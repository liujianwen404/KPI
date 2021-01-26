package com.ruoyi.business.service.impl;

import java.io.*;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.*;
import java.util.stream.Collectors;

import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.lang.Assert;
import cn.hutool.core.lang.UUID;
import cn.hutool.core.util.ZipUtil;
import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.ExcelWriter;
import com.alibaba.excel.write.metadata.WriteSheet;
import com.alibaba.excel.write.metadata.fill.FillConfig;
import com.alibaba.excel.write.metadata.fill.FillWrapper;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysDept;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.exception.BusinessException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.file.FileUtils;
import com.ruoyi.system.service.ISysDeptService;
import com.ruoyi.system.service.ISysPostService;
import com.ruoyi.system.service.ISysUserService;
import lombok.extern.slf4j.Slf4j;
import com.ruoyi.common.utils.DateUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.common.utils.ShiroUtils;
import com.ruoyi.business.mapper.JournalMapper;
import com.ruoyi.business.domain.Journal;
import com.ruoyi.business.service.IJournalService;
import com.ruoyi.common.core.text.Convert;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

/**
 * 员工日报Service业务层处理
 * 
 * @author liujianwen
 * @date 2021-01-16
 */
@Slf4j
@Service
public class JournalServiceImpl implements IJournalService
{


    @Resource
    private JournalMapper journalMapper;

    @Autowired
    private ISysUserService sysUserService;

    @Autowired
    private ISysDeptService sysDeptService;

    @Autowired
    private ISysPostService sysPostService;

    /**
     * 查询员工日报
     * 
     * @param id 员工日报ID
     * @return 员工日报
     */
    @Override
    public Journal selectJournalById(Long id)
    {
        return journalMapper.selectById(id);
    }

    /**
     * 查询员工日报列表
     * 
     * @param journal 员工日报
     * @return 员工日报
     */
    @Override
    public List<Journal> selectJournalList(Journal journal)
    {
        journal.setDelFlag("0");
        return journalMapper.selectJournalList(journal);
    }

    /**
     * 新增员工日报
     * 
     * @param journal 员工日报
     * @return 结果
     */
    @Override
    public int insertJournal(Journal journal)
    {
        journal.setUpdateId(ShiroUtils.getUserId());
        journal.setUpdateBy(ShiroUtils.getLoginName());
        journal.setUpdateTime(DateUtils.getNowDate());
        journal.setUserId(ShiroUtils.getSysUser().getUserId());
        journal.setUserName(ShiroUtils.getSysUser().getUserName());
        journal.setDeptId(ShiroUtils.getSysUser().getDeptId());
        SysUser sysUser = sysUserService.selectUserById(ShiroUtils.getSysUser().getUserId());
        if (sysUser != null) {
            SysDept sysDept = sysDeptService.selectDeptById(sysUser.getDeptId());
            if (sysDept != null) {
                journal.setDeptName(sysDept.getDeptName());
            }
        }
        return journalMapper.insert(journal);
    }

    /**
     * 新增或修改员工日报
     *
     * @param journal 员工日报
     * @return 结果
     */
    @Override
    public int insertOrUpdateJournal(Journal journal, HttpServletRequest request)
    {
        int num = 0;
        //更新任务进度数据
        //提交的任务进度数量
        int count = Integer.parseInt(request.getParameter("count"));
        //遍历所有任务进度
        for (int i = 1; i <= count; i++) {
            String taskId = request.getParameter("task"+i);
            String date = request.getParameter("date" + i);
            String taskProgress = request.getParameter("taskProgress" + i);
            if (StringUtils.isNotBlank(date)) {
                journal.setDate(DateUtil.parseDate(date));
            }
            if (StringUtils.isNotBlank(taskProgress)) {
                journal.setTaskProgress(taskProgress);
            }
            if (StringUtils.isNotBlank(taskId)) {
                //如果任务进度ID不为空，则更新原进度数据
                journal.setId(Long.valueOf(taskId));
                journal.setUpdateId(ShiroUtils.getUserId());
                journal.setUpdateBy(ShiroUtils.getLoginName());
                journal.setUpdateTime(DateUtils.getNowDate());
                num = journalMapper.updateById(journal);
            } else {
                //否则插入新任务进度
                journal.setCreateId(ShiroUtils.getUserId());
                journal.setCreateBy(ShiroUtils.getLoginName());
                journal.setCreateTime(DateUtils.getNowDate());
                num = journalMapper.insert(journal);
            }
        }
        return num;
    }

    /**
     * 修改员工日报
     * 
     * @param journal 员工日报
     * @return 结果
     */
    @Override
    public int updateJournal(Journal journal)
    {
        journal.setUpdateId(ShiroUtils.getUserId());
        journal.setUpdateBy(ShiroUtils.getLoginName());
        journal.setUpdateTime(DateUtils.getNowDate());
        return journalMapper.updateById(journal);
    }

    /**
     * 删除员工日报对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteJournalByIds(String ids)
    {
        return journalMapper.deleteJournalByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除员工日报信息
     * 
     * @param id 员工日报ID
     * @return 结果
     */
    @Override
    public int deleteJournalById(Long id)
    {
        return journalMapper.deleteJournalById(id);
    }

    @Override
    public AjaxResult exportUser(String startTime,String endTime) {

        Journal journal = new Journal();
        Map<String, Object> params = new HashMap<>();
        params.put("startTime",startTime);
        params.put("endTime",endTime);
        journal.setParams(params);
        List<Journal> journals = journalMapper.selectJournalList(journal);
        List<Long> userIds = journals.stream().map(journal1 -> journal1.getUserId()).distinct().collect(Collectors.toList());
        List<SysUser> users = userIds.stream().filter(id -> !deptLeaders().contains(id)).map(id -> sysUserService.selectUserById(id)).collect(Collectors.toList());
        if (users.size() == 0 || users == null) {
            throw new BusinessException("要导出的员工数据为空！");
        }
        List<List<Journal>> lists = users.stream().map(user -> {//每个普通员工的日志集合
            Journal info = new Journal();
            info.setParams(params);
            info.setUserId(user.getUserId());
            List<Journal> infoJournalList = journalMapper.selectJournalList(info);
            return infoJournalList;
        }).collect(Collectors.toList());

        lists.forEach(infoList -> {
            List<String> nameList = infoList.stream().map(info -> info.getUserName()).collect(Collectors.toList());
            // 读取Excel文档
            String property = System.getProperty("user.dir");
            String path = property + File.separator + "ruoyi-admin" + File.separator + "src" + File.separator + "main" + File.separator + "resources" + File.separator + "excelTemplate" + File.separator + "userTemplate.xlsx";
            File finalXlsxFile = createNewFile(path,nameList.get(0));//复制模板，
            Workbook workBook = null;
            try {
                workBook = getWorkbok(finalXlsxFile);
            } catch (IOException e) {
                e.printStackTrace();
            }
            // sheet 对应一个工作页 插入数据开始 ------
            Sheet sheet = workBook.getSheetAt(0);

            //开始时间与结束时间相差天数
            long betweenDay = DateUtil.betweenDay(DateUtil.parseDate(startTime), DateUtil.parseDate(endTime), true);
            if (betweenDay > 6) {
                betweenDay = 6;
            }
            int initRow = 5;// 保证第一次循环获取到第6行

            StringBuilder project = new StringBuilder();//本周主项
            StringBuilder summary = new StringBuilder();//本周小结
            for (int i = 0; i <= betweenDay; i++) {
                Date day = DateUtil.offsetDay(DateUtil.parseDate(startTime), i);
                StringBuilder workContent = new StringBuilder();
                StringBuilder progressContent = new StringBuilder();
                for (int j = 0; j < infoList.size(); j++) {
                    if(DateUtil.isSameDay(day,infoList.get(j).getDate())){
                        workContent.append(infoList.get(j).getZentaoName()+";");
                        progressContent.append(infoList.get(j).getTaskProgress()+"%;");
                    }
                }
                //从第6行开始循环插入
                Row row = sheet.getRow(initRow + i);
                Cell cell2 = row.getCell(1);//第2列，是具体内容
                cell2.setCellValue(workContent.toString());
                Cell cell3 = row.getCell(2);//第3列，是预计开始时间
                cell3.setCellValue(day);
                Cell cell4 = row.getCell(3);//第4列，是预计完成时间
                cell4.setCellValue(day);
                Cell cell5 = row.getCell(4);//第5列，是完成进度
                cell5.setCellValue(progressContent.toString());

                project.append(workContent.toString()).append(String.valueOf((char)10));
                summary.append(workContent.toString()).append(String.valueOf((char)10));
            }
            List<Long> idList = infoList.stream().map(info -> info.getUserId()).collect(Collectors.toList());
            SysUser user = sysUserService.selectUserById(idList.get(0));
            SysDept sysDept = sysDeptService.selectDeptById(user.getDeptId());

            Row row3 = sheet.getRow(2);// 获取到第3行
            Cell cell2 = row3.getCell(1);// 3行 2列
            String deptPostNameStr = sysDept.getDeptName() + "-" + user.getUserName();
            cell2.setCellValue(deptPostNameStr);

            Cell cell3 = row3.getCell(2);// 3行 3列
            String timeFrame = "时段："+ startTime + "---" +endTime;
            cell3.setCellValue(timeFrame);

            Row row4 = sheet.getRow(3);// 获取到第4行
            Cell cell402 = row4.getCell(1);// 4行 2列
            String[] projectArr = project.toString().split(";");
            List<String> projectStrList = new ArrayList<>(Arrays.asList(projectArr));
            List<String> projectList = projectStrList.stream().distinct().collect(Collectors.toList());
            List<String> writeProject = projectList.stream().map(pro -> pro.trim() + String.valueOf((char) 10)).collect(Collectors.toList());
            String projStr = StringUtils.strip(writeProject.toString(), "[]").replaceAll(","," ").replaceAll(" ","");
            cell402.setCellValue(projStr);

            Row row13 = sheet.getRow(12);// 获取到第13行
            Cell cell1302 = row13.getCell(1);// 13行 2列
            String[] summaryArr = summary.toString().split(";");
            List<String> summaryStrList = new ArrayList<>(Arrays.asList(summaryArr));
            List<String> summaryList = summaryStrList.stream().distinct().collect(Collectors.toList());
            List<String> writeSummary = summaryList.stream().map(summ -> summ.trim() + String.valueOf((char) 10)).collect(Collectors.toList());
            String summStr = StringUtils.strip(writeSummary.toString(), "[]").replaceAll(","," ").replaceAll(" ","");
            cell1302.setCellValue(summStr);
            //插入数据结束

            OutputStream out = null;
            try {
                out = new FileOutputStream(finalXlsxFile);
                workBook.write(out);
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                if (out != null) {
                    try {
                        out.flush();
                        out.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }

        });

        //压缩excel并输出
        String srcName = getAbsoluteFile("员工周报");
        String zipName = "员工周报.zip";
        // 保存zip文件的路径
        String realPath = getAbsoluteFile("");
        String zipPath = realPath + File.separator + zipName;

        //压缩输出
        ZipUtil.zip(srcName,zipPath);
        //删除临时存放的文件
        String filePath = RuoYiConfig.getDownloadPath() + "员工周报";
        FileUtils.deleteFileOrDirectory(filePath);
        return AjaxResult.success(zipName);
    }

    private static File createNewFile(String path,String username) {
        // 读取模板，并赋值到新文件************************************************************
        // 文件模板路径

        File file = new File(path);
        if (!file.exists()) {
            throw new BusinessException("原模板文件不存在");
        }
        // 新的文件名
        String newFileName = username + ".xls";
        // 保存文件的路径
        String realPath = getAbsoluteFile("员工周报");
        // 判断路径是否存在
        File dir = new File(realPath);
        if (!dir.exists()) {
            dir.mkdirs();
        }
        // 写入到新的excel
        File newFile = new File(realPath, newFileName);
        try {
            newFile.createNewFile();
            // 复制模板到新文件
            FileUtils.copyFile(file, newFile);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return newFile;
    }

    /**
     * 判断excel格式版本
     *
     * @param file
     * @return
     * @throws IOException
     */
    public static Workbook getWorkbok(File file) throws IOException {
        Workbook wb = null;
        FileInputStream in = new FileInputStream(file);
        if (file.getName().endsWith(".xls")) { // Excel&nbsp;2003
            wb = new XSSFWorkbook(in);
        } else if (file.getName().endsWith("xlsx")) { // Excel 2007/2010
            wb = new XSSFWorkbook(in);
        }
        return wb;
    }

    /**
     * 获取下载路径
     *
     * @param filename 文件名称
     */
    public static String getAbsoluteFile(String filename)
    {
        String downloadPath = RuoYiConfig.getDownloadPath() + filename;
        File desc = new File(downloadPath);
        if (!desc.getParentFile().exists())
        {
            desc.getParentFile().mkdirs();
        }
        return downloadPath;
    }

    /**
     * 是否是部门负责人
     * @return
     */
    public boolean isDeptLeader(Long userId){
        List<SysDept> deptList = sysDeptService.selectDeptList(new SysDept());
        if (!deptList.isEmpty()) {
            if (deptList.stream().anyMatch(dept -> {
                if (userId.equals(dept.getLeader())) {
                    return true;
                }
                return false;
            })) {
                return true;
            }
        }
        return false;
    }

    /**
     * 返回部门负责人ID集合
     * @return
     */
    public List<Long> deptLeaders(){
        List<SysDept> deptList = sysDeptService.selectDeptList(new SysDept());
        List<Long> list = new ArrayList<>();
        deptList.stream().forEach(dept -> {
            if (null != dept.getLeader() && !"".equals(dept.getLeader())) {
                list.add(Long.parseLong(dept.getLeader()));
            }
        });
        return list;
    }

}
