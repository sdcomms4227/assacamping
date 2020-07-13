package faqAdmin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class FaqAdminDAO {
	
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

	public List<FaqVO> getFaqList(Map<String, Object> searchMap) {

		List<FaqVO> faqList = new ArrayList<FaqVO>();

		int numberPerPage = 10;
		int pageNo = (int)searchMap.get("pageNo");
		int offset = (pageNo - 1)*10;
		String searchKeyword = (String)searchMap.get("searchKeyword");
		String sql = "";
		
		try {
			
			conn = dbUtil.DBConnection.getConnection();
			
			sql = "	select *"
					+ " from faq"
					+ " where faqTitle like ?"
					+ " order by faqNo desc"
					+ "	limit ?, ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, '%' + searchKeyword + '%');
			pstmt.setInt(2, offset);
			pstmt.setInt(3, numberPerPage);
			
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


	public int getFaqListCount(Map<String, Object> searchMap) {

		String searchKeyword = (String)searchMap.get("searchKeyword");
		String sql = "";
		
		try {
			conn = dbUtil.DBConnection.getConnection();			

			sql = "select count(faqNo) from faq"
					+ " where faqTitle like ?";
					
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, '%' + searchKeyword + '%');
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch(Exception e) {
			System.out.println("getFaqListCount()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
		
		return 0;		
	}
	
	public FaqVO getFaq(int faqNo) {
		
		FaqVO faqVO = new FaqVO();
		
		try {
			conn = dbUtil.DBConnection.getConnection();
			String sql = "select * from faq where faqNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, faqNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				faqVO.setFaqContent(rs.getString("faqContent"));
				faqVO.setFaqNo(rs.getInt("faqNo"));
				faqVO.setFaqTitle(rs.getString("faqTitle"));
				faqVO.setFaqWriteDate(rs.getTimestamp("faqWriteDate"));
			}			
			
		} catch(Exception e) {
			System.out.println("getFaq()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
		
		return faqVO;
	}

	public int getFaqLastNo() {
		
		int lastNo = 0;

		try {
			conn = dbUtil.DBConnection.getConnection();			
			String sql = "select max(faqNo) from faq";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				lastNo = rs.getInt(1);
			}else {
				lastNo = 0;
			}
			
		} catch(Exception e) {
			System.out.println("getFaqLastNo()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}

		return lastNo;
	}
	
	public int insertFaq(FaqVO faqVO) {
				
		try {			
			conn = dbUtil.DBConnection.getConnection();			
			String sql = "insert into faq(faqTitle, faqContent, faqWriteDate)"
					+ "values(?,?,now())";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, faqVO.getFaqTitle());
			pstmt.setString(2, faqVO.getFaqContent());
			
			return pstmt.executeUpdate();			
		} catch(Exception e) {
			System.out.println("insertFaq()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
		
		return 0;
	}

	public int updateFaq(FaqVO faqVO) {
						
		try {
			conn = dbUtil.DBConnection.getConnection();
			
			String sql = "update faq set faqTitle=?, faqContent=? where faqNo=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, faqVO.getFaqTitle());
			pstmt.setString(2, faqVO.getFaqContent());
			pstmt.setInt(3, faqVO.getFaqNo());
			
			return pstmt.executeUpdate();			
		} catch(Exception e) {
			System.out.println("updateFaq()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
		
		return 0;
	}

	public int deleteFaq(int faqNo) {
		
		try {
			conn = dbUtil.DBConnection.getConnection();
			String sql = "delete from faq where faqNo=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, faqNo);
			
			return pstmt.executeUpdate();			
		} catch(Exception e) {
			System.out.println("deleteFaq()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}		
		
		return 0;
	}
	
}