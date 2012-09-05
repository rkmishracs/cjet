<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s"  uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <title>CMC | Create Event</title>
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
        <input type="hidden" id="createEventHidden" value="${pageContext.request.contextPath}"/>
        <div>
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
                                <label class="title" style="width:371px;">Show All Events</label>
                            </form>
                        </div>
                        <div id="users-contain" class="ui-widget">
                            <h4>All Events</h4>
                            <div id="exportPdfDiv"><a class="button-h" href="#" id="exportToPdf"><span>Export To PDF</span></a></div>
                            <div style="height:5px;"></div>
                            <c:if test="${successCancelEvent != null}">
                                <div style="position: relative;left: 40px;width: 400px; color: #6B9EDD;">${successCancelEvent}</div> 
                            </c:if>
                            <table class="ui-widget ui-widget-content">
                                <thead>
                                    <tr class="ui-widget-header ">
                                        <th>Event Name</th>
                                        <th>Event Type</th>
                                        <th>Event Date</th>
                                        <th>Event Time</th>
                                        <th>Event Location</th>
                                        <th>Additional Information</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${eventsList}" var="events">
                                        <tr>
                                            <td>${events.eventName}</td>
                                            <td>${events.eventType}</td>
                                            <td><fmt:formatDate  dateStyle="default"  pattern="dd-MM-yyyy" value="${events.eventOn}"/></td>
                                            <td>${events.eventTime}</td>
                                            <td>${events.eventLocation}</td>
                                            <td>${events.additionalInfo}</td>
                                            <td><span><a href="${pageContext.request.contextPath}/event/cancelEvent/${events.id}" style="color:blue">Cancel</a></span></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div id="body2" class="col">

                    <div id="right-cont-area">

                        <!-- Some Dash Board-->  

                    </div>

                    <div class="right-nav">

                        <ul>
                            <li class="current"><a href="${pageContext.request.contextPath}/event/showCreateEvent">Create Event</a></li>
                            <li><a href="#">Show All Events</a></li>
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