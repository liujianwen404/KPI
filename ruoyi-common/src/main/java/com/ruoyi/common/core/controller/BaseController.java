package com.ruoyi.common.core.controller;

import java.beans.PropertyEditorSupport;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.AjaxResult.Type;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.page.PageDomain;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.page.TableSupport;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.ServletUtils;
import com.ruoyi.common.utils.ShiroUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.sql.SqlUtil;

import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;

/**
 * web层通用数据处理
 * 
 * @author ruoyi
 */
public class BaseController
{
    protected final Logger logger = LoggerFactory.getLogger(BaseController.class);
	
	public static final int[] CN_WEEKS = new int[] {6,7,1,2,3,4,5};

    /**
     * 将前台传递过来的日期格式的字符串，自动转化为Date类型
     */
    @InitBinder
    public void initBinder(WebDataBinder binder)
    {
        // Date 类型转换
        binder.registerCustomEditor(Date.class, new PropertyEditorSupport()
        {
            @Override
            public void setAsText(String text)
            {
                setValue(DateUtils.parseDate(text));
            }
        });
    }

    /**
     * 设置请求分页数据
     */
    protected void startPage()
    {
        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();
        if (StringUtils.isNotNull(pageNum) && StringUtils.isNotNull(pageSize))
        {
            String orderBy = SqlUtil.escapeOrderBySql(pageDomain.getOrderBy());
            PageHelper.startPage(pageNum, pageSize, orderBy);
        }
    }

    /**
     * 设置请求排序数据
     */
    protected void startOrderBy()
    {
        PageDomain pageDomain = TableSupport.buildPageRequest();
        if (StringUtils.isNotEmpty(pageDomain.getOrderBy()))
        {
            String orderBy = SqlUtil.escapeOrderBySql(pageDomain.getOrderBy());
            PageHelper.orderBy(orderBy);
        }
    }

    /**
     * 获取request
     */
    public HttpServletRequest getRequest()
    {
        return ServletUtils.getRequest();
    }

    /**
     * 获取response
     */
    public HttpServletResponse getResponse()
    {
        return ServletUtils.getResponse();
    }

    /**
     * 获取session
     */
    public HttpSession getSession()
    {
        return getRequest().getSession();
    }

    /**
     * 响应请求分页数据
     */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    protected TableDataInfo getDataTable(List<?> list)
    {
        TableDataInfo rspData = new TableDataInfo();
        rspData.setCode(0);
        rspData.setRows(list);
        rspData.setTotal(new PageInfo(list).getTotal());
        return rspData;
    }

    /**
     * 响应返回结果
     * 
     * @param rows 影响行数
     * @return 操作结果
     */
    protected AjaxResult toAjax(int rows)
    {
        return rows > 0 ? success() : error();
    }

    /**
     * 响应返回结果
     * 
     * @param result 结果
     * @return 操作结果
     */
    protected AjaxResult toAjax(boolean result)
    {
        return result ? success() : error();
    }

    /**
     * 返回成功
     */
    public AjaxResult success()
    {
        return AjaxResult.success();
    }

    /**
     * 返回失败消息
     */
    public AjaxResult error()
    {
        return AjaxResult.error();
    }

    /**
     * 返回成功消息
     */
    public AjaxResult success(String message)
    {
        return AjaxResult.success(message);
    }

    /**
     * 返回失败消息
     */
    public AjaxResult error(String message)
    {
        return AjaxResult.error(message);
    }

    /**
     * 返回错误码消息
     */
    public AjaxResult error(Type type, String message)
    {
        return new AjaxResult(type, message);
    }

    /**
     * 页面跳转
     */
    public String redirect(String url)
    {
        return StringUtils.format("redirect:{}", url);
    }
    
    /**
     * 初始化时间段参数
     * @param modelMap
     */
	protected void initTimeRanges(ModelMap modelMap) {
		List<Map> timeRanges = new ArrayList();
		final Date curr = new Date();
		timeRanges.add(new HashMap() {{
			put("name", "本周");
			put("begin", DateUtil.format(DateUtil.beginOfWeek(curr), "yyyy-MM-dd"));
			put("end", DateUtil.format(DateUtil.endOfWeek(curr), "yyyy-MM-dd"));
		}});
		curr.setDate(curr.getDate()-7);
		timeRanges.add(new HashMap() {{
			put("name", "上周");
			put("begin", DateUtil.format(DateUtil.beginOfWeek(curr), "yyyy-MM-dd"));
			put("end", DateUtil.format(DateUtil.endOfWeek(curr), "yyyy-MM-dd"));
		}});
		final Date curr2 = new Date();
		timeRanges.add(new HashMap() {{
			put("name", "本月");
			put("begin", DateUtil.format(DateUtil.beginOfMonth(curr2), "yyyy-MM-dd"));
			put("end", DateUtil.format(DateUtil.endOfMonth(curr2), "yyyy-MM-dd"));
		}});
		timeRanges.add(new HashMap() {{
			put("name", "本月(自然周)");
			put("begin", firstNaturalWeek(DateUtil.beginOfMonth(curr2)));
			put("end", endNaturalWeek(DateUtil.endOfMonth(curr2)));
		}});
		curr2.setMonth(curr2.getMonth()-1);
		timeRanges.add(new HashMap() {{
			put("name", "上月");
			put("begin", DateUtil.format(DateUtil.beginOfMonth(curr2), "yyyy-MM-dd"));
			put("end", DateUtil.format(DateUtil.endOfMonth(curr2), "yyyy-MM-dd"));
		}});
		timeRanges.add(new HashMap() {{
			put("name", "上月(自然周)");
			put("begin", firstNaturalWeek(DateUtil.beginOfMonth(curr2)));
			put("end", endNaturalWeek(DateUtil.endOfMonth(curr2)));
		}});
		

		modelMap.put("timeRanges", timeRanges);
		modelMap.put("beginDate", timeRanges.get(0).get("begin"));
		modelMap.put("endDate", timeRanges.get(0).get("end"));
	}
	
	private static String firstNaturalWeek(Date date) {
		DateTime begin = DateUtil.beginOfMonth(date);
		int week = CN_WEEKS[begin.dayOfWeek()];
		if(week!=1) {
			begin.setDate(begin.getDate()+(8-week));
		}
		return DateUtil.format(begin, "yyyy-MM-dd");
	}
	
	private static String endNaturalWeek(Date date) {
		DateTime end = DateUtil.endOfMonth(date);
		int week = CN_WEEKS[end.dayOfWeek()];
		if(week!=7) {
			end.setDate(end.getDate()+(7-week));
		}
		return DateUtil.format(end, "yyyy-MM-dd");
	}
	
	public void loadZentaoIdentity(Map data) {
		if(data==null) {
			return ;
		}
		SysUser sysUser = ShiroUtils.getSysUser();
		if(sysUser==null) {
			return ;
		}
		if(sysUser.getRoles()!=null && sysUser.getRoles().stream().anyMatch(i->"admin".equals(i.getRoleKey()) || "assistant".equals(i.getRoleKey()))) {
			//data.put("deptId", sysUser.getDeptId());
		} else if(sysUser.getRoles()!=null && sysUser.getRoles().stream().anyMatch(i->"group".equals(i.getRoleKey())) && sysUser.getDeptId()!=null) {
			data.put("deptId", Math.abs(sysUser.getDeptId()));
		} else {
			data.put("username", sysUser.getLoginName());
		}
	}
}
