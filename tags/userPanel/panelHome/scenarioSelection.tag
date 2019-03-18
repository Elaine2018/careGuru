<scenarioSelection>

  <section class="wrap-anime wrap">
    <div class="card-shape" each = {i in scenarioData} onclick={selectScenario} if={!currentScenario}>
       { i.scenarioName }
       <div class="card-shape-preview">
         <img src={i.scenarioImage || "./img/Scenario2.png"} alt="">
        </div>
    </div>
  </section>

  <!-- <button type="button" name="button" each = {i in scenarioData} onclick={selectScenario} if={!currentScenario} class="sceneSelect wrap-anime"> { i.scenarioName }</button> -->

  <section class="eachScenario">
    <scenario each={i in scenarioData } data= { i } } if={i.scenarioID == this.currentScenario}></scenario>
  </section>

  <script>

    // this.currentScenario = this.scenarioData[0];
    this.currentScenario = undefined;


    this.scenarioData =
    [
      {
        scenarioID: 1,
        scenarioImage: "./img/Scenario1.png",
        scenarioName: "Scenario 1",
        scenarioIntroduction: "Hello! I'm Greg. I'm 20 years old. I'm a junior in Boston College junior. I'm an international student from Singapore, and I have BC’s student health insurance.",
        scenarioContent:
        [
          {
              question: "George noticed Greg’s situation and tried to help. Greg told George his situation and says he’s in stable condition. As George, what should you do?",
            descrip: "Before Christmas, Greg went to snowboarding in Vail, Colorado with a friend. It’s his first time on the snow so he’s excited. His friend, George, is an experienced snowboarder. After a few practices on the learning slope, Greg became very confident on himself and decided to go to a blue trail with George. The first run went well and Greg started to loose his carefulness. On his second run, Greg failed to manage his speed at a shape turn, and hit a tree. He went unconscious. Fortunately, Greg’s helmet got his consciousness back quickly, but he felt difficult to breath well because of the hit in his chest. He’s left shin also hurts badly and couldn’t stand up. ",
            imgurl: "./img/sad3.png",
            sceneId: 1,
            options:
            {
              option1:
              {
                optionName: "Call 911 to ask for an ambulance",
                optionLinkTo: 4,
                optionResults:
                {
                  health: +20,
                  money: -40
                },
                optionWarn:
                {
                  warnName: "Have you think about: Even though 911 is the go-to resource for seeking emergency help, they may not have equipment and access to go up to the mountain. This may result a very long waiting time or being redirected to other rescuing agencies.",
                  choosedFeedback: "911 answered the call and come to the ski resort. However, their vehicle couldn’t come up to where Greg is. Paramedics asked the Ski Patrol to rescue Greg down and took him into the hospital directly after half an hour. Greg got x-rayed and diagnosed by a doctor. He’s fibula has a crackle. Everything else is fine. Doctor put his shin in a cast."
                }
              },
              option2:
              {
                optionName: "Help Greg to snowboard down to the Ski Patrol office for help.",
                optionLinkTo: 3,
                optionResults:
                {
                  health: -45,
                  money: -0
                },
                optionWarn:
                {
                  warnName: "STOP! Moving an injured person without medical assessment is extremely risky and may cause further injuries.",
                  choosedFeedback: "You and Grey managed to come down to the bottom (miraculously), but Grey’s situation is much more worse. He’s in huge pain. Greg found unsafe to let you make decisions for him. He decided to make his own decisions."
                }
              },
              option3:
              {
                optionName: "Ask an experienced skier who is passing by to contact Ski Patrol for help.",
                optionLinkTo: 2,
                optionResults:
                {
                  health: + 0,
                  money: + 0
                },
                optionWarn:
                {
                  warnName: "Make sure the skier knows the exact location and what happened to Greg.",
                  choosedFeedback: "Ski patrollers got notified and came to Gray in around 10 minutes. They put Greg in a rescue toboggan to take him down the mountain."
                }
              },
              option4:
              {
                optionName: "Snowboard down the mountain yourself to the Ski Patrol office for help.",
                optionLinkTo: 2,
                optionResults:
                {
                  health: -10,
                  money: + 0
                },
                optionWarn:
                {
                  warnName: "Are you sure? Greg is injured and in pain. Are you sure you want to leave him in the cold alone and unattended?",
                  choosedFeedback: "Greg waited in the cold by himself lonely and scared for around 10 minutes. Ski patrollers came and put Greg in a rescue toboggan to take him down the mountain."
                }
              }
            }
          },// end of scenario 1 scene 1
          {
            question: "As Greg, what do you want to do?",
            descrip: "In the Ski Patrol office, patrollers examined Greg briefly. Greg seemed very conscious, and could response to all questions normally. His breathing difficulties went away. His blood pressure and other health indicating measurements were within normal range. However,  his left shin kept giving him pain. The on-site doctor said she couldn’t tell if Greg’s bones are broken because of no x-ray. She gave Greg ice packs, wrapped his shin with supports, and suggested Greg to go to another doctor. ",
            imgurl: "./img/sad2.png",
            sceneId: 2,
            options:
            {
              option1:
              {
                optionName: "Ask the ski patrol office to call you an ambulance",
                optionLinkTo: 4,
                optionResults:
                {
                  health: +30,
                  money: -40
                },
                optionWarn:
                {
                  warnName: "Ambulances are expensive. Do you know how much your insurance will cover if you call an ambulances? Also, emergency rooms rank patients’ priorities by the seriousness of their conditions. Non life-threatening conditions may result in long waiting time.",
                  choosedFeedback: "Ambulance came and took Greg into the emergency room of a nearby hospital. He’s fibula has a crackle. Everything else is fine. Doctor put his shin in a cast."
                }
              },
              option2:
              {
                optionName: "Ask George to drive you to an emergency room",
                optionLinkTo: 4,
                optionResults:
                {
                  health: +25,
                  money: -25
                },
                optionWarn:
                {
                  warnName: "You’re on your way to see a doctor! But before you go, consider this:  emergency rooms rank patients’ priorities by the seriousness of their conditions. Non life-threatening conditions may result in long waiting time. Also, base on your insurance policy, you may pay more than visiting an urgent care center.",
                  choosedFeedback: "Greg waited in the emergency room for one and half hours. A doctor took Greg’s x-ray and diagnosed him. He’s fibula has a crackle. Everything else is fine. Doctor put his shin in a cast."
                }
              },
              option3:
              {
                optionName: "Ask George to drive you to an urgent care center",
                optionLinkTo: 4,
                optionResults:
                {
                  health: +25,
                  money: -10
                },
                optionWarn:
                {
                  warnName: "You’re on your way to see a doctor! Normally visiting an urgent care center cost less and take less waiting time. However, double check with the on-site doctor if Greg has any life-threatening conditions before you go. If he does, go the the emergency room immediately.",
                  choosedFeedback: "Greg got x-rayed and diagnosed by a doctor. He’s fibula has a crackle. Everything else is fine. Doctor put his shin in a cast."
                }
              },
              option4:
              {
                optionName: "Go back to the hotel since you think the shin will gets better and you doesn’t want to pay medical bills.",
                optionLinkTo: 3,
                optionResults:
                {
                  health: -20,
                  money: + 0
                },
                optionWarn:
                {
                  warnName: "You’re risking your health! If you don’t get treatment on time, it’s possible that undiagnosed injuries pose high risks to your well-being, and potentially put you into critical conditions.",
                  choosedFeedback: "Greg’s leg kept hurting him, and on the next morning, his shin became turgid."
                }
              },
              option5:
              {
                optionName: "Wait until you go back to boston to see a doctor, because you’re under student insurance and need referrals from the student health center to see a doctor.",
                optionLinkTo: 3,
                optionResults:
                {
                  health: -20,
                  money: + 0
                },
                optionWarn:
                {
                  warnName: "Wrong assumption! Read your school’s health care website and your insurance policy. You do not need  referrals when it’s an emergency.",
                  choosedFeedback: "Greg waited till the next morning. Greg’s leg kept hurting him and his shin became turgid."
                }
              }
            }
          },// end of scenario 1 scene 2
          {
            question: "As Greg, what do you want to do?",
            descrip: "Greg realized he must find medical help for his injury.",
            imgurl: "./img/dizzy2.png",
            sceneId: 3,
            options:
            {
              option1:
              {
                optionName: "Go to an emergency room",
                optionLinkTo: 4,
                optionResults:
                {
                  health: +45,
                  money: -30
                },
                optionWarn:
                {
                  warnName: "You’re on your way to see a doctor! But before you go, consider this:  emergency rooms rank patients’ priorities by the seriousness of their conditions. Non life-threatening conditions may result in long waiting time. Also, base on your insurance policy, you may pay more than visiting an urgent care center.",
                  choosedFeedback: "Greg waited in the emergency room for two hours. A doctor took Greg’s x-ray and diagnosed him. He’s fibula has a crackle. Everything else is fine. Doctor put his shin in a cast."
                }
              },
              option2:
              {
                optionName: "Go to an urgent care center.",
                optionLinkTo: 4,
                optionResults:
                {
                  health: +45,
                  money: -15
                },
                optionWarn:
                {
                  warnName: "You’re on your way to see a doctor! Normally visiting an urgent care center cost less and take less waiting time. But before you go, make sure you don’t have any life-threatening symptoms.",
                  choosedFeedback: "Greg got x-rayed and diagnosed by a doctor. He’s fibula has a crackle. Everything else is fine. Doctor put his shin in a cast."
                }
              },
              option3:
              {
                optionName: "Go find a physician to be your new primary care provider and ask the physician to refer you to a orthopedist.",
                optionLinkTo: 4,
                optionResults:
                {
                  health: +30,
                  money: -10
                },
                optionWarn:
                {
                  warnName: "Are you sure? A primary care physician provides the first contact for a person with an undiagnosed health concern, however, in this case, getting referral from a physician and wait to see an orthopedist may take days.",
                  choosedFeedback: "A day later, Greg went to a physician. However, the physician send him to the urgent care center after a brief examination. The physician’s office doesn’t have x-ray equipment. This caused Greg an extra bill. In the urgent care center, Greg got x-rayed and diagnosed by a doctor. He’s fibula has a crackle. Everything else is fine. Doctor put his shin in a cast."
                }
              },
            }
          }, // end of scenario 1 scene 3
          {
            question: "As Greg, how to fill out information about your insurance?",
            descrip: "After being treated, a nurse came in and gave Greg a lot of paper works to fill. The form asked for personal information as well as insurance information, such as your insurance ID number. But Greg didn’t have a copy of his insurance. Ahh so much paperwork! ",
            imgurl: "./img/sad1.png",
            sceneId: 4,
            options:
            {
              option1:
              {
                optionName: "Leave insurance information blank and decide just to pay the full bill",
                optionLinkTo: 5,
                optionResults:
                {
                  health: +0,
                  money: -20
                },
                optionWarn:
                {
                  warnName: "Ahhh are you sure? Emergency medical care and examinations are not cheap. Plus you already paid a lot for your insurance plan. Why not save these money for a trip to Alaska?",
                  choosedFeedback: "Since you didn’t provide the hospital your insurance information,the care provider sent you bills directly."
                }
              },
              option2:
              {
                optionName: "Call your school’s student health center, and ask them about this",
                optionLinkTo: 6,
                optionResults:
                {
                  health: +0,
                  money: +15
                },
                optionWarn:
                {
                  warnName: "Student health center is a good resource when you have any question about medical issues. Give them a call when you don’t know where to find answers. But will someone pick up the phone in Christmas?",
                  choosedFeedback: "Awww the office was closed because of the holiday. Lucky, you know a friend who works as the receptionist at student health, and he directed you to the correct website to find the information. Your insurance company covered a large portion of your bills! Remember to respond to phone calls and mails from your insurance company to avoid any inconveniences. "
                }
              },
              option3:
              {
                optionName: "Go to your insurance company’s website to find the brochure of your plan.",
                optionLinkTo: 5,
                optionResults:
                {
                  health: +0,
                  money: -20
                },
                optionWarn:
                {
                  warnName: "Everyone in you school use the same policy documents to check their benefits. But clearly the forms is asking your personal information. Are you sure this brochure can give you the correct information?",
                  choosedFeedback: "You found your policy brochure online, and mistakenly thought the policy number was your insurance ID number. The insurance company couldn’t located you. Therefore, the care provider sent you bills directly."
                }
              },
              option4:
              {
                optionName: "Go to your school’s student health website and find a digital copy of your insurance card",
                optionLinkTo: 6,
                optionResults:
                {
                  health: +0,
                  money: +15
                },
                optionWarn:
                {
                  warnName: "You’re looking at the correct place. Once you log in with our student id (or other forms of credentials), you’ll be able to see a digital copy of your insurance card. Do you know what’s GRP and which number is your insurance ID?",
                  choosedFeedback: "Your insurance company covered a large portion of your bills! Remember to respond to phone calls and mails from your insurance company to avoid any inconveniences."
                }
              }
            }
          }, //end of scenario 1 scene 4
          {
            question: "As Greg, what can you do?",
            descrip: "Greg went back to Boston after his ski trip. Weeks later, Greg received bills that contained visit fees, laboratory fees, and doctor fees. Greg found the amount was too high to afford. He wanted to see if he could still use his insurance to cover some of the expense.",
            imgurl: "./img/dizzy1.png",
            sceneId: 5,
            options:
            {
              option1:
              {
                optionName: "Go to your insurance website and follow instruction about how to fill a claim",
                optionLinkTo: 6,
                optionResults:
                {
                  health: +0,
                  money: +30
                },
                optionWarn:
                {
                  warnName: "Most insurance companies request you to fill out claim forms and provide supporting documents like your bills and receipts. Be sure to check all the requirement carefully and keep all the document.",
                  choosedFeedback: "You mailed your claim and other documents. A few weeks later, your insurance company mailed their reimbursement decision and an updated bill to you."
                }
              },
              option2:
              {
                optionName: "Call student health office to request reimbursement.",
                optionLinkTo: 6,
                optionResults:
                {
                  health: +0,
                  money: +30
                },
                optionWarn:
                {
                  warnName: "Insurance companies handle most of your medical expense, so the student health office can’t offer your reimbursement directly. However, contact your school to ask questions about filing a claim and basically all other questions about health you may have.",
                  choosedFeedback: "Student health staff helped you to find the claim form and explained how to file the form. You mailed your claim and other required documents. A few weeks later, your insurance company mailed their reimbursement decision and an updated bill to you."
                }
              },
              option3:
              {
                optionName: "Call hospital to discuss the bill with them.",
                optionLinkTo: 6,
                optionResults:
                {
                  health: +0,
                  money: +30
                },
                optionWarn:
                {
                  warnName: "Hospital or other care providers may waive some of the charges if the patients can prove significant financial hardship. However, they don’t provide insurance benefits. Call your insurance company or student health center to ask what to do.",
                  choosedFeedback: "Insurance company staff helped you to find the claim form and explained how to file the form. You mailed your claim and other required documents. A few weeks later, your insurance company mailed their reimbursement decision and an updated bill to you."
                }
              }
            }
          }, //end of scenario 1 scene 5
          {
            question: "As Greg, which care provider you should go to?",
            descrip: "After coming back to Boston, Greg realized he need to visit a doctor to check how his bone is healing, and got instructions about what to do next.",
            imgurl: "./img/happy1.png",
            sceneId: 6,
            options:
            {
              option1:
              {
                optionName: "Student health center",
                optionLinkTo: 7,
                optionResults:
                {
                  health: +20,
                  money: -5
                },
                optionWarn:
                {
                  warnName: "Student health center is most students’ primary care provider, and most physician and medical professionals there don’t necessarily specialize in  orthopedics. Student health center can refer students to specialists.",
                  choosedFeedback: "Doctor at the student health center referred your to an in-network orthopedist. Because your insurance company is notified, you don’t have additional claims to do. You only need to pay a small copay and coinsurance."
                }
              },
              option2:
              {
                optionName: "A clinic with an orthopedist.",
                optionLinkTo: 7,
                optionResults:
                {
                  health: +20,
                  money: -20
                },
                optionWarn:
                {
                  warnName: "Orthopedists specialize in medicine concerned with injuries of the skeleton. They can give you treatment related to the injury. However, before you go, check if your insurance policy require a referral from your primary care provider to avoid high bills. Also, remember to choose an in-network orthopedist to maximize your insurance pay",
                  choosedFeedback: "You went to an orthopedist, got treated,  and gave the doctor’s office your insurance information. Weeks later, you received a large bill. Because you don’t have a referral, your insurance company declined to pay."
                }
              },
              option3:
              {
                optionName: "A hospital",
                optionLinkTo: 7,
                optionResults:
                {
                  health: +20,
                  money: -20
                },
                optionWarn:
                {
                  warnName: "Large hospitals is very likely to have orthopedist department and can provide proper treatment. However, before you go, check if your insurance policy require a referral from your primary care provider to avoid high bills. Keep in mind that hospitals may result a higher cost. Also, remember to choose an in-network provider to maximize your insurance pay",
                  choosedFeedback: "You went to a hospital, got treated,  and gave the doctor’s office your insurance information. Weeks later, you received a large bill. Because you don’t have a referral, your insurance company declined to pay."
                }
              }
            }
          }, //end of scenario 1 scene 6
          {
            question: "",
            descrip: "Congratulation for completing the first learning scenario! Please check the “Must-Know Information” session if you need to review any information.",
            imgurl: "./img/happy1.png",
            sceneId: 7,
          }, //end of scenario 1 scene 7
        ]
      }, // end of scenario 1
      {
        scenarioID: 2,
        scenarioImage: "./img/Scenario2.png",
        scenarioName: "Scenario 2",
        scenarioIntroduction: "Scenario 2 - need update",
        scenarioContent:
        [
          {
            question: "question 1",
            descrip: "descrip 1",
            imgurl: "sadsadada",
            sceneId: 1,
            options:
            {
              option1:
              {
                optionName: "option 1",
                optionLinkTo: 4,
                optionResults:
                {
                  health: +25,
                  money: -40
                },
                optionWarn:
                {
                  warnName: "option 1 warnName",
                  choosedFeedback: "option 1 choosedFeedback"
                }
              },
              option2:
              {
                optionName: "option 2",
                optionLinkTo: 3,
                optionResults:
                {
                  health: -50,
                  money: -0
                },
                optionWarn:
                {
                  warnName: "option 2 warnName",
                  choosedFeedback: "option 2 choosedFeedback"
                }
              },
              option3:
              {
                optionName: "option 3",
                optionLinkTo: 2,
                optionResults:
                {
                  health: + 0,
                  money: + 0
                },
                optionWarn:
                {
                  warnName: "option 3 warnName",
                  choosedFeedback: "option 3 choosedFeedback"
                }
              },
              option4:
              {
                optionName: "option 4",
                optionLinkTo: 2,
                optionResults:
                {
                  health: -5,
                  money: + 0
                },
                optionWarn:
                {
                  warnName: "option 4 warnName",
                  choosedFeedback: "option 4 choosedFeedback"
                }
              }
            }
          },// end of scenario 2 scene 1
          {
            question: "question 2",
            descrip: "descrip 2",
            imgurl: "sadsadada",
            sceneId: 2,
            options:
            {
              option1:
              {
                optionName: "option 1",
                optionLinkTo: 4,
                optionResults:
                {
                  health: +30,
                  money: -40
                },
                optionWarn:
                {
                  warnName: "option 1 warnName",
                  choosedFeedback: "option 1 choosedFeedback"
                }
              },
              option2:
              {
                optionName: "option 2",
                optionLinkTo: 4,
                optionResults:
                {
                  health: +30,
                  money: -25
                },
                optionWarn:
                {
                  warnName: "option 2 warnName",
                  choosedFeedback: "option 2 choosedFeedback"
                }
              },
              option3:
              {
                optionName: "option 3",
                optionLinkTo: 4,
                optionResults:
                {
                  health: +30,
                  money: -10
                },
                optionWarn:
                {
                  warnName: "option 3 warnName",
                  choosedFeedback: "option 3 choosedFeedback"
                }
              },
              option4:
              {
                optionName: "option 4",
                optionLinkTo: 3,
                optionResults:
                {
                  health: -20,
                  money: + 0
                },
                optionWarn:
                {
                  warnName: "option 1 warnName",
                  choosedFeedback: "option 1 choosedFeedback"
                }
              },
              option5:
              {
                optionName: "option 5",
                optionLinkTo: 3,
                optionResults:
                {
                  health: -20,
                  money: + 0
                },
                optionWarn:
                {
                  warnName: "option 5 warnName",
                  choosedFeedback: "option 5 choosedFeedback"
                }
              }
            }
          }, // end of scenario 2 scene 2
        ]
      }, // end of scenario 2
      {
        scenarioID: 3,
        scenarioImage: "./img/Scenario3.png",
        scenarioName: "Scenario 3",
        scenarioIntroduction: "Scenario 3 - need update",
        scenarioContent:
        [
          {
            question: "question 1",
            descrip: "descrip 1",
            imgurl: "sadsadada",
            sceneId: 1,
            options:
            {
              option1:
              {
                optionName: "option 1",
                optionLinkTo: 4,
                optionResults:
                {
                  health: +25,
                  money: -40
                },
                optionWarn:
                {
                  warnName: "option 1 warnName",
                  choosedFeedback: "option 1 choosedFeedback"
                }
              },
              option2:
              {
                optionName: "option 2",
                optionLinkTo: 3,
                optionResults:
                {
                  health: -50,
                  money: -0
                },
                optionWarn:
                {
                  warnName: "option 2 warnName",
                  choosedFeedback: "option 2 choosedFeedback"
                }
              },
              option3:
              {
                optionName: "option 3",
                optionLinkTo: 2,
                optionResults:
                {
                  health: + 0,
                  money: + 0
                },
                optionWarn:
                {
                  warnName: "option 3 warnName",
                  choosedFeedback: "option 3 choosedFeedback"
                }
              },
              option4:
              {
                optionName: "option 4",
                optionLinkTo: 2,
                optionResults:
                {
                  health: -5,
                  money: + 0
                },
                optionWarn:
                {
                  warnName: "option 4 warnName",
                  choosedFeedback: "option 4 choosedFeedback"
                }
              }
            }
          },// end of scenario 3 scene 1
          {
            question: "question 2",
            descrip: "descrip 2",
            imgurl: "sadsadada",
            sceneId: 2,
            options:
            {
              option1:
              {
                optionName: "option 1",
                optionLinkTo: 4,
                optionResults:
                {
                  health: +30,
                  money: -40
                },
                optionWarn:
                {
                  warnName: "option 1 warnName",
                  choosedFeedback: "option 1 choosedFeedback"
                }
              },
              option2:
              {
                optionName: "option 2",
                optionLinkTo: 4,
                optionResults:
                {
                  health: +30,
                  money: -25
                },
                optionWarn:
                {
                  warnName: "option 2 warnName",
                  choosedFeedback: "option 2 choosedFeedback"
                }
              },
              option3:
              {
                optionName: "option 3",
                optionLinkTo: 4,
                optionResults:
                {
                  health: +30,
                  money: -10
                },
                optionWarn:
                {
                  warnName: "option 3 warnName",
                  choosedFeedback: "option 3 choosedFeedback"
                }
              },
              option4:
              {
                optionName: "option 4",
                optionLinkTo: 3,
                optionResults:
                {
                  health: -20,
                  money: + 0
                },
                optionWarn:
                {
                  warnName: "option 1 warnName",
                  choosedFeedback: "option 1 choosedFeedback"
                }
              },
              option5:
              {
                optionName: "option 5",
                optionLinkTo: 3,
                optionResults:
                {
                  health: -20,
                  money: + 0
                },
                optionWarn:
                {
                  warnName: "option 5 warnName",
                  choosedFeedback: "option 5 choosedFeedback"
                }
              }
            }
          }, // end of scenario 3 scene 2
        ]
      } // end of scenario 3
    ]


  enter(e) {
    this.scenarioSelection = e.item.i.scenarioSelection;
  }

  this.on('before-unmount', function () {
    // var wrap = document.querySelector('.tobeanimate');  wrap.classList.remove('slideIn'); console.log(wrap);
  })


  selectScenario(e) {
    console.log(e.item.i)
    var id = e.item.i.scenarioID;
    this.currentScenario = id;
  }
  </script>

  <style>
    .eachScenario {
      height: 90%;
      overflow-y: scroll;
    }

    .card-shape .card-shape-preview {
      cursor: pointer;
      width: 150px;
      height: 150px;
      border-radius: 50%;
      overflow: hidden;
      margin: 0 auto;
      border: 5px solid #EE7379;
      margin-top: 30px;
      position: relative;
    }

    .card-shape .card-shape-preview:after {
      content: "";
      position: absolute;
      color: #fff;
      left: 0;
      bottom: 0;
      height: 0%;
      width: 100%;
      background: #EE7379;
      transition: all .4s ease-in-out;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .card-shape .card-shape-preview:hover:after {
      content: "View";
      height: 100%;
    }



    .card-shape .card-shape-preview img{
      width: 100%;
      height: auto;

    }

    /* .scene-wrap {
      width: 60%;
      min-width: 270px;
      height: 500px;
      background: #fff;
      margin: 40px auto;
    }
    .scene-wrap .button-wrap {
      width: 300px;
      display: flex;
      text-align: center;
      margin: 30px auto;
      justify-content: space-around;
      flex-wrap: wrap;
    }
    .scene-wrap .button-wrap > * {
      width: 50%;
    } */
  </style>
</scenarioSelection>
