package com.ruoyi.common.business.entity;

import java.util.Date;

import com.alibaba.excel.annotation.ExcelIgnore;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 员工日报对象 t_business_journal
 * 
 * @author liujianwen
 * @date 2021-01-16
 */
@Data
@TableName(value = "t_business_journal")
public class Journal extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键ID */
    @TableId(value = "id",type = IdType.AUTO)//指定自增策略
    private Long id;

    /** 员工id */
    @ExcelIgnore
    @TableField
    private Long userId;

    /** 员工名称 */
    @Excel(name = "员工")
    @TableField
    private String userName;

    /** 部门id */
    @ExcelIgnore
    @TableField
    private Long deptId;

    /** 部门名称 */
    @Excel(name = "部门")
    @TableField
    private String deptName;

    /** 岗位id */
    @ExcelIgnore
    @TableField
    private Long postId;

    /** 岗位名称 */
    @ExcelIgnore
    @TableField
    private String postName;

    /** 日期 */
    @Excel(name = "日期", width = 30, dateFormat = "yyyy-MM-dd")
    @TableField
    private Date date;

    /** 禅道任务ID */
    @ExcelIgnore
    @TableField
    private Long zentaoId;

    /** 禅道任务名称 */
    @Excel(name = "禅道任务名称")
    @TableField
    private String zentaoName;

    /** 任务进度 */
    @Excel(name = "任务进度（百分比）")
    @TableField
    private String taskProgress;


}
