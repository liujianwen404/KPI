package com.ruoyi.business.service.impl;

import java.util.Date;
import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.business.mapper.PerformanceCollectMapper;
import com.ruoyi.common.business.entity.PerformanceCollect;
import com.ruoyi.common.business.service.IPerformanceCollectService;
import com.ruoyi.common.core.text.Convert;

/**
 * 个人月度绩效考核汇总Service业务层处理
 * 
 * @author ruoyi
 * @date 2021-02-18
 */
@Service
public class PerformanceCollectServiceImpl implements IPerformanceCollectService 
{
    @Autowired
    private PerformanceCollectMapper performanceCollectMapper;

    /**
     * 查询个人月度绩效考核汇总
     * 
     * @param id 个人月度绩效考核汇总ID
     * @return 个人月度绩效考核汇总
     */
    @Override
    public PerformanceCollect selectPerformanceCollectById(Long id)
    {
        return performanceCollectMapper.selectPerformanceCollectById(id);
    }

    /**
     * 查询个人月度绩效考核汇总列表
     * 
     * @param performanceCollect 个人月度绩效考核汇总
     * @return 个人月度绩效考核汇总
     */
    @Override
    public List<PerformanceCollect> selectPerformanceCollectList(PerformanceCollect performanceCollect)
    {
        return performanceCollectMapper.selectPerformanceCollectList(performanceCollect);
    }

    /**
     * 新增个人月度绩效考核汇总
     * 
     * @param performanceCollect 个人月度绩效考核汇总
     * @return 结果
     */
    @Override
    public int insertPerformanceCollect(PerformanceCollect performanceCollect)
    {
        performanceCollect.setCreateTime(DateUtils.getNowDate());
        return performanceCollectMapper.insertPerformanceCollect(performanceCollect);
    }

    /**
     * 修改个人月度绩效考核汇总
     * 
     * @param performanceCollect 个人月度绩效考核汇总
     * @return 结果
     */
    @Override
    public int updatePerformanceCollect(PerformanceCollect performanceCollect)
    {
        performanceCollect.setUpdateTime(DateUtils.getNowDate());
        return performanceCollectMapper.updatePerformanceCollect(performanceCollect);
    }

    /**
     * 删除个人月度绩效考核汇总对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deletePerformanceCollectByIds(String ids)
    {
        return performanceCollectMapper.deletePerformanceCollectByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除个人月度绩效考核汇总信息
     * 
     * @param id 个人月度绩效考核汇总ID
     * @return 结果
     */
    @Override
    public int deletePerformanceCollectById(Long id)
    {
        return performanceCollectMapper.deletePerformanceCollectById(id);
    }

    @Override
    public int selectPreMonth(Date preMonth, Long userId) {
        return performanceCollectMapper.selectPreMonth(preMonth,userId);
    }
}
