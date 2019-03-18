
<infoOpen>
  <section class="infoOpen-wrap wrap-anime">
    <main class="card-body">
      <h3 class="title">{this.opts.data.title}</h3>
      <p class="t-justify">{this.opts.data.content}</p>
    </main>
    <footer class="card-footer">
      <div class={ "foot-left": true, starred: this.opts.data.starred } onclick={star} id = {this.opts.data.id}>
        <i class="fa fa-star"></i> STAR
      </div>
      <div class="foot-right" onclick={close}>
        CLOSE
      </div>
    </footer>
  </section>
  
  
  <script>
    var that = this;
    this.userInfo = this.parent.userInfo;
    this.on('before-unmount', function() {
      
    })

    close() {
      var card = document.querySelector('.infoOpen-wrap');
      card.classList.add('animate-out');
      setTimeout(() => {
        this.parent.openedCard = undefined;
        that.parent.update();
      }, 500);
    }

    star(e) {
      //give the star a style change temporarily (in the view layer)
        var alreadyStarred = Object.values(e.currentTarget.classList).includes('starred');
        //remove star label from the firebase database
        if (alreadyStarred) {
          var key = that.opts.data.firebaseId;
          firebase.database().ref("/careGuru/" + this.userInfo.uid + "/starredArticle/" + key).set(null);
          e.currentTarget.classList.remove('starred');
          this.updateParentStarEffect(e);  
          return;
        }

        //label the item as starred one in the database
        e.currentTarget.classList.add('starred');
        var key = firebase.database().ref("/careGuru/" + that.userInfo.uid + "/starredArticle").push().key;
        firebase.database().ref("/careGuru/" + that.userInfo.uid + "/starredArticle/" + key).set(that.opts.data);
      
        //update the parent info.tag view layer
        this.updateParentStarEffect(e);
      }

      updateParentStarEffect(e) {
        var infoPieceId = e.currentTarget.id;
        this.parent.infoPieceData[infoPieceId].starred = !this.parent.infoPieceData[infoPieceId].starred;
        this.parent.update();
      }
  </script>

  <style>
    .infoOpen-wrap {
      position: fixed;
      left: 0;
      right: 0;
      top: 0;
      bottom: 0;
      margin: auto;
      width: 300px;
      max-height: 400px;
      background-color: #fff;
      box-shadow: 1px 1px 13px 0px rgba(43,43,43,.3);
    }

    .infoOpen-wrap .card-body {
      overflow: auto;
      height: 88%;
      padding: 20px 25px;
      box-sizing: border-box;
    }
    .infoOpen-wrap .card-body .title {
      text-align: center;
    }
    .infoOpen-wrap .card-footer {
      display: flex;
      position: absolute;
      bottom: 0;
      left: 0;
      width: 100%;
      text-align: center;
    }
    .infoOpen-wrap .card-footer > * {
      padding: 10px 0;
      flex: 1 1 auto;
      cursor: pointer;
    }
    
    .infoOpen-wrap .card-footer > *:first-child {
      
      border-right: 1px solid rgb(230, 230, 230);
    }
    
    .infoOpen-wrap .card-footer > *:first-child > i {
      color: rgb(230, 230, 230);
    }


    .infoOpen-wrap .card-footer > *:first-child.starred > i{
      color: #FFC748;
    }

    .infoOpen-wrap .card-footer > *:first-child.starred {
      position: relative;
      overflow: hidden;  
    }
    .infoOpen-wrap .card-footer > *:first-child.starred::after{
      content: "";
      position: absolute;
      left: 0;
      bottom: 0;
      border-radius: 50%;
      background: #FFC748;
      animation: starIt 1s linear;
      transform-origin: center;

    }

    @keyframes starIt {
      0% {left: -50%; width: 0;height: 0;opacity: 0; transform: translateX(-50%);transform: translateY(50%);}
      50% {left: -50%;width: 200px;height: 200px;opacity: 0.3;transform: translateX(-50%);transform: translateY(50%);}
      100% {left: -50%;width: 300px;height: 300px;opacity: 0;transform: translateX(-50%);transform: translateY(50%);}
    }
    </style>
</infoOpen>
