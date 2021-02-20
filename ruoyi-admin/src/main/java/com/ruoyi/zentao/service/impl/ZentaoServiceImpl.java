package com.ruoyi.zentao.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ruoyi.common.annotation.DataSource;
import com.ruoyi.common.enums.DataSourceType;
import com.ruoyi.zentao.domain.ZentaoDept;
import com.ruoyi.zentao.domain.ZentaoUser;
import com.ruoyi.zentao.mapper.ZentaoMapper;
import com.ruoyi.zentao.service.IZentaoService;

/**
 * 禅道
 * @author vivi207
 *
 */
@DataSource(DataSourceType.ZENTAO)
@Service
public class ZentaoServiceImpl implements IZentaoService {
	
	@Autowired
    private ZentaoMapper zentaoMapper;
	
	@Override
	public List<Map> bugList(Map params) {
		return zentaoMapper.bugList(params);
	}

	@Override
	public List<Map> bugStatistics(Map params) {
		return zentaoMapper.bugStatistics(params);
	}

	@Override
	public List<Map> taskList(Map params) {
		return zentaoMapper.taskList(params);
	}

	@Override
	public List<Map> taskStatistics(Map params) {
		return zentaoMapper.taskStatistics(params);
	}
	
	@Override
	public ZentaoUser findUser(String username) {
		if(username==null || "".equals(username)) {
			return null;
		}
		return zentaoMapper.findUser(username);
	}
	
	@Override
	public List<ZentaoDept> findDept(Integer id) {
		if(id==null) {
			return new ArrayList(0);
		}
		return zentaoMapper.findDept(id);
	}

	@Override
	public List<Map> userTaskList(Map<String, String> map) {
		return zentaoMapper.userTaskList(map);
	}

	@Override
	public List<Map> userRequirementList(Map<String, String> map) {
		return zentaoMapper.userRequirementList(map);
	}

	@Override
	public List<ZentaoDept> deptList() {
		return zentaoMapper.deptList();
	}

}
