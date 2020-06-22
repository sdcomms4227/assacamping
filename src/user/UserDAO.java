package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserDAO {
	private DataSource dataFactory;
	private Connection conn;
	private PreparedStatement pstmt;
	
	public UserDAO() {
		try {
			Context ctx = new InitialContext();
			Context envconContext = (Context)ctx.lookup("java:/comp/env");
			dataFactory = (DataSource)envconContext.lookup("jdbc/assa");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	
}//UserDAO클래스 
