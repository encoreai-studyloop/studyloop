package handler;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

import databean.ApplyDataBean;
import databean.AttendeeDataBean;
import databean.BoardDataBean;
import databean.CategoryTempBean;
import databean.CertificateDataBean;
import databean.CommentDataBean;
import databean.ExpDataBean;
import databean.LanguageDataBean;
import databean.LocationDataBean;
import databean.SchoolDataBean;
import databean.StudyDataBean;
import databean.StudyTimeDataBean;
import databean.UserDataBean;
import dbbean.BoardDBBean;
import dbbean.ShowDBBean;
import dbbean.UserDao;

@Controller
public class ShowHandler {
	@Resource
	private ShowDBBean showDao;
	@Resource
	private BoardDBBean boardDao;
	@Resource
	private UserDao userDao;
	
	private Logger log = Logger.getLogger( "show" );

	long applyintime;
	long applyouttime;
	
	SimpleDateFormat inputFormat = new SimpleDateFormat( "MM/dd/yyyy" );
	
	@RequestMapping("/view")
	public ModelAndView viewPro(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		HttpSession session = req.getSession( true );

		//int study_id = 1; // for temporary selected study data
		int study_id = Integer.parseInt( req.getParameter("sid") );	// studyId parameter
		
		//int tuser_id = 5; // for temporary signed-user data
		UserDataBean userDto = (UserDataBean) req.getSession().getAttribute("userDto"); //세션에서 가져온 유저 정보
		if(userDto != null) {
			userDto = userDao.getUserById(userDto.getId());
		}
		
		
		int cntAttendee = showDao.getCntAttendee( study_id );	// count attendee with regprocess_id=5
		
		StudyDataBean studyDto = showDao.getStudyInfo( study_id );
		StudyTimeDataBean studytimeDto = showDao.getStudyTime( study_id );
		LocationDataBean locationDto = showDao.getLocation( study_id );
		ApplyDataBean masterData = showDao.loadPrevData( studyDto.getUser_id() );	// study master-user data
		CategoryTempBean categoryDto = showDao.getStudyCategoryNames( studyDto.getCat_id() );
		//UserDataBean userDto = showDao.getMyData( userDto.getId() );
		if(userDto != null) {
			ApplyDataBean applyDto = showDao.loadPrevData( userDto.getId() );
			req.setAttribute( "applyDto", applyDto );
		}
		studyDto.setCur_personnel( cntAttendee );

		if ( cntAttendee != 0 ) { 
			List<Integer> idList = showDao.getIdListAttendee( study_id );	// study members
			Map<Integer, ApplyDataBean> dataMap = new HashMap<Integer, ApplyDataBean>();
			for (Integer user_id : idList) {
				ApplyDataBean applyData = showDao.loadPrevData( user_id );
				dataMap.put( user_id,  applyData );
			}			
			req.setAttribute( "dataMap", dataMap );
		}

		req.setAttribute( "cntAttendee", cntAttendee );
		req.setAttribute( "masterData", masterData );
		req.setAttribute( "cntAttendee", cntAttendee );
		session.setAttribute( "studyDto", studyDto );	// studyDto -> on session
		session.setAttribute( "studytimeDto", studytimeDto );
		session.setAttribute( "locationDto", locationDto );
		
		session.setAttribute( "userDto", userDto );		// userDto -> on session
		session.setMaxInactiveInterval( -1 );


		//게시판
		study_id = 1; //스터디 아이디
		int wuser_id = 1; //글쓰는 사람 유저 아이디
		List<BoardDataBean> boardDtoList = boardDao.loadBoardlist(study_id);
		req.setAttribute("boardDtoList", boardDtoList);
		req.setAttribute("study_id", study_id);
		req.setAttribute("wuser_id", wuser_id);
		
		
//		log.debug( "[회원]" + userDto.getEmail() + " 이 [스터디]{ " + studyDto.getTitle() + " } 클릭" );
//		log.debug( "[클릭한 스터디 정보]" );
//		log.debug( "[소개]{ " + studyDto.getIntro() + " }" );
//		log.debug( "[진행방식]{ " + studyDto.getTitle() + " }" );
//		log.debug( "[모집대상]{ " + studyDto.getTarget() + " }" );
//		log.debug( "[커리큘럼]{ " + studyDto.getCurriculum() + " }" );
//		log.debug( "[코멘트]{ " + studyDto.getScomment() + " }" );
//		log.debug( "[비용]{ " + studyDto.getScost() + " }" );
//		log.debug( "[참석인원] " + studyDto.getCur_personnel() );
//		log.debug( "[최대인원] " + studyDto.getMax_personnel() );
//		log.debug( "[스터디형태] " + studyDto.getTerm() );
//		log.debug( "[등록일] " + studyDto.getRegdate() );
//		log.debug( "[모집마감] " + studyDto.getDeadline() );
//		log.debug( "[상세장소]{ " + studyDto.getPlace() + " }" );
//		log.debug( "[지역] " + locationDto.getState_city() );
//		log.debug( "[상세지역] " + locationDto.getDetail_loc() );
//		log.debug( "[카테고리] " + categoryDto.getBig() + ", " + categoryDto.getMiddle() + ", " + categoryDto.getSmall() );
//		log.debug( "[스터디일시]" + studytimeDto.getSdate() + ", " + studytimeDto.getSday() + ", " + studytimeDto.getStime() );
		
		if ( userDto != null ) {
			log.debug("[회원 스터디 클릭]");
			String cur = studyDto.getCurriculum();
			if(cur != null) {
				cur = cur.replace(","," ");
			}
			String tar = studyDto.getTarget();
			if(tar !=null) {
				tar = tar.replace(",", " ");
			}
			log.debug("0.5"+","+userDto.getId() +","+userDto.getEmail() +","+userDto.getGender()+","+userDto.getBirth()+","+userDto.getAddress()+","+userDto.getInterest()+","+userDto.getGoal()+","+userDto.getOpen()+","+userDto.getPart()+ ","+studyDto.getId()+",{" + studyDto.getTitle().replace(",", " ") + "},{" + studyDto.getIntro().replace(",", " ") + "},{" + tar + "},{" +cur + "},{" + studyDto.getScomment() + "},{" + studyDto.getScost() + "}," + studyDto.getCur_personnel() + "," + studyDto.getMax_personnel() + "," + studyDto.getTerm() + "," + studyDto.getRegdate() + "," + studyDto.getDeadline() + ",{" + studyDto.getPlace() + "}," + locationDto.getState_city() + "," + locationDto.getDetail_loc() + "," + categoryDto.getBig() + "," + categoryDto.getMiddle() + "," + categoryDto.getSmall() + "," + studytimeDto.getSdate() + "," + studytimeDto.getSday() + "," + studytimeDto.getStime() );
			log.debug("[회원 스터디 클릭 끝]");
		} else {
			//log.debug("[비회원]");
			//log.debug(studyDto.getId()+ ",{" + studyDto.getTitle() + "},{" + studyDto.getIntro() + "},{" + studyDto.getTitle() + "},{" + studyDto.getTarget() + "},{" + studyDto.getCurriculum() + "},{" + studyDto.getScomment() + "},{" + studyDto.getScost() + "}," + studyDto.getCur_personnel() + "," + studyDto.getMax_personnel() + "," + studyDto.getTerm() + "," + studyDto.getRegdate() + "," + studyDto.getDeadline() + ",{" + studyDto.getPlace() + "}," + locationDto.getState_city() + "," + locationDto.getDetail_loc() + "," + categoryDto.getBig() + "," + categoryDto.getMiddle() + "," + categoryDto.getSmall() + "," + studytimeDto.getSdate() + "," + studytimeDto.getSday() + "," + studytimeDto.getStime() );
		}
		
		return new ModelAndView("views/show/view");
	}
	
	
	@RequestMapping("/apply")
	public ModelAndView applyPro(HttpServletRequest req, HttpServletResponse resp) throws Exception {
			req.setCharacterEncoding( "utf-8" );
		
			AttendeeDataBean attendeeDto = new AttendeeDataBean();
			SchoolDataBean schoolDto = new SchoolDataBean();
			ExpDataBean expDto = new ExpDataBean();
			LanguageDataBean langDto = new LanguageDataBean();
			CertificateDataBean certDto = new CertificateDataBean();
			UserDataBean userDto = (UserDataBean) req.getSession().getAttribute( "userDto" );
			StudyDataBean studyDto = (StudyDataBean) req.getSession().getAttribute( "studyDto" );
			CategoryTempBean categoryDto = showDao.getStudyCategoryNames( studyDto.getCat_id() );
			LocationDataBean locationDto = (LocationDataBean) req.getSession().getAttribute( "locationDto" );
			StudyTimeDataBean studytimeDto = (StudyTimeDataBean) req.getSession().getAttribute( "studytimeDto" );

			log.debug("[신청서 정보]");
			attendeeDto.setPurpose( req.getParameter( "purpose" ) );
			attendeeDto.setGoal( req.getParameter( "goal" ) );
			attendeeDto.setIntro( req.getParameter( "attendee_intro" ) );
			attendeeDto.setRequest( req.getParameter( "attendee_request" ) );
			attendeeDto.setRegdate( new Timestamp( System.currentTimeMillis() ) );
			attendeeDto.setUser_id( userDto.getId() );
			attendeeDto.setStudy_id( studyDto.getId() );
			attendeeDto.setRegprocess_id( 1 );

			showDao.deleteSchool( userDto.getId() );
			schoolDto.setName( req.getParameter( "school" ) );
			schoolDto.setMajor( req.getParameter( "major" ) );
			schoolDto.setStatus( req.getParameter( "radio-school" ) );
			schoolDto.setUser_id( userDto.getId() );
			showDao.insertSchool( schoolDto );
			
			log.debug(schoolDto.getUser_id()+","+ studyDto.getId()+","+schoolDto.getName()+","+schoolDto.getMajor()+","+schoolDto.getStatus());
			showDao.deleteCareer( userDto.getId() );
			int careernum = 0;
			int langnum = 0;
			int certnum = 0;
			for ( int i = 1; i < 21; i++ ) {
				if ( req.getParameter( "career" + Integer.toString( i ) ) != null && 
						! req.getParameter( "career" + Integer.toString( i ) ).equals( "" ) ) {
					expDto.setExperience( req.getParameter( "career" + Integer.toString( i ) ) );
					expDto.setStart_date( inputFormat.parse( req.getParameter( "workstart" + Integer.toString( i ) ) ) );
					expDto.setEnd_date( inputFormat.parse( req.getParameter( "workend" + Integer.toString( i ) ) ) );
					expDto.setUser_id( userDto.getId() );
					showDao.insertCareer( expDto );
					//log.debug(expDto.getUser_id()+","+ studyDto.getId()+","+expDto.getExperience()+","+expDto.getStart_date()+","+expDto.getEnd_date());
					careernum++;
				}
				
			}
			log.debug("careernum,"+ Integer.toString(careernum));
			showDao.deleteLanguage( userDto.getId() );
			for ( int i = 1; i < 21; i++ ) {
				if ( req.getParameter( "lang" + Integer.toString( i ) ) != null &&
						! req.getParameter( "lang" + Integer.toString( i ) ).equals( "" ) ) { 
					langDto.setLanguage( req.getParameter( "lang" + Integer.toString( i ) ) );
					langDto.setName( req.getParameter( "exam" + Integer.toString( i ) ) );
					langDto.setScore( req.getParameter( "score" + Integer.toString( i ) ) );
					langDto.setObtain_date( inputFormat.parse( req.getParameter( "langodate" + Integer.toString( i ) ) ) );
					langDto.setUser_id( userDto.getId() );
					showDao.insertLanguage( langDto );
					//log.debug(langDto.getUser_id()+","+ studyDto.getId()+","+langDto.getName()+","+langDto.getLanguage()+","+langDto.getScore()+","+langDto.getObtain_date());
					langnum++;
				}
			}
			log.debug("langnum,"+ Integer.toString(langnum));
			showDao.deleteCertificate( userDto.getId() );
			for ( int i = 1; i < 21; i++ ) {
				if ( req.getParameter( "cert" + Integer.toString( i ) ) != null &&
						! req.getParameter( "cert" + Integer.toString( i ) ).equals( "" ) ) { 
					certDto.setName( req.getParameter( "cert" + Integer.toString( i ) ) );
					certDto.setScore( req.getParameter( "grade" + Integer.toString( i ) ) );
					certDto.setObtain_date( inputFormat.parse( req.getParameter( "certodate" + Integer.toString( i ) ) ) );
					certDto.setUser_id( userDto.getId() );
					showDao.insertCertificate( certDto );
					//log.debug(certDto.getUser_id()+","+ studyDto.getId()+","+certDto.getName()+","+certDto.getScore()+","+certDto.getObtain_date());
					certnum++;
				}
			}
			log.debug("certnum,"+ Integer.toString(certnum));
			long millis = (applyouttime - applyintime);
			log.debug(userDto.getId()+","+ studyDto.getId()+","+attendeeDto.getPurpose()+","+attendeeDto.getGoal()+","+attendeeDto.getIntro()+","+attendeeDto.getRequest()+","+millis);
			log.debug("[신청서 정보 끝]");
			int resultAttendee = showDao.insertAttendee( attendeeDto );
			
			req.setAttribute( "resultAttendee", resultAttendee );
			
			log.debug( "[스터디 신청 완료]" );
//			log.debug(userDto.getEmail() +" 회원 - 스터디  "+ studyDto.getTitle() + "에 신청 완료");  
			applyouttime = System.currentTimeMillis();
			
			long minutes = (millis / 1000)  / 60;
			int seconds = (int)((millis / 1000) % 60);
//			log.debug("스터디 신청 작성 시간 : "+ minutes+" 분 "+seconds+" 초");			log.debug( minutes + "," + seconds + "," + userDto.getEmail() + ",{" + studyDto.getTitle() + "},{" + studyDto.getIntro() + "},{" + studyDto.getTitle() + "},{" + studyDto.getTarget() + "},{" + studyDto.getCurriculum() + "},{" + studyDto.getScomment() + "},{" + studyDto.getScost() + "}," + studyDto.getCur_personnel() + "," + studyDto.getMax_personnel() + "," + studyDto.getTerm() + "," + studyDto.getRegdate() + "," + studyDto.getDeadline() + ",{" + studyDto.getPlace() + "}," + locationDto.getState_city() + "," + locationDto.getDetail_loc() + "," + categoryDto.getBig() + "," + categoryDto.getMiddle() + "," + categoryDto.getSmall() + "," + studytimeDto.getSdate() + "," + studytimeDto.getSday() + "," + studytimeDto.getStime() );
			
			String cur = studyDto.getCurriculum();
			if(cur != null) {
				cur = cur.replace(","," ");
			}
			String tar = studyDto.getTarget();
			if(tar !=null) {
				tar = tar.replace(",", " ");
			}
			
			log.debug("1.0"+","+userDto.getId() +","+userDto.getEmail() +","+userDto.getGender()+","+userDto.getBirth()+","+userDto.getAddress()+","+userDto.getInterest()+","+userDto.getGoal()+","+userDto.getOpen()+","+userDto.getPart()+ ","+studyDto.getId()+",{" + studyDto.getTitle().replace(",", " ") + "},{" + studyDto.getIntro().replace(",", " ") + "},{" + tar + "},{" +cur + "},{" + studyDto.getScomment() + "},{" + studyDto.getScost() + "}," + studyDto.getCur_personnel() + "," + studyDto.getMax_personnel() + "," + studyDto.getTerm() + "," + studyDto.getRegdate() + "," + studyDto.getDeadline() + ",{" + studyDto.getPlace() + "}," + locationDto.getState_city() + "," + locationDto.getDetail_loc() + "," + categoryDto.getBig() + "," + categoryDto.getMiddle() + "," + categoryDto.getSmall() + "," + studytimeDto.getSdate() + "," + studytimeDto.getSday() + "," + studytimeDto.getStime() );
			log.debug( "[스터디 신청 완료 끝]" );
			return new ModelAndView("views/show/apply");
	}

	@RequestMapping("/applyForm")
	public ModelAndView applyFormPro(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		UserDataBean userDto = (UserDataBean) req.getSession().getAttribute( "userDto" );
		StudyDataBean studyDto = (StudyDataBean) req.getSession().getAttribute( "studyDto" );
		CategoryTempBean categoryDto = showDao.getStudyCategoryNames( studyDto.getCat_id() );
		LocationDataBean locationDto = (LocationDataBean) req.getSession().getAttribute( "locationDto" );
		StudyTimeDataBean studytimeDto = (StudyTimeDataBean) req.getSession().getAttribute( "studytimeDto" );
		
		req.getSession().setAttribute( "userDto", userDto );
		req.getSession().setAttribute( "studytimeDto", studytimeDto );
		req.getSession().setAttribute( "locationDto", locationDto );
		
		applyintime = System.currentTimeMillis();
//		log.debug( userDto.getEmail() + " 회원 - 스터디 '" + studyDto.getTitle() + "'" + applyintime + "에 신청 시도" );
		log.debug( "[스터디 신청 시도 - 시각 & 스터디정보]" );
		log.debug( userDto.getId() + ","+ userDto.getEmail() +"," +studyDto.getId()+",{" + studyDto.getTitle() + "},{" + studyDto.getIntro() + "},{" + studyDto.getTitle() + "},{" + studyDto.getTarget() + "},{" + studyDto.getCurriculum() + "},{" + studyDto.getScomment() + "},{" + studyDto.getScost() + "}," + studyDto.getCur_personnel() + "," + studyDto.getMax_personnel() + "," + studyDto.getTerm() + "," + studyDto.getRegdate() + "," + studyDto.getDeadline() + ",{" + studyDto.getPlace() + "}," + locationDto.getState_city() + "," + locationDto.getDetail_loc() + "," + categoryDto.getBig() + "," + categoryDto.getMiddle() + "," + categoryDto.getSmall() + "," + studytimeDto.getSdate() + "," + studytimeDto.getSday() + "," + studytimeDto.getStime() );
		
		return new ModelAndView("views/show/applyForm");
	}
	
	@RequestMapping("/applyResult")
	public ModelAndView applyResultPro(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		int user_id = Integer.parseInt( req.getParameter( "id" ) );
		int study_id = Integer.parseInt( req.getParameter( "sid" ) );
		
		req.setAttribute( "user_id", user_id );
		req.setAttribute( "study_id", study_id );
		
		return new ModelAndView("views/show/applyResult");
	}
	
	@RequestMapping(value="/getApplication.do", produces="application/json; charset=utf8")
	@ResponseBody
	public ResponseEntity ajax_myApplication( 
		@RequestParam("user_id") Integer user_id, 
		@RequestParam("study_id") Integer study_id, HttpServletResponse resp) throws Exception {

		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json;charset=UTF-8");
		
//		System.out.println("in ajax : got user_id " + user_id + ", got study_id " + study_id);
		
		ApplyDataBean applyDto = showDao.loadPrevData( user_id );

		Map<String, Integer> id_map = new HashMap<String, Integer>();
		id_map.put( "user_id", user_id );
		id_map.put( "study_id", study_id );
		AttendeeDataBean attendeeDto = showDao.getMineApplied( id_map );
		
//		System.out.println("in ajax : got attendeeDto " + attendeeDto);
//		System.out.println("in ajax : got attendeeId " + attendeeDto.getId() + "\n");
		
		HashMap<String, Object> attendeeMap = new HashMap<String, Object>();
		attendeeMap.put( "attendee_id", Integer.toString( attendeeDto.getId() ) );
		if ( attendeeDto.getPurpose() != null )
			attendeeMap.put( "purpose", attendeeDto.getPurpose() );
		if ( attendeeDto.getGoal() != null )
			attendeeMap.put( "goal", attendeeDto.getGoal() );
		attendeeMap.put( "user_id", Integer.toString( attendeeDto.getUser_id() ) );
		if ( attendeeDto.getIntro() != null )
			attendeeMap.put( "intro", attendeeDto.getIntro() );
		if ( attendeeDto.getRequest() != null )
			attendeeMap.put( "request", attendeeDto.getRequest() );
		if ( applyDto.getSchool_name() != null )
			attendeeMap.put( "school_name", applyDto.getSchool_name() );
		if ( applyDto.getSchool_major() != null )
			attendeeMap.put( "school_major", applyDto.getSchool_major() );
		if ( applyDto.getSchool_status() != null )
			attendeeMap.put( "school_status", applyDto.getSchool_status() );
		attendeeMap.put( "experience", applyDto.getExperience() );
		attendeeMap.put( "exp_start", applyDto.getExp_start() );
		attendeeMap.put( "exp_end", applyDto.getExp_end() );
		attendeeMap.put( "language", applyDto.getLanguage() );
		attendeeMap.put( "lang_name", applyDto.getLang_name() );
		attendeeMap.put( "lang_score", applyDto.getLang_score() );
		attendeeMap.put( "lang_obtain", applyDto.getLang_obtain() );
		attendeeMap.put( "cert_name", applyDto.getCert_name() );
		attendeeMap.put( "cert_score", applyDto.getCert_score() );
		attendeeMap.put( "cert_obtain", applyDto.getCert_obtain() );
		
		JSONArray json = new JSONArray();
		json.add( attendeeMap );
//		System.out.println(json.toString() + "\n");
		return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping(value="/loadPrevData.do", produces="application/json; charset=utf8")
	@ResponseBody
	public ResponseEntity ajax_myPrevData(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json;charset=UTF-8");
		
		UserDataBean userDto = (UserDataBean) req.getSession().getAttribute( "userDto" );
		int user_id = userDto.getId();
		ApplyDataBean applyDto = showDao.loadPrevData( user_id );
		//ApplyDataBean applyDto = new ApplyDataBean();
		
		HashMap<String, Object> applyMap = new HashMap<String, Object>();
		applyMap.put( "attendee_id", Integer.toString( applyDto.getAttendee_id() ) );
		applyMap.put( "purpose", applyDto.getPurpose() );
		applyMap.put( "goal", applyDto.getGoal() );
		applyMap.put( "user_id", Integer.toString( applyDto.getUser_id() ) );
		applyMap.put( "school_name", applyDto.getSchool_name() );
		applyMap.put( "school_major", applyDto.getSchool_major() );
		applyMap.put( "school_status", applyDto.getSchool_status() );
		applyMap.put( "experience", applyDto.getExperience() );
		applyMap.put( "exp_start", applyDto.getExp_start() );
		applyMap.put( "exp_end", applyDto.getExp_end() );
		applyMap.put( "language", applyDto.getLanguage() );
		applyMap.put( "lang_name", applyDto.getLang_name() );
		applyMap.put( "lang_score", applyDto.getLang_score() );
		applyMap.put( "lang_obtain", applyDto.getLang_obtain() );
		applyMap.put( "cert_name", applyDto.getCert_name() );
		applyMap.put( "cert_score", applyDto.getCert_score() );
		applyMap.put( "cert_obtain", applyDto.getCert_obtain() );
		
		JSONArray json = new JSONArray();
		json.add( applyMap );
//		System.out.println(json.toString());
		return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping(value="/getMineApplied.do")
	@ResponseBody
	public String ajax_isMineApplied( 
			@RequestParam("user_id") Integer user_id, 
			@RequestParam("study_id") Integer study_id, HttpServletRequest request) throws Exception {
		int study_holder_id = showDao.getStudyIdbyUserId(study_id);
		if(user_id == study_holder_id) {
			
			return "mystudy";
		}
		else {
			Map<String, Integer> id_map = new HashMap<String, Integer>();
			id_map.put( "user_id", user_id );
			id_map.put( "study_id", study_id );
			AttendeeDataBean attendeeDto = showDao.getMineApplied( id_map );
			
			if ( attendeeDto != null ) return "exist";
			else return "joinable";
		}

	}
	
	@RequestMapping("/boardlist")
	public ModelAndView boardListProcess(HttpServletRequest req, HttpServletResponse resp) throws Exception {
//		int study_id = 1; //스터디 아이디
//		int wuser_id = 1; //글쓰는 사람 유저 아이디
		int study_id = Integer.parseInt(req.getParameter("sid"));
		int wuser_id = ((UserDataBean) req.getSession().getAttribute("userDto")).getId();
		List<BoardDataBean> boardDtoList = boardDao.loadBoardlist(study_id);
		req.setAttribute("boardDtoList", boardDtoList);
		req.setAttribute("study_id", study_id);
		req.setAttribute("wuser_id", wuser_id);
		
		return new ModelAndView("views/board/list");
	}
	
	@RequestMapping("/boardInput")
	public ModelAndView boardInputProcess(HttpServletRequest req, HttpServletResponse resp) throws Exception {
	//	int study_id = 1; //스터디 아이디
	//	int wuser_id = 1; //글쓰는 사람 유저 아이디
		int study_id = Integer.parseInt(req.getParameter("sid"));
		int wuser_id = ((UserDataBean) req.getSession().getAttribute("userDto")).getId();
		req.setAttribute("study_id", study_id);
		req.setAttribute("wuser_id", wuser_id);
		
		return new ModelAndView("views/board/inputForm");
	}

	@RequestMapping("/boardinputpro")
	public ModelAndView boardInputProProcess(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding( "utf-8" );
		BoardDataBean boardDto = new BoardDataBean();
		UserDataBean userDto = (UserDataBean) req.getSession().getAttribute( "userDto" );
		
		boardDto.setTitle(req.getParameter("title"));
		boardDto.setPasswd(req.getParameter("passwd"));
		boardDto.setContent(req.getParameter("content"));
		boardDto.setUser_id(Integer.parseInt(req.getParameter("wuser_id")));
		boardDto.setStudy_id(Integer.parseInt(req.getParameter("study_id")));
		boardDto.setReadcount(0);
		boardDto.setRef(0);
		boardDto.setRe_level(0);
		boardDto.setRe_step(0);
		
		int form = Integer.parseInt(req.getParameter("articleform"));
		if(form == 1) {
			boardDto.setSecret("1");
			boardDto.setNotice("0");
		}
		else if(form ==2) {
			boardDto.setSecret("0");
			boardDto.setNotice("1");
		}
		else {
			boardDto.setSecret("0");
			boardDto.setNotice("0");
		}
		int res = boardDao.insertBoard(boardDto); //삽입
		System.out.println(res);
		req.setAttribute("res", res);

		log.debug( "[게시판 글 작성]" );
		log.debug( userDto.getId()+","+userDto.getEmail() + "," + boardDto.getStudy_name() );
		
		return new ModelAndView("views/board/inputPro");
	}
	
	@RequestMapping("/boardcontent")
	public ModelAndView boardContentProcess(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding( "utf-8" );
		int id = Integer.parseInt(req.getParameter("bid"));
		int study_id = 1;
		UserDataBean userDto = (UserDataBean) req.getSession().getAttribute( "userDto" );
		
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("id", id);
		map.put("study_id", study_id);
		BoardDataBean boardDto = boardDao.getArticle(map);
		System.out.println(boardDto.getTitle());
		req.setAttribute("boardDto", boardDto);

		log.debug( "[게시판 글 조회]" );
		log.debug( userDto.getId()+","+userDto.getEmail() + ", " + boardDto.getStudy_name() );
		
		return new ModelAndView("views/board/content");
	}
	
	@RequestMapping("/articledelete")
	public ModelAndView articledeleteProcess(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		int id = Integer.parseInt(req.getParameter("id"));
		int sid = Integer.parseInt(req.getParameter("id"));
		Map<String,Integer> map = new HashMap<String,Integer>();
		UserDataBean userDto = showDao.getMyData( id );
		StudyDataBean studyDto = showDao.getStudyInfo( sid );
		map.put("id", id);
		map.put("study_id", sid);
		int res = boardDao.deleteArticle(map);
		req.setAttribute("res", res);

		log.debug( "[게시판 글 삭제]" );
		log.debug( userDto.getId()+","+userDto.getEmail() + ", " + studyDto.getTitle() );

		return new ModelAndView("views/board/deletePro");
	}
	
	 @RequestMapping(value="/board/commentList.do", produces="application/json; charset=utf8")
	 @ResponseBody
	 public ResponseEntity ajax_commentList(HttpServletRequest req, HttpServletResponse resp) throws Exception{


	        HttpHeaders responseHeaders = new HttpHeaders();
	        responseHeaders.add("Content-Type", "application/json;charset=UTF-8");

	
	        ArrayList<HashMap> hmlist = new ArrayList<HashMap>();
	        
	        // 해당 게시물 댓글
	        int board_id = Integer.parseInt(req.getParameter("board_id"));
	        List<CommentDataBean> commentDto = boardDao.selectBoardCommentByCode(board_id);
	        
	        if(commentDto.size() > 0){
	            for(int i=0; i<commentDto.size(); i++){
	                HashMap hm = new HashMap();
	                hm.put("id", commentDto.get(i).getId());
	                hm.put("content", commentDto.get(i).getContent());
	                hm.put("writer", commentDto.get(i).getWriter());
	                hm.put("regdate", commentDto.get(i).getRegdate().toString());
	                
	                hmlist.add(hm);
	            }
	            
	        }
	        JSONArray json = new JSONArray();
	        json.addAll(hmlist);
//	        System.out.println(json.toString());
	        return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
	        
	    }
	   @RequestMapping(value="/board/addComment.do")
	   @ResponseBody
	   public String ajax_addComment(@ModelAttribute("commentDto")CommentDataBean commentDto, HttpServletRequest request) throws Exception{
	        
	        HttpSession session = request.getSession();
	        
			UserDataBean userDto = (UserDataBean) request.getSession().getAttribute( "userDto" );

	        try{
	        	commentDto.setWriter("익명");
//	        	System.out.println(commentDto.getContent());
	            boardDao.addComment(commentDto);
	            
	        } catch (Exception e){
	            e.printStackTrace();
	        }

			log.debug( "[게시판 댓글 작성]" );
			log.debug( userDto.getEmail() + ", " + showDao.getStudyInfo( commentDto.getStudy_id() ).getTitle() );
	        
	        return "success";
	    }
	   
	   @RequestMapping(value="/board/delComment.do")
	   @ResponseBody
	   public String ajax_deleteComment(
				@RequestParam("comment_id") String commentId, HttpServletRequest req) throws Exception{

//			Map<String, Integer> id_map = new HashMap<String, Integer>();
//			id_map.put( "comment_id", comment_id );
//			id_map.put( "board_id", board_id );
//			id_map.put( "study_id", study_id );
		   	int comment_id = Integer.parseInt( commentId );
		   	CommentDataBean commentDto = showDao.getCommentByCommentId( comment_id );
			
			boardDao.delComment( comment_id );
			
			log.debug( "[게시판 댓글 삭제]" );
			log.debug( commentDto.getContent() + ", " + commentDto.getWriter() + ", " + commentDto.getRegdate() );
			
			return "success";
		}

}