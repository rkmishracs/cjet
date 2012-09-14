<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s"  uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <title>CMC | Admin</title>

        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/resources/css/redmond/jquery-ui-1.8.23.custom.css" />
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico"/>
        <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" type="text/css" />


        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/drop.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery.tipsy.js"></script>
        <script
        type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery-ui-1.8.22.custom.min.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/app.js"></script>


    </head>
    <body>
        <div>
            <div class="logo" style="position: relative;top: 5px; left: 15px;">
                <a href="${pageContext.request.contextPath}/master"><img src="${pageContext.request.contextPath}/resources/images/CMC_LOGO.jpg" alt="" style="border-color:#312e25 ;zIndex:600" /></a>
            </div>
            <div class="menu_nav">
                <ul>
                    <li class="active"><a href="${pageContext.request.contextPath}/master">Home</a></li>
                    <li><a href="${pageContext.request.contextPath}/sign-in/out">Sign Out</a></li>
                </ul>
                <div class="clr"></div>
            </div>

            <input type="hidden" id="searchDataHidden" value="${pageContext.request.contextPath}" />
            <div id="body">
                <div class="wrapper">
                    <div id="body1" class="col"> 
                        <!--Begin Prediction Module-->
                        <div class="heading-review">
                            <form id="prdkt-compose-form" style="float:left; margin:10px 0 0 10px;">
                                <label class="title" style="width:371px;">Search View</label>
                                <!--div id="view-pub-pro"><a href="#"><s:message code="lbl.setEmailMessagesPreferences"/></a></div-->
                            </form>
                            <div class="name"></div>
                        </div>
                        <!-- Tabs -->
                        <div class="signDiv">
                            &nbsp;
                        </div>

                        <div id="tabs">
                            <ul>
                                <li><a href="#tabs-1">By EnrollmentNumber</a></li>
                            </ul>
                            <div id="tabs-1">

                                <div class="st-blocked2">
                                    <sf:form id="searchByEnrollmentNumberDiv" modelAttribute="findByEnrollmentNumberForm" action="" method="post">
                                        <label>Enter Enrollment Number</label><sf:input path="enrollmentId"/><a id="testEnrl" class="button-h" href="#" style="position: relative ;left: 20px;top: -3px;">
                                            <span>search</span>
                                        </a><div id="ajax_loading" style="position: absolute;top: 75px;left: 450px; width: 200px;display: none; ">
                                            <img align="absmiddle" src="${pageContext.request.contextPath}/resources/images/spinner.gif" />&nbsp;Processing...
                                        </div>
                                    </sf:form>
                                </div>

                                <div class="st-blocked2" id="SearchNumberErrorDiv" >
                                    <span>No Record matched with Enrollment Number.</span>
                                </div>
                                </br>

                                <div id="studentResponse" class="ui-tabs-panel ui-widget-content ui-corner-bottom" style="position: relative;width: 500px;left:20px;;background: snow ;border-radius: 8px 8px 8px 8px;border: 1px solid #DFD9C3;">
                                    </br>
                                    <h2 align="middle"><u>Student Details</u></h2>

                                    <table>
                                        <tr>
                                            <td>
                                                <table style="position: relative;left:20px;width: 350px;border: 20px #898989;">
                                                    <tr><td ><label>Enrollment Number</label></td><td><label>:</label></td><td><label id="enrollmentNumber">111</label></td></tr>                                                                                                          
                                                    <tr><td><label>Name</label></td><td><label>:</label></td><td><label id="name">111</label></td></tr>             
                                                    <tr><td><label>Gender</label></td><td><label>:</label></td><td><label id="gender">111</label></td></tr>
                                                    <tr><td><label>Date Of Birth</label></td><td><label>:</label></td><td><label id="dob"></label></td></tr>
                                                    <tr><td><label>Enrolled on</label></td><td><label>:</label></td><td><label id="enrolledOn">111</label></td></tr>
                                                    <tr><td><label>Email</label></td><td><label>:</label></td><td><label id="email">111</label></td></tr>
                                                    <tr><td><label>Phone</label></td><td><label>:</label></td><td><label id="phone">111</label></td></tr>
                                                    <tr><td><label>Mobile</label></td><td><label>:</label></td><td><label id="mobile">:&nbsp;&nbsp;111</label></td></tr>
                                                    <tr><td><label>Address</label></td><td><label>:</label></td><td><label id="address">111</label></td></tr>
                                                </table>
                                            </td>
                                            <td>
                                                <div  class="prdktr" style="position: relative; height: 60px;top:-30px;width:60px;left:30px;" id="imgDiv" >

                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                    </br>
                                    </br>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="body2" class="col">
                        <div id="right-cont-area">
                            <!-- Some Dash Board-->  
                        </div>
                        <div class="right-nav">
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/master/showEnrollment"><s:message code="lbl.enrollment.link.enrollment"/></a></li>
                                <li><a href="${pageContext.request.contextPath}/reports/all"><s:message code="lbl.enrollment.link.studentView"/></a></li>
                                <li><a href="${pageContext.request.contextPath}/reports/monthlyReport"><s:message code="lbl.enrollment.link.monthlyReport"/></a></li>
                                <li><a href="${pageContext.request.contextPath}/reports/weeklyReport"><s:message code="lbl.enrollment.link.weeklyReport"/></a></li>
                                <li><a href="${pageContext.request.contextPath}/reports/dailyReport"><s:message code="lbl.enrollment.link.dailyReport"/></a></li>
                                <li class="current"><a href="${pageContext.request.contextPath}/search"><s:message code="lbl.enrollment.link.find"/></a></li>
                                <li><a href="${pageContext.request.contextPath}/reports/viewAllProfiles">View All Profiles</a></li>
                                <li><a href="${pageContext.request.contextPath}/event">Events</a></li>
                                <li><a href="${pageContext.request.contextPath}/successStories">Success Stories</a></li>

                            </ul>
                        </div>
                    </div><!-- Body2 Div Ends Here -->
                    <div class="clear"></div>
                </div>
            </div>

            <div id="footer">
                <div class="wrapper">
                    <div id="footer1" class="col"> <span class="linkgroup">About Us</span>
                        <ul>
                            <li><a href="http://www.cmcltd.com/">Our Company</a></li>
                            <li><a href="team.html">Our Team</a></li>
                        </ul>
                    </div>
                    <div id="footer2" class="col"> <span class="linkgroup">Support</span>
                        <ul>
                            <li><a href="help.html">Help Center</a></li>
                        </ul>
                    </div>
                    <div id="footer3" class="col"> <span class="linkgroup">Follow Us</span>
                        <ul>
                            <li><a href="pridikt-on-twitter.html">Twitter</a></li>
                            <li><a href="pridikt-on-facebook.html">Facebook</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
