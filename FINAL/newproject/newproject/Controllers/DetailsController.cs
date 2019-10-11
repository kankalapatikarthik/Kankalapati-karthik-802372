using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using MOD_BAL;
using MOD_DAL;

namespace newproject.Controllers
{
    public class DetailsController : ApiController
    {
        MOD_BAL.User userlogic = new MOD_BAL.User();

        [Route("api/GetAllData")]
        [HttpGet]
        public IHttpActionResult GettAll()
        {
            var data = userlogic.GetAll();
            return Ok(data);
        }

        [Route("api/GetAllSkill")]
        [HttpGet]
        public IHttpActionResult GettAllSkill1()
        {
            var data = userlogic.GetAllSkill();
            return Ok(data);
        }

        [Route("api/addPayment")]
        [HttpPost]
        public int AddPayment1(PaymentDetail details)
        {
            return userlogic.AddPayment(details);
        }

        [Route("api/create")]
        [HttpPost]
        public int Create(SignupDtl details)
        {
            return userlogic.New(details);
        }

        [Route("api/createSkill")]
        [HttpPost]
        public int CreateSkills(SkillDetail details)
        {
            return userlogic.NewSkill(details);
        }

        [Route("api/login")]
        [HttpPost]
        public IHttpActionResult Login(SignupDtl userDtl)
        {
            SignupDtl result = userlogic.SignIn(userDtl);
            return Ok(result);
        }
        [HttpDelete]
        [Route("api/deleteSkills/{id}")]
        public int Delete(int id)
        {
            return userlogic.Deleteskill(id);
        }
        [Route("api/showtechnologies")]
        [HttpGet]
        public IHttpActionResult GettAllTechnologies()
        {
            var data = userlogic.GetAllTechnologies();
            return Ok(data);
        }
        [HttpGet]
        [Route("api/searchTrainer/{name}")]
        public IHttpActionResult SearchTrainer(string name)
        {
            var data = userlogic.Trainer(name);
            return Ok(data);
        }
        [HttpGet]
        [Route("api/searchSkill/{name}")]
        public IHttpActionResult Skill(string name)
        {
            var data = userlogic.Skill(name);
            return Ok(data);
        }
        [HttpGet]
        [Route("api/searchtrainerdata/{id}")]
        public IHttpActionResult trainerdata(int id)
        {
            var data = userlogic.trainerdata(id);
            return Ok(data);
        }

        [Route("api/trainingAdd")]
        [HttpPost]
        public int AddTraining(TrainingDtl Dtl)
        {
            return userlogic.NewTraining(Dtl);
        }
        [HttpGet]
        [Route("api/userTrainings/{id}")]
        public IHttpActionResult TrainingUser1(int id)
        {
            var data = userlogic.TrainingUser(id);
            return Ok(data);
        }
        [HttpPut]
        [Route("api/trainingEdit/{id}")]
        public int Edit(int id, TrainingDtl training)
        {
            return userlogic.UpdateTraining(id, training);
        }
        [HttpGet]
        [Route("api/trainingDetails/{id}")]
        public TrainingDtl TrainingDetails(int id)
        {
            return userlogic.GetTrainingDetails(id);
        }
        [HttpGet]
        [Route("api/mentorTrainings/{id}")]
        public IHttpActionResult TrainingMentor1(int id)
        {
            var data = userlogic.TrainingMentor(id);
            return Ok(data);
        }
        [HttpGet]
        [Route("api/Details/{id}")]
        public SignupDtl Details(int id)
        {
            return userlogic.GetDetails(id);
        }
        [HttpPut]
        [Route("api/EditUserData/{id}")]
        public IHttpActionResult EditUserData(int id, SignupDtl user)
        {
            userlogic.EditAllData(id, user);
            return Ok("block");
        }

        [Route("api/GetAllPayment")]
        [HttpGet]
        public IHttpActionResult GettAllPay()
        {
            var data = userlogic.GetAllPayment();
            return Ok(data);
        }
        [HttpGet]
        [Route("api/paymentById/{id}")]
        public IHttpActionResult PaymentById(int id)
        {
            var data = userlogic.getPaymentDetailsById(id);
            return Ok(data);
        }
        [HttpPut]
        [Route("api/paymentEdit/{id}")]
        public int EditPayment(int id, PaymentDetail training)
        {
            return userlogic.UpdatePayment(id, training);
        }
        [HttpGet]
        [Route("api/paymentByMentorId/{id}")]
        public IHttpActionResult PayementByMentorId(int id)
        {
            var data = userlogic.GetPaymentDetails(id);
            return Ok(data);
        }
        [HttpPut]
        [Route("api/EditUserData1/{id}")]
        public int EditUserData1(int id, SignupDtl user)
        {
            return userlogic.EditUserData(id, user);
        }


    }
}
