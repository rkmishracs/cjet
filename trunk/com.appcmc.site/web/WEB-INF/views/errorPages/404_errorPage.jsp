<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <title>CMC | ErrorPage</title>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/resources/css/redmond/jquery-ui-1.8.23.custom.css" />
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/styles.css" />


        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/drop.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
        <script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery.tipsy.js"></script>
        <script
        type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/js/jquery-ui-1.8.22.custom.min.js"></script>


    </head>

    <body>
        <div class="logo" style="position: relative;top: 5px; left: 15px;">
            <c:if test="${user.type == 'student'}">
                <a href="${pageContext.request.contextPath}/avtar"><img src="${pageContext.request.contextPath}/resources/images/CMC_LOGO.jpg" alt="" style="border-color:#312e25 ;zIndex:600" /></a>
            </c:if>
            <c:if test="${user.type == 'admin'}">
                <a href="${pageContext.request.contextPath}/master"><img src="${pageContext.request.contextPath}/resources/images/CMC_LOGO.jpg" alt="" style="border-color:#312e25 ;zIndex:600" /></a>
            </c:if>
            <c:if test="${user == null}">
                <a href="${pageContext.request.contextPath}/appHome"><img src="${pageContext.request.contextPath}/resources/images/CMC_LOGO.jpg" alt="" style="border-color:#312e25 ;zIndex:600" /></a>
            </c:if>    
        </div>

        <div class="menu_nav">
            <ul>
                <c:if test="${user.type == 'student'}">
                    <li class="active"><a href="${pageContext.request.contextPath}/avtar">Home</a></li>
                </c:if>
                <c:if test="${user.type == 'admin'}">
                    <li class="active"><a href="${pageContext.request.contextPath}/master">Home</a></li>
                </c:if>
                <c:if test="${user == null}">
                    <li class="active"><a href="${pageContext.request.contextPath}/appHome">Home</a></li>
                </c:if>
            </ul>
            <div class="clr"></div>
        </div>

        <div class="clear"></div>
        <div id="body">
            <div id="container">
                <div id="errorDiv">
                    <img src="${pageContext.request.contextPath}/resources/images/404.jpg" width="960px" height="300px"></img>
                    <div id="errorInfo">
                        <span class="errTxt1">Sorry, that page doesnot exist!</span>
                        <span class="errTxt2">We apologize for the inconvenience, but the page you attempted to access does not exist in our system.</span>
                    </div>
                </div>
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

    </body>
</html>
