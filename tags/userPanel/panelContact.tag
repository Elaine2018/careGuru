
<panelContact>
  <div class="contact-wrap">
    <div class="gallery">
      <div each= { item in personalInfo } class="individual" >
            <div class="main-info">
              <div class="main-info-inner">
                <img class="img" src={item.img}>
                <h4 class="personalInfo">{item.name}</h4>
                <h6>{item.role}</h6>
              </div>
            </div>
            <div class="main-bottom">
              <a href={"mailto:" + item.email}><p>{item.email}</p></a>
            </div>
      </div>
    </div>
  </div>
  <script>
  this.personalInfo = [
    {
      name: "Yuntong Man",
      img: "../img/Yuntong.png",
      role: "Instructional Designer",
      email: "ymm2110@tc.columbia.edu",
    },
    {
      name: "Shuai Yuan",
      img: "../img/Shuai.jpeg",
      role: "Web Developer",
      email: "sy2729@tc.columbia.edu",
    },
    {
      name: "Yigu Liang",
      img: "../img/Yigu.png",
      role: "Subject Matter Expert",
      email: "yl3605@tc.columbia.edu",
    },
    {
      name: "Zhiping Zhang",
      img: "../img/Zhiping.png",
      role: "UX Designer",
      email: "zz2499@tc.columbia.edu",
    }
  ]

  </script>

  <style>
  .contact-wrap {
    height: calc(100% - 59px);
    overflow: auto;
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
</panelContact>
