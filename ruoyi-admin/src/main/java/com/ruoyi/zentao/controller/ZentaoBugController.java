package com.ruoyi.zentao.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

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
 * zentao bug 相关
 * 
 * @author ruoyi
 */
@Controller
@RequestMapping("/zentao/bug")
public class ZentaoBugController extends BaseController{
	
	@Autowired
	private IZentaoService zentaoService;

	@GetMapping
	public String bug(ModelMap modelMap) {
		initTimeRanges(modelMap);
		return "zentao/bug";
	}

    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo bugList(QueryForm form){
        startPage();
        loadZentaoIdentity(form.getParams());
        List<Map> data = zentaoService.bugList(form.getParams());
        return getDataTable(data);
    }
    
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult bugExport(QueryForm form){
        loadZentaoIdentity(form.getParams());
        List<Map> data = zentaoService.bugList(form.getParams());
        
        ExcelUtil<Map> util = new ExcelUtil<Map>(Map.class, form.getHeader());
        return util.exportExcel(data, "Bug清单");
    }
    
	@GetMapping("/statistics")
	public String bugStatistics(ModelMap modelMap) {
		initTimeRanges(modelMap);
		return "zentao/bug-statistics";
	}

    @PostMapping("/statistics/list")
    @ResponseBody
    public TableDataInfo bugStatisticsList(QueryForm form){
        startPage();
        loadZentaoIdentity(form.getParams());
        List<Map> data = zentaoService.bugStatistics(form.getParams());
        return getDataTable(data);
    }
    
    @PostMapping("/statistics/export")
    @ResponseBody
    public AjaxResult bugStatisticsExport(QueryForm form){
        loadZentaoIdentity(form.getParams());
        List<Map> data = zentaoService.bugStatistics(form.getParams());
        
        ExcelUtil<Map> util = new ExcelUtil<Map>(Map.class, form.getHeader());
        return util.exportExcel(data, "Bug统计");
    }
 
}
