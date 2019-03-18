
<panel-sidebar>
    <ul class="t-center">
      <li><img src="./img/LOGO2.png" alt="logo"></li>
      <li class={activeSideBar: currentPage === 'home'}><a href="#{this.parent.parent.user.uid}/home" onclick={goback} data-message="panelhome"><i class="fa fa-home"></i></a></li>
      <li class={activeSideBar: currentPage === 'product'}><a href="#{this.parent.parent.user.uid}/product" onclick={goback} data-message="panelproduct"><i class="fa fa-tachometer"></i></a></li>
      <li class={activeSideBar: currentPage === 'contact'}><a href="#{this.parent.parent.user.uid}/contact" onclick={goback} data-message="panelcontact"><i class="fa fa-comment"></i></a></li>
      <li class={activeSideBar: currentPage === 'notification'}><i class="fa fa-bell"></i></li>
    </ul>
  <script>
    var that = this;
    this.on('update', ()=> {
      this.currentPage = this.parent.currentPage; //obtain the current page from parent tag to switch mode
    })

    goback(e) {
      //set the homepage panel parameter to none for user to go back when they are in home panel branches
      if(this.parent.tags.hasOwnProperty(e.target.dataset.message)){
        this.parent.tags.panelhome.homePage = false;
        this.parent.tags.panelhome.update();
      }else {
        //console.log('else: parent tag doesnt have ')
      }
    }
  </script>

  <style>
    ul > li {
      padding: 30px 5px;
      font-size: 1.2em;
      color: #BAC0CD;
      transition: all .4s;
    }
    ul > li > a{
      color: inherit;
      width: 100%;
      display: inline-block;
    }

    ul > li:first-child {
      padding: 20px 5px;
    }

    ul > li > img {
      width: 30px;
      height: auto;
    }

    ul > li.activeSideBar {
      color: #F07277;
      position: relative;
    }
    ul > li.activeSideBar:after {
      content: "";
      position: absolute;
      right: 0;
      top: 0;
      bottom: 0;
      margin: auto 0;
      height: 50%;
      width: 2px;
      border-radius: 2px;
      background: #F07277;
    }
  </style>
</panel-sidebar>
