
<contact>
  <home-header page={this.opts.page}>
    <div class="head-middle">
      <h1>Contact Us</h1>
      <p>
        We are always working to make your experience better. Understanding your concerns help us improve. Tell us what you think of our site, products, and services. Did you have a great experience? We'd love to hear from you!
      </p>
    </div>
    <form>
      <input type="text" placeholder="Name">
      <input type="text" placeholder="E-mail">
      <input type="text" id="msg" placeholder="Message">
      <button type="submit" class="important">Send it !</button>
    </form>
  </home-header>


  <!--The following is "About" page content   -   credit to Zhiping Zhang - Good Job -->
  <div class="gallery tobeanimate">
    <div each= { item in personalInfo } class="individual" >
          <div class="main-info">
            <div class="main-info-inner">
              <img class="img" src={item.img}>
              <h4 class="personalInfo">{item.name}</h4>
              <h6>{item.role}</h6>
            </div>
          </div>
          <div class="main-bottom">
            <p>{item.email}</p>
          </div>
    </div>
  </div>

  <footerInner></footerInner>
  <script>

  this.personalInfo = [
    {
      name: "Yuntong Man",
      img: "../img/yuntong.png",
      role: "Instructional Designer",
      email: "Email: ymm2110@tc.columbia.edu",
    },
    {
      name: "Shuai Yuan",
      img: "../img/shuai.jpeg",
      role: "Web Developer",
      email: "Email: sy2729@tc.columbia.edu",
    },
    {
      name: "Yigu Liang",
      img: "../img/yigu.png",
      role: "Subject Matter Expert",
      email: "Email: yl3605@tc.columbia.edu",
    },
    {
      name: "Zhiping Zhang",
      img: "../img/zhiping.png",
      role: "UX Designer",
      email: "Email: zz2499@tc.columbia.edu",
    }
  ]

  this.on('mount', function() {
    detectScroll();
  })
  </script>

  <style>
    .header .head-middle {
      text-align: center;
      margin-top: 100px;
    }
    .header .head-middle h1{
      font-size: 2.5em;
      font-weight: 100;
      padding: 10px 0;
      text-shadow: 2px 2px rgba(0, 0, 0, 0.2);
    }
    .header .head-middle p{
      font-size: 1.1em;
      font-weight: 100;
      padding: 20px 20%;
      text-shadow: 1px 1px rgba(0, 0, 0, 0.2);
      position: relative;
    }
    .header .head-middle p:after{
      /* content: ""; */
      position: absolute;
      bottom: -10px;
      left: 0;
      right: 0;
      margin: 0 auto;
      width: 40%;
      height: 1px;
      border-radius: 50%;
      background: rgb(255,255,255);
      background: linear-gradient(90deg, rgba(255,255,255,0.38279061624649857) 0%, rgba(255,255,255,0.5872724089635855) 50%, rgba(255,255,255,0.3295693277310925) 100%);
    }
    form {
      text-align: center;
      width: 35%;
      margin: 20px auto;
      padding: 20px;
    }
    form input {
      width: 100%;
      margin: 20px 0;
      background: rgba(0,0,0,0);
      border: none;
      border-bottom: 1px solid white;
    }
    input::-webkit-input-placeholder {
      color: white;
      letter-spacing: 1.5px;
      font-size: 12px;
    }
    #msg {
      margin-top: 40px;
    }
    button {
      padding: 6px 20px;
      margin-top: 20px;
      font-size: 16px;
    }

    .gallery {
      display: flex;
      justify-content: space-around;
      flex-wrap: wrap;
      margin: 50px 0;
    }
    .gallery .individual {
      margin: 30px 0;
      width: 250px;
      height: 300px;
      border: 1px solid #F2F4F5;
      border-radius: 4px;
      box-shadow: 1px 1px 5px rgba(0, 0, 0, 0.04);
    }
    .gallery .individual .main-info {
      height: 80%;
      display: flex;
      justify-content: center;
      align-items: center;

    }
    .gallery .individual .main-info .main-info-inner {
      text-align: center;
    }


    .gallery .individual .main-info img {
      width: 50px;
      height: 50px;
      border-radius: 50%;
      border: 1px solid rgba(0, 0, 0, 0.1);
      padding: 4px;
      box-shadow: inset -2px -2px 15px 3px #DC848B, 2px 2px 10px 0px rgba(0, 0, 0, 0.1);
    }
    .gallery .individual .main-bottom {
      /* text-align: center; */
      height: calc(100% - 240px);
      background-color: #FCFBFE;
      display: flex;
      justify-content: center;
      align-items: center;
      border-radius: inherit;
    }



  </style>
</contact>
