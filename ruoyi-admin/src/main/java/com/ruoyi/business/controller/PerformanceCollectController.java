package com.ruoyi.business.controller;

import java.util.List;

import com.alibaba.excel.EasyExcel;
import com.ruoyi.quartz.task.PerformanceCollectTask;
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
import com.ruoyi.common.business.entity.PerformanceCollect;
import com.ruoyi.common.business.service.IPerformanceCollectService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 个人月度绩效考核汇总Controller
 * 
 * @author ruoyi
 * @date 2021-02-18
 */
@Controller
@RequestMapping("/business/performance/collect")
public class PerformanceCollectController extends BaseController
{
    private String prefix = "business/performance/collect";

    @Autowired
    private IPerformanceCollectService performanceCollectService;

    @Autowired
    private PerformanceCollectTask performanceCollectTask;

    @RequiresPermissions("performance:collect:view")
    @GetMapping()
    public String collect()
    {
        return prefix + "/collect";
    }

    /**
     * 查询个人月度绩效考核汇总列表
     */
//    @RequiresPermissions("performance:collect:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(PerformanceCollect performanceCollect)
    {
        startPage();
        List<PerformanceCollect> list = performanceCollectService.selectPerformanceCollectList(performanceCollect);
        return getDataTable(list);
    }

    /**
     * 导出个人月度绩效考核汇总列表
     */
//    @RequiresPermissions("performance:collect:export")
    @Log(title = "个人月度绩效考核汇总", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(PerformanceCollect performanceCollect)
    {
        List<PerformanceCollect> list = performanceCollectService.selectPerformanceCollectList(performanceCollect);
        String fileName = "月度绩效考核汇总.xlsx";
        String filePath = ExcelUtil.getAbsoluteFile(fileName);
        EasyExcel.write(filePath, PerformanceCollect.class).sheet("sheet1").doWrite(list);
        return AjaxResult.success(fileName);
    }

    /**
     * 新增个人月度绩效考核汇总
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存个人月度绩效考核汇总
     */
//    @RequiresPermissions("performance:collect:add")
    @Log(title = "个人月度绩效考核汇总", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(PerformanceCollect performanceCollect)
    {
        return toAjax(performanceCollectService.insertPerformanceCollect(performanceCollect));
    }

    /**
     * 修改个人月度绩效考核汇总
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        PerformanceCollect performanceCollect = performanceCollectService.selectPerformanceCollectById(id);
        mmap.put("performanceCollect", performanceCollect);
        return prefix + "/edit";
    }

    /**
     * 修改保存个人月度绩效考核汇总
     */
//    @RequiresPermissions("performance:collect:edit")
    @Log(title = "个人月度绩效考核汇总", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(PerformanceCollect performanceCollect)
    {
        return toAjax(performanceCollectService.updatePerformanceCollect(performanceCollect));
    }

    /**
     * 删除个人月度绩效考核汇总
     */
//    @RequiresPermissions("performance:collect:remove")
    @Log(title = "个人月度绩效考核汇总", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(performanceCollectService.deletePerformanceCollectByIds(ids));
    }

    @PostMapping( "/statistics")
    @ResponseBody
    public AjaxResult statistics(String startDate,String endDate)
    {
        return toAjax(performanceCollectTask.PerformanceCollectTask(startDate,endDate));
    }
}
