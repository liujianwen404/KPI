package com.ruoyi.business.mapper;

import java.util.Date;
import java.util.List;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.common.business.entity.PerformanceJob;
import org.apache.ibatis.annotations.Param;

/**
 * 个人工作现考核Mapper接口
 * 
 * @author ruoyi
 * @date 2021-02-18
 */
public interface PerformanceJobMapper extends BaseMapper<PerformanceJob>
{
    /**
     * 查询个人工作现考核
     * 
     * @param id 个人工作现考核ID
     * @return 个人工作现考核
     */
    public PerformanceJob selectPerformanceJobById(Long id);

    /**
     * 查询个人工作现考核列表
     * 
     * @param performanceJob 个人工作现考核
     * @return 个人工作现考核集合
     */
    public List<PerformanceJob> selectPerformanceJobList(PerformanceJob performanceJob);

    /**
     * 新增个人工作现考核
     * 
     * @param performanceJob 个人工作现考核
     * @return 结果
     */
    public int insertPerformanceJob(PerformanceJob performanceJob);

    /**
     * 修改个人工作现考核
     * 
     * @param performanceJob 个人工作现考核
     * @return 结果
     */
    public int updatePerformanceJob(PerformanceJob performanceJob);

    /**
     * 删除个人工作现考核
     * 
     * @param id 个人工作现考核ID
     * @return 结果
     */
    public int deletePerformanceJobById(Long id);

    /**
     * 批量删除个人工作现考核
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deletePerformanceJobByIds(String[] ids);

    int selectPreMonth(@Param("preMonth") Date preMonth, @Param("userId")Long userId);

    PerformanceJob selectInfoPerformanceJobByCondition(PerformanceJob conditionJob);
}
