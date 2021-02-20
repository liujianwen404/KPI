package com.ruoyi.zentao.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.ruoyi.common.core.domain.entity.SysDept;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.ShiroUtils;
import com.ruoyi.system.service.ISysDeptService;
import com.ruoyi.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.QueryForm;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.zentao.service.IZentaoService;

import cn.hutool.core.date.DateUtil;

/**
 * zentao task 相关
 * 
 * @author ruoyi
 */
@Controller
@RequestMapping("/zentao/task")
public class ZentaoTaskController extends BaseController{
	
	@Autowired
	private IZentaoService zentaoService;

	@Autowired
	private ISysUserService userService;

    @Autowired
	private ISysDeptService deptService;

	@GetMapping
	public String task(ModelMap modelMap) {
		initTimeRanges(modelMap);
		return "zentao/task";
	}

	@GetMapping("/userTask")
    @ResponseBody
	public AjaxResult userTask(Map<String,String> map) {
        SysUser sysUser = ShiroUtils.getSysUser();
        if (!sysUser.isAdmin()){
            String loginName = ShiroUtils.getLoginName();
            map.put("username",loginName);
        }
        List<Map> data = zentaoService.userTaskList(map);
        boolean isDeptLeader = userService.userIsDeptLeader(sysUser.getUserId());
        if (isDeptLeader && !sysUser.isAdmin()) {
            //如果是部门领导，则查询出该领导所管部门所有人的任务
            SysDept sysDept = new SysDept();
            sysDept.setLeader(sysUser.getUserId().toString());
            List<SysDept> deptList = deptService.selectDeptListWithoutDataScopeByCondition(sysDept);
            Map<String,String> mmap = new HashMap<>();
            if (deptList != null && deptList.size() > 0) {
                deptList.stream().forEach(dept -> {
                    mmap.put("deptId",dept.getDeptId().toString());
                    data.addAll(zentaoService.userTaskList(mmap));
                });
            }
        }
		return AjaxResult.success(data);
	}

    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo taskList(QueryForm form){
        startPage();
        loadZentaoIdentity(form.getParams());
        List<Map> data = zentaoService.taskList(form.getParams());
        return getDataTable(data);
    }
    
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult taskExport(QueryForm form){
        loadZentaoIdentity(form.getParams());
        List<Map> data = zentaoService.taskList(form.getParams());
        
        ExcelUtil<Map> util = new ExcelUtil<Map>(Map.class, form.getHeader());
        return util.exportExcel(data, "任务清单");
    }
    
	@GetMapping("/statistics")
	public String taskStatistics(ModelMap modelMap) {
		initTimeRanges(modelMap);
		return "zentao/task-statistics";
	}

    @PostMapping("/statistics/list")
    @ResponseBody
    public TableDataInfo taskStatisticsList(QueryForm form){
        startPage();
        loadZentaoIdentity(form.getParams());
        List<Map> data = zentaoService.taskStatistics(form.getParams());
        return getDataTable(data);
    }
    
    @PostMapping("/statistics/export")
    @ResponseBody
    public AjaxResult taskStatisticsExport(QueryForm form){
        loadZentaoIdentity(form.getParams());
        List<Map> data = zentaoService.taskStatistics(form.getParams());
        
        ExcelUtil<Map> util = new ExcelUtil<Map>(Map.class, form.getHeader());
        return util.exportExcel(data, "任务统计");
    }
 
}
