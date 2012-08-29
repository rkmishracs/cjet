<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s"  uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <title>CMC | Master Home</title>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/resources/css/redmond/jquery-ui-1.8.23.custom.css" />

        <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" type="text/css" />
        

        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/drop.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery.tipsy.js"></script>
        <script
        type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery-ui-1.8.22.custom.min.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/app.js"></script>

    </head>


    <body>
        <div id="changePasswordResponse">
                <span class="changePasswordSpan"><s:message code="lbl.passwordChangedSuccessfully"/></span>
            </div>
        <input type="hidden" id="adminChangePasswordHidden" value="${pageContext.request.contextPath}"/>
        <div id="changePasswordAdminDiv" class="signDiv">

            <p class="validateTips"><s:message code="lbl.signin.allFieldsAreRequire"/></p>

            <sf:form method="post" action="${pageContext.request.contextPath}/changePassword" modelAttribute="changePasswordForm" id="changePasswordForm">

                <div class="signDiv">

                </div>

                <div class="signDiv">
                    <label for="tags"><s:message code="lbl.txt.changePassword.userName"/></label>
                    <sf:input type="text" path="userName" name="userName" value="${user.enrollmentNumber}" size="30" />
                </div>    
                <div class="signDiv">
                    <label for="tags"><s:message code="lbl.txt.changePassword.currentPassword"/></label>
                    <sf:input type="password" path="currentPassword" name="currentPassword" id="currentPassword" size="30"/>
                </div>    
                <div class="signDiv">
                    <label for="tags"><s:message code="lbl.txt.changePassword.newPassword"/></label>
                    <sf:input type="password" path="newPassword" name="newPassword" id="newPassword" size="30"/>
                </div>
                <div class="signDiv">
                    <label for="tags"><s:message code="lbl.txt.changePassword.confirmPassword"/></label>
                    <sf:input type="password" path="confirmPassword" name="confirmPassword" id="confirmPassword" size="30"/>
                </div>
                <div id="ajax_loading">
                    <img align="absmiddle" src="resources/images/spinner.gif">&nbsp;<s:message code="lbl.txt.Processing"/>
                </div>

            </sf:form>


        </div>

        <div class="clear"></div>
        <div id="body" style="background-color: white;">

            <div class="logo" style="position: relative;top: 5px; left: 15px;">
                <a href="${pageContext.request.contextPath}/master"><img src="${pageContext.request.contextPath}/resources/images/CMC_LOGO.jpg" alt="" style="border-color:#312e25 ;zIndex:600" /></a>
            </div>

            <div class="menu_nav">
                <ul>
                    <li class="active"><a href="${pageContext.request.contextPath}/master">Home</a></li>
                    <li><a href="#">Support</a></li>
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Contact Us</a></li>
                    <li><a href="${pageContext.request.contextPath}/sign-in/out">Sign Out</a></li>
                </ul>
                <div class="clr"></div>
            </div>

            <div class="wrapper">
                <div id="body1" class="col"> 
                    <!--Begin Prediction Module-->
                    <div class="heading-review">
                        <form id="prdkt-compose-form" style="float:left; margin:10px 0 0 10px;">
                            <label class="title" style="width:371px;"><s:message code="lbl.dashboard"/></label>
                        </form>
                        <div class="name"></div>
                    </div>

                    <div class="profilePer" id="reportsInfo" >

                        <div id="reportsInfoHeading" id="profileHeading">Enrollment Details
                            
                        </div>
                        <table id="first">
                            <tr><td>Total Students Enrolled</td><td>:</td><td>${studentCount}</td></tr><tr><td >Students Enrolled In This Month</td><td>:</td><td>${StudentMonthlyCount}</td></tr>
                        </table>
                        <table id="second" >

                            <tr><td>Students Enrolled In This Week</td><td>:</td><td >${studentWeeklyCount}</td></tr><tr><td>Students Enrolled Today</td><td>:</td><td>${studentDayCount}</td></tr>
                        </table>
                    </div>
                    <!--End Prediction Module--> 
                </div>
                <div id="body2" class="col">

                    <div id="right-cont-area">

                        <!-- Some Dash Board-->  

                    </div>

                    <div class="right-nav">
                        <ul>
                            <li class="current"><a href="${pageContext.request.contextPath}/master/showEnrollment"><s:message code="lbl.enrollment.link.enrollment"/></a></li>
                            <li><a href="${pageContext.request.contextPath}/reports/all"><s:message code="lbl.enrollment.link.studentView"/></a></li>
                            <li><a href="${pageContext.request.contextPath}/reports/monthlyReport"><s:message code="lbl.enrollment.link.monthlyReport"/></a></li>
                            <li><a href="${pageContext.request.contextPath}/reports/weeklyReport"><s:message code="lbl.enrollment.link.weeklyReport"/></a></li>
                            <li><a href="${pageContext.request.contextPath}/reports/dailyReport"><s:message code="lbl.enrollment.link.dailyReport"/></a></li>
                            <li><a href="${pageContext.request.contextPath}/search"><s:message code="lbl.enrollment.link.find"/></a></li>
                            <li><a href="#" id="change-password-link"><s:message code="lbl.enrollment.link.changePassword"/></a></li>
                        </ul>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
        <div id="footer">
            <div class="wrapper">
                <div id="footer1" class="col"> <span class="linkgroup"><s:message code="lbl.footer.link.aboutUs"/></span>
                    <ul>
                        <li><a href="company.html"><s:message code="lbl.footer.link.aboutUs.ourCompany"/></a></li>
                        <li><a href="team.html"><s:message code="lbl.footer.link.aboutUs.ourTeam"/></a></li>
                        <li><a href="press.html"><s:message code="lbl.footer.link.aboutUs.pressCoverage"/></a></li>
                    </ul>
                </div>
                <div id="footer2" class="col"> <span class="linkgroup"><s:message code="lbl.footer.link.support"/></span>
                    <ul>
                        <li><a href="help.html"><s:message code="lbl.footer.link.support.helpCenter"/></a></li>
                        <li><a href="what-is-a-pridiktion.html"><s:message code="lbl.footer.link.support.whatIsaPrediction"/></a></li>
                        <li><a href="how-to-prodikt.html"><s:message code="lbl.footer.link.support.howto"/></a></li>
                    </ul>
                </div>
                <div id="footer2" class="col"> <span class="linkgroup"><s:message code="lbl.footer.link.followUs"/></span>
                    <ul>
                        <li><a href="pridikt-blog"><s:message code="lbl.footer.link.followUs.blog"/></a></li>
                        <li><a href="pridikt-on-twitter.html"><s:message code="lbl.footer.link.followUs.twitter"/></a></li>
                        <li><a href="pridikt-on-facebook.html"><s:message code="lbl.footer.link.followUs.facebook"/></a></li>
                    </ul>
                </div>
                <div id="footer2" class="col"> <span class="linkgroup"><s:message code="lbl.footer.link.legal"/></span>
                    <ul>
                        <li><a href="pridikt-rules.html"><s:message code="lbl.footer.link.legal.detailedRules"/></a></li>
                        <li><a href="terms.html"><s:message code="lbl.footer.link.legal.termsAndConditions"/></a></li>
                        <li><a href="privacy.html"><s:message code="lbl.footer.link.legal.privacyPolicy"/></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </body>
</html>