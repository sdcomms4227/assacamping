<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>
<footer class="footer">
	<div class="container">
		<div class="row">
			<div class="col text-center">
				<div class="footer_logo"><a href="${contextPath}"><img src="${contextPath}/images/footer_logo.jpg" alt="ASSA Camping" /></a></div>
				<nav class="footer_nav mt-5">
					<ul>
						<li><a href="${contextPath}/productServlet/listProduct.do">캠핑상품</a></li>
						<li><a href="${contextPath}/campingServlet/listCamping.do">캠핑정보</a></li>
						<li><a href="${contextPath}/eventServlet/listEvent.do"">이벤트</a></li>
						<li><a href="${contextPath}/contactServlet/contact.do">고객센터</a></li>
					</ul>
				</nav>
				<div class="footer_social">
					<ul>
						<li><a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
						<li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
						<li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
						<li><a href="#"><i class="fa fa-reddit-alien" aria-hidden="true"></i></a></li>
						<li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
					</ul>
				</div>
				<div class="copyright">
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				</div>
				<div class="footer_qrcode my-5">
					<a href='http://m.site.naver.com/0CmUE'><img src='https://qrcodethumb-phinf.pstatic.net/20200715_244/1594813324572w3oMd_PNG/0CmUE.png'/></a>
				</div>
			</div>
		</div>
	</div>
</footer>