package com.ruoyi.common.business.service;

import java.util.Date;
import java.util.List;
import com.ruoyi.common.business.entity.PerformanceCollect;

/**
 * 个人月度绩效考核汇总Service接口
 * 
 * @author ruoyi
 * @date 2021-02-18
 */
public interface IPerformanceCollectService 
{
    /**
     * 查询个人月度绩效考核汇总
     * 
     * @param id 个人月度绩效考核汇总ID
     * @return 个人月度绩效考核汇总
     */
    public PerformanceCollect selectPerformanceCollectById(Long id);

    /**
     * 查询个人月度绩效考核汇总列表
     * 
     * @param performanceCollect 个人月度绩效考核汇总
     * @return 个人月度绩效考核汇总集合
     */
    public List<PerformanceCollect> selectPerformanceCollectList(PerformanceCollect performanceCollect);

    /**
     * 新增个人月度绩效考核汇总
     * 
     * @param performanceCollect 个人月度绩效考核汇总
     * @return 结果
     */
    public int insertPerformanceCollect(PerformanceCollect performanceCollect);

    /**
     * 修改个人月度绩效考核汇总
     * 
     * @param performanceCollect 个人月度绩效考核汇总
     * @return 结果
     */
    public int updatePerformanceCollect(PerformanceCollect performanceCollect);

    /**
     * 批量删除个人月度绩效考核汇总
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deletePerformanceCollectByIds(String ids);

    /**
     * 删除个人月度绩效考核汇总信息
     * 
     * @param id 个人月度绩效考核汇总ID
     * @return 结果
     */
    public int deletePerformanceCollectById(Long id);

    int selectPreMonth(Date preMonth, Long userId);
}
