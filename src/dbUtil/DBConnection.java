package dbUtil;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBConnection {

	public static Connection getConnection() throws Exception {
		
		Context init = new InitialContext();
		
		// 커넥션풀 얻기
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/assa");
			
		// 커넥션풀에 존재하는 커넥션 얻기
		Connection conn = ds.getConnection();
		
		// 커넥션 반환하기
		return conn;
	}

}