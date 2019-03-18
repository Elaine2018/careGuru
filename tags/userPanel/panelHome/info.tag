
<info>
  <div class="panel-main-wrap info-wrap">
    <div class="t-right pr-2">
      <a href="#{this.parent.parent.uid}/saved" class="view-saved t-underline">Vie your saved cards</a>
    </div>
    <div class='flex flex-wrap'>
      <infoPiece class="info-piece" each = {i in infoPieceData} data = {i} starred = {starredArticleId} onclick={openInfo}></infoPiece>
      <infoOpen data = {openedCard || infoPieceData[0]} if={openedCard}></infoOpen>
    </div>
  </div>
  <script>
    this.userInfo = this.parent.userInfo;
    console.log(this.parent.parent)
    var that = this;
    this.infoPieceData = [
      {
        imgurl: './img/part-1-info-system.png',
        title: 'Basic Information',
        content: 'Almost all care is provided for by the private sector, though some hospital run by the government. 70% hospitals are non-profit, while the rest are for-profit. Most Pharmaceutical and medical device company are run by private sector. Research pay from both public and private (but more from private) side.'
      },
      {
        imgurl: './img/part1-medicine.png',
        title: 'Medicare',
        content: 'National social insurance program run and administered by the federal government 15%. US citizens covered by medicare, most of them are elderly people. It is a Single payer system: all people are covered by one type of insurance. Part A: covers you if you are hospitalized, pretty much free if you are over 65, almost everyone is able to get it. Part B: covers outpatient services, sometimes deferred by people who are still getting insurance from their jobs, has a pretty low deductible, co-insurance is 20%. Part C (a.k.a Medicare Advantage) opportunity for private companies to offer Medicare-like benefits as an alternative to other Medicare benefits. Part D. Contains the prescription drug plans, designed and run by private insurance companies, approved and paid by the Federal Government, individual beneficiaries pick the plan they like.'
      },
      {
        imgurl: './img/part1-medicine.png',
        title: 'Medicaid',
        content: 'State based program (with federally set guidelines), provides medical coverage for people who cannot afford it. The government has a standard to define “who cannot afford it”. Must cover: kids under 6 years of age to 133% FPL and kids 6-18 to 100% FPL, the states children’s health insurance plan, pregnant woman up to 133% FPL, parents to 1996 welfare levels the elderly and those with disabilities who receive Supplemental Security Income. (In most states, adults without kids cannot get medicaid, even those poorest people without kids)'
      },
      {
        imgurl: './img/part-1-info-system.png',
        title: 'Conclusion',
        content: 'Private insurance for most, Medicare and Medicaid for some, and VA and Tricare for few.'
      },//Part 2- Health Insurance Overview
      {
        imgurl: './img/part2-insurance.png',
        title: 'Premium',
        content: 'The amount of money the insurance company is going to charge you for the insurance policy you are purchasing.'
      },
      {
        imgurl: './img/part-2-insurancepay.png',
        title: 'Deductible',
        content: 'An annual deductible is a set dollar amount that you may be required to pay toward covered medical care within a single year.'
      },
      {
        imgurl: './img/part-2-insurancepay.png',
        title: 'Co-pay',
        content: 'This is a fixed fee for certain kinds of office visit, prescription drugs, or other kinds of care.'
      },
      {
        imgurl: './img/part-2-insurancepay.png',
        title: 'Co-Insurance',
        content: 'This is a percentage of the total cost for a covered medical service, instead of a fixed copayment fee.'
      },
      {
        imgurl: './img/part-2-insurancepay.png',
        title: 'Out-of-pocket maximum',
        content: 'The most you have to pay for covered services in a plan year.'
      },
      {
        imgurl: './img/part2-insurance.png',
        title: 'Plan Year',
        content: 'A 12-month period of benefits coverage under a group health plan. This 12-month period may not be the same as the calendar year.'
      },
      {
        imgurl: './img/part-2-insurancepay.png',
        title: 'What are covered?',
        content: 'Every health plan must cover the following services, typically with deductible and co-pay/co-insurance: 1). Ambulatory patient services (outpatient care you get without being admitted to a hospital); 2). Emergency services; 3). Hospitalization (such as surgery); 4). Maternity and newborn care (care before and after your baby is born); 5). Mental health and substance use disorder services, including behavioral health treatment (this includes counseling and psychotherapy); 6). Prescription drugs; 7). Rehabilitative and habilitative services and devices (services and devices to help people with injuries, disabilities, or chronic conditions gain or recover mental and physical skills); 8). Laboratory services; 9). Preventive and wellness services and chronic disease management; 10). Pediatric services'
      },
      {
        imgurl: './img/part-2-insurancepay.png',
        title: 'What are not covered?',
        content: 'Although some policies may provide such coverage, typically, the following services are not covered: 1). Travel vaccines; 2). Acupuncture & other alternative therapies; 3). Cosmetic surgery ; 4). Nursing home care; 5). Dental & Vision & Hearing; 6). Weight Loss Surgery; 7). Preventative tests; 8). All medications'
      },
      {
        imgurl: './img/part2-insurance.png',
        title: 'Pre-existing conditions',
        content: 'All Marketplace plans must cover treatment for pre-existing medical conditions. No insurance plan can reject you, charge you more, or refuse to pay for essential health benefits for any condition you had before your coverage started. Once you’re enrolled, the plan can’t deny you coverage or raise your rates based only on your health. Medicaid and the Children Health Insurance Program (CHIP) also cannot refuse to cover you or charge you more because of your pre-existing condition.'
      },
      {
        imgurl: './img/part-2-insurancepay.png',
        title: 'General Benefits - Aetna',
        content: 'Check "https://www.aetnastudenthealth.com/schools/columbia/pdbs1718.pdf"'
      },
      {
        imgurl: './img/part-2-insurancepay.png',
        title: 'File A Claim',
        content: 'When: A claim is a detailed invoice that your health-care provider (such as your doctor, clinic, or hospital) sends to the health insurer. This invoice shows exactly what services you received. Here is how it works – You get a service from a health care provider. The health care provider submits a claim to Unity. The medical billing insurance claims process starts when a healthcare provider treats a patient and sends a bill of services provided to a designated payer, which is usually a health insurance company. Take Aetna as a sample case, here are the steps you need to do: 1). Click "Claims Center," then "Submit claims". 2).Complete your claim online. 3).Copy, scan and upload your supporting documents, including itemized bills, original receipts. 4). Click "submit claim" to complete the process. 5). After you submit your completed claim form, you will receive a notification by e-mail to confirm that it has been submitted successfully.'
      },//Part 3- Health Care Provider
      {
        imgurl: './img/part3-providers.png',
        title: '3 general providers',
        content: 'Health Care Professionals. Hospitals / Clinics. Student Health Center / Company Health Center'
      },
      {
        imgurl: './img/part3-providers.png',
        title: 'What providers provide?',
        content: 'Goods (medicine & medical equipment) & Services.'
      },
      {
        imgurl: './img/part3-providers.png',
        title: 'How to find providers?',
        content: '1). Emergency Room VS. Urgent Care Center. emergency room priorotize based on your situation. 2). Primary Care Provider (PCP). 3). Doctor Referral. Why do I need a referral? Read more -- "https://www.tuftsmedicarepreferred.org/members/using-your-plan/what-referral-and-why-do-i-need-one"'
      },
    ]

    this.openedCard = undefined;

    openInfo(e) {
      this.openedCard = e.item.i;
      this.update();
    }

    this.on('mount', function() {
      //create an unique index id for each item and set starred to false by default
      that.infoPieceData.forEach(function(i, index) {
        i.starred = false;
        i.id = index;
      })

    //label the starred item from the database record
      var starredArticle = Object.values(that.userInfo.starredArticle);

      //set the item with its firebase id;
      var starredArticleObject = Object.entries(that.userInfo.starredArticle);
      starredArticleObject.forEach((i)=>{
        that.infoPieceData[i[1].id].firebaseId = i[0];
      })


      var starredArticleId = [];
      starredArticle.forEach((i) => {
        starredArticleId.push(i.id);
      })
      starredArticleId.forEach((i)=> {
        that.infoPieceData[i].starred = true;
      })
      // console.log(that.infoPieceData)
      that.update();
    })
  </script>

  <style>
    .view-saved {
      font-size: 1.2em;
      color: #f0a2ae;
    }
    .info-piece {
      margin-right: 25px;
    }
    .info-wrap {
      height: 550px;
      padding: 3em 1em 3em 2em;
    }
  </style>
</info>
