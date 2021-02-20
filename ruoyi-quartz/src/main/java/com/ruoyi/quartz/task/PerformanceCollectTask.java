package com.ruoyi.quartz.task;

import cn.hutool.core.date.DateField;
import cn.hutool.core.date.DateUtil;
import com.ruoyi.common.business.entity.PerformanceCollect;
import com.ruoyi.common.business.entity.PerformanceJob;
import com.ruoyi.common.business.manager.IZentaoManager;
import com.ruoyi.common.business.service.IPerformanceCollectService;
import com.ruoyi.common.business.service.IPerformanceJobService;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.exception.BusinessException;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.ShiroUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.service.ISysDeptService;
import com.ruoyi.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 定时任务调度测试
 * 
 * @author ruoyi
 */
@Component("PerformanceCollectTask")
public class PerformanceCollectTask
{
    @Autowired
    private ISysUserService userService;

    @Autowired
    private ISysDeptService deptService;

    @Autowired
    private IPerformanceJobService performanceJobService;

    @Autowired
    private IPerformanceCollectService performanceCollectService;

    @Autowired
    private IZentaoManager zentaoManager;

    public int PerformanceCollectTask(String beginDate,String endDate)
    {
        int i = 0;
        SysUser currentUser = ShiroUtils.getSysUser();
        Date nowDate = DateUtil.date();
        Date preMonth = DateUtil.offset(nowDate, DateField.MONTH, -1);
        List<SysUser> sysUsers = userService.selectUserListWithoutDataScope(new SysUser());
        if (sysUsers != null && sysUsers.size()>0) {
            for (SysUser sysUser : sysUsers) {
                if (sysUser.getUserId() != 1) {
                    Long userId = sysUser.getUserId();

                    PerformanceCollect performanceCollect = new PerformanceCollect();
                    performanceCollect.setCreateId(userId);
                    performanceCollect.setCreateBy(currentUser.getLoginName());
                    performanceCollect.setCreateTime(nowDate);
                    performanceCollect.setDelFlag("0");
                    performanceCollect.setUserId(userId);
                    performanceCollect.setUserName(sysUser.getUserName());
                    performanceCollect.setDate(preMonth);
                    performanceCollect.setDeptId(sysUser.getDeptId());
                    performanceCollect.setDeptName(sysUser.getDept().getDeptName());

                    //工作进度
                    Map<String, String> map = new HashMap<>();
                    map.put("username",sysUser.getLoginName());
                    map.put("beginDate",beginDate);
                    map.put("endDate",endDate);
                    List<Map> jobScheduleList = zentaoManager.jobSchedule(map);
                    if (jobScheduleList != null && jobScheduleList.size()>0) {
                        BigDecimal score = (BigDecimal) jobScheduleList.get(0).get("score");
                        performanceCollect.setJobSchedule(score);
                    }
                    //工作表现
                    PerformanceJob conditionJob = new PerformanceJob();
                    conditionJob.setUserId(userId);
                    conditionJob.setDate(preMonth);
                    PerformanceJob performanceJob = performanceJobService.selectInfoPerformanceJobByCondition(conditionJob);
                    if (performanceJob != null) {
                        performanceCollect.setJobPerformance(performanceJob.getSuperiorGrade());
                    }

                    int num = performanceCollectService.selectPreMonth(preMonth, userId);
                    if (num > 0) {
                        //上月的绩效考核数据已存在，则更新数据
                        performanceCollectService.updatePerformanceCollect(performanceCollect);
                        i++;
                    } else {
                        performanceCollectService.insertPerformanceCollect(performanceCollect);
                        i++;
                    }
                }
            }
        }
        return i;
    }

}
