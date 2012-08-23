<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s"  uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <title>CMC | Student Monthly Report</title>

        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/resources/css/redmond/jquery-ui-1.8.23.custom.css" />

        <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" type="text/css" />
        <!--  Two Style Tags Here  -->
        <!-- Style For Image -->
        <style>
            #penguin{
                position:absolute;
                top:0px;
                top:10px;
                left:180px;
            }


        </style>  
        <!-- Styles For Table with id studentDetail -->
        <style>
            body { font-size: 62.5%; }
            label, input { display:block; }
            input.text { margin-bottom:12px; width:95%; padding: .4em; }
            fieldset { padding:0; border:0; margin-top:25px; }
            h4{ font-size: 1.0em; margin: .6em 0; }
            div#users-contain { width: 600px; margin: 20px 0;  }
            div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
            div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; }
            .ui-dialog .ui-state-error { padding: .3em; }

        </style>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/drop.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/popup-tips.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery.tipsy.js"></script>

        <script
        type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery-ui-1.8.22.custom.min.js"></script>

        <!-- Script for MouseOver And Mouseout -->

        <script>
            $(document).ready(function(){
              
                $("#studentDetail a").each(function(){
                    
                    $(this).mouseover(function(){
                    
                        var enrlNo = $(this).attr('title');
                        $.ajax({
                            type : "GET",
                            url : "${pageContext.request.contextPath}/reports/studentEnrl",
                            data:  "enrlNo="+enrlNo,
        
                            success: function(msg){
              	
                  
               
                                $('#dialog').html('<table align="center" id="resTable">'+'<tr>'+'<td>'+'First Name:'+'</td>'+'<td>'+msg.firstName+'</td>'+'<td>'+''+'</td>'+'</tr>'+'<tr>'+'<td>'+'Last Name:'+'</td>'+'<td>'+msg.lastName+'</td>'+'<td>'+''+'</td>'+'</tr>'+'<tr>'+'<td>'+'Gender:'+'</td>'+'<td>'+msg.gender+'</td>'+'<td>'+''+'</td>'+'</tr>'+'<tr>'+'<td>'+'Address:'+'</td>'+'<td>'+msg.contacts.address+'</td>'+'<td>'+''+'</td>'+'</tr>'+'<tr>'+'<td>'+'Email:'+'</td>'+'<td>'+msg.email+'</td>'+'<td>'+''+'</td>'+'</tr>'+'<tr>'+'<td>'+'Mobile:'+'</td>'+'<td>'+msg.contacts.mobile+'</td>'+'<td>'+''+'</td>'+'</tr>'+'<tr>'+'<td>'+'Land Phone:'+'</td>'+'<td>'+msg.contacts.landPhone+'</td>'+'<td>'+''+'</td>'+'</tr>'+'</table>'+'<table id="imgTable" align="right" >'+'<tr>'+'<td>'+'<img  id="penguin"  src="${pageContext.request.contextPath}/resources/images/Penguins.jpg"/>'+'</td>'+'</tr>'+'</table>');
                            }
          
                        });
                    
                        $('#dialog').dialog({
                            autoOpen: false,
                            width: 250,
                            height:200
                        });

                        $('#dialog').dialog('open');
                        return false;
            
                    }).mouseout(function(){
    
                        $("#dialog").dialog('close');
                        return true;
                    });
                
                });       
            });     
        </script>
                            
        <style type="text/css">                    
            
            #exportPdfDiv{
                position: absolute;
                top: 123px;
                left: 700px;
                width:102px;
                height: 34px;
            }
            
        </style>
    </head>
    <body>
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
                            <label class="title" style="width:371px;"><s:message code="lbl.txt.allEnrolls.studentView"/></label>
                            <!--div id="view-pub-pro"><a href="#"><s:message code="lbl.setEmailMessagesPreferences"/></a></div-->
                        </form>
                        <div class="name"></div>
                    </div>
                    <!--  Created Table  --> 
                    <div id="users-contain" class="ui-widget">
                        
                        <h4>Number Of Students Enrolled In This Month : <c:out value="${fn:length(studentsMonthlyList)}"/></h4>
                        <div id="exportPdfDiv"><a class="button-h" href="#" id="exportToPdf"><span>Export To PDF</span></a></div>
                        <div style="height:5px;"></div>
                        <table id="studentDetail" class="ui-widget ui-widget-content">
                            <thead>
                                <tr class="ui-widget-header ">
                                    <th>Enrollment Number</th>
                                    <th>Email</th>
                                    <th>Name</th>
                                    <th>Date Of Birth</th>
                                    <th>Created On</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${studentsMonthlyList}" var="std">
                                    <tr>
                                        <td><a href="#" id ="enrolNo" title="${std.enrollmentNumber}">${std.enrollmentNumber}</a></td>
                                        <td>${std.email}</td>
                                        <td>${std.firstName} ${std.lastName}</td>
                                        <td><fmt:formatDate  dateStyle="default"  pattern="dd-MM-yyyy" value="${std.dateOfBirth}" /></td>
                                        <td><fmt:formatDate  dateStyle="default" pattern="dd-MM-yyyy" value="${std.createdOn}"/></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>  

                    <div id="dialog" title="Student Details">


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
