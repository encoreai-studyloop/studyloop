package handler;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import databean.ArticleReportDataBean;
import databean.BoardDataBean;
import databean.StudyDataBean;
import databean.StudyReportDataBean;
import databean.UserDataBean;
import databean.UserReportDataBean;
import dbbean.BoardDao;
import dbbean.SearchDao;
import dbbean.UserDao;

@Controller
public class ManageHandler {
	@Resource
	UserDao userDao;
	
	@Resource
	BoardDao boardDao;
	
	@Resource
	SearchDao searchDao;
	
	@RequestMapping("/manageindex")
	public ModelAndView calendarPageprocess(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		int membernum = userDao.getUsers().size();
		int studynum = searchDao.getStudies().size();
		int boardnum = boardDao.getAllboardarticles().size();
		
		req.setAttribute("membernum", membernum);
		req.setAttribute("studynum", studynum);
		req.setAttribute("boardnum", boardnum);
		return new ModelAndView("views/admin/adminindex");
	}
	
	@RequestMapping("/userreport")
	public ModelAndView userreportprocess(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		List<UserDataBean> userDtoList = userDao.getUsers();
		req.setAttribute("userDtoList", userDtoList);
		return new ModelAndView("views/admin/usermanage");
	}
	
	@RequestMapping("/deleteUserbyadmin")
	public void deletuserreportprocess(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		int id = Integer.parseInt(req.getParameter("id"));
		userDao.deleteUserById(id);
		resp.sendRedirect("userreport.do");
	
	}
	
	@RequestMapping("/boardreport")
	public ModelAndView boardreportprocess(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		List<BoardDataBean> boardDtoList = boardDao.getAllboardarticles();
		req.setAttribute("boardDtoList", boardDtoList);
		return new ModelAndView("views/admin/boardmanage");
	}
	
	@RequestMapping("/deleteArticlebyadmin")
	public void deletarticlereportprocess(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		int id = Integer.parseInt(req.getParameter("id"));
		int study_id = Integer.parseInt(req.getParameter("sid"));
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("id", id);
		map.put("study_id", study_id);
		boardDao.deleteArticle(map);
		resp.sendRedirect("boardreport.do");
	}
	
	@RequestMapping("/studymanage")
	public ModelAndView studymanageprocess(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		List<StudyDataBean> studyDtoList = searchDao.getStudies();
		req.setAttribute("studyDtoList", studyDtoList);
		

		return new ModelAndView("views/admin/studymanage");
	}
	
	@RequestMapping("/deleteStudybyadmin")
	public ModelAndView deleteStudyprocess(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		int sid = Integer.parseInt(req.getParameter("sid"));
		System.out.println(sid);
		searchDao.deleteStudy(sid);
		resp.sendRedirect("studymanage.do");
		
		return new ModelAndView("views/admin/userReport");
	}
	
	@RequestMapping("/studyReport")
	public ModelAndView ReportedStudiesprocess(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		List<StudyReportDataBean> studyRDtoList = searchDao.getReportedStudies();
		//List<StudyDataBean> studyDtoList = searchDao.getUser_id();
		req.setAttribute("studyRDtoList", studyRDtoList);
		return new ModelAndView("views/admin/studyReport");
	}
	
	@RequestMapping("/boardReport")
	public ModelAndView ReportedArticlesprocess(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		List<ArticleReportDataBean> ADtoList = searchDao.getReportedArticles();
		req.setAttribute("ADtoList", ADtoList);
		return new ModelAndView("views/admin/boardReport");
	}
	
	@RequestMapping("/userReport")
	public ModelAndView ReportedUsersprocess(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		List<UserReportDataBean> UDtoList = searchDao.getReportedUsers();
		req.setAttribute("UDtoList", UDtoList);
		return new ModelAndView("views/admin/userReport");
	}
	
}
