package com.ruoyi.zentao.controller;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysDept;
import com.ruoyi.system.service.ISysDeptService;
import com.ruoyi.zentao.domain.ZentaoDept;
import com.ruoyi.zentao.service.IZentaoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/zentao/user")
public class ZantaoUserController {

    @Autowired
    private IZentaoService zentaoService;
    @Autowired
    private ISysDeptService sysDeptService;

    @GetMapping("/syncZantao")
    @ResponseBody
    public AjaxResult syncZantao(){
        List<ZentaoDept> zentaoDepts =  zentaoService.deptList();
        SysDept sysDept = new SysDept();
//        sysDept.setDeptId();
        return null;
    }
}
