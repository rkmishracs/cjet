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
                <li><a href="${pageContext.request.contextPath}/appHome">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/appHome/about">About Us</a></li>
                <li class="active"><a href="${pageContext.request.contextPath}/appHome/contact">Contact Us</a></li>
                <li><a href="#" id="signinLink">Sign In</a></li>
            </ul>
            <div class="clr"></div>
        </div>

        <input type="hidden" id="appHomeHidden" value="${pageContext.request.contextPath}" />
        <div class="clear"></div>
        <div id="body" style="background-color: white;">



            <div class="wrapper">

                <div id="body1" class="col" style="background-color: white;">

                    <div id="imageForContactUsPage">
                        <img src="${pageContext.request.contextPath}/resources/images/header2.jpg"/>
                    </div>
                    <br/>
                    <br/>
                    <br/>
                    <h1 id="headerColor">Contact Us</h1>
                    <div id="lineForContactUS"></div>
                    <br/>
                    <br/>
                    <div id="contactUsDiv">

                        <p>
                            CMC Limited, Vizag.
                            <br/>
                            D.No. 49-24-12, 2nd Floor,
                            <br/>
                            Krupa City Center,
                            <br/>
                            Shankaramattam Main Road,Vizag 530 016.
                            <br/>
                            Ph.No.: 0891 2746554, Mobile : +91 9676534400.
                            <br/>
                            Email:
                            <a href="mailto:cmcvizag@cmcltd.com">cmcvizag@cmcltd.com</a>
                        </p>
                    </div>

                </div>
                <div id="body2" class="col">
                </div>
            </div>
            <div class="clear"></div>
        </div>


        <div id="footer">
            <div class="wrapper">
                <div id="footer1" class="col"> <span class="linkgroup">About Us</span>
                    <ul>
                        <li><a href="company.html">Our Company</a></li>
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