package com.ruoyi.web.controller.system;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.utils.ShiroUtils;
import com.ruoyi.framework.shiro.service.SysPasswordService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysDept;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.ServletUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.service.ISysDeptService;
import com.ruoyi.system.service.ISysRoleService;
import com.ruoyi.system.service.ISysUserService;
import com.ruoyi.zentao.domain.ZentaoDept;
import com.ruoyi.zentao.domain.ZentaoUser;
import com.ruoyi.zentao.service.IZentaoService;

/**
 * 登录验证
 * 
 * @author ruoyi
 */
@Controller
public class SysLoginController extends BaseController
{
	
	@Autowired
	private IZentaoService zentaoService;

	@Autowired
	private ISysUserService sysUserService;

	@Autowired
	private ISysDeptService sysDeptService;
	
	@Autowired
	private ISysRoleService sysRoleService;

	@Autowired
	private SysPasswordService passwordService;

	@Value("${debug.username:}")
	private String username;
	@Value("${debug.password:}")
	private String password;
	
    @GetMapping("/login")
    public String login(HttpServletRequest request, HttpServletResponse response, ModelMap mmap)
    {
        // 如果是Ajax请求，返回Json字符串。
        if (ServletUtils.isAjaxRequest(request))
        {
            return ServletUtils.renderString(response, "{\"code\":\"1\",\"msg\":\"未登录或登录超时。请重新登录\"}");
        }

        mmap.put("username", username);
        mmap.put("password", password);

        return "login";
    }

    @PostMapping("/login")
    @ResponseBody
    public AjaxResult ajaxLogin(String username, String password, Boolean rememberMe, String type)
    {
    	if("1".equals(type)) {
    		this.zentaoUserSync(username);
    	}
        UsernamePasswordToken token = new UsernamePasswordToken(username, password, rememberMe);
        Subject subject = SecurityUtils.getSubject();
        try
        {
            subject.login(token);
            return success();
        }
        catch (AuthenticationException e)
        {
            String msg = "用户或密码错误";
            if (StringUtils.isNotEmpty(e.getMessage()))
            {
                msg = e.getMessage();
            }
            return error(msg);
        }
    }
    
    /**
     * 禅道用户同步
     * @param username
     */
    private void zentaoUserSync(String username) {
    	ZentaoUser user = zentaoService.findUser(username);
    	if(user==null) {
    		//禁用本地用户
    		return;
    	}
    	
    	SysUser sysUser = sysUserService.selectUserByLoginName(username);
    	if(sysUser==null) {
    		SysUser update = new SysUser();
    		update.setUserType("00");
    		update.setEmail(user.getEmail());
    		update.setLoginName(user.getAccount());
    		update.setUserName(user.getRealname());
    		update.setPhonenumber(user.getPhone());
    		update.setStatus("0");
    		update.setCreateBy("admin");
    		update.setPassword(user.getPassword().toLowerCase());
    		update.setRemark("禅道用户");
    		update.setRoleIds(new Long[] {2L});
    		if(user.getDept()!=null) {
    			update.setDeptId(Long.valueOf(user.getDept()));
    		}
    		//update.setRoleId(roleId);
    		update.setSex("m".equals(user.getGender())?"0":"1");
//    		if(user.getDept()!=null) {
//    			update.setDeptId(-Integer.toUnsignedLong(user.getDept()));
//    		}
    		
    		if(user.getDeleted()==1) {
        		update.setStatus("1");
    		}
    		
    		sysUserService.insertUser(update);
    		
    		if(user.getDept()!=null) {
    			this.zentaoDeptSync(Long.valueOf(user.getDept()));
    		}
    	}else {
    		SysUser update = new SysUser();
    		update.setDeptId(sysUser.getDeptId());
    		update.setUserName(user.getRealname());
    		if(user.getDeleted()==1) {
        		update.setStatus("1");
    		}
    		//sysUserService.updateUserInfo(update);
    	}
    }
    
    private void zentaoDeptSync(Long deptId) {
    	if(sysDeptService.checkDeptExist(deptId)) {
    		return;
    	}
    	List<ZentaoDept> zentaoDepts = zentaoService.findDept(deptId.intValue());
    	for(ZentaoDept dept : zentaoDepts) {
    		if(sysDeptService.checkDeptExist(deptId)) {
        		continue;
        	}
    		SysDept sysDept = new SysDept();
    		sysDept.setDeptId(Long.valueOf(dept.getId()));
    		sysDept.setParentId(dept.getParent()==null || dept.getParent()==0 ? 100 : Long.valueOf(dept.getParent()));
    		sysDept.setDeptName(dept.getName());
    		sysDept.setOrderNum(dept.getOrder()==null?"0":dept.getOrder().toString());
    		sysDept.setLeader(null);
    		sysDept.setPhone(null);
    		sysDept.setEmail(null);
    		sysDept.setDelFlag("0");
    		sysDept.setCreateBy("admin");
    		sysDept.setCreateTime(new Date());
    		StringBuffer ancestors = new StringBuffer("0,100");
    		for (String p : dept.getPath().split(",")) {
				if(!p.equals("")) {
					ancestors.append(",-").append(p);
				}
			}
    		sysDept.setAncestors(ancestors.toString());//path

			sysDeptService.insertDept(sysDept);
    	}
    }
    

    @GetMapping("/unauth")
    public String unauth()
    {
        return "error/unauth";
    }
}
