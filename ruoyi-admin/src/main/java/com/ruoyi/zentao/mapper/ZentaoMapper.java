package com.ruoyi.zentao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.ruoyi.zentao.domain.ZentaoDept;
import com.ruoyi.zentao.domain.ZentaoUser;

public interface ZentaoMapper {

	/**
	 * bug清单
	 * @param params
	 * @return
	 */
	List<Map> bugList(@Param("params") Map params);
	
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
	List<Map> taskList(@Param("params") Map params);
	
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
	ZentaoUser findUser(@Param("username") String username);
	

	/**
	 * 查询部门
	 * @param id
	 * @return
	 */
	List<ZentaoDept> findDept(@Param("id") Integer id);

	List<Map> userTaskList(@Param("params") Map<String, String> map);

	List<Map> userRequirementList(@Param("params") Map<String, String> map);

    List<ZentaoDept> deptList();
}
