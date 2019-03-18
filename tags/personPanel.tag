<personPanel>
  <section class="wrap">
    <panel-sidebar class="sidebar"></panel-sidebar>
    <main>
      <panel-head></panel-head>
      <panelHome if={ subpage === `${this.uid}/home` }></panelHome>
      <panel-product if={ subpage === `${this.uid}/product` }></panel-product>
      <panelContact if={ subpage === `${this.uid}/contact` }></panelContact>
      <panelSaved if={ subpage === `${this.uid}/saved` && viewAll }></panelSaved>
      <panelSaved-view if={ eachSaved } data = { eachSaved }></panelSaved-view>
    </main>
    <panel-user-card if={usercard}></panel-user-card>
  </section>

  <script>
    var that = this;
    this.subpage = 'home';
    this.uid = this.parent.user.uid; //obtain the user id and transform it into the unique subpage URL
    this.userInfo;
    this.currentPage; //obtain the current page name
    this.viewAll = true;
    this.eachSaved = false;

    var subRoute = route.create();
    subRoute(`${this.uid}/*`, function(page) {
      that.subpage = that.uid + "/" + page;
      that.currentPage = page;
      that.update();
    })
    subRoute(this.uid, function(page) {
      that.subpage = that.uid + '/home';
      that.currentPage = 'home';
      that.update();
    })

    this.on('mount', function(){
      route.exec();


//---------------------------very Critical Step-------------------------------------//
     //do query from database to get the right user info
      careGuruRef.orderByKey().equalTo(that.uid).on('value', function(e) {
        var data = Object.values(e.val())[0];
        that.userInfo = data;
        that.tags.panelhome.userInfo = data; // pass the data to the child component for later use
        that.tags.panelhome.update();
      })
    })

    this.on('unmount', function() {
      subRoute.stop();
    })

  </script>


  <style>
    .wrap {
      display: flex;
      width: 100%;
      height: 100%;
    }

    .wrap .sidebar, .wrap main {
      flex: 1 1;
      background: #ccc;
    }

    .wrap .sidebar{
      max-width: 70px;
      background-color: #fff;
      position: relative;
      box-shadow: 3px 0 15px 0 rgba(0, 0, 0, 0.1);
    }

    .wrap .sidebar li {
      font-size: 1.4em;
    }

    .wrap main {
      background-color: #F5F6FA;
    }

  </style>


</personPanel>
