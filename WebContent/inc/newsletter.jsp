<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>
<div class="newsletter">
	<div class="newsletter_content">
		<div class="newsletter_image" style="background-image:url(${contextPath}/images/newsletter.jpg)"></div>
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="section_title_container text-center">
						<div class="section_subtitle">only the best</div>
						<div class="section_title">subscribe for a 20% discount</div>
					</div>
				</div>
			</div>
			<div class="row newsletter_container">
				<div class="col-lg-10 offset-lg-1">
					<div class="newsletter_form_container">
						<form action="#">
							<input type="email" class="newsletter_input" required="required" placeholder="E-mail here">
							<button type="submit" class="newsletter_button">subscribe</button>
						</form>
					</div>
					<div class="newsletter_text">Integer ut imperdiet erat. Quisque ultricies lectus tellus, eu tristique magna pharetra nec. Fusce vel lorem libero. Integer ex mi, facilisis sed nisi ut, vestib ulum ultrices nulla. Aliquam egestas tempor leo.</div>
				</div>
			</div>
		</div>
	</div>
</div>