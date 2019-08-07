package commons;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapClient {
	private static SqlSession session;
	static {
		try {
			Reader rd = Resources.getResourceAsReader("commons/sqlMapConfig.xml");
			SqlSessionFactory fac = new SqlSessionFactoryBuilder().build(rd);
			session = fac.openSession(true);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public static SqlSession getSession() {
		return session;
	}
}
