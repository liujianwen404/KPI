package com.ruoyi.business.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.lang.Assert;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.ShiroUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.service.ISysUserService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.business.domain.Journal;
import com.ruoyi.business.service.IJournalService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

import javax.servlet.http.HttpServletRequest;

/**
 * 员工日报Controller
 * 
 * @author liujianwen
 * @date 2021-01-16
 */
@Controller
@RequestMapping("/business/journal")
public class JournalController extends BaseController
{
    private String prefix = "business/journal";

    @Autowired
    private IJournalService journalService;

    @Autowired
    private ISysUserService sysUserService;

    @RequiresPermissions("business:journal:view")
    @GetMapping()
    public String journal(String date,String type,ModelMap map)
    {
        if (StringUtils.isNotBlank(date)) {
            Date format = DateUtil.parseDate(date);
            map.put("date",format);
            map.put("type",type);
        }
        return prefix + "/journal";
    }

    /**
     * 查询员工日报列表
     */
    @RequiresPermissions("business:journal:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Journal journal)
    {
        if (!ShiroUtils.getSysUser().isAdmin()) {
            journal.setUserId(ShiroUtils.getSysUser().getUserId());
        }
        startPage();
        List<Journal> list = journalService.selectJournalList(journal);
        return getDataTable(list);
    }

    /**
     * 新增员工日报
     */
    @GetMapping("/add")
    public String add(String date,String type,ModelMap map)
    {
        if (StringUtils.isNotBlank(date) && !"null".equals(date)) {
            Date format = DateUtil.parseDate(date);
            map.put("date",format);
            map.put("type",type);
        }
        return prefix + "/add";
    }

    /**
     * 新增保存员工日报
     */
//    @RequiresPermissions("business:journal:add")
    @Log(title = "员工日报", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Journal journal)
    {
        return toAjax(journalService.insertJournal(journal));
    }

    /**
     * 新增或修改员工日报
     */
    @GetMapping("/addOrEdit")
    public String addOrEdit(Long taskId,String title,ModelMap map)
    {
        Journal journal = new Journal();
        journal.setZentaoId(taskId);
        List<Journal> list = journalService.selectJournalList(journal);
        SysUser sysUser = sysUserService.selectUserById(ShiroUtils.getSysUser().getUserId());
        map.put("taskId",taskId);
        map.put("zentaoName",title);
        map.put("userId",ShiroUtils.getSysUser().getUserId());
        map.put("userName",sysUser.getUserName());
        map.put("deptId",sysUser.getDept().getDeptId());
        map.put("deptName",sysUser.getDept().getDeptName());
        map.put("tasks",list);
        return prefix + "/addOrEdit";
    }

    /**
     * 新增或修改保存员工日报
     */
//    @RequiresPermissions("business:journal:add")
    @Log(title = "员工日报", businessType = BusinessType.INSERT)
    @PostMapping("/addOrEdit")
    @ResponseBody
    public AjaxResult addOrEditSave(Journal journal, HttpServletRequest request)
    {
        return toAjax(journalService.insertOrUpdateJournal(journal,request));
    }

    /**
     * 修改员工日报
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        Journal journal = journalService.selectJournalById(id);
        mmap.put("journal", journal);
        return prefix + "/edit";
    }

    /**
     * 修改保存员工日报
     */
    @RequiresPermissions("business:journal:edit")
    @Log(title = "员工日报", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Journal journal)
    {
        return toAjax(journalService.updateJournal(journal));
    }

    /**
     * 删除员工日报
     */
    @RequiresPermissions("business:journal:remove")
    @Log(title = "员工日报", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(journalService.deleteJournalByIds(ids));
    }

    /**
     * 导出员工日报列表
     */
    @RequiresPermissions("business:journal:export")
    @Log(title = "员工日报", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Journal journal)
    {
        List<Journal> list = journalService.selectJournalList(journal);
        ExcelUtil<Journal> util = new ExcelUtil<Journal>(Journal.class);
        return util.exportExcel(list, "journal");
    }

    /**
     * 导出员工周报
     */
    @Log(title = "员工周报", businessType = BusinessType.EXPORT)
    @PostMapping("/exportUser")
    @ResponseBody
    public AjaxResult exportUser(String startTime,String endTime)
    {
        return journalService.exportUser(startTime,endTime);
    }

}
