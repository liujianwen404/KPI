package com.ruoyi.business.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.common.business.entity.Journal;
import java.util.List;
/**
 * 员工日报 数据层
 *
 * @author liujianwen
 * @date 2021-01-16
 */
public interface JournalMapper extends BaseMapper<Journal> {

    /**
     * 查询员工日报列表
     *
     * @param journal 员工日报
     * @return 员工日报集合
     */
    public List<Journal> selectJournalList(Journal journal);

    /**
     * 删除员工日报
     *
     * @param id 员工日报ID
     * @return 结果
     */
    public int deleteJournalById(Long id);

    /**
     * 批量删除员工日报
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteJournalByIds(String[] ids);

}