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
            <input type="hidden" id="createSucessStoriesHidden" value="${pageContext.request.contextPath}"/>
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
                                <label class="title" style="width:371px;">Create A Success Story</label>
                            </form>
                        </div>

                        <div class="name">
                            <ul class="options tabs2">
                                <li id="listOne" class="active"><a href="#tab1">Create A Success Story</a></li>
                            </ul>
                        </div>
                        <div class="tab_container2">

                            <sf:form action="" method="POST" modelAttribute="successStoryCreationForm" id="sucessStoryCreation">
                                <div class="tab_content2">
                                    <div id="createEventDiv">

                                        <div class="st-blocked2" style="z-index: 810;">
                                            <label for="tags">Enrollment Number</label>
                                            <sf:input path="sucessStoriesEnrollmentNumber" type="text" size="25" value="" class="tags" name="eventName" id="sucessStoriesEnrollmentNumber"/>

                                            <div id="ajax_loading_enrollmentShow">
                                                <img  src="${pageContext.request.contextPath}/resources/images/spinner.gif"><div id="ajax_loading_createSucessStory_processing"><s:message code="lbl.txt.Processing"/></img>
                                            </div>
                                        </div>

                                        <div class="st-blocked2" style="z-index: 810;">
                                            <label for="tags">Name</label>
                                            <sf:input path="personName" type="text" size="25" class="tags" id="successStoryPersonName"/>
                                        </div>

                                        <div class="st-blocked2" style="z-index: 810;">
                                            <label for="tags">Placed Company Name</label>
                                            <sf:input path="placedCompanyName" type="text" size="25" class="tags" id="placedCompanyName"/>
                                        </div>

                                        <div class="st-blocked2" style="z-index: 810;">
                                            <label for="tags">Year Of Placement</label>
                                            <sf:input path="yearOfPlacement" type="text" size="25" class="tags" id="yearOfPlacement"/>
                                        </div>

                                        <div class="st-blocked2" style="z-index: 810;">
                                            <label for="tags">Designation</label>
                                            <sf:input path="designation" type="text" size="25" class="tags" id="designation"/>
                                        </div>

                                        <div class="st-blocked2" style="z-index: 810;">
                                            <label for="tags">Package Details</label>
                                            <sf:input path="packageDetails" type="text" size="25" class="tags" id="packageDetails"/>
                                        </div>

                                        <div class="st-blocked2" style="z-index: 810;">
                                            <label for="tags">Other Details</label>
                                            <sf:textarea path="otherDetails" class="tags" cols="5" rows="6" id="otherDetails"></sf:textarea>
                                        </div>

                                        <div class="st-blocked2">
                                            <label for="tags"><br/></label>
                                            <a class="button-h" href="#" id="submitForCreateSuccessStories"><span>Submit</span></a>
                                            <a class="button-h" href="${pageContext.request.contextPath}/successStories" id="cancelForCreateEvent"><span>Cancel</span></a>
                                        </div>


                                        <div id="ajax_loading_createSucessStory">

                                            <img  src="${pageContext.request.contextPath}/resources/images/spinner.gif"><div id="ajax_loading_createSuccessStory_Processing"><s:message code="lbl.txt.Processing"/></div></img>
                                        </div>
                                    </div>

                                    <div id="createdSuccessStory">
                                        <span class="createdEventSucess">Successfully Created An Event</span>
                                    </div>

                                </div>
                            </sf:form>
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
                        <li class="current"><a href="${pageContext.request.contextPath}/successStories/createSuccessStories">Create Success Stories</a></li>
                        <li><a href="${pageContext.request.contextPath}/successStories/viewAllSuccessStories">Show All Success Stories</a></li>
                    </ul>

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