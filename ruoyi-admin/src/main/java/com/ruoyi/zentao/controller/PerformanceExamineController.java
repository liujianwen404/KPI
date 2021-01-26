package com.ruoyi.zentao.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jxls.common.Context;
import org.jxls.util.JxlsHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.DateUtil;

import cn.hutool.core.io.IoUtil;
import cn.hutool.core.lang.UUID;
import cn.hutool.core.util.ZipUtil;
import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelUtil;

/**
 * 绩效考核
 * @author vivi207
 *
 */
@Controller
@RequestMapping("/performance/examine")
public class PerformanceExamineController extends BaseController{
	
	private final static Logger log = LoggerFactory.getLogger(PerformanceExamineController.class);

	/**
	 * 导入
	 * @return
	 */
    @GetMapping("/upload")
    public String upload(ModelMap modelMap){
    	
    	
    	return "performance-examine/upload";
    }
	
	/**
	 * 导入生成
	 * @return
	 * @throws IOException 
	 */ 
    @PostMapping("/upload/generate")
    @ResponseBody
    public AjaxResult importGenerate(@RequestParam("file_data")  MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws IOException{

    	ServletContext servletContext = request.getSession().getServletContext();
    	URL template = servletContext.getResource("/excel/template/performance_examine.xlsx");
    	if(template==null) {
    		template = PerformanceExamineController.class.getResource("/excel/template/performance_examine.xlsx");
    	}
    	
    	//压缩输出
    	String zipName = genExcelZip(file.getInputStream(), template.getPath());
    	
    	return AjaxResult.success(zipName);
    }
    
	/**
	 * 导入生成
	 * @return
	 * @throws IOException 
	 */ 
    @GetMapping("/download/{zipName}")
    public void download(@PathVariable("zipName") String zipName, HttpServletResponse response) throws IOException{
    	String filename = "【研发部】个人月度绩效考核表.zip";
    	response.setContentType("application/octet-stream");
    	response.setHeader("Content-disposition", "attachment;filename=" + URLEncoder.encode(filename, "UTF-8"));
    	
    	File zipFile = new File(System.getProperty("java.io.tmpdir")+File.separator+zipName);
    	FileInputStream in = new FileInputStream(zipFile);
    	IoUtil.copy(in, response.getOutputStream());
    	in.close();
    	response.getOutputStream().flush();
    }
    
    /**
     * 生成绩效Excel并压缩输出
     * @param in
     * @throws IOException
     */
    private static String genExcelZip(InputStream in, String template) throws IOException {
    	Date date = new Date();
    	date.setMonth(date.getMonth()-1);
    	date.setDate(1);
    	DateUtil time = new DateUtil(date);
    	ExcelReader excelReader = ExcelUtil.getReader(in, 0);
    	List<Map<String, Object>> data = excelReader.read(1, 2, excelReader.getRowCount());
    	
    	//创建临时目录
    	String tempPath = System.getProperty("java.io.tmpdir")+File.separator+UUID.randomUUID()+File.separator+ time.getYear()+time.getMonth()+File.separator;
    	File tempDir = new File(tempPath);
    	if(!tempDir.exists()) {
    		tempDir.mkdirs();
    	}
    	
    	for(Map<String, Object> item : data){
    		Context context = new Context();
    		context.putVar("_now", new DateUtil());
    		context.putVar("time", time);
    		context.putVar("data", item);
    		
    		String outFile = String.format(tempPath+"【研发部】个人月度绩效考核表-%s%s-%s.xlsx", time.getYear(), time.getMonth(), item.get("姓名"));
    		log.info("outFile:{}", outFile);

    		OutputStream outputStream = new FileOutputStream(outFile);
    		InputStream templateStream = new FileInputStream(template);
    		JxlsHelper.getInstance().processTemplate(templateStream, outputStream, context);
    		outputStream.close();
    		templateStream.close();
    	}

    	String zipName = UUID.randomUUID().toString()+".zip";
    	File zipFile = new File(System.getProperty("java.io.tmpdir")+File.separator+zipName);
    	FileOutputStream out = new FileOutputStream(zipFile);
    	//压缩输出
    	ZipUtil.zip(out, Charset.forName("UTF-8"), true, null, tempDir);
    	out.flush();
    	out.close();
    	
    	//删除临时文件
    	//tempDir.deleteOnExit();
    	///zipFile.deleteOnExit();
    	return zipName;
	}
    
    public static void main(String[] args) throws IOException {
    	FileInputStream in = new FileInputStream("c:/aaa.xlsx");
    	
    	String path = genExcelZip(in, "E:\\gitee\\zentao-kpi\\ruoyi-admin\\src\\main\\resources\\excel\\template\\performance_examine.xlsx");
    	System.out.println(System.getProperty("java.io.tmpdir")+File.separator+path);
    	
    	
    	in.close();
	}
}
