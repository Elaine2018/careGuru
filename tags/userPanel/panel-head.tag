<panel-head>
  <header class="panel-head">
    <nav>
      <ul class="clearfix">
        <li class="user-menu">
          <img src={user.photoURL} alt="profile">
          {user.displayName}
          <ul class="submenu">
            <li onclick={usercard}><i class="fa fa-user-circle"></i> Account</li>
            <li class="disabled" title="in dev"><i class="fa fa-gear"></i>Lorem ipsum</li>
            <li onclick={logOut}><i class="fa fa-sign-out"></i>sign out</li>
          </ul>
        </li>
        <li class="disabled"><i class="fa fa-gear"></i></li>
        <li><i class="fa fa-search"></i></li>
      </ul>
    </nav>
  </header>
  <script>
    this.user = this.parent.parent.user; //get the user object
    // console.log('from head' + this.parent.parent.user.uid + "/home");
    var that = this;
      logOut() {
        firebase.auth().signOut().then(function () {
          // Sign-out successful.
          route('home');
        }).catch(function (error) {
          // An error happened.
        });
      }

      this.on('mount', function () {
        firebase.auth().onAuthStateChanged(function (userObj) {
          that.parent.user = firebase.auth().currentUser;
          that.parent.update();
        })
      })

      usercard() {
        this.parent.usercard = true;
        this.parent.update();
      }

      this.on('mount', function() {
        $('.user-menu').mouseenter(function () {
          var submenu = document.querySelector('.submenu');
          submenu.classList.add('menu-active');
        })
        $('.user-menu').mouseleave(function () {
          var submenu = document.querySelector('.submenu');
          submenu.classList.remove('menu-active');
        })
      })


  </script>

  <style>
    header {
      border-bottom: 1px solid #F9FAFB;
      background: #fff;
    }

    
    header > nav > ul > li:nth-child(n+2):nth-child(-n+3) {
      border-right: 1px solid #EBECEE;
    }
    header > nav > ul > li{
      float: right;
      padding: 16px 30px;
    }

    header nav ul > .user-menu {
      padding-left: 7%;
      min-width: 100px;
      position: relative;
    }

    header > nav > ul > li {
      cursor: pointer;
    }
    
    header > nav > ul > li > img{
      height: 30px;
      left: 10%;
      vertical-align: middle;
    }

    header > nav > ul > li.user-menu > .submenu{
      position: absolute;
      background: #fff;
      width: 100%;
      right: 0;
      bottom: -50%;
      text-align: center;
      opacity: 0;
      z-index: -1;
      box-shadow: 2px 2px 15px 0 rgba(0, 0, 0, 0.1);
    }
    header > nav > ul > li.user-menu > .submenu.menu-active {
      animation: menuActive .3s ease-in-out forwards;
    }
    @keyframes menuActive {
      to{opacity: 1;bottom: -227%;z-index: 2;}
    }


    header > nav > ul > li.user-menu > .submenu > li{
      /* display: block; */
      padding: 10px 0;
    }
    header > nav > ul > li.user-menu > .submenu > li:hover{
      background-color: #f5f6fA;
    }
    header > nav > ul > li.user-menu > .submenu > li > i{
      padding: 0 5px;
    }



  </style>
</panel-head>
