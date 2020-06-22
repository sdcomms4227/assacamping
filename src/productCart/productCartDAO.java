package productCart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import productList.productListVO;

public class productCartDAO {
	PreparedStatement pstmt;
	ResultSet rs;
	Connection con;
	String sql;
	
   public Connection getConnection ()  throws Exception{
		
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/assa");
		Connection con=ds.getConnection();
		
		return con;
	 }//getConnection
   public void freeResource() {
		try {
			if(con !=null) { con.close();}
			if(pstmt !=null) { pstmt.close();}
			if(rs !=null) { rs.close();}
			
		} catch (Exception e) {
			System.out.println("freeResource에서오류"+e.getMessage());
		}
	}//freeResource();
   
   
	public List<productCartVO> AllCartList(String userId){//장바구니목록조회
		List<productCartVO> list=null;
		
		try {
			 con=getConnection();
			
			 sql="select * from productCart where userId=? order by productCartDate desc";
			
			 pstmt=con.prepareStatement(sql);
			 
			 pstmt.setString(1, userId);
			 
			 rs=pstmt.executeQuery();
			 while(rs.next()) {
				productCartVO vo=new productCartVO(
						rs.getInt("productNO"),
						rs.getInt("productPrice"),
						rs.getInt("cartQuantity"),
						rs.getInt("productDelivery"),
						rs.getString("productName"), 
						rs.getString("productImage"),
						rs.getString("productCategory"),
						userId);
				list.add(vo);
			 }
		} catch (Exception e) {
		System.out.println("AllCartList에서오류"+e.getMessage());
		}finally {
			freeResource();
		}
		return list;
	}//AllCartList
	
	public void addCartList(productCartVO vo) {//장바구니추가하기
		try {
			con=getConnection();
			
			sql="insert into productCart(productNO,productPrice,cartQuantity,productDelivery,productName,productImage,productCategory,userId,productCartDate)"
				+ " values(?,?,?,?,?,?,?,?,now())";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, vo.getProductNO());
			pstmt.setInt(2,vo.getProductPrice());
			pstmt.setInt(3, vo.getCartQuantity());
			pstmt.setInt(4, vo.getProductDelivery());
			pstmt.setString(5, vo.getProductName());
			pstmt.setString(6, vo.getProductImage());
			pstmt.setString(7, vo.getProductCategory());
			pstmt.setString(8, vo.getUserId());
			
		} catch (Exception e) {
			System.out.println("addCartList에서오류"+e.getMessage());
		}finally {
			freeResource();
		}
		
	}//addCartList

}
