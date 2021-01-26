package com.ruoyi.common.core.domain;

import java.util.LinkedHashMap;
import java.util.Map;

import com.alibaba.fastjson.JSON;

/**
 * 查询表单
 * @author vivi207
 *
 */
public class QueryForm {
	
	private Map<String,String> params;
	
	private String header;

	public Map<String, String> getParams() {
		return params;
	}

	public void setParams(Map<String, String> params) {
		this.params = params;
	}

	public Map<String, String> getHeader() {
		if(header==null || "".equals(header)) {
			return new LinkedHashMap<String, String>(0);
		}
		return JSON.parseObject(header, LinkedHashMap.class);
	}

	public void setHeader(String header) {
		this.header = header;
	}
}
