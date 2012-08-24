<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s"  uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <title>CMC | Student Monthly Report</title>

        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/resources/css/redmond/jquery-ui-1.8.23.custom.css" />

        <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" type="text/css" />

        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/drop.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/popup-tips.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery.tipsy.js"></script>

        <script
        type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery-ui-1.8.22.custom.min.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/app.js"></script>

        <!--  Two Style Tags Here  -->
        <!-- Style For Image -->
        <style>
            #penguin{
                position:absolute;
                top:0px;
                top:10px;
                left:180px;
            }

            #tabs{
                position: relative;
                top: 0px;
                width: 595px;
            }


        </style>  
        <!-- Styles For Table with id studentDetail -->
        

    </head>
    <body>
        <input type="hidden" id="searchDataHidden" value="${pageContext.request.contextPath}" />
        
        <div id="header">
            <div class="wrapper">
                <div id="logo" class="grid_4 "><a href="index.html" tabindex="1"><img src="" width="112" height="34" alt="" /></a></div>
                <div id="search">

                </div>

                <div id="nav"> <a href="${pageContext.request.contextPath}/master" class="home" tabindex="3"><s:message code="lbl.link.signin.welcome"/><c:out value="${user.firstName}"/></a> <a href="${pageContext.request.contextPath}/sign-in/out" class="home" style="width:100px;"><s:message code="lbl.link.signin.signOut"/></a>
                    <div class="profilewrapper">

                        <div id="profilemenu" style="visibility: hidden">
                            <div class="profilemenuwrapper">
                                <div class="profile" onclick="MM_showHideLayers('profilemenu','','hide')"><img class="profilethumb" src="resources/images/design/user-thumb20.jpg" width="20" height="20" alt="Geoff Rego" title="Geoff Rego" /><span><s:message code="lbl.link.signin.geoffRego"/></span></div>
                                <a href="profile.htm"><s:message code="lbl.link.signin.publicProfile"/></a> <a href="profile-edit.htm"><s:message code="lbl.link.signin.editProfile"/></a> <a href="sign-out.htm"><s:message code="lbl.link.signin.signOut"/></a> </div>
                        </div>
                        <!-- Profile Menu ends here --> 

                    </div>
                </div>
            </div>
        </div>

        <div class="clear"></div>
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
                            <li><a href="#tabs-2">By EnrollmentName</a></li>
                            <li><a href="#tabs-3">By Phone</a></li>
                        </ul>
                        <div id="tabs-1">

                            <div class="st-blocked2">
                                <sf:form id="searchByEnrollmentNumberDiv" modelAttribute="findByEnrollmentNumberForm" action="" method="post">
                                    <label>Enter Enrollment Number</label><sf:input path="enrollmentId"/><a id="testEnrl" class="button-h" href="#" style="position: relative ;left: 20px;">
                                        <span>search</span>
                                    </a><div id="ajax_loading" style="position: absolute;left: 450px; width: 200px;display: none ">
                                        <img align="absmiddle" src="${pageContext.request.contextPath}/resources/images/spinner.gif" />&nbsp;Processing...
                                    </div>


                                </sf:form>

                            </div>

                            <div class="st-blocked2" id="errorDiv" style="color:red">
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
                        <div id="tabs-2">

                            Nam dui erat, auctor a, dignissim quis, sollicitudin eu, felis. Pellentesque nisi urna, interdum eget, sagittis et, consequat vestibulum, lacus. Mauris porttitor ullamcorper augue.





                        </div>
                        <div id="tabs-3">Nam dui erat, auctor a, dignissim quis, sollicitudin eu, felis. Pellentesque nisi urna, interdum eget, sagittis et, consequat vestibulum, lacus. Mauris porttitor ullamcorper augue.</div>
                    </div>

                </div>
                <div id="body2" class="col">




                    <div id="right-cont-area">

                        <!-- Some Dash Board-->  

                    </div>

                    <div class="right-nav">
                        <ul>



                        </ul>
                    </div>
                </div><!-- Body2 Div Ends Here -->
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
</html>