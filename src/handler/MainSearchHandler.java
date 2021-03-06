package handler;


import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
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
	Logger log = Logger.getLogger("main");
	
	@RequestMapping("/search")
    public ModelAndView searchprocess(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
        String keyword  = req.getParameter("searchVal");
        String[] loclist = req.getParameterValues("loclist");
        String cat = req.getParameter("cat");
        String[] daylist = req.getParameterValues("sday");
        String sort = req.getParameter("sort");
        int cluster = 0;
        if(req.getSession().getAttribute("userDto") == null) {
        	log.debug("[비회원 검색]");
        }
        else {
        	log.debug("[회원 검색]");
        	UserDataBean userDto = userDao.getUserById(((UserDataBean)req.getSession().getAttribute("userDto")).getId());
        	log.debug(userDto.getId() + ","+ userDto.getEmail());
        	String[] interest = {"BG","MS","PC","PU","IT","CK","SO","AZ","CO","ID","MT","NE", "NM", "EN", "JP", "CH","DE", "ET","EX"};
        	String[] goal = {"JB", "CT", "MJ", "LA"," AC"};
        	
       
        	
        	ArrayList<String> interestArr = new ArrayList<String>(Arrays.asList(interest)); 
        	ArrayList<String> goalArr = new ArrayList<String>(Arrays.asList(goal)); 
        	
        	
        	ArrayList<String> userdata = new ArrayList<String>();
        	if(userDto.getGender().equals("남"))
        		userdata.add("0.0");
        	else
        		userdata.add("1.0");
        	String age = Integer.toString((2019 - Integer.parseInt(userDto.getBirth().substring(0, 4))));
        	userdata.add(age);
        	String inter = Double.toString(interestArr.indexOf(userDto.getInterest())).toString();
        	if (inter.equals(null))
        		inter = "0.0";    	
        	userdata.add(inter);
        	String gol = Double.toString(goalArr.indexOf(userDto.getGoal())).toString();
        	if (gol.equals(null))
        		gol = "0.0";
        	userdata.add(gol);
        	userdata.add(userDto.getOpen());
        	userdata.add(userDto.getPart());
        	       	
        	String message = userdata.get(0)+","+userdata.get(1)+","+userdata.get(2)+","+userdata.get(3)+","+userdata.get(4)+","+userdata.get(5);
            
            File file = new File("/Users/joon/Desktop/webproject/studyloop/WebContent/views/search/mydata.txt");
            FileWriter writer = null;
          
            try {
                // 기존 파일의 내용에 이어서 쓰려면 true를, 기존 내용을 없애고 새로 쓰려면 false를 지정한다.
                writer = new FileWriter(file, false);
                writer.write(message);
                writer.flush();   
                System.out.println("DONE");
            } catch(IOException e) {
                e.printStackTrace();
            } finally {
                try {
                    if(writer != null) writer.close();
                } catch(IOException e) {
                    e.printStackTrace();
                }
            }
            Runtime rt = Runtime.getRuntime();
            String[] processString = {"/Users/joon/anaconda3/bin/python3", "/Users/joon/Desktop/webproject/studyloop/WebContent/findCluster.py"};
            System.out.println(processString);
            try {
                Process extractProcess = rt.exec(processString);
                BufferedReader input = new BufferedReader(new InputStreamReader(extractProcess.getInputStream()));
                String pyString = input.readLine();
                System.out.println("<PYSTUFF>SUCCESS " + pyString + "</PYSTUFF>");
                cluster = Integer.parseInt(pyString);
            } catch (IOException e) {
                e.printStackTrace();
                System.out.println("<FAIL>PYTHON DID NOT RUN</FAIL>");
            } 
        }
        
        if(keyword == null) {
        	keyword = "";
            log.debug("[전체 검색]");   
        }
        else {
        	log.debug("[검색키워드]");  
        	log.debug(keyword);  
        }
    
        List<StudyDataBean> studyDtoList = searchDao.searchByKeyWord(keyword);

        List<LocTmpDataBean> locationList = searchDao.getLocationList(keyword);
        
        if(cat != null) {
        	log.debug("[카테고리 검색]"); 
        	log.debug(cat);  
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
     
            log.debug("[지역검색]");
            log.debug((Arrays.toString(loclist)));  
        }
        
        if(daylist != null) { //화목 
        	List<StudyDataBean> studyDtoFilterList = new ArrayList<StudyDataBean>();
        	String name_day = "";
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
        	
    		Map<String, String> days = new HashMap<String,String>();
    		
    		days.put("0","월");
    		days.put("1","화");
    		days.put("2","수");
    		days.put("3","목");
    		days.put("4","금");
    		days.put("5","토");
    		days.put("6","일");
	    		// daylist = {"0", "2", "6"}
    		for(int x=0; x<daylist.length; x++) {
    			// x = 0 
    			// x = 1
    			name_day += days.get(daylist[x])+ " ";
    			//name_day = 월;
    			//name_day = 월 수;
    		}
        	log.debug("[요일검색]");
        	log.debug(name_day);
        	
        }
       
        
        if(sort != null) {
        	if(sort.equals("1")) { //프리미엄 순
        		log.debug("[프리미엄순 정렬]"); 
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
        		log.debug("[최신 등록순 정렬]"); 
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
        		log.debug("[데드라인 임박순 정렬]"); 
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
        
        //머신러닝 결과 적용(회원만)
        if(req.getSession().getAttribute("userDto") != null) {
       
	       	String[] category = {"대기업 자소서", "대기업 인적성", "대기업 면접" ,"공기업 자소서","공기업 NCS","공기업 면접","중소기업 자소서","중소기업 면접","공무원 7급","공무원 9급","공무원 5급","컴퓨터 정보처리기사","컴퓨터 정보보안기사","컴퓨터 컴퓨터활용능력","컴퓨터 리눅스마스터","사회 사회조사분석사","요리 한식조리기사","요리 일식조리기사","요리 양식조리기사","사회 유통관리사","사회 한국사능력검정시험","영어 TOEIC","영어 OPIC"
	        		,"영어 SAT","영어 TOEFL","일본어 JPLT","일본어 JPT","중국어 HSK","독일어 ZD","공학 기계공학","공학 컴퓨터공학","공학 화학공학","공학 환경공학","공학 로봇공학","공학 생명공학"
	        		,"인문 국어국문학","인문 철학","인문 사학","인문 유학","인문 중어중문학","사회 심리학","사회 통계학","사회 사회학","사회 커뮤니케이션학","자연과학 물리학","자연과학 수학","자연과학 생물학","자연과학 지구과학"
	        		,"회화 영어회화","운동 웨이트","운동 조깅"};
	
	        String[] loc = {"강남","홍대","신촌","종로","신사","목동","잠실","양재","사당","노원","은평","혜화","성수","인사동","고양","서면","송도","건대"
	        	               ,"신림","마포","성북","영등포","용산","왕십리" ,"구로","동작","수유","회기","충무로","미아","청량리","강서"
	        	               ,"수원","고양","분당","의정부","송도","구월동","부평","대전역","중앙","서면","부경대","해운대","남포","구미","울산대"};
	        	
	        
	        
	        studyDtoList = searchDao.addEstrate(studyDtoList, cluster);
	        for(StudyDataBean s : studyDtoList) {
	        	//System.out.println(s.getEst_rate());
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

		log.debug("[마이페이지]");
		log.debug(userDto.getId()+","+userDto.getEmail()+","+userDto.getGender());
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
            //log.debug("스터디 "+userDao.getStudyById(sid)+"에 신청한 유저 "+ userDao.getUserById(tid).getNick() +" 의 상태를 "+userDao.getStatus(status)+"로 변경");
            log.debug("[신청 상태 변경]");
            log.debug(userDao.getStudyById(sid).getId()+","+userDao.getUserById(tid).getId()+","+userDao.getStatus(status));
            UserDataBean userDto2 = userDao.getUserById(tid);
            StudyDataBean studyDto = userDao.getStudyById(sid);
            
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
		
		log.debug("[참여중인 스터디] "+pstudyDtoList.size()+" 개");
		for(StudyDataBean s : pstudyDtoList) {
			log.debug(myId+","+s.getId()+","+s.getTitle() + ","+s.getCategory()+ ","+s.getLocation());
		}	
		log.debug("[주최한 스터디] "+ostudyDtoList.size()+" 개");
		for(StudyDataBean s : ostudyDtoList) {
			log.debug(myId+","+s.getId()+","+s.getTitle() + ","+s.getCategory()+ ","+s.getLocation());
		}
		log.debug("[신청한 스터디] "+rstudyDtoList.size()+" 개");
		for(StudyDataBean s : rstudyDtoList) {
			log.debug(myId+","+s.getId()+","+s.getTitle() + ","+s.getCategory()+ ","+s.getLocation());
		}
		
		return new ModelAndView("views/search/mypage");
	}
	
	@RequestMapping("/main")
	public ModelAndView mainFormprocess(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		Map<String,Double> cord = new HashMap<String,Double>();
		cord.put("lat", (double) 0);
		cord.put("long", (double) 0);
		
		if(req.getSession().getAttribute("lat") != null) {
	
			double latitude =  (double) req.getSession().getAttribute("lat");
			double longtitude = (double) req.getSession().getAttribute("long");				
			cord.replace("lat", latitude);
			cord.replace("long", longtitude);
			//log.debug("[접속 좌표] " + latitude + "," + longtitude);

			GpsToAddress gps = new GpsToAddress();
			
			log.debug("[접속 위치]\n" +gps.coordToAddr(longtitude, latitude));
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
		
		UserDataBean userDto = (UserDataBean) req.getSession().getAttribute("userDto");
		int id = userDto.getId();
		
		SchoolDataBean schoolDto = searchDao.getSchoolinfo(id);
		List<LanguageDataBean> languageDtoList = searchDao.getLanguageinfo(id);
		List<CertificateDataBean> certificateDtoList = searchDao.getCertificateinfo(id);
		List<ExpDataBean> expDtoList = searchDao.getExpinfo(id);
		log.debug("[신청자 정보]");
		log.debug(userDto.getId()+","+userDto.getEmail());
		if(schoolDto !=null) {
			req.setAttribute("schoolDto", schoolDto);
			log.debug("[추가정보] [학교]:\n" + schoolDto.getName()+","+ schoolDto.getMajor() +"," +schoolDto.getStatus());
		}
		if(languageDtoList !=null) {
			log.debug("[어학]"); 
			req.setAttribute("languageDtoList", languageDtoList);
			for(LanguageDataBean l : languageDtoList) {
				log.debug(l.getLanguage()+ ","+l.getName() + ","+l.getScore()+","+l.getObtain_date());
			}	
		}
		if(certificateDtoList !=null) {
			log.debug("[자격증]"); 
			req.setAttribute("certificateDtoList", certificateDtoList);
			for(CertificateDataBean c : certificateDtoList) {
				log.debug(c.getName()+ ","+c.getScore()+","+c.getObtain_date());
			}	
		}
		if(expDtoList !=null) {
			log.debug("[경력/경험]"); 
			req.setAttribute("expDtoList", expDtoList);
			for(ExpDataBean e : expDtoList) {
				log.debug(e.getExperience()+ ","+e.getStart_date() +"," +e.getEnd_date());
			}	
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
	
		log.debug("[개인 추가정보 수정]");
		log.debug(userDto.getId()+","+userDto.getEmail());
		//insert
		String schoolname = req.getParameter("school");
		log.debug("[학교]");		
		String schoolstatus = req.getParameter("radio-school");	
		String schoolmajor = req.getParameter("school-major");
		log.debug(schoolname+","+schoolmajor+","+schoolstatus);
		SchoolDataBean schoolDto = new SchoolDataBean();
		schoolDto.setName(schoolname);
		schoolDto.setMajor(schoolmajor);
		schoolDto.setStatus(schoolstatus);
		schoolDto.setUser_id(id);
		
		int sres = searchDao.insertSchooldata(schoolDto);
		int cres = 0;
		int lres = 0;
		int ceres = 0;
		log.debug("[경력/경험]");
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
				log.debug(career+","+start+","+end);

			}
		}
		log.debug("[어학]");
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
			
			log.debug(lang+","+exam+","+score+","+getdate);

			}
		}
		log.debug("[자격증]");
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
				
				log.debug(cert+","+grade+","+certodate);
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
        UserDataBean userDto = userDao.getUserById(user_id);
        log.debug("[프리미엄구매]");
        log.debug(userDto.getId()+","+userDto.getEmail());
        
        resp.sendRedirect( "/studyloop/mypage.do?id=" + user_id );
    }
	
	@RequestMapping("/closeStudy")
	public void closeStudyProcess(HttpServletRequest req, HttpServletResponse resp) throws Exception{
		
		int sid = Integer.parseInt(req.getParameter("sid"));
		searchDao.closeStudy(sid);
		StudyDataBean studyDto = userDao.getStudyById(sid);
		UserDataBean userDto = (UserDataBean) req.getSession().getAttribute("userDto");
		log.debug("[스터디 종료]");
		log.debug(userDto.getId()+","+studyDto.getId()+","+studyDto.getTitle());
		resp.sendRedirect("mypage.do");
	}
	
	@RequestMapping("/live_chat.do")
	public ModelAndView livechat(HttpServletRequest req, HttpServletResponse resp) throws Exception{
		
		return new ModelAndView("views/chat/chat");
	}
	 
}
