
<logIn>

   <section class="login fix-center" ref="login">

     <video autoplay loop id="video-background" muted plays-inline ref="video">
      <source src="./img/login_v.mp4" type="video/mp4">
     </video>
     Your browser does not support the video tag.
     <div class="login-info">
      <p class="close"><i class="fa fa-close" onclick = {close}></i></p>
      <h2>Login In</h2>
      <p>Login with your account or your Google account to access the full website</p>
      <form action="">
        <span><i class="fa fa-user"></i></span><input type="text" placeholder="username"><br>
        <span><i class="fa fa-key"></i></span><input type="password" placeholder="password" id="pass">
        <button class="loginBtn signinBtn">Log In</button>
        <button class="loginBtn signupBtn">Sign Up</button>
      </form>
      <p id="google-login"><i class="fa fa-google" onclick={googleSign}></i></p>
      <p id="google-hint">Login With Google</p>
     </div>
   </section>


  <script>
    var that = this;
    close() {
      this.parent.loginPanel = false;
      this.parent.update();
    }
    googleSign() {
      var provider = new firebase.auth.GoogleAuthProvider();
      firebase.auth().signInWithPopup(provider).then(function (result) {
        var token = result.credential.accessToken;
        // The signed-in user info.
        var user = result.user;
        // ...
        route(user.uid);

        //should detect whether the uer already exist there in the firebase, otherwise it's gonna overwrite previours data
        var ifNewUser = true;
        var existedUser = undefined;
        var existedUserId = undefined;

        careGuruRef.once('value', (snapshot)=>{
          userIds = Object.keys(snapshot.val());
          userIds.forEach((i)=>{
            if(user.uid === i) {
              ifNewUser = false;
              existedUserId = i;
              return
            }
          })
        }).then(
          function() {
            if (ifNewUser) {
              //initialize user info object
              console.log('this is a new user')
              var userInfo = {
                name: user.displayName,
                uid: user.uid,
                profile: user.photoURL,
                firstLogin: true,
                surveyData: null,  //data can't be undefined, otherwise can't be pushed to firebase
                starredArticle: null
              }

              careGuruRef.child(user.uid).set(userInfo).catch(function (error) {
                console.log(error.code + error.message)
              });
            }
            that.parent.user = user;
            that.parent.update();
          }
        )
      }).catch(function (error) {
        // Handle Errors here.
        var errorCode = error.code;
        var errorMessage = error.message;
        // The email of the user's account used.
        var email = error.email;
        // The firebase.auth.AuthCredential type that was used.
        var credential = error.credential;
        console.log(error.code + error.message + error.email)
      });
    }



    this.on('mount', function() {
      var login = this.refs.login;
      login.classList.add('fallDown');
    })
    this.on('before-unmount', function() {
      var login = this.refs.login;
      login.classList.remove('fallDown');
    })

  </script>

  <style>
    .login {
      z-index: 21;
      width: 320px;
      height: 560px;
      box-shadow: 2px 2px 10px 0 rgba(0, 0, 0, 0.3);
      overflow: hidden;
    }
    .login::after {
      content: "";
      position: absolute;
      top: 0;
      bottom: 0;
      left: 0;
      right: 0;
      z-index: 23;
      background: rgba(0, 0, 0, 0.3);
      background: linear-gradient(0deg, rgba(0,0,0,0.5984768907563025) 0%, rgba(0,0,0,0.22032563025210083) 100%);
    }
    #video-background {
      position: absolute;
      width: 100%;
      min-height: 100%;
      object-fit: cover;
      z-index: 22;
    }
    .login-info {
      position: absolute;
      top: 0;
      bottom: 0;
      left: 0;
      right: 0;
      z-index: 24;
      background: transparent;
      color: #fff;
      /* display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      text-align: center; */
    }
    .login-info .close {
      text-align: right;
      padding: 10px 10px 0;
      cursor: pointer;
    }

    .login-info h2{
      text-align: center;
      padding: 60px;
    }
    .login-info p{
      padding: 10px 20px;
      text-align: center;
    }

    .login-info form{
      text-align: center;
      padding: 10px;
    }

    .login-info form input::placeholder{
        color: #fff;
        text-indent: 20%;
    }
    .login-info form input{
      width: 170px;
      height: 34px;
      background: rgba(255,255,255, 0.5);
      font-size: 1em;
      font-weight: 100;
      margin: 5px 0;
      color: #fff;
      padding: 3px 5px 3px 30px;
      box-sizing: border-box;
      display: inline-block;
    }
    .login-info form input#pass{
      transform: translateX(-3px);
    }

    .login-info form span {
      transform: translateX(20px);
      display: inline-block;
      position: relative;
    }
    .login-info form span::after {
      content: "";
      position: absolute;
      right: -5px;
      width: 1px;
      height: 80%;
      top: 0;
      bottom: 0;
      margin: auto 0;
      display: block;
      background: #fff;
    }

    .login-info form .loginBtn {
      margin: 10px 0;
      width: 150px;
      height: 40px;
      border: 1px solid #EE747A;
      background: transparent;
      transition: all .4s;
      color: #EE747A;
      border-radius: 4px;
      font-size: 0.9em;
    }

    .login-info form .signinBtn:hover {
      background: #fff;
      box-shadow: 3px 3px 10px 0 rgba(255, 255, 255, 0.3), -3px -3px 10px 0 rgba(255, 255, 255, 0.3);
    }

    .login-info form .signupBtn {
      margin: 0;
      background: #fff;
      box-shadow: 3px 3px 10px 0 rgba(255, 255, 255, 0.3), -3px -3px 10px 0 rgba(255, 255, 255, 0.3);
    }

    .login-info #google-login {
      padding: 0px;
      margin-top: 10px;
      font-size: 1.5em;
    }
    .login-info #google-login i{
      cursor: pointer;
      transition: all .4s;
    }

    .login-info #google-login i:hover {
      color: #EE747A;
    }

    .login-info #google-hint {
      padding: 0;
      font-size: 10px;
    }

    </style>
</logIn>
