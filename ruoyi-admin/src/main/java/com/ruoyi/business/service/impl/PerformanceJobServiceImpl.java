package com.ruoyi.business.service.impl;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import cn.hutool.core.date.DateField;
import cn.hutool.core.date.DateUtil;
import com.ruoyi.common.core.domain.entity.SysDept;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.exception.BusinessException;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.ShiroUtils;
import com.ruoyi.system.service.ISysDeptService;
import com.ruoyi.system.service.ISysUserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.business.mapper.PerformanceJobMapper;
import com.ruoyi.common.business.entity.PerformanceJob;
import com.ruoyi.common.business.service.IPerformanceJobService;
import com.ruoyi.common.core.text.Convert;

/**
 * 个人工作现考核Service业务层处理
 * 
 * @author ruoyi
 * @date 2021-02-18
 */
@Service
public class PerformanceJobServiceImpl implements IPerformanceJobService 
{
    @Autowired
    private PerformanceJobMapper performanceJobMapper;

    @Autowired
    private ISysUserService userService;

    @Autowired
    private ISysDeptService deptService;

    /**
     * 查询个人工作现考核
     * 
     * @param id 个人工作现考核ID
     * @return 个人工作现考核
     */
    @Override
    public PerformanceJob selectPerformanceJobById(Long id)
    {
        return performanceJobMapper.selectPerformanceJobById(id);
    }

    /**
     * 查询个人工作现考核列表
     * 
     * @param performanceJob 个人工作现考核
     * @return 个人工作现考核
     */
    @Override
    public List<PerformanceJob> selectPerformanceJobList(PerformanceJob performanceJob)
    {
        SysUser sysUser = ShiroUtils.getSysUser();
        if (!sysUser.isAdmin()){
            performanceJob.setUserId(ShiroUtils.getUserId());
        }
        List<PerformanceJob> performanceJobList = performanceJobMapper.selectPerformanceJobList(performanceJob);
        boolean isDeptLeader = userService.userIsDeptLeader(sysUser.getUserId());
        if (isDeptLeader && !sysUser.isAdmin()) {
            //如果是部门领导，则查询出该领导所管部门所有人的数据
            SysDept sysDept = new SysDept();
            sysDept.setLeader(sysUser.getUserId().toString());
            List<SysDept> deptList = deptService.selectDeptListWithoutDataScopeByCondition(sysDept);
            PerformanceJob job = new PerformanceJob();
            if (deptList != null && deptList.size() > 0) {
                deptList.stream().forEach(dept -> {
                    job.setDeptId(dept.getDeptId());
                    performanceJobList.addAll(performanceJobMapper.selectPerformanceJobList(job));
                });
            }
        }
        return performanceJobList.stream().distinct().collect(Collectors.toList());
    }

    /**
     * 新增个人工作表现考核
     * 
     * @param performanceJob 个人工作表现考核
     * @return 结果
     */
    @Override
    public int insertPerformanceJob(PerformanceJob performanceJob)
    {
        SysUser sysUser = ShiroUtils.getSysUser();
        Long userId = sysUser.getUserId();
        Date preMonth = DateUtil.offset(DateUtil.date(), DateField.MONTH, -1);

        int num = performanceJobMapper.selectPreMonth(preMonth,userId);
        if (num > 0) {
            throw new BusinessException("上月的个人工作表现数据已存在");
        }
        performanceJob.setCreateTime(DateUtils.getNowDate());
        performanceJob.setCreateId(userId);
        performanceJob.setCreateBy(sysUser.getCreateBy());
        performanceJob.setUserId(userId);
        performanceJob.setUserName(sysUser.getUserName());
        performanceJob.setDeptId(sysUser.getDeptId());
        performanceJob.setDeptName(sysUser.getDept().getDeptName());
        performanceJob.setDate(preMonth);
        performanceJob.setDelFlag("0");
        return performanceJobMapper.insertPerformanceJob(performanceJob);
    }

    /**
     * 修改个人工作现考核
     * 
     * @param performanceJob 个人工作现考核
     * @return 结果
     */
    @Override
    public int updatePerformanceJob(PerformanceJob performanceJob)
    {
        performanceJob.setUpdateTime(DateUtils.getNowDate());
        return performanceJobMapper.updatePerformanceJob(performanceJob);
    }

    /**
     * 删除个人工作现考核对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deletePerformanceJobByIds(String ids)
    {
        return performanceJobMapper.deletePerformanceJobByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除个人工作现考核信息
     * 
     * @param id 个人工作现考核ID
     * @return 结果
     */
    @Override
    public int deletePerformanceJobById(Long id)
    {
        return performanceJobMapper.deletePerformanceJobById(id);
    }

    public int selectPreMonth(Date preMonth, Long userId)
    {
        return performanceJobMapper.selectPreMonth(preMonth,userId);
    }

    @Override
    public PerformanceJob selectInfoPerformanceJobByCondition(PerformanceJob conditionJob) {
        return performanceJobMapper.selectInfoPerformanceJobByCondition(conditionJob);
    }
}
