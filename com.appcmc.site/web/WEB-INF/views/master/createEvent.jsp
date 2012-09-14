<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s"  uri="http://www.springframework.org/tags"%>
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
            <input type="hidden" id="createEventHidden" value="${pageContext.request.contextPath}"/>
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
                        <!--Begin Prediction Module-->
                        <div class="heading-review">
                            <form id="prdkt-compose-form" style="float:left; margin:10px 0 0 10px;">
                                <label class="title" style="width:371px;">Event Creation</label>
                            </form>
                        </div>

                        <div class="name">
                            <ul class="options tabs2">
                                <li id="listOne" class="active"><a href="#tab1">Create Event</a></li>
                            </ul>
                        </div>
                        <div class="tab_container2">

                            <div class="tab_content2">
                                <div id="createEventDiv">

                                    <sf:form action="" method="POST" modelAttribute="eventCreationFrom" id="eventCreation">


                                        <div class="st-blocked2" style="z-index: 810;">
                                            <label for="tags">Event Name</label>
                                            <sf:input path="eventName" type="text" size="25" value="" class="tags" name="eventName" id="eventName"/>
                                        </div>

                                        <div class="st-blocked2" style="z-index: 810;">
                                            <label for="tags">Event Type</label>
                                            <sf:select path="eventType" id="eventType">
                                                <sf:option value="Please Select" selected="true">Please Select</sf:option>
                                                <sf:option value="Job Fair">Job Fair</sf:option>
                                                <sf:option value="Walk-In">Walk-In</sf:option>
                                                <sf:option value="ON Campus Drive">ON Campus Drive</sf:option>
                                            </sf:select>
                                        </div>

                                        <div class="st-blocked2" style="z-index: 810;">
                                            <label for="tags">Event Date</label>
                                            <sf:input path="eventDate" type="text" size="25" value="" class="tags" name="eventDate" id="eventDate"/>
                                        </div>

                                        <div class="st-blocked2" style="z-index: 810;">
                                            <label for="tags">Event Time</label>
                                            <sf:input type="text" path="eventTime" size="10" value="" class="tags" name="eventTime" id="eventTime"/>
                                            <sf:select path="eventTimeSpecific" id="eventTimeSpecific">
                                                <sf:option value="A.M">A.M</sf:option>
                                                <sf:option value="P.M">P.M</sf:option>
                                            </sf:select>
                                        </div>

                                        <div class="st-blocked2" style="z-index: 810;">
                                            <label for="tags">Event Location</label>
                                            <sf:input type="text" path="eventLocation" size="25" value="" class="tags" name="eventLocation" id="eventLocation"/>
                                        </div>

                                        <div class="st-blocked2" style="z-index: 810;">
                                            <label for="tags">Additional Information</label>
                                            <sf:textarea path="eventAdditionalInformation" class="tags" cols="5" rows="6" id="eventAdditionalInformation"/>
                                        </div>

                                        <div class="st-blocked2">
                                            <label for="tags"><br/></label>
                                            <a class="button-h" href="#" id="submitForCreateEvent"><span>Submit</span></a>
                                            <a class="button-h" href="${pageContext.request.contextPath}/event" id="cancelForCreateEvent"><span>Cancel</span></a>
                                        </div>

                                    </sf:form>
                                    <div id="ajax_loading_createEvent">

                                        <img  src="${pageContext.request.contextPath}/resources/images/spinner.gif"><div id="ajax_loading_createEventText"><s:message code="lbl.txt.Processing"/></img></div>


                                </div>

                                <div id="createdEventSucess">
                                    <span class="createdEventSucess">Successfully Created An Event</span>
                                </div>

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
                            <li class="current"><a href="${pageContext.request.contextPath}/event/showCreateEvent">Create Event</a></li>
                            <li><a href="${pageContext.request.contextPath}/event/showViewAllEvents">Show All Events</a></li>
                        </ul>

                    </div>

                </div>
            </div>
        </div>
        <div class="clear"></div>
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
    </body>
</html>