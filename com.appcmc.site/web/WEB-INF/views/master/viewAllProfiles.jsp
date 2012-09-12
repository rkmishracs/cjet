<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s"  uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
   <head>
      <title>CMC | Admin</title>
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
      <div id="body" style="background-color: white;">

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

         <div class="wrapper">
            <div id="body1" class="col">
               <div class="heading-review">
                  <form id="prdkt-compose-form" style="float:left; margin:10px 0 0 10px;">
                     <label class="title" style="width:371px;">View All Profiles</label>
                  </form>
                  <div class="name"></div>
               </div>
               <div id="users-contain" class="ui-widget">
                  <h4>Existing Students</h4>
                  <div id="exportPdfDiv"><a class="button-h" href="#" id="exportToPdf"><span>Export To PDF</span></a></div>
                  <div style="height:5px;"></div>
                  <table class="ui-widget ui-widget-content">
                     <thead>
                        <tr class="ui-widget-header ">
                           <th>Enrollment Number</th>
                           <th>Name</th>
                           <th>Email</th>
                           <th>Phone Number</th>
                           <th>Key Skills</th>
                           <th>Resume</th>
                        </tr>
                     </thead>
                     <tbody>
                        <c:forEach items="${studentContactsProfile}" var="stdConProf">
                                 <tr>
                                    <td>${stdConProf.enrollmentNumber}</td>
                                    <td>${stdConProf.firstName} ${stdConProf.lastName}</td>
                                    <td>${stdConProf.email}</td>
                                    <td>${stdConProf.mobile}</td>
                                    <td>${stdConProf.keySkills}</td>
                                    <td><a href="${pageContext.request.contextPath}/reports/download/${stdConProf.enrollmentNumber}">Download</a></td>
                                 </tr>
                        </c:forEach>
                     </tbody>
                  </table>
               </div>
            </div>

            <div id="body2" class="col">
               <div class="right-nav">
                  <ul>
                     <li class="current"><a href="${pageContext.request.contextPath}/master/showEnrollment"><s:message code="lbl.enrollment.link.enrollment"/></a></li>
                     <li><a href="${pageContext.request.contextPath}/reports/all"><s:message code="lbl.enrollment.link.studentView"/></a></li>
                     <li><a href="${pageContext.request.contextPath}/reports/monthlyReport"><s:message code="lbl.enrollment.link.monthlyReport"/></a></li>
                     <li><a href="${pageContext.request.contextPath}/reports/weeklyReport"><s:message code="lbl.enrollment.link.weeklyReport"/></a></li>
                     <li><a href="${pageContext.request.contextPath}/reports/dailyReport"><s:message code="lbl.enrollment.link.dailyReport"/></a></li>
                     <li><a href="${pageContext.request.contextPath}/search"><s:message code="lbl.enrollment.link.find"/></a></li>
                     <li><a href="#" id="change-password-link"><s:message code="lbl.enrollment.link.changePassword"/></a></li>
                     <li><a href="${pageContext.request.contextPath}/reports/viewAllProfiles">View All Profiles</a></li>
                  </ul>
               </div>
            </div>
         </div>
      </div>
      <div class="clear"></div>
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