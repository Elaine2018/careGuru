
<home-header>
  <main class="header" id = {tour: this.opts.page === "tour", faqs: this.opts.page === "faqs", contact: this.opts.page === "contact"}>
    <div class="main-inner">
      <nav class="clearfix">
        <div class="logo">
          <a href="#home"><img src="/img/LOGO.png" alt="logo"></a>
        </div>
        <ul class="nav-right">
          <li>
            <a href="#faqs">FAQS</a>
          </li>
          <li>
            <a href="#contact">CONTACT</a>
          </li>
          <li class="important" onclick={loginTrigger} if={!this.parent.user}>GET ACCESS</li>
        </ul>
      </nav>

      <yield/> 
  
    </div>
  </main>
  <script>
    playVideo() {
        this.parent.videoPlay = true;
        this.parent.parent.videoPlay = true;
        this.parent.update();   //open videoPlay tag
        this.parent.parent.update(); //open shadow layer in app.tag
      }

    loginTrigger() {
        this.parent.parent.loginPanel = true;
        this.parent.parent.update();
    }
  </script>

  <style>
    .header {
      width: 100%;
      min-height: 600px;
      background: url("./img/app1.jpg") no-repeat;
      background-size: cover;
      background-position: center;
      position: relative;
      color: #FFFFFF;
    }

    .header#tour {
      background: url("./img/tour1.jpg") no-repeat;
      background-size: cover;
      background-position: center;
    }
    .header#faqs {
      background: url("./img/faqs1.jpg") no-repeat;
      background-size: cover;
      background-position: center;
    }
    .header#contact {
      background: url("./img/contact1.jpg") no-repeat;
      background-size: cover;
      background-position: center;
    }

    .header:after {
      content: "";
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background: rgb(227,101,105);
      background: linear-gradient(0deg, rgba(229,120,123,1) 0%, rgba(201,144,153,1) 25%, rgba(173,164,177,1) 50%, rgba(132,186,205,1) 75%, rgba(114,197,220,1) 100%);
      opacity: 0.8;
    }

    .main-inner {
      position: relative;
      z-index: 2;
    }

    .header nav {
      padding: 15px;
      border-bottom: 1px solid #8BD0E3;
      box-sizing: border-box;
      height: 65px;
    }
    .header nav .logo {
      float: left;
      height: 56px;
      bottom: 10px;
      position: relative;
    }
    .header nav .logo img {
      height: 100%;
      width: auto;
    }
    .header nav .nav-right {
      float: right;
      margin-right: 10%;
    }
    .header nav .nav-right li {
      display: inline-block;
      margin-left: 10px;
      font-weight: 100;
      font-size: 0.85em;
      padding: 5px 10px;
      
    }
    .header nav .nav-right li a{
      color: inherit;
    }

  </style>
</home-header>
