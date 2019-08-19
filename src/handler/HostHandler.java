package handler;

import java.io.File;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.oracle.jrockit.jfr.ContentType;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import databean.CategoryDataBean;
import databean.CategoryTempBean;
import databean.LocationDataBean;
import databean.StudyDataBean;
import databean.StudyRegCategoryDataBean;
import databean.StudyTimeDataBean;
import databean.UserDataBean;
import dbbean.HostDao;
import dbbean.SearchDao;
import dbbean.ShowDao;

@Controller
public class HostHandler {
	@Resource
	private HostDao hostDao;

	@Resource
	private SearchDao searchDao;
	
	@RequestMapping("/titleForm")
	public ModelAndView titleFormProcess(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		Logger log = Logger.getLogger("studyloop");
		log.debug("새 스터디 작성 시작");
		List<StudyRegCategoryDataBean> catDtoList = hostDao.getStudyCategory();

		req.setAttribute("catDtoList", catDtoList);
		return new ModelAndView("views/host/titleForm");
	}

	@RequestMapping("/infoForm")
	public ModelAndView infoFormProcess(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		Logger log = Logger.getLogger("studyloop");
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=UTF-8");
		ServletContext cxt = req.getSession().getServletContext();

		String dir = cxt.getRealPath("/views/host/img");

		File Folder = new File(dir);

		if (!Folder.exists()) {
			try {
				Folder.mkdir();
				log.debug("폴더가 생성되었습니다.");
			} catch (Exception e) {
				e.getStackTrace();
			}
		} else {
			log.debug("이미 폴더가 생성되어 있습니다.");
		}

		StudyDataBean studyDto = new StudyDataBean();
		try {
			MultipartRequest multi = new MultipartRequest(req, dir, 5 * 1024 * 1024, "utf-8",
					new DefaultFileRenamePolicy());
			Enumeration<?> files = multi.getFileNames();
			String filename = multi.getFilesystemName("picture");
			String originalname = multi.getOriginalFileName("picture");
			String type = multi.getContentType("picture");
			File f = multi.getFile("picture");
			int beginIndex = f.toString().indexOf("studyloop") - 1;
			String newFiledir = f.toString().substring(beginIndex, f.toString().length());
			studyDto.setPicture(newFiledir);

			// 디버깅
		//	System.out.println("String filename = multi.getFilesystemName(\"picture\"): " + filename);
			// }

			log.debug("세션에서 갖고 온 유저 아이디 : " + ((UserDataBean) req.getSession().getAttribute("userDto")).getId());
			studyDto.setUser_id(((UserDataBean) req.getSession().getAttribute("userDto")).getId());
			studyDto.setTitle(multi.getParameter("title"));
			studyDto.setCat_id(Integer.parseInt(multi.getParameter("category")));
			
		//	studyDto.setCat_id(1);

			studyDto.setTerm(multi.getParameter("term"));
			studyDto.setMax_personnel(Integer.parseInt(multi.getParameter("max_personnel")));

			String deadline = multi.getParameter("deadline");
			if (!deadline.equals("")) {
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				studyDto.setDeadline(df.parse(multi.getParameter("deadline")));
			}

			req.getSession().setAttribute("studyDto", studyDto);
			log.debug("스터디 타이틀 : " + studyDto.getTitle());
			log.debug("스터디 이미지: " + studyDto.getPicture());
			String cat = hostDao.getCategoryById(studyDto.getCat_id());
			studyDto.setCategory(cat);
			log.debug("스터디 카테고리 : " + cat);
			log.debug("스터디 형태 : " + studyDto.getTerm());
			log.debug("스터디 모집인원 : " + studyDto.getMax_personnel());
			log.debug("스터디 모집마감일 : " + studyDto.getDeadline());
			

		} catch (Exception e) {
			e.printStackTrace();
		}

		return new ModelAndView("views/host/infoForm");
	}

	@RequestMapping("/scheduleForm")
	public ModelAndView scheduleFormProcess(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		Logger log = Logger.getLogger("studyloop");
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		ServletContext cxt = req.getSession().getServletContext();
		String dir = cxt.getRealPath("/");
		try {
			MultipartRequest multi = new MultipartRequest(req, dir, 5 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());

			StudyDataBean studyDto = (StudyDataBean) req.getSession().getAttribute("studyDto");
			List<LocationDataBean> locDtoList = hostDao.getStudyLocation();

				if(locDtoList.isEmpty()) {
					System.out.println("리스트null");
				}
				else {
			for(int i=0;i<locDtoList.size();i++) {
				if(locDtoList.get(i)== null) {
				}
			}
		}
			studyDto.setIntro(multi.getParameter("intro"));
			studyDto.setProcess(multi.getParameter("process"));
			studyDto.setTarget(multi.getParameter("target"));
			studyDto.setCurriculum(multi.getParameter("curriculum"));
			studyDto.setChat_url(multi.getParameter("chat_url"));
			
	
			req.getSession().setAttribute("studyDto", studyDto);
			req.setAttribute("locDtoList", locDtoList);
			
			log.debug("스터디 소개 : " + studyDto.getIntro());
			log.debug("스터디 진행방식 : " + studyDto.getProcess());
			log.debug("스터디 모집대상 : " + studyDto.getTarget());
			log.debug("스터디 세부 커리큘럼 : " + studyDto.getCurriculum());
			log.debug("스터디 채팅링크: " + studyDto.getChat_url());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return new ModelAndView("views/host/scheduleForm");
	}

	@RequestMapping("/sregister")
	public ModelAndView attendProProcess(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		Logger log = Logger.getLogger("studyloop");	
		String form = req.getParameter("form");
		if(form != null) {
			int study_id = Integer.parseInt(req.getParameter("sid"));
			StudyDataBean studyDto = hostDao.getStudy(study_id);
			StudyTimeDataBean studytimeDto = hostDao.getStudyTime(study_id);
			log.debug(studyDto.getId() +"번 스터디 마이페이지 스터디 삭제/수정 들어옴");
			String loc = hostDao.getLocationById(studyDto.getLoc_id());
			studyDto.setLocation(loc);	
			String cat = hostDao.getCategoryById(studyDto.getCat_id());
			studyDto.setCategory(cat);
			req.setAttribute("studyDto", studyDto);
			req.setAttribute("studytimeDto", studytimeDto);
		}
		else {
			StudyTimeDataBean studytimeDto = new StudyTimeDataBean();
			req.setCharacterEncoding("utf-8");
			resp.setContentType("text/html;charset=UTF-8");
			PrintWriter out = resp.getWriter();
			ServletContext cxt = req.getSession().getServletContext();
			MultipartRequest multi = null;
			String dir = cxt.getRealPath("/");
			try {
				//if (-1 < req.getContentType().indexOf("multipart/form-data")) {
					multi = new MultipartRequest(req, dir, 5 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());

					StudyDataBean studyDto = (StudyDataBean) req.getSession().getAttribute("studyDto");
		
					studyDto.setLoc_id(Integer.parseInt(multi.getParameter("location")));
					studyDto.setPlace(multi.getParameter("spelocation"));

					if (multi.getParameter("scost").equals(null) || multi.getParameter("scost").length() == 0) {
						studyDto.setScost("0");
					} else {
						studyDto.setScost(multi.getParameter("scost"));
					}

					studyDto.setScomment(multi.getParameter("scomment"));

					DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
					studytimeDto.setSdate(df.parse(multi.getParameter("sdate")));
					studytimeDto.setStime(multi.getParameter("stime"));
					String[] sdays = multi.getParameterValues("sday");
					String daylist = "";
					for (String day : sdays) {
						daylist += day + "@";
					}
					studytimeDto.setSday(daylist);

					req.getSession().setAttribute("studytimeDto", studytimeDto);
					req.getSession().setAttribute("studyDto", studyDto);

					hostDao.insertStudyTimeInfo((StudyTimeDataBean) req.getSession().getAttribute("studytimeDto"));
					int studytime_id = hostDao.getStudytimeId();
					((StudyDataBean) req.getSession().getAttribute("studyDto")).setStudytime_id(studytime_id);
					hostDao.insertStudyInfo((StudyDataBean) req.getSession().getAttribute("studyDto"));

					req.getSession().removeAttribute("studyDto");
					req.getSession().removeAttribute("studytimeDto");
					String loc = hostDao.getLocationById(studyDto.getLoc_id());
					studyDto.setLocation(loc);
					
					String cat = hostDao.getCategoryById(studyDto.getCat_id());
					studyDto.setCategory(cat);
					req.setAttribute("studyDto", studyDto);
					req.setAttribute("studytimeDto", studytimeDto);
					log.debug("스터디 장소 : " + loc);
					log.debug("스터디 세부장소 : " + studyDto.getPlace());
					log.debug("스터디 회비 : " + studyDto.getScost());
					String[] dataArr = daylist.split("@");
					String newArr = Arrays.toString(dataArr);
				
					Map<String,String> days = new HashMap<String, String>();
					days.put("0", "월");
					days.put("1", "화");
					days.put("2", "수");
					days.put("3", "목");
					days.put("4", "금");
					days.put("5", "토");
					days.put("6", "일");		

					for(int i=0; i<newArr.length(); i++) {
						 String strday = days.get(newArr) + " ";
						 log.debug(studyDto.getId() + "번  스터디 요일 : " + strday);		  
						}
				//	log.debug(studyDto.getId() + "번 스터디 수정 스터디 요일 : " + strday);
				//	log.debug("스터디 요일 : " + studytimeDto.getSday());
					log.debug("스터디 시간 : " + studytimeDto.getStime());
					log.debug("스터디 시작일 : " + studytimeDto.getSdate());
					log.debug("스터디 추가코멘트 : " + studyDto.getScomment());
					log.debug("스터디 등록 완료");
					
			//	}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}	
		return new ModelAndView("views/host/register");
	}

	@RequestMapping("/sdeletePro")
	public ModelAndView deleteProProcess(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		Logger log = Logger.getLogger("studyloop");
		StudyDataBean studyDto = hostDao.getStudy(Integer.parseInt(req.getParameter("sid")));
		req.setAttribute("studyDto", studyDto);
		int result = hostDao.deleteStudyInfo(Integer.parseInt(req.getParameter("sid")));
		log.debug(studyDto.getId() + "번 스터디 삭제 시작 : " + result);
		req.setAttribute("result", result);
		long deletetime = System.currentTimeMillis();
		log.debug(deletetime/(1000*60*60) + "시" + deletetime/(1000*60) + "분" + deletetime/1000 + "초 : " + studyDto.getId() + "번 스터디 삭제 완료 ");	
		return new ModelAndView("views/host/deleteStudyPro");
	}

	@RequestMapping("/sdelete")
	public ModelAndView deleteProcess(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		Logger log = Logger.getLogger("studyloop");
		return new ModelAndView("views/host/deleteStudy");
	}

	@RequestMapping("/smodify")
	public ModelAndView modifyProcess(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		Logger log = Logger.getLogger("studyloop");
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=UTF-8");
		StudyDataBean studyDto = hostDao.getStudy(Integer.parseInt(req.getParameter("sid")));
		StudyTimeDataBean studytimeDto = hostDao.getStudyTime(Integer.parseInt(req.getParameter("sid")));
		List<LocationDataBean> locDtoList = hostDao.getStudyLocation();
		List<StudyRegCategoryDataBean> catDtoList = hostDao.getStudyCategory();
		req.setAttribute("studyDto", studyDto);
		req.setAttribute("studytimeDto", studytimeDto);
		req.setAttribute("locDtoList", locDtoList);
		req.setAttribute("catDtoList", catDtoList);
		log.debug(studyDto.getId() + "번 스터디 수정 시작");
		return new ModelAndView("views/host/modifyStudy");
	}

	@RequestMapping("/smodifyPro")
	public ModelAndView modifyProProcess(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		Logger log = Logger.getLogger("studyloop");
		int sid = Integer.parseInt(req.getParameter("sid"));
		int stid = Integer.parseInt(req.getParameter("stid"));
		
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=UTF-8");
		ServletContext cxt = req.getSession().getServletContext();
		String dir = cxt.getRealPath("/views/host/img");
		try {
			// if(-1 <req.getContentType().indexOf("multipart/form-data")) {
			MultipartRequest multi = new MultipartRequest(req, dir, 5 * 1024 * 1024, "utf-8",
					new DefaultFileRenamePolicy());
			Enumeration<?> files = multi.getFileNames();
			String filename = multi.getFilesystemName("modpicture");
			String originalname = multi.getOriginalFileName("modpicture");
			String type = multi.getContentType("modpicture");
			File f = multi.getFile("modpicture");
			int beginIndex = f.toString().indexOf("studyloop") - 1;
			String newFiledir = f.toString().substring(beginIndex, f.toString().length());

			
			StudyDataBean studyDto = new StudyDataBean();
			StudyTimeDataBean studytimeDto = new StudyTimeDataBean();
			studyDto.setId(sid);
			studyDto.setTitle(multi.getParameter("modtitle"));
			studyDto.setPicture(newFiledir);
			studyDto.setCat_id(1);
		//	studyDto.setCat_id(Integer.parseInt(multi.getParameter("modcategory").toString()));	//
		//	System.out.println("multi.getParameter(\"modcategory\").toString() : " + multi.getParameter("modcategory").toString());
		//	System.out.println("multi.getParameter(\"modcategory\"): " + multi.getParameter("modcategory"));
			
			
			studyDto.setTerm(multi.getParameter("modterm"));
			studyDto.setMax_personnel(Integer.parseInt(multi.getParameter("modmax_personnel")));

			String deadline = multi.getParameter("moddeadline");
			if (!deadline.equals("")) {
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				studyDto.setDeadline(df.parse(multi.getParameter("moddeadline")));
			}
			
			studyDto.setIntro(multi.getParameter("modintro"));
			studyDto.setProcess(multi.getParameter("modprocess"));
			studyDto.setTarget(multi.getParameter("modtarget"));
			studyDto.setCurriculum(multi.getParameter("modcurriculum"));
			studyDto.setChat_url(multi.getParameter("modchat_url"));

			studyDto.setLoc_id(Integer.parseInt(multi.getParameter("modlocation")));
			studyDto.setPlace(multi.getParameter("modspelocation"));

			if (multi.getParameter("modscost").equals(null) || multi.getParameter("modscost").length() == 0) {
				studyDto.setScost("0");
			} else {
				studyDto.setScost(multi.getParameter("modscost"));
			}

			studyDto.setScomment(multi.getParameter("modscomment"));
			
			studyDto.setStudytime_id(stid);
			
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			studytimeDto.setSdate(df.parse(multi.getParameter("modsdate")));
			studytimeDto.setStime(multi.getParameter("modstime"));
			String[] sdays = multi.getParameterValues("sday");
			String daylist = "";

			for (String day : sdays) {
				daylist += day + "@";
			}
		
			studytimeDto.setSday(daylist);		
			studytimeDto.setId(studyDto.getStudytime_id());
			System.out.println("studyDto.setScomment(req.getParameter(\"modscomment\")) :" + multi.getParameter("modscomment"));
			int result = hostDao.modifyStudyInfo(studyDto);
			hostDao.modifyStudyTimeInfo(studytimeDto);
			req.setAttribute("result", result);
			log.debug("스터디 수정 : " + result);
			log.debug(studyDto.getId() + "번 스터디 수정 타이틀 : " + studyDto.getTitle());
			log.debug(studyDto.getId() + "번 스터디 수정 이미지: " + studyDto.getPicture());
			
			String loc = hostDao.getLocationById(studyDto.getLoc_id());
			studyDto.setLocation(loc);	
			String cat = hostDao.getCategoryById(studyDto.getCat_id());
			studyDto.setCategory(cat);
			log.debug(studyDto.getId() + "번 스터디 수정 카테고리 : " + cat);
			log.debug(studyDto.getId() + "번 스터디 수정 형태 : " + studyDto.getTerm());
			log.debug(studyDto.getId() + "번 스터디 수정 모집인원 : " + studyDto.getMax_personnel());
			log.debug(studyDto.getId() + "번 스터디 수정 모집마감일 : " + studyDto.getDeadline());
			log.debug(studyDto.getId() + "번 스터디 수정 소개 : " + studyDto.getIntro());
			log.debug(studyDto.getId() + "번  스터디 수정 진행방식 : " + studyDto.getProcess());
			log.debug(studyDto.getId() + "번 스터디 수정 모집대상 : " + studyDto.getTarget());
			log.debug(studyDto.getId() + "번 스터디 수정 세부 커리큘럼 : " + studyDto.getCurriculum());
			log.debug(studyDto.getId() + "번 스터디 수정 채팅링크: " + studyDto.getChat_url());
			
			log.debug(studyDto.getId() + "번 스터디 수정 스터디 장소 : " + loc);
			log.debug(studyDto.getId() + "번 스터디 수정 스터디 세부장소 : " + studyDto.getPlace());
			log.debug(studyDto.getId() + "번 스터디 수정 스터디 회비 : " + studyDto.getScost());
			
			
		
		//	String strdaylist = "";
			
			String[] dataArr = daylist.split("@");
			String newArr = Arrays.toString(dataArr);
//			log.debug(studyDto.getId() + "번 스터디 수정 스터디 요일 : " + newArr);	
			Map<String,String> days = new HashMap<String, String>();
			days.put("0", "월");
			days.put("1", "화");
			days.put("2", "수");
			days.put("3", "목");
			days.put("4", "금");
			days.put("5", "토");
			days.put("6", "일");
			
		//	System.out.println(dataArr);
				
			for(int i=0; i<newArr.length(); i++) {
				 String strday = days.get(newArr) + " ";
				 log.debug(studyDto.getId() + "번 스터디 수정 스터디 요일 : " + strday);		  
				}
			
		//	log.debug(studyDto.getId() + "번 스터디 수정 스터디 요일 : " + studytimeDto.getSday());
			log.debug(studyDto.getId() + "번 스터디 수정 스터디 시간 : " + studytimeDto.getStime());
			log.debug(studyDto.getId() + "번 스터디 수정 스터디 시작일 : " + studytimeDto.getSdate());
			log.debug(studyDto.getId() + "번 스터디 수정 스터디 추가코멘트 : " + studyDto.getScomment());
			
			long regtime = System.currentTimeMillis();	
			log.debug(regtime/(1000*60*60) + "시" + regtime/(1000*60) + "분" + regtime/1000 + "초 : " + studyDto.getId() + "번 스터디 수정 스터디 등록 완료");
			// }
		} catch (Exception e) {
			e.printStackTrace();
		}

		return new ModelAndView("views/host/modifyStudyPro");
	}

}