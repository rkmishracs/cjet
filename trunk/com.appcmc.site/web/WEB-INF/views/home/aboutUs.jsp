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
                <li class="active"><a href="${pageContext.request.contextPath}/appHome/about">About Us</a></li>
                <li><a href="${pageContext.request.contextPath}/appHome/contact">Contact Us</a></li>
                <li><a href="#" id="signinLink">Sign In</a></li>
            </ul>
            <div class="clr"></div>
        </div>

        <input type="hidden" id="appHomeHidden" value="${pageContext.request.contextPath}" />
        <div class="clear"></div>
        <div id="body" style="background-color: white;">
            <div class="wrapper">
                <div id="imageForAboutUsPage">
                    <img src="${pageContext.request.contextPath}/resources/images/header1.jpg"/>
                </div>
                <div id="dataMain">
                    <br/>
                    <br/>
                    <h1 id="headerColor">About CMC IT Education & Training: The Computer Training Institute</h1>
                    <h3 id="headerColor">Also more information on its computer centres</h3>
                    <div id="lineForAboutUS"></div>
                    <br/>
                    <br/>
                    <p id="dataForAboutUs">
                        CMC Limited is a leading IT solutions company and a subsidiary of Tata Consultancy Services Limited (TCS Ltd ), one of the world's leading information technology consulting, services and business process outsourcing organization. We are a part of the Tata group, India's best-known business conglomerate.
                        <br/>
                        <br/>
                        With 18 offices, 150 service locations, 520 non-resident locations and over 5,551 employees worldwide, we provide a wide spectrum of unique Information Technology solutions and services to a clientele of premier organization in the government and private sectors.
                        <br/>
                        <br/>
                    </p>
                    <h2 id="headerColor"> Large and complex project management capabilities </h2>
                    <div id="lineForAboutUS"></div>
                    <br/>
                    <br/>
                    <p id="dataForAboutUs">
                        Since its incorporation in 1975, CMC has an enviable record of successfully building IT solutions for massive and complex infrastructure and market projects.
                        <br/>
                        <br/>
                        Our competitive edge comes from combining our technology competencies with our understanding of verticals, straddling a range of sectors from banking and insurance, power, mining and defence to education. Our high quality, high value IT solutions have helped reshape businesses and delivered measurable results to our customers.
                        <br/>
                        <br/>
                    </p>
                    <h2 id="headerColor"> Sizable resource pool with diverse skill sets </h2>
                    <div id="lineForAboutUS"></div>
                    <br/>
                    <br/>
                    <p id="dataForAboutUs">
                        We achieve this with the help of our resource pool of engineers trained in diverse technologies, with vast domain knowledge and varied skill sets. Of our 5,551 employees, over 14 per cent have more than ten years of work experience. We have an impeccable educational profile; as many as 26 per cent of our employees have postgraduate degrees.
                        <br/>
                        <br/>
                        We also conduct significant research into emerging technologies and competence areas at our state-of-the-art, ISO 9001-certified R&D centre in Hyderabad, India. That is what gives us an edge in complex, high technology projects.
                        <br/>
                        <br/>
                        The Systems Integration Business Unit's all four regions are at Level 5 (optimizing level) of the SEI's Capability Maturity Model (software).
                        <br/>
                        <br/>
                    </p>
                    <h2 id="headerColor"> Strong customer relationships </h2>
                    <div id="lineForAboutUS"></div>
                    <br/>
                    <br/>
                    <p id="dataForAboutUs">
                        CMC's customer orientation and service culture lead to enduring bonds with clients. Our distinct value proposition and service culture, coupled with our track record of successful service delivery, are reflected in our long-standing customer relationships with dominant players in key infrastructure, services and government sectors.
                        <br/>
                        <br/>
                        Our customers include some of the biggest organizations in India: Reserve Bank of India, Indian Railways, Indian Oil Corporation Limited, Bharat Petroleum Corporation Limited, Oil and Natural Gas Corporation Limited, United Western Bank, Bank of India and Bank of Baroda.
                        <br/>
                        <br/>
                        The trust reposed in us by our clients is reflected in our growing revenues from operations such as post-implementation maintenance and support activities.
                        <br/>
                        <br/>
                    </p>
                    <h2 id="headerColor"> Strong service delivery chain </h2>
                    <div id="lineForAboutUS"></div>
                    <br/>
                    <br/>
                    <p id="dataForAboutUs">
                        In the domestic market, we have established an extensive services network penetrating the remotest geographical locations. This gives us an unmatched advantage in servicing customers with an all-India presence, such as the railways, banks, government entities and other organizations with countrywide operations.
                        <br/>
                        <br/>
                    </p>
                    <h2 id="headerColor"> Growth strategies </h2>
                    <div id="lineForAboutUS"></div>
                    <br/>
                    <br/>
                    <p id="dataForAboutUs">
                        CMC's growth strategy focuses on capitalising on its unique skill sets and leveraging the synergies with TCS and other Tata group companies, for growth in revenue and profitability of our operations.
                        <br/>
                        <br/>
                        We will continue to focus on consolidating our dominant position in India, while expanding our reach globally.
                    </p>
                    <br/>
                    <br/>
                </div>
            </div>
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