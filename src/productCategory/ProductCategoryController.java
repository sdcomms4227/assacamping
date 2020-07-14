package productCategory;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/productCategoryServlet/*")
public class ProductCategoryController extends HttpServlet {

	ProductCategoryService productCategoryService;
	ProductCategoryVO productCategoryVO;

	@Override
	public void init() throws ServletException {
		productCategoryService = new ProductCategoryService();
		productCategoryVO = new ProductCategoryVO();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String nextPage = "";

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");

		String action = request.getPathInfo();
		System.out.println("action: " + action);

		List<ProductCategoryVO> productCategoryList = null;

		if (action == null || action.contentEquals("/listProductCategory.do")) {

			productCategoryList = productCategoryService.listProductCategory();
			request.setAttribute("productCategoryList", productCategoryList);
			nextPage = "/productAdmin/listProductCategory.jsp";

		} else if (action.contentEquals("/addProductCategory.do")) {

			String productCategoryName = request.getParameter("productCategoryName");
			productCategoryVO.setProductCategoryName(productCategoryName);
			int result = productCategoryService.addProductCategory(productCategoryVO);

			String msg = "";
			if (result > 0) {
				msg = "새 카테고리를 추가하였습니다.";
			} else {
				msg = "오류가 발생했습니다.";
			}

			PrintWriter out = response.getWriter();
			out.write("<script>");
			out.write("alert('" + msg + "');");
			out.write("location.href='" + request.getContextPath() + "/productCategoryServlet/listProductCategory.do';");
			out.write("</script>");
			return;

		} else if (action.contentEquals("/updateProductCategory.do")) {

			int productCategoryNo = Integer.parseInt(request.getParameter("productCategoryNo"));
			String productCategoryName = request.getParameter("productCategoryName");
			productCategoryVO.setProductCategoryNo(productCategoryNo);
			productCategoryVO.setProductCategoryName(productCategoryName);
			int result = productCategoryService.updateProductCategory(productCategoryVO);

			String msg = "";
			if (result > 0) {
				msg = "카테고리 정보가 수정되었습니다.";
			} else {
				msg = "오류가 발생했습니다.";
			}

			PrintWriter out = response.getWriter();
			out.write("<script>");
			out.write("alert('" + msg + "');");
			out.write("location.href='" + request.getContextPath() + "/productCategoryServlet/listProductCategory.do';");
			out.write("</script>");

			return;

		} else if (action.contentEquals("/deleteProductCategory.do")) {

			int productCategoryNo = Integer.parseInt(request.getParameter("productCategoryNo"));
			int result = productCategoryService.deleteProductCategory(productCategoryNo);

			String msg = "";
			if (result > 0) {
				msg = "카테고리를 삭제하였습니다.";
			} else {
				msg = "오류가 발생했습니다.";
			}

			PrintWriter out = response.getWriter();
			out.write("<script>");
			out.write("alert('" + msg + "');");
			out.write("location.href='" + request.getContextPath() + "/productCategoryServlet/listProductCategory.do';");
			out.write("</script>");

			return;

		}

		if (!nextPage.equals("")) {
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
		}

	}

}
