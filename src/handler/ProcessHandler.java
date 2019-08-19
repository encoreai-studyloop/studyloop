package handler;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import databean.ArticleReportDataBean;
import databean.AttendDataBean;
import databean.AttendanceCheckDataBean;
import databean.CommentDataBean;
import databean.ScheduleDataBean;
import databean.StudyDataBean;
import databean.StudyReportDataBean;
import databean.UserDataBean;
import databean.UserReportDataBean;
import dbbean.ProcessDao;
import dbbean.ShowDao;

@Controller 
public class ProcessHandler {
	Logger log = Logger.getLogger("studyloop");
	
	@Resource
	private ProcessDao processDao;
	@Resource
	private ShowDao showDao;
	
	private long inTime;
	private long outTime;
	

	@RequestMapping("/calendar")
	public ModelAndView calendarPageprocess(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		log.debug("[캘린더 진입]");
		
		int study_id = Integer.parseInt(req.getParameter("sid"));
		req.setAttribute("study_id", study_id);
		int id = ((UserDataBean) req.getSession().getAttribute("userDto")).getId();
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("study_id", study_id);
		map.put("id", id);
		List<UserDataBean> userDtoList = processDao.getHattendCheckTable(map);
		userDtoList.add(((UserDataBean) req.getSession().getAttribute("userDto")));
		log.debug(showDao.getStudyInfo(study_id).getTitle());
		req.setAttribute("userDtoList", userDtoList);
		
		return new ModelAndView("views/process/calendar");
	}
	
	
	 @RequestMapping(value="/initcalendar.do", produces="application/json; charset=utf8")
	 @ResponseBody
	 public ResponseEntity initcalendarprocess(HttpServletRequest req, HttpServletResponse resp) throws Exception{
        HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.add("Content-Type", "application/json;charset=UTF-8");

        ArrayList<HashMap> hmlist = new ArrayList<HashMap>();	        
        //스터디 아이디
        int study_id = Integer.parseInt(req.getParameter("study_id"));
        List<ScheduleDataBean> scheduleDto = processDao.selectSchedulebyId(study_id);
        
        if(scheduleDto.size() > 0){
        	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        	SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM-dd");
            for(int i=0; i<scheduleDto.size(); i++){
                HashMap hm = new HashMap();
                hm.put("id", scheduleDto.get(i).getId());
                hm.put("content", scheduleDto.get(i).getContent());
                hm.put("start_date", df.format(scheduleDto.get(i).getStart_date()));
                if(scheduleDto.get(i).getEnd_date() != null)
                	hm.put("end_date", df.format(scheduleDto.get(i).getEnd_date()));
                hm.put("classname", scheduleDto.get(i).getClassname());
                hm.put("allDay", scheduleDto.get(i).getAllDay());
                hmlist.add(hm);
            }
            
        }
        JSONArray json = new JSONArray();
        json.addAll(hmlist);
        System.out.println(json.toString());
        return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
	        
	}
	 
    @RequestMapping(value="/updatecalendar.do")
    @ResponseBody
    public String updatecalendarprocess(@RequestParam("study_id") int study_id, HttpServletRequest req) throws Exception{
        
      //server단 확인
       
       String[] parameterValues = req.getParameterValues("events");
       String[] ids = req.getParameterValues("ids"); //삭제 됬는지 확인하기 위한 삭제전 있던 id 목록
       List<String> idsList = null;
       if(ids == null) {
    	   idsList = new ArrayList<String>();
       }
       else {
    	   idsList = new ArrayList<String>(Arrays.asList(ids));
       }
     
       
       //System.out.println(parameterValues[0]);
       //System.out.println(idsList.toString());
       List<Map<String,Object>> resultMap = new ArrayList<Map<String,Object>>();
       resultMap = net.sf.json.JSONArray.fromObject(parameterValues[0]);
      
       for (Map<String, Object> map : resultMap) {
    	   map.put("study_id", study_id);
    	   //System.out.println( "end : "+ ((String)map.get("end")));
    	   if((boolean)map.get("allDay")== true) {
    		   map.replace("allDay", "true");
    	   }
    	   else {
    		   map.replace("allDay", "false");
    	   }
    	   if(((String)map.get("end")).equals("Invalid date")) {
    		  // System.out.println("바뀜");
    		   map.replace("end", "");
    	   }
    	   if(map.containsKey("id")) {
    		   String tmp = Integer.toString((int) map.get("id"));
        	   if(idsList.contains(tmp)) {
        		   idsList.remove(tmp);
        	   }
    	   }
           processDao.updateCalendar(map);
       }
       if(idsList.size()>0)
    	   processDao.deleteCalendar(idsList);

        return Integer.toString(study_id);
    }
    
    
    @RequestMapping("/attend")
	public ModelAndView attendprocess(HttpServletRequest req, HttpServletResponse resp) throws Exception{
    	
    	outTime = System.currentTimeMillis();
    	
		long millis = (outTime - inTime);
		long minutes = (millis / 1000)  / 60;
		int seconds = (int)((millis / 1000) % 60);			
		log.debug("[스터디 별 출석부 이용 시간] "+ minutes+" 분 "+seconds+" 초");
		

	
    	UserDataBean userDto = (UserDataBean)(req.getSession().getAttribute("userDto"));

    	
    	// getStudy
    	// getAttendee
    	List<StudyDataBean> studyDtoList = processDao.getStudyforAt(userDto.getId());
    	List<StudyDataBean> ateeDtoList = processDao.getAttendee(userDto.getId());
    	
    	
    	req.setAttribute("studyDtoList", studyDtoList);
    	req.setAttribute("ateeDtoList", ateeDtoList);
    	
    	
    	//주최자 스터디 제목
    	Map<String,Integer> htitleMap = new HashMap<String,Integer>();
    	int id = userDto.getId(); // 로그인된 아이디

 
		int hsid = Integer.parseInt(req.getParameter("hsid"));
		
    	htitleMap.put("id", id);
    	htitleMap.put("study_id", hsid);
    
		
		//참여자 스터디 제목
		List<UserDataBean> getHattendCheckTable  = processDao.getHattendCheckTable(htitleMap);
		req.setAttribute("getHattendCheckTable", getHattendCheckTable);
		req.setAttribute("hsid", htitleMap.get("study_id"));
		
		
		List<AttendanceCheckDataBean> atckDtoList = processDao.getAttendanceStatus(htitleMap.get("study_id"));
		if(atckDtoList != null) {
			req.setAttribute("atckDtoList", atckDtoList);
		}
		String noedit = req.getParameter("noedit");
		if(noedit != null) {
			req.setAttribute("noedit", 1);
		}
		
		log.debug("[출석부 사용자, 스터디]");
	
		StudyDataBean getStudyInfo = (StudyDataBean)showDao.getStudyInfo(hsid);
		log.debug(userDto.getNick()+","+getStudyInfo.getTitle());


		
		inTime = System.currentTimeMillis();
		
		return new ModelAndView("views/process/attend");
		
		
	}
	
	@RequestMapping("/updateStatus")
	public void updateStautsprocess(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");
		
		UserDataBean userDto = (UserDataBean)(req.getSession().getAttribute("userDto"));
    	
    	// getStudy
    	// getAttendee
    	List<StudyDataBean> studyDtoList = processDao.getStudyforAt(userDto.getId());
    	List<StudyDataBean> ateeDtoList = processDao.getAttendee(userDto.getId());
    	req.setAttribute("studyDtoList", studyDtoList);
    	req.setAttribute("ateeDtoList", ateeDtoList);
    	
    	//주최자 스터디 제목
    	Map<String,Integer> htitleMap = new HashMap<String,Integer>();
    	int id = userDto.getId(); // 로그인된 아이디

    	if(req.getParameter("hsid")== null) {
    		int hsid = 1;
        	htitleMap.put("id", id);
        	htitleMap.put("study_id", hsid);
    	}
    	else {
    		int hsid = Integer.parseInt(req.getParameter("hsid"));
        	htitleMap.put("id", id);
        	htitleMap.put("study_id", hsid);
    	}
    	
		
		
		List<UserDataBean> getHattendCheckTable  = (List<UserDataBean>)processDao.getHattendCheckTable(htitleMap);
		req.setAttribute("getHattendCheckTable", getHattendCheckTable);
		
		// 여기까지 attend setting
		
		
		int hsid = Integer.parseInt(req.getParameter("hsid"));
		int uid = Integer.parseInt(req.getParameter("uid"));
		String now = req.getParameter("now");
		String status = req.getParameter("status");
		
		//System.out.println(hsid);
		//System.out.println(uid);
		
		AttendDataBean attendDto = new AttendDataBean();
		
				
		attendDto.setStudy_id(hsid);
		attendDto.setUser_id(uid);
		
		
		String dateParts[] = now.split("@");
		String day  = dateParts[0]; //일 //23
		String month  = dateParts[1]; //월 //07
		String year = dateParts[2]; //년 //2019
		
		String current = day + "-" + month + "-" + year;
		//System.out.println(current);
		

		DateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
		Date date = formatter.parse(current);  
		//System.out.println(date);
		
		attendDto.setAttend_date(date);
		attendDto.setAttendance(status);
		
		int check = processDao.checkAttendData(attendDto);
		if(check == 0) {
			processDao.insertHattendListTable(attendDto);
			
		}
		else {
			processDao.updateHattendListTable(attendDto);
		}
		
		
		String noedit = req.getParameter("noedit");
		if(noedit != null) {
			req.setAttribute("noedit", 1);
		}

		resp.sendRedirect("attend.do?hsid="+hsid);
		
	
	}
	
	@RequestMapping("/reportForm")
	public ModelAndView reportFormprocess(HttpServletRequest req, HttpServletResponse resp) throws Exception{
		
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");
		
		inTime = System.currentTimeMillis();

		
		
		return new ModelAndView("views/process/reportForm");
		
	}
	
	@RequestMapping("/updateReport")
	public ModelAndView updateReportprocess(HttpServletRequest req, HttpServletResponse resp) throws Exception{
		
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");
		
		
		// System.out.println("핸들러 들어옴");
		UserDataBean userDto = (UserDataBean)(req.getSession().getAttribute("userDto"));
		String reporter_nick = userDto.getNick();
		log.debug("[신고하는 사람 닉네임] " + reporter_nick);
		
		int cases = Integer.parseInt(req.getParameter("radio")); // 사용자, 스터디, 게시글
		// System.out.println("cases : " + cases);
		
		int reason = Integer.parseInt(req.getParameter("reason")); // repcat_id
		String reasonName = processDao.repCat(reason);
		
		
		String content = req.getParameter("content"); // content
		// System.out.println("content : " + content);
		
		
		
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		
		if(cases == 0) {
			String detail = req.getParameter("which-user"); 
			// System.out.println("detail : " + detail);
			//사용자
			log.debug("[신고 당한 사용자 닉네임] " + detail);
			
			UserReportDataBean urDto = new UserReportDataBean();
			urDto.setContent(content);
			log.debug("[신고 내용] " + content);
			
			urDto.setRepcat_id(reason);
			log.debug("[신고 이유] " + reasonName);
			urDto.setReporter_nick(reporter_nick);
			urDto.setTime(timestamp);
			urDto.setSuspect_nick(detail);
			
			int result = processDao.putUserRep(urDto);
			
			req.setAttribute("result", result);
			
			
		} else if (cases == 1) {
			String detail1 = req.getParameter("which-study-title"); 
			log.debug("[신고 당한 스터디 제목] " + detail1);
			
			String detail2 = req.getParameter("which-study-hname");
			log.debug("[신고 당한 스터디 주최자 닉네임] " + detail2);

			//스터디
			StudyReportDataBean srDto = new StudyReportDataBean();
			srDto.setContent(content);
			log.debug("[신고 내용] " + content);
			srDto.setRepcat_id(reason);
			log.debug("[신고 이유] " + reasonName);
			
			srDto.setReporter_nick(reporter_nick);
			srDto.setTime(timestamp);
			srDto.setStudy_title(detail1);
			srDto.setSuspect_nick(detail2);
			
			
			int result = processDao.putStudyRep(srDto);
			
			req.setAttribute("result", result);
			
			
		} else if (cases == 2) {
			String detail1 = req.getParameter("which-article-hname");
			log.debug("[신고 당한 게시글을 작성한 사용자 닉네임] " + detail1);
			
			String detail2 = req.getParameter("which-article-stitle");
			log.debug("[신고 당한 게시글의 스터디 제목] + " + detail2);
			
			String detail3 = req.getParameter("which-article-title");
			log.debug("[신고 당한 게시글 제목] " + detail3);
			
			// System.out.println("detail1 : " + detail1);
			// System.out.println("detail2 : " + detail2);
			// System.out.println("detail3 : " + detail3);
			//게시글
			ArticleReportDataBean arDto = new ArticleReportDataBean();
			
			arDto.setContent(content);
			log.debug("[신고 내용] " + content);
			
			arDto.setArticle_title(detail3);
			arDto.setReporter_nick(reporter_nick);
			arDto.setRepcat_id(reason);
			log.debug("[신고 이유] " + reasonName);
			
			arDto.setStudy_title(detail2);
			arDto.setSuspect_nick(detail1);
			arDto.setTime(timestamp);
			
			int result = processDao.putArticleRep(arDto);
			req.setAttribute("result", result);
		}
		
		
		outTime = System.currentTimeMillis();
		
    	
		long millis = (outTime - inTime);
		long minutes = (millis / 1000)  / 60;
		int seconds = (int)((millis / 1000) % 60);			
		log.debug("[신고 이용 시간] "+ minutes+" 분 "+seconds+" 초");
		return new ModelAndView("views/process/updateRepPro");
		
	}
	
	
	
	@RequestMapping("/rateForm")
	public ModelAndView rateprocess(HttpServletRequest req, HttpServletResponse resp) throws Exception{
		
		inTime = System.currentTimeMillis();

		
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");
		
		UserDataBean userDto = (UserDataBean)(req.getSession().getAttribute("userDto"));
		
		int study_id = Integer.parseInt(req.getParameter("sid"));
		StudyDataBean getStudyInfo = (StudyDataBean)showDao.getStudyInfo(study_id);

		//int study_id =1;
		
		Map<String, Integer> rateMap = new HashMap<String,Integer>();
		
		rateMap.put("id", userDto.getId());
		rateMap.put("study_id", study_id);
		
		log.debug("[종료된 스터디 제목] " + getStudyInfo.getTitle());
		
		List<UserDataBean> getHattendCheckTable  = (List<UserDataBean>)processDao.getHattendCheckTable(rateMap);
		req.setAttribute("getHattendCheckTable", getHattendCheckTable);
	
		
		
	
		return new ModelAndView("views/process/rateForm");
		
	}
	
	@RequestMapping("/updateRate")
		public ModelAndView updateRateprocess(HttpServletRequest req, HttpServletResponse resp) throws Exception{

		UserDataBean userDto = (UserDataBean)(req.getSession().getAttribute("userDto"));
		
		
		String ids = req.getParameter("ids");
		ids = ids.substring(0, ids.length()-1);
		String rates = req.getParameter("rates");
		rates = rates.substring(0, rates.length()-1);
		int num = Integer.parseInt(req.getParameter("num"));
		
		List<String> idsList = (Arrays.asList(ids.split("a")));  //"257" - > 2,5,7,
		
		List<String> ratesList = (Arrays.asList(rates.split("a")));// "343" - > 3,4,3
		
		int result = 0;
		log.debug("[평점 부여]"); 
		for(int i =0; i<num; i++) {
			
			UserDataBean user = processDao.getUser(Integer.parseInt(idsList.get(i)));
			
			double rate = (user.getRate() + Double.parseDouble(ratesList.get(i)) )/ 2;
			int rateLog = Integer.parseInt(ratesList.get(i));
		
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", user.getId());
			map.put("rate", rate);
			
			log.debug(user.getNick() +","+ rateLog);
		
			
			result = processDao.updateRate(map);
		}
		
		
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("id", userDto.getId());
		map2.put("point", userDto.getPoint() + 10);
		processDao.updatePoint(map2);
		
		req.setAttribute("result", result);
		
		outTime = System.currentTimeMillis();
		
    	
		long millis = (outTime - inTime);
		long minutes = (millis / 1000)  / 60;
		int seconds = (int)((millis / 1000) % 60);			
		log.debug("[평점 이용 시간] "+ minutes+" 분 "+seconds+" 초");
		return new ModelAndView("views/process/updateRegPro");
		
	}
	
	
	
    
}
