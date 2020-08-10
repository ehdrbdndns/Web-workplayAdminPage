<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="models.Footer" %>
<%@ page import="services.FooterService" %>
<%@ page import="models.FooterIntutition" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: zlzld
  Date: 2020-06-29
  Time: 오후 3:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Footer footer = new FooterService().getFooter();
    ArrayList<FooterIntutition> footerSeouls = new FooterService().getFooterSeoul();
    ArrayList<FooterIntutition> footerYoughts = new FooterService().getFooterYought();
    request.setAttribute("footer", footer);
    request.setAttribute("footerSeouls", footerSeouls);
    request.setAttribute("footerYoughts", footerYoughts);

%>
<!--TODO FOOTER-->
<footer class="footer mt-auto bg-main-black">
    <div class="container pl-0 pr-0 footer-container">
        <div class="footer-padding">
            <div class="row m-p-0">
                <div class="row col-12 col-md-7 zero-section sns-div m-auto m-p-0">
                    <a class="footer-sns-a col-12 col-md-6 m-p-0 text-left pb-md-0 pb-3 pl-md-0 pl-4"
                       href="${footer.blog_url}" target="_blank"><img
                            src="../../resources/images/blog.svg" alt="SNS">
                        <span class="sns-sm-line">${footer.blog_name}</span>
                    </a>
                    <a class="footer-sns-a col-12 col-md-6 m-p-0 text-left pb-md-0 pb-3 pl-md-0 pl-4"
                       href="${footer.youtube_url}" target="_blank"><img
                            src="../../resources/images/youtube_gray.svg" alt="SNS">
                        <span class="sns-sm-line">${footer.youtube_name}</span>
                    </a>
                </div>
                <div class="row col-12 col-md-5 m-p-0">
                    <div class="input-group col-md-6 col-12 pl-4 pr-4 pl-md-0 pr-md-2 pb-md-0 pb-3">
                        <label class="d-none" for="inputGroupSelect01"></label>
                        <select class="custom-select" id="inputGroupSelect01">
                            <option value="" selected="">서울시 유사 기관</option>
                            <c:forEach items="${footerSeouls}" var="option" varStatus="status">
                                <option value="${option.url}">${option.name}</option>
                            </c:forEach>
                            <%--<option value="http://seoulstartuphub.com">서울창업허브</option>
                            <option value="http://startup.ssu.ac.kr">서울창업카페 숭실대입구역점</option>
                            <option value="https://honghapvalley.org">서울창업카페 홍대점</option>
                            <option value="http://seoulstartupcafe.com">서울창업카페 신촌점</option>
                            <option value="http://kstartupcafe.com">서울창업카페 대학로점</option>
                            <option value="https://blog.naver.com/cubestup">서울창업카페 충무로점</option>
                            <option value="https://blog.naver.com/seoul_esc">서울창업카페 은평불광점</option>
                            <option value="https://ycstartup.co.kr">서울창업카페 양천신정점</option>
                            <option value="http://창업카페상봉.com">서울창업카페 상봉점</option>
                            <option value="https://blog.naver.com/dodostartup">서울창업카페 서초교대점</option>--%>
                        </select>
                    </div>
                    <div class="input-group col-md-6 col-12 pl-md-2 pr-md-0 pr-4 pl-4 pb-md-0 pb-3">
                        <label class="d-none" for="inputGroupSelect02"></label>
                        <select class="custom-select" id="inputGroupSelect02">
                            <option value="" selected="">강동구 유사 기관</option>
                            <c:forEach items="${footerYoughts}" var="option" varStatus="status">
                                <option value="${option.url}">${option.name}</option>
                            </c:forEach>
                            <%--<option selected="">강동구 유사 기관</option>
                            <option value="http://www.gangdong.go.kr">강동구청</option>
                            <option value="http://youthmaru.co.kr">청년마루</option>
                            <option value="http://www.gdse.org">강동구사회적경제지원센터</option>
                            <option value="http://www.gangdongmaeul.org">강동구마을공동체지원센터</option>
                            <option value="https://amsacrc.modoo.at">암사도시재생 상상나루來</option>
                            <option value="https://blog.naver.com/gangdong_orang">서울청년센터 강동오랑</option>--%>
                        </select>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-padding">
            <div class="row m-p-0">
                <div class="col-md-8 col-sm-6 col-xs-12 p-0 footer-information text-left pl-4 pl-md-0">
                    <p class="footer-address h6 small">${footer.location}</p>
                    <p class="footer-address h6 small">
                        <span class="footer-icon"><span class="pl-0 font-weight-bold">T. </span>${footer.phone}</span>
                        <span class="footer-icon"><span class="font-weight-bold">F. </span>${footer.FAX}</span>
                        <span class="footer-icon"><span
                                class="font-weight-bold">E. </span>${footer.email}</span></p>
                    <p class="footer-address copyright h6 small">Copyright@ 2020 Haenaem Center. All right reserved.</p>
                </div>
                <div class="footer-logo col-md-4 col-sm-6 col-xs-12 p-0 text-md-right text-center">
                    <a href="/main.do"><img src="../../resources/images/footer_logo.svg" alt="footer_logo"/></a>
                </div>
            </div>
        </div>
    </div>
</footer>
<!--TODO FOOTER END-->
