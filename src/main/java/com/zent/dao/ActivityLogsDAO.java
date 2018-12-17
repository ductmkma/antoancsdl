package com.zent.dao;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import com.zent.entity.ActivityLogs;
import com.zent.entity.Tags;
import com.zent.mapper.ActivityLogsMapper;
import com.zent.mapper.TagsMapper;
import com.zent.utils.Constant;

public class ActivityLogsDAO implements IActivityLogs {
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplateObject;
	public DataSource getDataSoure() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}



	public JdbcTemplate getJdbcTemplateObject() {
		return jdbcTemplateObject;
	}



	public void setJdbcTemplateObject(JdbcTemplate jdbcTemplateObject) {
		this.jdbcTemplateObject = jdbcTemplateObject;
	}
	@Override
	public List<ActivityLogs> getAll() {
		String sql = "SELECT * FROM MINHDUC.activity_logs where deleted_at is null order by id desc";
		List<ActivityLogs> listActivitys = jdbcTemplateObject.query(sql, new ActivityLogsMapper());
		return listActivitys;
	}
	@Override
	public List<ActivityLogs> search(ActivityLogs al, Integer page) {
		String sql = "select * from (select a.*, ROWNUM rnum from (select * from MINHDUC.activity_logs order by id desc) a where rownum <= "+(((page-1)*Constant.PAGE_SIZE_ADMIN)+Constant.PAGE_SIZE_ADMIN)+" and deleted_at is null";
		HashMap<Integer, Object> map = new HashMap<Integer, Object>();
		Integer count = -1;
		if (al.getUsername() != "") {
			count++;
			map.put(count, "%" + al.getUsername() + "%");
			sql += " AND (username LIKE ? ";
		}

		if (al.getIpaddress()!= "") {
			count++;
			map.put(count, "%" + al.getIpaddress() + "%");
			sql += " OR ip_address LIKE ? ) ";
		}

		Object[] args = new Object[count + 1];

		if (count < 0)
			args = new Object[] {};
		else {
			for (Integer key : map.keySet()) {
				args[key] = map.get(key);
			}
		}

		sql += " ) WHERE rnum >= "+ ((page-1)*Constant.PAGE_SIZE_ADMIN+1);
		List<ActivityLogs> listal = jdbcTemplateObject.query(sql, args, new ActivityLogsMapper());
		return listal;
	}

	@Override
	public void insert(ActivityLogs al) {
		Object[] obj = new Object[11];
		obj[0] = al.getMethod();
		obj[1] = al.getIpaddress();
		obj[2] = al.getDatabaseName();
		obj[3] = al.getBrowser();
		obj[4] = al.getOs();
		obj[5] = al.getServerHost();
		obj[6] = al.getHostName();
		obj[7] = al.getMachineConnect();
		if(al.getUsername()=="null"){
			obj[8] = "Không xác định";
		}else{
			obj[8] = al.getUsername();
		}
		
		obj[9] = al.getLink();
		obj[10] = al.getAccount();
		String sql  = "INSERT INTO MINHDUC.activity_logs(method,ip_address,database_name,browser,os,server_host,host_name,machine_connect,username,link,account,created_at) values (?,?,?,?,?,?,?,?,?,?,?,SYSDATE + interval '1' DAY - INTERVAL '9' HOUR)";
		jdbcTemplateObject.update(sql,obj);
		
	}

	@Override
	public String getMethod(HttpServletRequest request) {
		
		return request.getMethod();
	}

	@Override
	public String getDataBaseName() {
		String sql = "select SYS_CONTEXT('USERENV', 'DB_NAME')  from dual";
		String databaseName = jdbcTemplateObject.queryForObject(sql, String.class);
		return databaseName;
	}

	@Override
	public String getBrowser(HttpServletRequest request) {
		String  browserDetails  =   request.getHeader("User-Agent");
        String  userAgent       =   browserDetails;
        String  user            =   userAgent.toLowerCase();
        String browser = "";
		if (user.contains("msie"))
        {
            String substring=userAgent.substring(userAgent.indexOf("MSIE")).split(";")[0];
            browser=substring.split(" ")[0].replace("MSIE", "IE")+"-"+substring.split(" ")[1];
        } else if (user.contains("safari") && user.contains("version"))
        {
            browser=(userAgent.substring(userAgent.indexOf("Safari")).split(" ")[0]).split("/")[0]+"-"+(userAgent.substring(userAgent.indexOf("Version")).split(" ")[0]).split("/")[1];
        } else if ( user.contains("opr") || user.contains("opera"))
        {
            if(user.contains("opera"))
                browser=(userAgent.substring(userAgent.indexOf("Opera")).split(" ")[0]).split("/")[0]+"-"+(userAgent.substring(userAgent.indexOf("Version")).split(" ")[0]).split("/")[1];
            else if(user.contains("opr"))
                browser=((userAgent.substring(userAgent.indexOf("OPR")).split(" ")[0]).replace("/", "-")).replace("OPR", "Opera");
        } else if (user.contains("chrome"))
        {
            browser=(userAgent.substring(userAgent.indexOf("Chrome")).split(" ")[0]).replace("/", "-");
        } else if ((user.indexOf("mozilla/7.0") > -1) || (user.indexOf("netscape6") != -1)  || (user.indexOf("mozilla/4.7") != -1) || (user.indexOf("mozilla/4.78") != -1) || (user.indexOf("mozilla/4.08") != -1) || (user.indexOf("mozilla/3") != -1) )
        {
            //browser=(userAgent.substring(userAgent.indexOf("MSIE")).split(" ")[0]).replace("/", "-");
            browser = "Netscape-?";

        } else if (user.contains("firefox"))
        {
            browser=(userAgent.substring(userAgent.indexOf("Firefox")).split(" ")[0]).replace("/", "-");
        } else if(user.contains("rv"))
        {
            browser="IE-" + user.substring(user.indexOf("rv") + 3, user.indexOf(")"));
        } else
        {
            browser = "UnKnown, More-Info: "+userAgent;
        }
		return browser;
	}

	@Override
	public String getOs(HttpServletRequest request) {
		String  browserDetails  =   request.getHeader("User-Agent");
        String  userAgent       =   browserDetails;

         if (userAgent.toLowerCase().indexOf("windows") >= 0 )
         {
             return "Windows";
         } else if(userAgent.toLowerCase().indexOf("mac") >= 0)
         {
        	 return "Mac";
         } else if(userAgent.toLowerCase().indexOf("x11") >= 0)
         {
        	 return "Unix";
         } else if(userAgent.toLowerCase().indexOf("android") >= 0)
         {
        	 return "Android";
         } else if(userAgent.toLowerCase().indexOf("iphone") >= 0)
         {
        	 return "IPhone";
         }else{
        	 return "UnKnown, More-Info: "+userAgent;
         }
         
	}

	@Override
	public String getServerHost() {
		String sql = "select SYS_CONTEXT('USERENV', 'SERVER_HOST')  from dual";
		String serverHost = jdbcTemplateObject.queryForObject(sql, String.class);
		return serverHost;
	}

	@Override
	public String getHostName() {
		String sql = "select SYS_CONTEXT('USERENV', 'HOST')  from dual";
		String hostName = jdbcTemplateObject.queryForObject(sql, String.class);
		return hostName;
	}

	@Override
	public String getMachineConnect() {
		String sql = "select SYS_CONTEXT('USERENV', 'OS_USER')  from dual";
		String os = jdbcTemplateObject.queryForObject(sql, String.class);
		return os;
	}

	@Override
	public String getIpAddress() {
		String sql = "select SYS_CONTEXT('USERENV', 'IP_ADDRESS')  from dual";
		String ipadd = jdbcTemplateObject.queryForObject(sql, String.class);
		return ipadd;
	}

	@Override
	public String getLink(HttpServletRequest request) {
		
		return request.getRequestURI();
	}

	@Override
	public String getAccount() {
		String sql = "select SYS_CONTEXT('USERENV', 'SESSION_USER')  from dual";
		String acc = jdbcTemplateObject.queryForObject(sql, String.class);
		return acc;
	}

	

}
