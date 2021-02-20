package com.ruoyi.zentao.manager;

import com.ruoyi.common.business.manager.IZentaoManager;
import com.ruoyi.zentao.service.IZentaoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public class ZentaoManager implements IZentaoManager {

    @Autowired
    private IZentaoService zentaoService;

    @Override
    public List<Map> jobSchedule(Map params) {
        return zentaoService.taskStatistics(params);
    }
}
