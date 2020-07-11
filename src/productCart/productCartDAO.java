package productCart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dbUtil.DBConnection;
import productList.productListVO;

public class productCartDAO {
	PreparedStatement pstmt;
	ResultSet rs;
	Connection con;
	String sql;
	DBConnection db;
  
   public void freeResource() {
		try {
			if(con !=null) { con.close();}
			if(pstmt !=null) { pstmt.close();}
			if(rs !=null) { rs.close();}
			
		} catch (Exception e) {
			System.out.println("freeResource에서오류"+e.getMessage());
		}
	}//freeResource();
   
  
	public List<productCartVO> allcartList(String userId){//장바구니목록조회
		  System.out.println(userId+"DAO");
		 List<productCartVO> list=new ArrayList();
		
		try {
			 con=db.getConnection();
			
			 sql="select * from productcart where userId=? order by productCartDate desc";
			
			 pstmt=con.prepareStatement(sql);
			 
			 pstmt.setString(1, userId);
			 
			 rs=pstmt.executeQuery();
			 
			 while(rs.next()) {
			 productCartVO vo= new productCartVO(
											     rs.getInt("productNo"),
												 rs.getInt("productPrice"),
												 rs.getInt("cartQuantity"),
												 rs.getInt("productDelivery"),
												 rs.getInt("productTotalPrice"), 
												 rs.getString("productName"), 
												 rs.getString("productImage"),
												 rs.getString("productCategory")
												      );
					
				                    list.add(vo);
			 }
		} catch (Exception e) {
		System.out.println("allCartList에서오류"+e.getMessage());
		
		
		}finally {
			freeResource();
		}
		return list;
	}//allCartList
	
	public void addCartList(productCartVO vo) {//장바구니추가하기
		try {
			con=db.getConnection();
			
			sql="insert into productcart(productNo, productPrice, cartQuantity, productDelivery, productName, productImage, productCategory ,userId, productCartDate,productTotalPrice)"
				+ " values(?,?,?,?,?,?,?,?,now(),?)";
			
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, vo.getProductNo());
			pstmt.setInt(2,vo.getProductPrice());
			pstmt.setInt(3, vo.getCartQuantity());
			pstmt.setInt(4, vo.getProductDelivery());
			pstmt.setString(5, vo.getProductName());
			pstmt.setString(6, vo.getProductImage());
			pstmt.setString(7, vo.getProductCategory());
			pstmt.setString(8, vo.getUserId());
			pstmt.setInt(9, vo.getProductTotalPrice());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("addCartList에서오류"+e.getMessage());
		}finally {
			freeResource();
		}
		
	}//addCartList
	
	public void cartUpdate(productCartVO vo) {//수량수정
		try {
			con=db.getConnection();
			
			sql="update productcart set cartQuantity=? ,productTotalPrice=? where userId=? and productName=?  ";
			
			pstmt=con.prepareStatement(sql);
			
			
			
			
			pstmt.setInt(1,vo.getCartQuantity());
			pstmt.setInt(2, vo.getProductTotalPrice());
			pstmt.setString(3, vo.getUserId());
			pstmt.setString(4, vo.getProductName());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("cartUpdate에서오류"+e.getMessage());
		}finally {
			freeResource();
		}
	}//cartUpdate
	
	public List<Integer> selectRemoveCart(String userId){//삭제할 장바구니의 이미지 파일 번호 얻어오기
		List<Integer> productNoList = new ArrayList<Integer>();

		try {
			con=db.getConnection();
			
			sql="select productNo from productcart where userId=?";
			
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				
				productNoList.add(rs.getInt("productNo"));
			}
		} catch (Exception e) {
			System.out.println("selectRemoveCart에서오류"+e.getMessage());
		}finally {
			freeResource();
		}
		return productNoList;
	}
	
	public void allDeleteCart(String userId) {//전체장바구니삭제
		try {
			con=db.getConnection();
			
			sql="delete from productcart where userId=?";
			
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			pstmt.executeUpdate();
			
					
	} catch (Exception e) {
		System.out.println("allDeleteCart에서오류"+e.getMessage());
	}finally {
		freeResource();
	}

	}//allDeleteCart
	
	public void deleteCart(String userId,int productNo ) {//하나의 상품장바구니 삭제
		
		try {
			con=db.getConnection();
			
			sql="delete from productcart where productNo=? and userId=?";
			
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, productNo);
			pstmt.setString(2, userId);
			
			pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			freeResource();
		}
   }//deleteCart

	public Map<String,Integer> TotalPrice(String userId) {//결제 할 금액
		Map<String,Integer> map=new HashMap<String, Integer>();
		int totalPrice=0;
		int totalDelivery=0;
		try {
			con=db.getConnection();
			
			sql="select sum(productTotalPrice) ,sum(productDelivery) from productcart where userId=?";
			
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				totalPrice=rs.getInt(1);
				totalDelivery=rs.getInt(2);
				
				 if(totalDelivery>2500) { totalDelivery=2500; }
				
				
				map.put("totalPrice", totalPrice);
				map.put("totalDelivery", totalDelivery);
				System.out.println(totalDelivery);
			}
			
		} catch (Exception e) {
			System.out.println("TotalPrice에서 오류"+e.getMessage());
		}
		
		return map;
	}
	
	public Integer cartTotalCount(String userId) {
		   int totalcount=0;
		try {
               con=db.getConnection();
			
			   sql="select count(*) from productcart where userId=?";
			    
			   pstmt=con.prepareStatement(sql);
			   
			   pstmt.setString(1, userId);
			   rs=pstmt.executeQuery();
			   if(rs.next()) {
				   
				   totalcount= rs.getInt(1);
				   
			   }
			
		} catch (Exception e) {
			
			System.out.println("cartTotalCount에서 오류"+e.getMessage());
			
		}finally {
			freeResource();
		}
		
		
		
		return totalcount;
	}
	
	
	
}