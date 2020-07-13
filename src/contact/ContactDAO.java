package contact;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import faqAdmin.FaqVO;

public class ContactDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public void freeResource() {
		try {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}

	public List<FaqVO> getFaqList() {

		List<FaqVO> faqList = new ArrayList<FaqVO>();

		String sql = "";
		
		try {
			
			conn = dbUtil.DBConnection.getConnection();			
			sql = "	select * from faq order by faqNo desc";			
			pstmt = conn.prepareStatement(sql);			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				FaqVO faqVO = new FaqVO();
				
				faqVO.setFaqContent(rs.getString("faqContent"));
				faqVO.setFaqNo(rs.getInt("faqNo"));
				faqVO.setFaqTitle(rs.getString("faqTitle"));
				faqVO.setFaqWriteDate(rs.getTimestamp("faqWriteDate"));				
								
				faqList.add(faqVO);
			}			
			
		} catch(Exception e) {
			System.out.println("getFaqList()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
		
		return faqList;		
	}
	
}