
<panelHome>
  <div class="home-wrap" if={!homePage}>
    <!-- <h1>Hi this is home</h1> -->
    <section class="wrap tobeanimate">
      <div class="home-option card-shape pointer" each = {i in options} onclick={enter} ref={i.title}>
        <img src={i.imgSrc} alt={i.title} >
        <h3>{i.title}</h3>
        <p class="t-justify">{i.intro}</p>
      </div>
    </section>
  </div>

  <info if={homePage === "must-know-info"}></info>
  <scenarioSelection if={homePage === "learning-scenario"}></scenarioSelection>
  <reminder if={homePage === "reminder"}></reminder>

  <script>
  //  this.userInfo = this.parent.userInfo;
   this.options = [
     {
      imgSrc: "./img/mainpageMustknowinfo.png",
      title: "Must-Know Information",
      homePage: "must-know-info",
      intro: "Here are basic U.S. health care jargons and health insurance policies you need to know in order to understand what people are talking."
     },
     {
      imgSrc: "./img/main pageScenarios.png",
      title: "Learning Scenarios",
      homePage: "learning-scenario",
      intro: "You will experiencing 3 different situations. We will provide explanations/consequences regarding your choice, but the final decision is up to you."
     },
     {
      imgSrc: "./img/mainpageReminder.png",
      title: "Personalized Reminder",
      homePage: "reminder",
      intro: "Create your personal profile to receive insurance-related reminders (e.g., Exams, Vaccines, Claims...)."
     }
   ]

    enter(e) {
      this.homePage = e.item.i.homePage;
      window.location.href = window.location.href + '#' +  e.item.i.homePage
    }

    this.on('before-unmount', function() {
      // var wrap = document.querySelector('.tobeanimate');
      // // wrap.classList.remove('slideIn');
      // console.log(wrap);
    })

    this.on('mount', ()=> {
      let path = window.location.hash.split('/');
      let module = path[path.length - 1];
      if(module !== 'home') {
        window.location.href = window.location.href.replace(module, 'home')
      }
    })
  </script>

  <style>

    h1 {
      text-align: center;
      padding: 40px 0;
    }

    p {
      font-weight: lighter;
    }

    .wrap {
      display: flex;
      justify-content: center;
      text-align: center;
      flex-wrap: wrap;
      overflow: auto;
      height: calc(100% - 59px);
      animation: slideIn ease-in-out 1s forwards;
    }

    .wrap .home-option {
      border-radius: 5px;
    }

    .wrap .home-option h3{
      font-weight: 400;
    }

    .wrap .home-option img{
      width: 50px;
      height: 50px;
      border-radius: 50%;
    }
  </style>
</panelHome>
