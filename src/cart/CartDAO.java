package cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CartDAO {
	PreparedStatement pstmt;
	ResultSet rs;
	Connection conn;
	String sql;
  
   public void freeResource() {
		try {
			if(conn !=null) { conn.close();}
			if(pstmt !=null) { pstmt.close();}
			if(rs !=null) { rs.close();}
			
		} catch (Exception e) {
			System.out.println("freeResource에서오류"+e.getMessage());
		}
	}//freeResource();
   
  
	public List<CartVO> allcartList(String userId){//장바구니목록조회
//		  System.out.println(userId+"DAO");
		 List<CartVO> list=new ArrayList();
		
		try {
			 conn=dbUtil.DBConnection.getConnection();
			
			 sql="select * from cart where userId=? order by productCartDate desc";
			
			 pstmt=conn.prepareStatement(sql);
			 
			 pstmt.setString(1, userId);
			 
			 rs=pstmt.executeQuery();
			 
			 while(rs.next()) {
			 CartVO vo= new CartVO(
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
	
	public void addCartList(CartVO vo) {//장바구니추가하기
		try {
			conn=dbUtil.DBConnection.getConnection();
			
			sql="insert into cart(productNo, productPrice, cartQuantity, productDelivery, productName, productImage, productCategory ,userId, productCartDate,productTotalPrice)"
				+ " values(?,?,?,?,?,?,?,?,now(),?)";
			
			pstmt=conn.prepareStatement(sql);
			
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
	
	public void cartUpdate(CartVO vo) {//수량수정
		try {
			conn=dbUtil.DBConnection.getConnection();
			
			sql="update cart set cartQuantity=? ,productTotalPrice=? where userId=? and productName=?  ";
			
			pstmt=conn.prepareStatement(sql);
			
			
			
			
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
			conn=dbUtil.DBConnection.getConnection();
			
			sql="select productNo from cart where userId=?";
			
			pstmt=conn.prepareStatement(sql);
			
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
			conn=dbUtil.DBConnection.getConnection();
			
			sql="delete from cart where userId=?";
			
			pstmt=conn.prepareStatement(sql);
			
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
			conn=dbUtil.DBConnection.getConnection();
			
			sql="delete from cart where productNo=? and userId=?";
			
			pstmt=conn.prepareStatement(sql);
			
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
			conn=dbUtil.DBConnection.getConnection();
			
			sql="select sum(productTotalPrice) ,sum(productDelivery) from cart where userId=?";
			
			pstmt=conn.prepareStatement(sql);
			
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
		}finally {
			freeResource();
		}
		
		return map;
	}
	
	public int cartTotalCount(String userId) {
		int totalcount=0;
		
		try {
               conn=dbUtil.DBConnection.getConnection();
			
			   sql="select count(*) from cart where userId=?";
			    
			   pstmt=conn.prepareStatement(sql);
			   
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