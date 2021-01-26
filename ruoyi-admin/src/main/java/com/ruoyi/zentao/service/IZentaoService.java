package com.ruoyi.zentao.service;

import java.util.List;
import java.util.Map;

import com.ruoyi.common.core.domain.AjaxResult;
import org.apache.ibatis.annotations.Param;

import com.ruoyi.zentao.domain.ZentaoDept;
import com.ruoyi.zentao.domain.ZentaoUser;

public interface IZentaoService {
	
	/**
	 * bug清单
	 * @param params
	 * @return
	 */
	List<Map> bugList(Map params);
	
	/**
	 * bug统计
	 * @param params
	 * @return
	 */
	List<Map> bugStatistics(@Param("params") Map params);
	
	/**
	 * 任务清单
	 * @param params
	 * @return
	 */
	List<Map> taskList(Map params);
	
	/**
	 * 任务统计
	 * @param params
	 * @return
	 */
	List<Map> taskStatistics(@Param("params") Map params);
	
	/**
	 * 查询用户信息
	 * @param username
	 * @return
	 */
	ZentaoUser findUser(String username);

	/**
	 * 查询部门
	 * @param id
	 * @return
	 */
	List<ZentaoDept> findDept(Integer id);

	List<Map> userTaskList(Map<String, String> map);

	List<ZentaoDept> deptList();
}
