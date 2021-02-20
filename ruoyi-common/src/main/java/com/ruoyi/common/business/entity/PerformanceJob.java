package com.ruoyi.common.business.entity;

import java.math.BigDecimal;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 个人工作现考核对象 t_performance_job
 * 
 * @author ruoyi
 * @date 2021-02-18
 */
@Data
@TableName(value = "t_performance_job")
public class PerformanceJob extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键ID */
    @TableId(value = "id",type = IdType.AUTO)//指定自增策略
    private Long id;

    /** 日期 */
    private Date date;

    /** 代码规范（个人） */
    @Excel(name = "代码规范", readConverterExp = "个=人")
    private BigDecimal infoCodeStandards;

    /** 沟通协调（个人） */
    @Excel(name = "沟通协调", readConverterExp = "个=人")
    private BigDecimal infoCoordination;

    /** 责任感（个人） */
    @Excel(name = "责任感", readConverterExp = "个=人")
    private BigDecimal infoResponsibility;

    /** 意见建议 */
    @Excel(name = "意见建议")
    private String opinion;

    /** 自我评分 */
    @Excel(name = "自我评分")
    private BigDecimal infoGrade;

    /** 代码规范（上级） */
    @Excel(name = "代码规范", readConverterExp = "上=级")
    private BigDecimal superiorCodeStandards;

    /** 沟通协调（上级） */
    @Excel(name = "沟通协调", readConverterExp = "上=级")
    private BigDecimal superiorCoordination;

    /** 责任感（上级） */
    @Excel(name = "责任感", readConverterExp = "上=级")
    private BigDecimal superiorResponsibility;

    /** 上级评分 */
    @Excel(name = "上级评分")
    private BigDecimal superiorGrade;

    /** 员工id */
    private Long userId;

    /** 员工姓名 */
    @Excel(name = "姓名")
    private String userName;

    /** 部门id */
    private Long deptId;

    /** 部门名称 */
    @Excel(name = "部门")
    private String deptName;

    /** 岗位id */
    private Long postId;

    /** 岗位名称 */
    private String postName;

    /** 创建者id */
    private Long createId;

    /** 更新者id */
    private Long updateId;

    /** 删除标志（0代表存在 1代表删除） */
    private String delFlag;

    @Excel(name = "说明")
    private String remark;
}
