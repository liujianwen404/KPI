package com.ruoyi.common.core.domain;

import java.beans.Transient;
import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.alibaba.excel.annotation.ExcelIgnore;
import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

/**
 * Entity基类
 * 
 * @author ruoyi
 */
@Data
public class BaseEntity implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 搜索值 */
    @ExcelIgnore
    @TableField(exist = false)
    private String searchValue;

    @ExcelIgnore
    private Long createId;

    /** 创建者 */
    @ExcelIgnore
    private String createBy;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @ExcelIgnore
    private Date createTime;

    @ExcelIgnore
    private Long updateId;

    /** 更新者 */
    @ExcelIgnore
    private String updateBy;

    /** 更新时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @ExcelIgnore
    private Date updateTime;

    /** 备注 */
    @ExcelIgnore
    private String remark;

    /** 删除标志（0代表存在 1代表删除） */
    @ExcelIgnore
    private String delFlag;

    /** 请求参数 */
    @TableField(exist=false)
    @ExcelIgnore
    private Map<String, Object> params;

    public Map<String, Object> getParams()
    {
        if (params == null)
        {
            params = new HashMap<>();
        }
        return params;
    }

    public void setParams(Map<String, Object> params)
    {
        this.params = params;
    }
}
