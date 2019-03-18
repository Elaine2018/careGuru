
<panel-product>
  <section class="wrap-product wrap-anime">
    <div class="pre-survey" if={!surveyStart && !surveyAlreadyDone}>
      <h1 class='mt-3 mb-3'>Let us create you a personalized health reminder</h1>
      <div class='intro-wrap'>
        <p>Each year, you have many health screenings to do to insure you're in healthy condition. Once you provide some basic information, CareGuru will create a personalized reminder for you so you can keep tracking of these screenings. </p>
        <p>Once you complete this form, go to the "personalized reminder" session in homepage to access your reminder.</p>
      </div>
      <a class="startbutton mt-3" onclick={startSurvey}>Let's do it!</a>
    </div>

    <div class="surveyData m-3" if={surveyAlreadyDone}>
      <h1 class='mt-3 mb-3'>You've finished the Survey Successfully!</h1>
      <p each="{value, key in surveyData}">
        <span class="">{key}</span>
        :
        <span class="">{value}</span>
      </p>
      <a class="startbutton mt-3" onclick={refill}>Refill the survey</a>
    </div>

    <!--  survey to fill  -->
    <survey if={surveyStart && !surveyAlreadyDone}></survey>
  </section>

  <script>
    this.surveyStart = false;
    this.surveyData = null;


    startSurvey() {
      this.surveyStart = true;
    }
    refill(){
      this.surveyAlreadyDone = false;
      this.surveyStart = true;
      this.update()
    }

    //if finished survey already;
    //show the result instead of the prompt
    this.surveyAlreadyDone = false;

    this.on('mount', ()=> {
      //get the cloudbase data about whether this user has finished the survey already
      firebase.database().ref("/careGuru/" + this.parent.uid + "/surveyFinished").once('value')
        .then(data=>{
          this.surveyAlreadyDone = !!data.val();
          //get the survey data
          if(this.surveyAlreadyDone) {
            firebase.database().ref("/careGuru/" + this.parent.uid + "/surveyData").once('value')
              .then(data2=>{
                this.surveyData = data2.val();
                this.update();
              })
          }else {
            this.update()
          }
        });
    })

  </script>

  <style>

    h1 {
      font-size: 2em;
    }
    .wrap-product {
      font: "proxima nova";
    }

    .intro-wrap p{
      font-size: 1.3em;
    }

    .pre-survey {
      padding: 30px;
      margin: 0 auto;
      max-width: 70%;
    }

    .startbutton {
      color: #EE7379;
      font-weight: 100;
      font-size: 20px;
      text-align: center;
      border-radius: 5px;
      border: solid 2px #EE7379;
      padding: 3px 25px;
      min-width: 100px;
      transition-duration: 400ms;
      cursor: pointer;
      display: inline-block;
    }

    .startbutton:hover {
      background-color: #EE7379;
      color: #fff;
    }


    .submitbutton:hover {
      background-color: #F07277;
      color: #fff;
    }

  </style>
</panel-product>
