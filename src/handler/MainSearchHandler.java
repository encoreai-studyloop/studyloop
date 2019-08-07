package handler;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import databean.AlarmDataBean;
import databean.AttendeeDataBean;
import databean.CategoryDataBean;
import databean.CertificateDataBean;
import databean.ExpDataBean;
import databean.LanguageDataBean;
import databean.LocTmpDataBean;
import databean.ScheduleDataBean;
import databean.SchoolDataBean;
import databean.StudyDataBean;
import databean.StudyRegFormDataBean;
import databean.UserDataBean;
import dbbean.SearchDao;
import dbbean.ShowDao;
import dbbean.UserDao;


@Controller
public class MainSearchHandler {
	@Resource
	private UserDao userDao;
	@Resource
	private SearchDao searchDao;
	@Resource
	private ShowDao showDao;
	
	@RequestMapping("/search")
    public ModelAndView searchprocess(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String keyword  = req.getParameter("searchVal");
        String[] loclist = req.getParameterValues("loclist");
        String cat = req.getParameter("cat");
        String[] daylist = req.getParameterValues("sday");
        String sort = req.getParameter("sort");
        

        
        System.out.println(keyword);
            if(keyword == null) {
                keyword = "";
            }
    
        List<StudyDataBean> studyDtoList = searchDao.searchByKeyWord(keyword);

        List<LocTmpDataBean> locationList = searchDao.getLocationList(keyword);
        
        if(cat != null) {
        	List<StudyDataBean> studyDtoFilterList = new ArrayList<StudyDataBean>();
        	for(int i=0; i<studyDtoList.size(); i++) {       		
        		if(studyDtoList.get(i).getCategory().equals(cat)) {
        			studyDtoFilterList.add(studyDtoList.get(i));
        		}
        	}
        	studyDtoList = studyDtoFilterList;
        }
        
        if( loclist != null ) {
            System.out.println("필터있음");
            List<StudyDataBean> studyDtoFilterList = new ArrayList<StudyDataBean>();
            for(int i=0; i<studyDtoList.size(); i++) {
                
                String result = searchDao.searchByLoc(studyDtoList.get(i).getLoc_id());  //2라고 하면 ws_location 테이블의 id 가 2인 행의 detail_loc를 찾아냄 - > 신사
                boolean exist = false;
                for(int j=0; j< loclist.length; j++) {
                    if(loclist[j].equals(result)) {
                        exist = true;
                        break;
                    }
                }
                if(exist) {
                    studyDtoFilterList.add(studyDtoList.get(i));
                }
            }
            studyDtoList = studyDtoFilterList;
        }
        
        if(daylist != null) { //화목 
        	List<StudyDataBean> studyDtoFilterList = new ArrayList<StudyDataBean>();
        	for(int i=0; i<studyDtoList.size(); i++) {
        		StudyDataBean studyDto = studyDtoList.get(i);
        		String sdays = searchDao.getStudyTimeDays(studyDto.getStudytime_id()); //화금
        		String[] sdaylist = sdays.split("@");
        		int check = 0;
        		for(int j=0; j<daylist.length; j++) {
        			for(int k=0; k<sdaylist.length; k++) {
        				if(daylist[j].equals(sdaylist[k])) {
        					check=1;
        					break;
        				}
        			}	
        			if(check==1) {
        				break;
        			}
        		}
        		if(check==1) {
        			//studyDtoList.remove(i);
        			studyDtoFilterList.add(studyDto);
        		}
        	}
        	studyDtoList = studyDtoFilterList;
        }
        
        if(sort != null) {
        	if(sort.equals("1")) { //프리미엄 순
                Collections.sort(studyDtoList, new Comparator<StudyDataBean>() {
                    @Override
                    public int compare(StudyDataBean s1, StudyDataBean s2) {
                        if (Integer.parseInt(s1.getPrime()) > Integer.parseInt(s2.getPrime())) {
                            return -1;
                        } else if (Integer.parseInt(s1.getPrime()) < Integer.parseInt(s2.getPrime())) {
                            return 1;
                        }
                        return 0;
                    }
                });
        	}
        	else if(sort.equals("2")) { //최신 등록 순
                Collections.sort(studyDtoList, new Comparator<StudyDataBean>() {
                    @Override
                    public int compare(StudyDataBean s1, StudyDataBean s2) {
                        if (s1.getRegdate().compareTo(s2.getRegdate()) <0) {
                            return -1;
                        } else if (s1.getRegdate().compareTo(s2.getRegdate()) >0) {
                            return 1;
                        }
                        return 0;
                    }
                });        		
        	}
        	else { // 데드라인 임박 순 
                Collections.sort(studyDtoList, new Comparator<StudyDataBean>() {
                    @Override
                    public int compare(StudyDataBean s1, StudyDataBean s2) {
                    	if(s1.getDeadline() != null && s2.getDeadline() != null) {
	                        if (s1.getDeadline().compareTo(s2.getDeadline()) >0) {
	                            return -1;
	                        } else if (s1.getDeadline().compareTo(s2.getDeadline()) <0) {
	                            return 1;
	                        }
                    	}
                        return 0;
                    }
                });   
        	}
        }
        
        req.setAttribute("studyDtoList", studyDtoList);
        req.setAttribute("locationList", locationList);

        return new ModelAndView("views/search/search");
        
    }
	
	@RequestMapping("/mypage")
	public ModelAndView myPageprocess(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		//회원 정보

		UserDataBean user = (UserDataBean) req.getSession().getAttribute("userDto");
		if(user == null) {
			resp.sendRedirect("login.do");
		}
		UserDataBean userDto = userDao.getUserById(user.getId());
		req.setAttribute("userDto", userDto);
		int myId = userDto.getId();
		
		//유저 status 변경
		if(req.getParameter("tid") != null) {
            int tid = Integer.parseInt(req.getParameter("tid"));
            int sid = Integer.parseInt(req.getParameter("sid"));
            int status = Integer.parseInt(req.getParameter("status"));
            
            Map<String,Integer> id_map = new HashMap<String, Integer>();
            id_map.put( "user_id", tid );
            id_map.put( "study_id", sid );
            int curUserStat = userDao.getUserStatus( id_map );
            System.out.println("curUserStat:" + curUserStat);
            System.out.println("status:" + status);
            System.out.println("sid:" + sid);
            
            Map<String,Integer> info = new HashMap<String, Integer>();
            info.put("tid", tid);
            info.put("sid", sid);
            info.put("status", status);
            int res = userDao.updateUserStatus(info);
            
            
            if ( res == 1 ) {
                switch ( curUserStat ) {
                case 1 : 
                case 2 : 
                case 3 : 
                case 4 : 
                    if ( status == 5 ) {
                        showDao.addCurPersonnel( sid );
                    }
                    break;
                case 5 : 
                    if (status != 5 ) {
                        showDao.subCurPersonnel( sid );
                    }
                }
            }
        }

		
		
		//회원이 참여중인 스터디
		List<StudyDataBean> pstudyDtoList = userDao.getParticipateStudy(myId);
		
		//회원이 주최한 스터디
		List<StudyDataBean> ostudyDtoList = userDao.getOpenStudy(myId);
		
		//회원이 신청한 스터디 
		List<StudyDataBean> rstudyDtoList = userDao.getRegisterStudy(myId);
		System.out.println("dfdsf");
		for(StudyDataBean s : rstudyDtoList) {
			System.out.println("신청 절차 :" );
		}

		//회원의 스터디에 신청한 유저들
		List<StudyRegFormDataBean> ruserDtoList = userDao.getMyStudyRegUser(myId);
		req.setAttribute("pstudyDtoList", pstudyDtoList);
		req.setAttribute("ostudyDtoList", ostudyDtoList);
		req.setAttribute("rstudyDtoList", rstudyDtoList);
		req.setAttribute("ruserDtoList", ruserDtoList);
		

		
		return new ModelAndView("views/search/mypage");
	}
	
	@RequestMapping("/main")
	public ModelAndView mainFormprocess(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		Logger log1 = Logger.getLogger("studyloop");

		log1.debug("ddsfsdfsfdsfsfsdf");
		
		Map<String,String> cord = new HashMap<String,String>();
		cord.put("lat", "0");
		cord.put("long", "0");
		if(req.getSession().getAttribute("lat") != null) {
			String latitude = (String) req.getSession().getAttribute("lat");
			String longtitude = (String) req.getSession().getAttribute("long");				
			cord.replace("lat", latitude);
			cord.replace("long", longtitude);
		}
		
		CategoryDataBean categoryDto = searchDao.loadCategory();
		req.setAttribute("categoryDto", categoryDto);
		//전체 다 가져오기
		//ArrayList<StudyDataBean> studyDtoList = (ArrayList<StudyDataBean>) searchDao.getStudyThumbNail();
		
		//새로운 스터디 가져오기
		ArrayList<StudyDataBean> nstudyDtoList = (ArrayList<StudyDataBean>) searchDao.getStudyThumbNailofnew();
		
		//근방 5km 이내 스터디 가져오기
		//ArrayList<StudyDataBean> nstudyDtoList = (ArrayList<StudyDataBean>) searchDao.getStudyThumbNailofnear(cord);
		
		//핫한 스터디 가져오기
		ArrayList<StudyDataBean> hstudyDtoList = (ArrayList<StudyDataBean>) searchDao.getStudyThumbNailofhot();
		
		//프리미엄 스터디 가져오기
		ArrayList<StudyDataBean> pstudyDtoList = (ArrayList<StudyDataBean>) searchDao.getStudyThumbNailofpremium();
		
	    //req.setAttribute("studyDtoList", studyDtoList );
	    req.setAttribute("nstudyDtoList", nstudyDtoList );
	    req.setAttribute("hstudyDtoList", hstudyDtoList );
	    req.setAttribute("pstudyDtoList", pstudyDtoList );
	    
		return new ModelAndView("views/search/main");
	}
	
	@RequestMapping("/deleteRegister")
	public ModelAndView deleteRegisterProcess(HttpServletRequest req, HttpServletResponse resp) throws Exception{
		int uid = ((UserDataBean) req.getSession().getAttribute("userDto")).getId();
		int sid = Integer.parseInt(req.getParameter("sid"));
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("uid", uid);
		map.put("sid", sid);
		searchDao.deleteRegister(map);
		System.out.println("uid : "+ uid +"\nsid : "+ sid);
		resp.sendRedirect("mypage.do");
		return new ModelAndView("views/search/mypage");
	}
	
	@RequestMapping("/faq")
	public ModelAndView faqPageProcess(HttpServletRequest req, HttpServletResponse resp) throws Exception{
		return new ModelAndView("views/search/faq");
	}
	
	@RequestMapping("/addinfoForm")
	public ModelAndView addinfoFormPageProcess(HttpServletRequest req, HttpServletResponse resp) throws Exception{
		UserDataBean userDto = (UserDataBean) req.getSession().getAttribute("userDto");
		int id = userDto.getId();
		
		SchoolDataBean schoolDto = searchDao.getSchoolinfo(id);
		List<LanguageDataBean> languageDtoList = searchDao.getLanguageinfo(id);
		List<CertificateDataBean> certificateDtoList = searchDao.getCertificateinfo(id);
		List<ExpDataBean> expDtoList = searchDao.getExpinfo(id);
		
		if(schoolDto !=null) {
			req.setAttribute("schoolDto", schoolDto);
			System.out.println("스쿨있음");
		}
		if(languageDtoList !=null) {
			req.setAttribute("languageDtoList", languageDtoList);
			System.out.println("랭귀지있음");
		}
		if(certificateDtoList !=null) {
			req.setAttribute("certificateDtoList", certificateDtoList);
			System.out.println("자격증있음");
		}
		if(expDtoList !=null) {
			req.setAttribute("expDtoList", expDtoList);
			System.out.println("경력있음");
		}
		
		return new ModelAndView("views/search/addinfoForm");
	}
	
	@RequestMapping("/addinfo")
	public ModelAndView addinfoPageProcess(HttpServletRequest req, HttpServletResponse resp) throws Exception{
		req.setCharacterEncoding( "utf-8" );
		
		UserDataBean userDto = (UserDataBean) req.getSession().getAttribute("userDto");
		int id = userDto.getId();
		
		//정보가 있는 정보면 기존꺼 delete 후 insert 없으면 그냥 insert 로 나눠서 작업 
		//delete 
		int delres = searchDao.cleanExistinginfo(id);
		System.out.println(delres);
		
		//insert
		String schoolname = req.getParameter("school");
		System.out.println(schoolname);
		String schoolstatus = req.getParameter("radio-school");
		System.out.println(schoolstatus);
		String schoolmajor = req.getParameter("school-major");
		SchoolDataBean schoolDto = new SchoolDataBean();
		schoolDto.setName(schoolname);
		schoolDto.setMajor(schoolmajor);
		schoolDto.setStatus(schoolstatus);
		schoolDto.setUser_id(id);
		
		int sres = searchDao.insertSchooldata(schoolDto);
		int cres = 0;
		int lres = 0;
		int ceres = 0;
		SimpleDateFormat df = new SimpleDateFormat("MM/dd/yyyy");
		for(int i =0; i<20;i++) {
			if( req.getParameter("career"+i) !=null) {
				String career = req.getParameter("career"+i);
				String start = req.getParameter("workstart"+i);
				String end = req.getParameter("workend"+i);
				ExpDataBean expDto = new ExpDataBean();
				expDto.setExperience(career);
				expDto.setStart_date(df.parse(start));
				expDto.setEnd_date(df.parse(end));
				expDto.setUser_id(id);
				cres = searchDao.insertCareerdata(expDto);
			}
		}
		
		for(int i =0; i<20; i++) {
			if( req.getParameter("lang"+i) !=null) {
			String lang = req.getParameter("lang"+i);
			String exam = req.getParameter("exam"+i);
			String score = req.getParameter("score"+i);
			String getdate = req.getParameter("langodate"+i);
			LanguageDataBean languageDto = new LanguageDataBean();
			languageDto.setLanguage(lang);
			languageDto.setName(exam);
			languageDto.setScore(score);
			languageDto.setObtain_date(df.parse(getdate));
			languageDto.setUser_id(id);
			lres = searchDao.insertLanguagedata(languageDto);
			}
		}
		
		for(int i =0; i<20;i++) {
			if( req.getParameter("cert"+i) !=null) {
				String cert = req.getParameter("cert"+i);
				String grade = req.getParameter("grade"+i);
				String certodate = req.getParameter("certodate"+i);
				CertificateDataBean certificateDto = new CertificateDataBean();
				certificateDto.setName(cert);
				certificateDto.setScore(grade);
				certificateDto.setObtain_date(df.parse(certodate));
				certificateDto.setUser_id(id);
				ceres = searchDao.insertCertificatedata(certificateDto);
			}
		}
		int res = 0;
		if(cres==1 && ceres==1 && lres==1 && sres==1)
			res = 1;
	
		req.setAttribute("res", res);
		
		return new ModelAndView("views/search/addinfoPro");
	}
	
	@RequestMapping("/csc")
	public ModelAndView cscFormprocess(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		return new ModelAndView("views/search/csc");
	}
	
	@RequestMapping("/service_intro")
	public ModelAndView serivce_introPageProcess(HttpServletRequest req, HttpServletResponse resp) throws Exception{
		return new ModelAndView("views/search/service_intro");
	}
	
	@RequestMapping("/terms_of_service")
	public ModelAndView terms_of_servicePageProcess(HttpServletRequest req, HttpServletResponse resp) throws Exception{
		return new ModelAndView("views/search/terms_of_service");
	}
	
	@RequestMapping("/privacyStatement")
	public ModelAndView privacyStatementPageProcess(HttpServletRequest req, HttpServletResponse resp) throws Exception{
		return new ModelAndView("views/search/privacyStatement");
	}
	
	@RequestMapping(value="/setPrime.do")
    @ResponseBody
    public void ajax_setMePrime( HttpServletRequest req, HttpServletResponse resp) throws Exception {
        int user_id = Integer.parseInt( req.getParameter( "id" ) );
        int updateResult = searchDao.updateUserPrime( user_id );
        System.out.println( "in ajax updateResult : " + updateResult );
        
        resp.sendRedirect( "/studyloop/mypage.do?id=" + user_id );
    }
	
	@RequestMapping("/closeStudy")
	public void closeStudyProcess(HttpServletRequest req, HttpServletResponse resp) throws Exception{
		int sid = Integer.parseInt(req.getParameter("sid"));
		searchDao.closeStudy(sid);
		resp.sendRedirect("mypage.do");
	}
	 
}
