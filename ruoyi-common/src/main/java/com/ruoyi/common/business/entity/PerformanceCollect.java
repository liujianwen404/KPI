package com.ruoyi.common.business.entity;

import java.math.BigDecimal;
import java.util.Date;

import com.alibaba.excel.annotation.ExcelIgnore;
import com.alibaba.excel.annotation.ExcelProperty;
import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 个人月度绩效考核汇总对象 t_performance_collect
 * 
 * @author ruoyi
 * @date 2021-02-18
 */
@Data
public class PerformanceCollect extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键ID */
    @ExcelIgnore
    private Long id;

    /** 日期 */
    @ExcelIgnore
    private Date date;

    /** 部门id */
    @ExcelIgnore
    private Long deptId;

    /** 部门名称 */
    @ExcelProperty({"员工信息","部门"})
    private String deptName;

    /** 岗位id */
    @ExcelIgnore
    private Long postId;

    /** 岗位名称 */
    @ExcelIgnore
    private String postName;

    /** 员工id */
    @ExcelIgnore
    private Long userId;

    /** 员工姓名 */
    @ExcelProperty({"员工信息","姓名"})
    private String userName;

    /** 工作进度 */
    @ExcelProperty({"绩效考核(100分)","工作进度"})
    private BigDecimal jobSchedule;

    /** 工作质量 */
    @ExcelProperty({"绩效考核(100分)","工作质量"})
    private BigDecimal jobQuality;

    /** 工作表现 */
    @ExcelProperty({"绩效考核(100分)","工作表现"})
    private BigDecimal jobPerformance;

    /** 产品满意度 */
    @ExcelProperty({"绩效考核(100分)","产品满意度"})
    private String productSatisfaction;

    /** 考核合计 */
    @ExcelProperty({"绩效考核(100分)","考核合计"})
    private BigDecimal assessTotal;

    /** 学习提升 */
    @ExcelProperty({"鼓励加分","学习提升"})
    private BigDecimal learningPromotion;

    /** 质量保障 */
    @ExcelProperty({"鼓励加分","质量保障"})
    private BigDecimal qualityAssurance;

    /** 专利资质 */
    @ExcelProperty({"鼓励加分","专利资质"})
    private BigDecimal patent;

    /** 效率优化 */
    @ExcelProperty({"鼓励加分","效率优化"})
    private BigDecimal efficiency;

    /** 鼓励合计 */
    @ExcelProperty({"鼓励加分","鼓励合计"})
    private BigDecimal encourageTotal;

    /** 绩效评分 */
    @ExcelProperty({"绩效考评","绩效评分"})
    private BigDecimal performanceGrade;

    /** 绩效评级 */
    @ExcelProperty({"绩效考评","绩效评级"})
    private String performanceRate;


}
