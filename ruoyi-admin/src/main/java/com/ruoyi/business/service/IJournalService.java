package com.ruoyi.business.service;

import java.io.IOException;
import java.util.List;
import com.ruoyi.business.domain.Journal;
import com.ruoyi.common.core.domain.AjaxResult;

import javax.servlet.http.HttpServletRequest;

/**
 * 员工日报Service接口
 * 
 * @author liujianwen
 * @date 2021-01-16
 */
public interface IJournalService
{
    /**
     * 查询员工日报
     * 
     * @param id 员工日报ID
     * @return 员工日报
     */
    public Journal selectJournalById(Long id);

    /**
     * 查询员工日报列表
     * 
     * @param hrJournal 员工日报
     * @return 员工日报集合
     */
    public List<Journal> selectJournalList(Journal hrJournal);

    /**
     * 新增员工日报
     * 
     * @param hrJournal 员工日报
     * @return 结果
     */
    public int insertJournal(Journal hrJournal);

    /**
     * 修改员工日报
     * 
     * @param hrJournal 员工日报
     * @return 结果
     */
    public int updateJournal(Journal hrJournal);

    /**
     * 批量删除员工日报
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteJournalByIds(String ids);

    /**
     * 删除员工日报信息
     * 
     * @param id 员工日报ID
     * @return 结果
     */
    public int deleteJournalById(Long id);


    int insertOrUpdateJournal(Journal journal, HttpServletRequest request);

    AjaxResult exportUser(String startTime,String endTime);
}
