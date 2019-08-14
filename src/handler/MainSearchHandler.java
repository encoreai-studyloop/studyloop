package handler;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
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
import location.GpsToAddress;


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
		Logger log = Logger.getLogger("studyloop");
        String keyword  = req.getParameter("searchVal");
        String[] loclist = req.getParameterValues("loclist");
        String cat = req.getParameter("cat");
        String[] daylist = req.getParameterValues("sday");
        String sort = req.getParameter("sort");
              
      
        if(keyword == null) {
        	keyword = "";
            log.debug("전체 검색");   
        }
        else {
        	log.debug("검색키워드 : "+ keyword);   
        }
    
        List<StudyDataBean> studyDtoList = searchDao.searchByKeyWord(keyword);

        List<LocTmpDataBean> locationList = searchDao.getLocationList(keyword);
        
        if(cat != null) {
        	log.debug("카테고리 검색 : "+ cat); 
        	List<StudyDataBean> studyDtoFilterList = new ArrayList<StudyDataBean>();
        	for(int i=0; i<studyDtoList.size(); i++) {       		
        		if(studyDtoList.get(i).getCategory().equals(cat)) {
        			studyDtoFilterList.add(studyDtoList.get(i));
        		}
        	}
        	studyDtoList = studyDtoFilterList;
        }
        
        if( loclist != null ) {
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
            log.debug("지역검색 : " + (Arrays.toString(loclist)));
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
        		
	    		//log.debug("요일검색 :" + (Arrays.toString(daylist)));
        		//String[] daylist = req.getParameterValues("sday");
	    		Map<Integer, String> days = new HashMap<Integer,String>();
		    		
		    		days.put(0, "월");
		    		days.put(1,"화");
		    		days.put(2,"수");
		    		days.put(3,"목");
		    		days.put(4,"금");
		    		days.put(5,"토");
		    		days.put(6,"일");
		    		
		    		for(int x=0; x<daylist.length; x++) {
		    			System.out.println(days.));
		    		}
        	}
        	studyDtoList = studyDtoFilterList;
        
        	log.debug("요일검색 :" + Arrays.asList(daylist));
        	
        }
       
        
        if(sort != null) {
        	if(sort.equals("1")) { //프리미엄 순
        		log.debug("프리미엄순 정렬"); 
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
        		log.debug("최신 등록순 정렬"); 
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
        		log.debug("데드라인 임박순 정렬"); 
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
		Logger log = Logger.getLogger("studyloop");
		
		UserDataBean user = (UserDataBean) req.getSession().getAttribute("userDto");
		if(user == null) {
			resp.sendRedirect("login.do");
		}
		

		UserDataBean userDto = userDao.getUserById(user.getId());
		req.setAttribute("userDto", userDto);
		int myId = userDto.getId();

		log.debug("회원 " +userDto.getEmail() +" 마이페이지 진입");
		//유저 status 변경
		if(req.getParameter("tid") != null) {
            int tid = Integer.parseInt(req.getParameter("tid"));
            int sid = Integer.parseInt(req.getParameter("sid"));
            int status = Integer.parseInt(req.getParameter("status"));
            
            Map<String,Integer> id_map = new HashMap<String, Integer>();
            id_map.put( "user_id", tid );
            id_map.put( "study_id", sid );
            int curUserStat = userDao.getUserStatus( id_map );

            
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
            log.debug("스터디 "+userDao.getStudyById(sid)+"에 신청한 유저 "+ userDao.getUserById(tid).getNick() +" 의 상태를 "+userDao.getStatus(status)+"로 변경");
        }

		
		
		//회원이 참여중인 스터디
		List<StudyDataBean> pstudyDtoList = userDao.getParticipateStudy(myId);
		
		//회원이 주최한 스터디
		List<StudyDataBean> ostudyDtoList = userDao.getOpenStudy(myId);
		
		//회원이 신청한 스터디 
		List<StudyDataBean> rstudyDtoList = userDao.getRegisterStudy(myId);


		//회원의 스터디에 신청한 유저들
		List<StudyRegFormDataBean> ruserDtoList = userDao.getMyStudyRegUser(myId);
		req.setAttribute("pstudyDtoList", pstudyDtoList);
		req.setAttribute("ostudyDtoList", ostudyDtoList);
		req.setAttribute("rstudyDtoList", rstudyDtoList);
		req.setAttribute("ruserDtoList", ruserDtoList);
		
		log.debug("참여중인 스터디 : "+pstudyDtoList.size()+" 개");
		for(StudyDataBean s : pstudyDtoList) {
			log.debug("제목 : "+ s.getTitle() + "\t카테고리 : "+s.getCategory());
		}	
		log.debug("주최한 스터디 : "+ostudyDtoList.size()+" 개");
		for(StudyDataBean s : ostudyDtoList) {
			log.debug("제목 : "+ s.getTitle() + "\t카테고리 : "+s.getCategory());
		}
		log.debug("신청한 스터디 : "+rstudyDtoList.size()+" 개");
		for(StudyDataBean s : rstudyDtoList) {
			log.debug("제목 : "+ s.getTitle() + "\t카테고리 : "+s.getCategory());
		}
		
		return new ModelAndView("views/search/mypage");
	}
	
	@RequestMapping("/main")
	public ModelAndView mainFormprocess(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		Logger log = Logger.getLogger("studyloop");
		
		
		Map<String,Double> cord = new HashMap<String,Double>();
		cord.put("lat", (double) 0);
		cord.put("long", (double) 0);
		
		if(req.getSession().getAttribute("lat") != null) {
	
			double latitude =  (double) req.getSession().getAttribute("lat");
			double longtitude = (double) req.getSession().getAttribute("long");				
			cord.replace("lat", latitude);
			cord.replace("long", longtitude);
			log.debug("접속 좌표 : " + latitude + ", " + longtitude);

			GpsToAddress gps = new GpsToAddress();
			
			log.debug("접속 위치 : " +gps.coordToAddr(longtitude, latitude));
		}
		
		CategoryDataBean categoryDto = searchDao.loadCategory();
		req.setAttribute("categoryDto", categoryDto);
		//전체 다 가져오기
		//ArrayList<StudyDataBean> studyDtoList = (ArrayList<StudyDataBean>) searchDao.getStudyThumbNail();
		
		//새로운 스터디 가져오기
		//ArrayList<StudyDataBean> nstudyDtoList = (ArrayList<StudyDataBean>) searchDao.getStudyThumbNailofnew();
		
		//근방 5km 이내 스터디 가져오기
		ArrayList<StudyDataBean> nstudyDtoList = (ArrayList<StudyDataBean>) searchDao.getStudyThumbNailofnear(cord);
		
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
	
		resp.sendRedirect("mypage.do");
		return new ModelAndView("views/search/mypage");
	}
	
	@RequestMapping("/faq")
	public ModelAndView faqPageProcess(HttpServletRequest req, HttpServletResponse resp) throws Exception{
		return new ModelAndView("views/search/faq");
	}
	
	@RequestMapping("/addinfoForm")
	public ModelAndView addinfoFormPageProcess(HttpServletRequest req, HttpServletResponse resp) throws Exception{
		Logger log = Logger.getLogger("studyloop");	
		UserDataBean userDto = (UserDataBean) req.getSession().getAttribute("userDto");
		int id = userDto.getId();
		
		SchoolDataBean schoolDto = searchDao.getSchoolinfo(id);
		List<LanguageDataBean> languageDtoList = searchDao.getLanguageinfo(id);
		List<CertificateDataBean> certificateDtoList = searchDao.getCertificateinfo(id);
		List<ExpDataBean> expDtoList = searchDao.getExpinfo(id);
		
		if(schoolDto !=null) {
			req.setAttribute("schoolDto", schoolDto);
			log.debug("추가정보 :\n학교명 : " + schoolDto.getName()+"\n전공명 : "+ schoolDto.getMajor() +"\n졸업유무" +schoolDto.getStatus());
		}
		if(languageDtoList !=null) {
			req.setAttribute("languageDtoList", languageDtoList);
			for(LanguageDataBean l : languageDtoList) {
				log.debug("어학 리스트 :\n언어 : "+l.getLanguage()+ "\n시험명 : "+l.getName() + "\n점수/등급 : "+l.getScore());
			}	
		}
		if(certificateDtoList !=null) {
			req.setAttribute("certificateDtoList", certificateDtoList);
			for(CertificateDataBean c : certificateDtoList) {
				log.debug("자격증 리스트 :\n자격증명 : "+c.getName()+ "\n점수/등급 : "+c.getScore());
			}	
		}
		if(expDtoList !=null) {
			req.setAttribute("expDtoList", expDtoList);
			for(ExpDataBean e : expDtoList) {
				log.debug("경력 리스트 :\n경력명 : "+e.getExperience()+ "\n시작일 : "+e.getStart_date() +"\n종료일 : " +e.getEnd_date());
			}	
		}
		
		return new ModelAndView("views/search/addinfoForm");
	}
	
	@RequestMapping("/addinfo")
	public ModelAndView addinfoPageProcess(HttpServletRequest req, HttpServletResponse resp) throws Exception{
		req.setCharacterEncoding( "utf-8" );
		Logger log = Logger.getLogger("studyloop");	
		UserDataBean userDto = (UserDataBean) req.getSession().getAttribute("userDto");
		int id = userDto.getId();
		
		//정보가 있는 정보면 기존꺼 delete 후 insert 없으면 그냥 insert 로 나눠서 작업 
		//delete 
		int delres = searchDao.cleanExistinginfo(id);
	
		log.debug("개인 추가정보 수정 :");
		//insert
		String schoolname = req.getParameter("school");
		log.debug("학교명 : "+schoolname);		
		String schoolstatus = req.getParameter("radio-school");	
		String schoolmajor = req.getParameter("school-major");
		log.debug("전공명 : "+schoolmajor);
		log.debug("졸업유무 : "+schoolstatus);
		SchoolDataBean schoolDto = new SchoolDataBean();
		schoolDto.setName(schoolname);
		schoolDto.setMajor(schoolmajor);
		schoolDto.setStatus(schoolstatus);
		schoolDto.setUser_id(id);
		
		int sres = searchDao.insertSchooldata(schoolDto);
		int cres = 0;
		int lres = 0;
		int ceres = 0;
		log.debug("경력 사항 : ");
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
				log.debug("경력명 : "+career);
				log.debug("시작일 : "+start);
				log.debug("종료일 : "+end);
			}
		}
		log.debug("어학 사항 : ");
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
			
			log.debug("언어명 : "+lang);
			log.debug("시험명 : "+exam);
			log.debug("성적 : "+score);
			log.debug("취득일 : "+getdate);

			}
		}
		log.debug("자격증 사항 : ");
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
				
				log.debug("자격증명 : "+cert);
				log.debug("성적 : "+grade);
				log.debug("취득일 : "+certodate);
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
        Logger log = Logger.getLogger("studyloop");
        log.debug(userDao.getUserById(user_id).getEmail() +" : 프리미엄 구매");
        
        resp.sendRedirect( "/studyloop/mypage.do?id=" + user_id );
    }
	
	@RequestMapping("/closeStudy")
	public void closeStudyProcess(HttpServletRequest req, HttpServletResponse resp) throws Exception{
		Logger log = Logger.getLogger("studyloop");	
		int sid = Integer.parseInt(req.getParameter("sid"));
		searchDao.closeStudy(sid);
		log.debug(userDao.getStudyById(sid).getTitle() +" 스터디 종료시킴");
		resp.sendRedirect("mypage.do");
	}
	 
}
