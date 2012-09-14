<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <title>CMC | Home</title>

        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/styles.css" />

        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css" />
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico"/>

        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/resources/css/redmond/jquery-ui-1.8.23.custom.css" />

        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>



        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>

        <script
        type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery-ui-1.8.22.custom.min.js"></script>


        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/app.js"></script>

    </head>
    <body>
        <div class="logo" style="position: relative;top: 5px; left: 15px;">
            <a href="${pageContext.request.contextPath}/appHome"><img src="${pageContext.request.contextPath}/resources/images/CMC_LOGO.jpg" alt="" style="border-color:#312e25 ;zIndex:600" /></a>
        </div>

        <div class="menu_nav">
            <ul>
                <li class="active"><a href="${pageContext.request.contextPath}/appHome">Home</a></li>
                
               
            </ul>
            <div class="clr"></div>
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
                    <!--End Prediction Module--> 

                    <!--Begin View Header-->

                    <!--End View Header--> 

                    <!--Begin Pridikt Module-->
                    <div class="m600-prdkt"> 

                        <!--Begin Pridiktor Info-->
                        <div class="prdktr"> <img src="${pageContext.request.contextPath}/resources/images/user-img.jpg" width="60" height="60" alt="Geoff Rego" title="Geoff Rego" />
                            <div class="name">Nicole Mossinger</div>
                            <div class="rank">Amateur</div>
                        </div>
                        <!--End Pridiktor Info--> 

                        <!--Begin Pridiktion Info Box-->
                        <div class="prdkt-box">
                            <h2 class="tags">Japan, Nuclear Energy, Disaster</h2>
                            <h1 class="pridiktion">There will be a nuclear melt-down in Japan before March 20, 2011</h1>
                            <div class="details"></div>
                            <div class="link"> <img src="${pageContext.request.contextPath}/resources/images/CMC_LOGO.jpg" width="90" height="63" alt="CMC Pvt Ltd" title="CMC" />
                                <div>
                                    <h3>Tsunami Hits Fukiyama Power Plant</h3>
                                    <a href="http://www.cnn.com" id="tipsblock" title="If you remember your password, try logging in with your email">www.cnn.com/linked-article</a>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ornare leo ac elit faucibus bibendum. Curabitur et nulla augue, vitae placerat velit. In nec mauris vel risus tempus iaculis. Nam dapibus, ante vel sodales fringilla, nunc massa consectetur leo, lacinia ultrices quam lectus nec sapien...</p>
                                </div>
                            </div>
                            
                            
                            
                            
                            <div class="boxpointer"></div>
                        </div>
                        <!--End Pridiktion Info Box-->
                        <div class="clear"></div>
                    </div>




                    <div class="m600-prdkt"> 

                        <!--Begin Pridiktor Info-->
                        <div class="prdktr"> <img src="${pageContext.request.contextPath}/resources/images/user-img1.png" width="60" height="60" alt="Geoff Rego" title="Geoff Rego" />
                            <div class="name">Geoff Rego</div>
                            <div class="rank">TopDog</div>
                        </div>
                        <!--End Pridiktor Info--> 

                        <!--Begin Pridiktion Info Box-->
                        <div class="prdkt-box">
                            <h2 class="tags">Japan, Nuclear Energy, Disaster</h2>
                            <h1 class="pridiktion">There will be a nuclear melt-down in Japan before March 20, 2011</h1>
                            <div class="details"></div>
                            <div class="link"> <img src="${pageContext.request.contextPath}/resources/images/CMC_LOGO.jpg" width="90" height="63" alt="CMC Pvt Ltd" title="CMC" />
                                <div>
                                    <h3>Tsunami Hits Fukiyama Power Plant</h3>
                                    <a href="http://www.cnn.com" id="tipsblock" title="If you remember your password, try logging in with your email">www.cnn.com/linked-article</a>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ornare leo ac elit faucibus bibendum. Curabitur et nulla augue, vitae placerat velit. In nec mauris vel risus tempus iaculis. Nam dapibus, ante vel sodales fringilla, nunc massa consectetur leo, lacinia ultrices quam lectus nec sapien...</p>
                                </div>
                            </div>
                           
                            <div class="boxpointer"></div>
                        </div>
                        <!--End Pridiktion Info Box--> 

                    </div>
                    <!--End Pridikt Module--> 

                    <!--Begin Pridikt Module-->
                    <div class="m600-prdkt"> 

                        <!--Begin Pridiktor Info-->
                        <div class="prdktr"> <img src="${pageContext.request.contextPath}/resources/images/user-img2.png" width="60" height="60" alt="Geoff Rego" title="Geoff Rego" />
                            <div class="name">Nicole Mossinger</div>
                            <div class="rank">Amateur</div>
                        </div>
                        <!--End Pridiktor Info--> 

                        <!--Begin Pridiktion Info Box-->
                        <div class="prdkt-box">
                            <h2 class="tags">Japan, Nuclear Energy, Disaster</h2>
                            <h1 class="pridiktion">There will be a nuclear melt-down in Japan before March 20, 2011</h1>
                            <div class="details"></div>
                            <div class="link"> <img src="${pageContext.request.contextPath}/resources/images/CMC_LOGO.jpg" width="90" height="63" alt="CMC Pvt Ltd" title="CMC" />
                                <div>
                                    <h3>Tsunami Hits Fukiyama Power Plant</h3>
                                    <a href="http://www.cnn.com" id="tipsblock" title="If you remember your password, try logging in with your email">www.cnn.com/linked-article</a>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ornare leo ac elit faucibus bibendum. Curabitur et nulla augue, vitae placerat velit. In nec mauris vel risus tempus iaculis. Nam dapibus, ante vel sodales fringilla, nunc massa consectetur leo, lacinia ultrices quam lectus nec sapien...</p>
                                </div>
                            </div>
                           
                            <div class="boxpointer"></div>
                        </div>
                        <!--End Pridiktion Info Box-->
                        <div class="clear"></div>
                    </div>
                    <!--End Pridikt Module--> 

                    <!--Begin Pridikt Module-->
                    <div class="m600-prdkt"> 

                        <!--Begin Pridiktor Info-->
                        <div class="prdktr"> <img src="${pageContext.request.contextPath}/resources/images/user-img3.png" width="60" height="60" alt="Geoff Rego" title="Geoff Rego" />
                            <div class="name">Stephen Pieraldi</div>
                            <div class="rank">Guru</div>
                        </div>
                        <!--End Pridiktor Info--> 

                        <!--Begin Pridiktion Info Box-->
                        <div class="prdkt-box">
                            <h2 class="tags">Business, Stocks, Apple, Steve Jobs, Health</h2>
                            <h1 class="pridiktion">Steve Jobs will be back at Apple no latter than July 1, 2011</h1>
                            <div class="details"></div>
                            <div class="link"></div>
                           
                            <div class="boxpointer"></div>
                        </div>
                        <!--End Pridiktion Info Box--> 

                    </div>
                    <!--End Pridikt Module--> 

                    <!--Begin Pridikt Module-->
                    <div class="m600-prdkt"> 

                        <!--Begin Pridiktor Info-->
                        <div class="prdktr"> <img src="${pageContext.request.contextPath}/resources/images/user-img4.jpg" width="60" height="60" alt="Geoff Rego" title="Geoff Rego" />
                            <div class="name">Hans Franz</div>
                            <div class="rank">Expert</div>
                        </div>
                        <!--End Pridiktor Info--> 

                        <!--Begin Pridiktion Info Box-->
                        <div class="prdkt-box">
                            <h2 class="tags">Japan, Nuclear Energy, Disaster</h2>
                            <h1 class="pridiktion">Donald Trumph will announce his presidential bid before June  20, 2011</h1>
                            <div class="details"></div>
                            <div class="link"></div>
                           
                            <div class="boxpointer"></div>
                        </div>
                        <!--End Pridiktion Info Box--> 

                    </div>
                    <!--End Pridikt Module--> 

                </div>
                <div id="body2" class="col">






                </div>
                <div class="clear"></div>
            </div>
        </div>

    </body>
</html>