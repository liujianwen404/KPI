package com.ruoyi.business.controller;

import java.util.List;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.ShiroUtils;
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
import com.ruoyi.common.business.entity.PerformanceJob;
import com.ruoyi.common.business.service.IPerformanceJobService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 个人工作现考核Controller
 * 
 * @author ruoyi
 * @date 2021-02-18
 */
@Controller
@RequestMapping("/business/performance/job")
public class PerformanceJobController extends BaseController
{
    private String prefix = "business/performance/job";

    @Autowired
    private IPerformanceJobService performanceJobService;

    @Autowired
    private ISysUserService sysUserService;

    @RequiresPermissions("performance:job:view")
    @GetMapping()
    public String job()
    {
        return prefix + "/job";
    }

    /**
     * 查询个人工作现考核列表
     */
//    @RequiresPermissions("performance:job:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(PerformanceJob performanceJob)
    {
        startPage();
        List<PerformanceJob> list = performanceJobService.selectPerformanceJobList(performanceJob);
        return getDataTable(list);
    }

    /**
     * 导出个人工作现考核列表
     */
//    @RequiresPermissions("performance:job:export")
    @Log(title = "个人工作现考核", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(PerformanceJob performanceJob)
    {
        List<PerformanceJob> list = performanceJobService.selectPerformanceJobList(performanceJob);
        ExcelUtil<PerformanceJob> util = new ExcelUtil<PerformanceJob>(PerformanceJob.class);
        return util.exportExcel(list, "job");
    }

    /**
     * 新增个人工作现考核
     */
    @GetMapping("/add")
    public String add(ModelMap map)
    {
        SysUser sysUser = ShiroUtils.getSysUser();
        boolean isDeptLeader = sysUserService.userIsDeptLeader(sysUser.getUserId());
        map.put("isDeptLeader",isDeptLeader);
        return prefix + "/add";
    }

    /**
     * 新增保存个人工作现考核
     */
//    @RequiresPermissions("performance:job:add")
    @Log(title = "个人工作现考核", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(PerformanceJob performanceJob)
    {
        return toAjax(performanceJobService.insertPerformanceJob(performanceJob));
    }

    /**
     * 修改个人工作现考核
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        SysUser sysUser = ShiroUtils.getSysUser();
        boolean isDeptLeader = sysUserService.userIsDeptLeader(sysUser.getUserId());
        PerformanceJob performanceJob = performanceJobService.selectPerformanceJobById(id);
        mmap.put("performanceJob", performanceJob);
        mmap.put("isDeptLeader",isDeptLeader);
        mmap.put("userId",sysUser.getUserId());
        return prefix + "/edit";
    }

    /**
     * 修改保存个人工作现考核
     */
//    @RequiresPermissions("performance:job:edit")
    @Log(title = "个人工作现考核", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(PerformanceJob performanceJob)
    {
        return toAjax(performanceJobService.updatePerformanceJob(performanceJob));
    }

    /**
     * 删除个人工作现考核
     */
//    @RequiresPermissions("performance:job:remove")
    @Log(title = "个人工作现考核", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(performanceJobService.deletePerformanceJobByIds(ids));
    }
}
