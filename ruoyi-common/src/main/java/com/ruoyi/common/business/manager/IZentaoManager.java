package com.ruoyi.common.business.manager;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface IZentaoManager {

	/**
	 * 工作进度
	 * @param params
	 * @return
	 */
	List<Map> jobSchedule(Map params);


}
