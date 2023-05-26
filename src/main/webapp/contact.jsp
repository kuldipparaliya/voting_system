<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Contact page</title>
    <link rel="stylesheet" href="css/contact.css" />
    <link
      href="https://fonts.googleapis.com/css2?family=Rokkitt:wght@400;500;600;700&display=swap"
      rel="stylesheet"
    />
    <script
      type="module"
      src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"
    ></script>
    <script
      nomodule
      src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"
    ></script>
  </head>
  <body>
    <header class="header">
      <div class="container">
        <div class="logo-box">
          <a href="">
            <img class="web-logo" src="images/website-logo.png" alt="VOTING SYSTEM" />
          </a>
        </div>
      </div>
    </header>
    <hr class="horizontal" />

    <nav class="nav">
      <ul class="navigation">
        <li class="nav-li"><a class="nav-link" href="home.jsp">PARTY_LIST</a></li>
        <li class="nav-li"><a class="nav-link" href="boothList.jsp">BOOTH_LIST</a></li>
        <li class="nav-li"><a class="nav-link" href="logout.jsp">LOGOUT</a></li>
      </ul>
    </nav>
    <hr class="horizontal" />
    <section>
      <div class="head">
        <h2>MEET OUR TEAM</h2>
      </div>
      <div class="guide-box">
        <h4 class="guide">
          Project-Guide:<span class="guide_name">Sunil patel</span>
        </h4>
      </div>
      
      <div class="section-container">
        <div class="contact-box">
          <img class="img" src="images/aryan.jpg" alt="" />
          <h2 class="name">
            <ion-icon class="large" name="people-outline"></ion-icon>Aryan Prajapati
          </h2>
          <div class="enroll">
            <ion-icon class="contain" name="earth-outline"></ion-icon>
            <span>200280107011</span>
          </div>
          <div class="number">
            <ion-icon class="contain" name="call-outline"></ion-icon>
            <span>+91 8487980301</span>
          </div>
          <div class="email">
            <ion-icon class="contain" name="mail-outline"></ion-icon>
            <span>aryanprajapati2112001@gmail.com</span>
          </div>
        </div>
        
        <div class="contact-box">
          <img class="img" src="images/kuldip.jpg" alt="" />
          <h2 class="name">
            <ion-icon class="large" name="people-outline"></ion-icon>Paraliya kuldip
          </h2>
          <div class="enroll">
            <ion-icon class="contain" name="earth-outline"></ion-icon>
            <span>200280107014</span>
          </div>
          <div class="number">
            <ion-icon class="contain" name="call-outline"></ion-icon>
            <span>+91 9313118046</span>
          </div>
          <div class="email">
            <ion-icon class="contain" name="mail-outline"></ion-icon>
            <span>kuldipparaliya6987@gmail.com</span>
          </div>
       </div>
         
        <div class="contact-box">
          <img class="img" src="images/vinit.jpeg" alt="" />
          <h2 class="name">
            <ion-icon class="large" name="people-outline"></ion-icon>Vinit Patel
          </h2>
          <div class="enroll">
            <ion-icon class="contain" name="earth-outline"></ion-icon>
            <span>200280107016</span>
          </div>
          <div class="number">
            <ion-icon class="contain" name="call-outline"></ion-icon>
            <span>+91 9313884034</span>
          </div>
          <div class="email">
            <ion-icon class="contain" name="mail-outline"></ion-icon>
            <span>vinit2273@gmail.com</span>
          </div>
        
         </div>
        
        
      </div>
    </section>

    <footer class="footer">
      <div class="footer--section">
        <div class="col--logo">
          <div class="footer--logo">
            <a href="#"
              ><img
                class="footer--img"
                src="images/website-logo.png"
                alt="secondhand book logo"
            /></a>
          </div>
          <div class="social--links">
            <ul class="social--link">
              <li>
                <a href="#"
                  ><ion-icon
                    name="logo-instagram"
                    class="footer--icon"
                  ></ion-icon
                ></a>
              </li>
              <li>
                <a href="#"
                  ><ion-icon
                    name="logo-facebook"
                    class="footer--icon"
                  ></ion-icon
                ></a>
              </li>
              <li>
                <a href="#"
                  ><ion-icon name="logo-twitter" class="footer--icon"></ion-icon
                ></a>
              </li>
            </ul>
          </div>
          <p class="copyright">
            copyright &copy; 2023 by AJAVA TEAM inc. All rights reserved.
          </p>
        </div>
        <div class="contact me">
          <h4 class="footer--heading">Contact us</h4>
          <address class="contacts">
            <p class="address">LDCE hostel navarangpura, 380015 ahemadabad</p>
            <p>
              <a href="tel:111-222-3333" class="footer--link">931-311-8046</a
              ><br />
              <a href="mailto:me@exapmle.com" class="footer--link"
                >wpteam2K23@gmail.com</a
              >
            </p>
          </address>
        </div>
        <div class="aboutme">
          <h4 class="footer--heading">About-us</h4>
          <ul class="list--style">
            <li><a class="footer--link" href="#">careers</a></li>
            <li><a class="footer--link" href="#">Graduation</a></li>
          </ul>
        </div>
        <div class="resources">
          <h4 class="footer--heading">resources</h4>
          <ul class="list--style">
            <li><a class="footer--link" href="#">Help center</a></li>
            <li><a class="footer--link" href="#">privacy & terms</a></li>
          </ul>
        </div>
      </div>
    </footer>
  </body>
</html>