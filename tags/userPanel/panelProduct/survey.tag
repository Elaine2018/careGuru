
<survey>

  <ul class="progress">
    <li class="t-center" each={ i, index in surveyData} data-num = {index}>{index + 1}</li>
  </ul>
  <p class = "tipText">Press "Enter" key to record your answers</p>


  <section class="wrap-survey wrap-anime">
    <div class="wrap-survey-inner">
      <div class="question-wrap" each = {i, index in surveyData} id = {"index"+ index}>
        <h3>{i.question}</h3>
        <input type="text" onkeydown={inputAnswer} id = {"input"+ index}>
      </div>
    </div>
  </section>
  <!-- <button class="submitbutton" onclick={submit} >Submit it! </button> -->


  <script>
    var that = this;
    this.uid = this.parent.parent.uid;
    this.surveyData = [
      {
        question: "What's your age? Please type in a number.",
        data: "age"

      },
      {
        question: "What's your physical gender? Please type male or female.",
        data: "gender"
      },
      {
        question: "Do you have school insurance? Please type yes or no. ",
        data: "schoolInsurance"
      },
      {
        question: "Which school are you attending?",
        data: "schoolAttending"
      },
      {
        question: "When do your current insurance expire? Please type in the date in yyyy-mm-dd format.",
        data: "insuranceExprieDate"
      }
    ]

    this.scrollDistance = 0;
    this.surveyAnswerData = {};
    inputAnswer(e) {



      if(e.which == 13) {
        var answer = e.target.value;
        //move focus to the next input
        var currentIndex = e.target.id.replace(/input/g, '') - 0;
        var brotherId = currentIndex + 1;
        if(answer) {
          var id = e.item.index + '';
          var selector = "[data-num='" + id + "']";
          var el = document.querySelector(selector)
          el.classList.add('finish');

          //obtain the data intended
          var data = e.item.i.data;
          this.surveyAnswerData[data] = answer;


        }else{
          console.log('there is nothing')

        }


        //judge the if this is last question
        if(brotherId < this.surveyData.length) {
          document.querySelector(`#input${brotherId}`).focus();
          //move view to the next input
          var offsetTop = e.target.offsetTop;
          var parentDiv = e.target.parentElement.parentElement;
          var distance = offsetTop - parentDiv.scrollTop -100;
          // var currentDistance = document.querySelector(`#index${currentIndex}`).getBoundingClientRect().height;
          // this.scrollDistance = this.scrollDistance + currentDistance;
          var time = Math.abs((distance / 100) * 200);
          var coords = { y: parentDiv.scrollTop }
          var tween = new TWEEN.Tween(coords).to({ y: parentDiv.scrollTop + distance }, time)
              .easing(TWEEN.Easing.Quadratic.InOut)
              .onUpdate(function () {
                parentDiv.scrollTop = coords.y;
              })
              .start();
        }else {
          firebase.database().ref("/careGuru/" + this.uid + "/surveyData").set(that.surveyAnswerData);
          firebase.database().ref("/careGuru/" + this.uid + "/surveyFinished").set(true)

          //notify the parent about the survey completion
          this.parent.surveyAlreadyDone = true;
          this.parent.surveyData = that.surveyAnswerData;
          this.parent.update();
          alert("Thank you for completing the questionnaire");
        }
      }
    }


    this.on('mount', function() {
      function animate(time) {
        requestAnimationFrame(animate);
        TWEEN.update(time);
      }
      requestAnimationFrame(animate);
    })

  </script>

  <style>
    .tipText {
      color: #EE7379;
      display: flex;
      width: 50%;
      margin: 0 auto;
      padding-top: 30px;
      justify-content: space-around;
      text-align: center;
    }
    .progress {
      display: flex;
      width: 50%;
      margin: 0 auto;
      padding-top: 50px;
      justify-content: space-around;
    }
    .progress > li {
      position: relative;
      color: #DFE2E9;
      line-height: 20px;
      border: 1px solid #DFE2E9;
      width: 20px;
      height: 20px;
      border-radius: 50%;
      transition: all 1s;
      transition-delay: 1s;
    }
    .progress > li:after {
      content: "";
      position: absolute;
      width: 0;
      left: 21px;
      top: 0;
      bottom: 0;
      margin: auto 0;
      height: 4px;
      background-color: #DFE2E9;
      transition: all 1s ease-in-out;
      transition-delay: 2s;
    }
    .progress > li:before {
      content: "";
      position: absolute;
      left: -55px;
      top: 0;
      bottom: 0;
      margin: auto 0;
      height: 4px;
      width: 0;
      background-color: #DFE2E9;
      transition: all 1s ease-in-out;
    }

    .progress > li.finish {
      border-color: #EE7379;
      background: #EE7379;
      color: #fff;
    }
    .progress > li.finish:after {
      width: 52px;
      background-color: #EE7379;
    }
    .progress > li.finish:before {
      width: 55px;
      background-color: #EE7379;
    }







    .wrap-survey {
      width: 400px;
      height: 400px;
      margin: 0 auto;
      margin-top: 50px;
      overflow: hidden;
      position: relative;
    }

    .wrap-survey::after {
      content: "";
      position: absolute;
      pointer-events: none;
      top: 0;
      right: 0;
      bottom: 0;
      left: 0;
      background: transparent;
      background: linear-gradient(0deg, rgba(245,246,250,1) 0%, rgba(255,255,255,0) 50%, rgba(245,246,250,1) 100%);
    }

    .wrap-survey .wrap-survey-inner {
      width: 100%;
      height: 100%;
      overflow-y: scroll;
      padding-right: 17px;
      box-sizing: content-box;
    }
    .wrap-survey .wrap-survey-inner .question-wrap {
      padding: 30px 0;
    }
    .wrap-survey .wrap-survey-inner .question-wrap input{
      font-size: 1em;
      width: 80%;
      height: 40px;
      border-radius: 5px;
      padding: 3px;
    }

    .wrap-survey .wrap-survey-inner .question-wrap:first-child {
      margin-top: 200px;
    }
     .question-wrap:last-child {
      margin-bottom: 200px;
     }


     .submitbutton {
      font: "proxima nova";
      color: #F07277;
      font-weight: 100;
      font-size: 20px;
      text-align: center;
      border-radius: 50px;
      border: solid 2px #F07277;
      padding: 3px 10px;
      margin-top: 10px;
      background: transparent;
      -webkit-transition-duration: 400ms;
      transition-duration: 400ms;
    }

  </style>
</survey>
