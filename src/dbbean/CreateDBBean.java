package dbbean;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;


@Configuration
public class CreateDBBean {

	// Board 빈 생성 
	@Bean
	public BoardDao boardDao() {
		BoardDao boardDao = new BoardDBBean();
		return boardDao;	
	}
	
	// User 빈 생성 
	@Bean
	public UserDao userDao() {
		UserDao userDao = new UserDBBean();
		return userDao;	
	}
	
	// Search 빈 생성 
	@Bean
	public SearchDao SearchDao() {
		SearchDao SearchDao = new SearchDBBean();
		return SearchDao;	
	}
	
	// Host 빈 생성
	@Bean
	public HostDao hostDao() {
		HostDao hostDao = new HostDBBean();
		return hostDao;
	}
	
	// Show 빈 생성
	@Bean
	public ShowDao showDao() {
		ShowDao showDao = new ShowDBBean();
		return showDao;
	}
	// Process 빈 생성
	@Bean
	public ProcessDao processDao() {
		ProcessDao processDao = new ProcessDBBean();
		return processDao;
	}
}
