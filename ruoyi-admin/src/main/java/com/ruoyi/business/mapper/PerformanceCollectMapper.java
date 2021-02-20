package com.ruoyi.business.mapper;

import java.util.Date;
import java.util.List;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.common.business.entity.PerformanceCollect;
import org.apache.ibatis.annotations.Param;

/**
 * 个人月度绩效考核汇总Mapper接口
 * 
 * @author ruoyi
 * @date 2021-02-18
 */
public interface PerformanceCollectMapper extends BaseMapper<PerformanceCollect>
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
     * 删除个人月度绩效考核汇总
     * 
     * @param id 个人月度绩效考核汇总ID
     * @return 结果
     */
    public int deletePerformanceCollectById(Long id);

    /**
     * 批量删除个人月度绩效考核汇总
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deletePerformanceCollectByIds(String[] ids);

    int selectPreMonth(@Param("preMonth") Date preMonth, @Param("userId")Long userId);
}
