using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity.Validation;
using MOD_DAL;

namespace MOD_BAL
{
    public class User
    {
        public projectDBEntities md = new projectDBEntities();
        public int New(SignupDtl sd)
        {
            md.SignupDtls.Add(sd);
            md.SaveChanges();
            return 1;
        }
        public int NewSkill(SkillDetail sd)
        {
            md.SkillDetails.Add(sd);
            md.SaveChanges();
            return 1;
        }
        public SignupDtl GetDetails(int id)
        {
            SignupDtl details = md.SignupDtls.Find(id);
            return details;
        }
        public IList<SignupDtl> GetAll()
        {
            return md.SignupDtls.ToList();
        }
        public IList<SkillDetail> GetAllSkill()
        {
            return md.SkillDetails.ToList();
        }
        public SignupDtl SignIn(SignupDtl loginDtl)
        {
            SignupDtl details = md.SignupDtls.SingleOrDefault(x => x.email == loginDtl.email && x.password == loginDtl.password);
            return details;
        }
        public int Deleteskill(int id)
        {
            SkillDetail sd = md.SkillDetails.Find(id);
            md.SkillDetails.Remove(sd);
            md.SaveChanges();
            return 1;
        }
        public IList<SkillDetail> GetAllTechnologies()
        {
            return md.SkillDetails.ToList();
        }
        public IList<SignupDtl> Trainer(string name)
        {
            return md.SignupDtls.Where(s => s.technology == name).ToList();
        }
        public IList<SkillDetail> Skill(string name)
        {
            return md.SkillDetails.Where(s => s.name == name).ToList();
        }
        public SignupDtl trainerdata(int id)
        {
            SignupDtl trainer = md.SignupDtls.SingleOrDefault(s => s.id == id);
            return trainer;
        }
        public int NewTraining(TrainingDtl sd)
        {
            md.TrainingDtls.Add(sd);
            md.SaveChanges();
            return 1;
        }
        public IList<TrainingDtl> TrainingUser(int id)
        {
            return md.TrainingDtls.Where(s => s.userId == id).ToList();
        }

        public int AddPayment(PaymentDetail newEntry)
        {
            try
            {
                md.PaymentDetails.Add(newEntry);
                md.SaveChanges();
                return 1;
            }
            catch
            {


                throw;
            }

        }
        public int UpdateTraining(int id, TrainingDtl training)
        {
            TrainingDtl emp = md.TrainingDtls.Find(id);
            if (emp != null)
            {
                try
                {
                    emp.mentorId = training.mentorId;
                    emp.startDate = training.startDate;
                    emp.endDate = training.endDate;
                    emp.timeSlot = training.timeSlot;
                    emp.userId = training.userId;
                    emp.userName = training.userName;
                    emp.progress = training.progress;
                    emp.status = training.status;
                    emp.mentorId = training.mentorId;
                    emp.mentorName = training.mentorName;
                    emp.skillId = training.skillId;
                    emp.skillname = training.skillname;
                    emp.fees = training.fees;
                    emp.requested = training.requested;
                    emp.rejectNotify = training.rejectNotify;
                    emp.paymentStatus = training.paymentStatus;
                    md.SaveChanges();
                }
                catch
                {
                    throw;
                }
            }
            return 1;
        }
        public TrainingDtl GetTrainingDetails(int id)
        {
            TrainingDtl details = md.TrainingDtls.Find(id);
            return details;
        }
        public IList<TrainingDtl> TrainingMentor(int id)
        {
            return md.TrainingDtls.Where(s => s.mentorId == id).ToList();
        }

        public int EditAllData(int id, SignupDtl userDtl)
        {
            SignupDtl user = md.SignupDtls.Find(id);
            if (user != null)
            {
                try
                {
                    user.email = userDtl.email;
                    user.userName = userDtl.userName;
                    user.password = userDtl.password;
                    user.firstName = userDtl.firstName;
                    user.lastName = userDtl.lastName;
                    user.contactNumber = userDtl.contactNumber;
                    user.role = userDtl.role;
                    user.linkdinUrl = userDtl.linkdinUrl;
                    user.yearOfExperience = userDtl.yearOfExperience;
                    user.active = userDtl.active;
                    user.technology = userDtl.technology;
                    md.SaveChanges();
                }
                catch
                {
                    throw;
                }
            }
            return 1;
        }

        public IList<PaymentDetail> GetAllPayment()
        {
            return md.PaymentDetails.ToList();
        }
        public PaymentDetail GetPaymentDetails(int id)
        {
            PaymentDetail details = md.PaymentDetails.Find(id);
            return details;
        }
        public IList<PaymentDetail> getPaymentDetailsById(int id)
        {
            return md.PaymentDetails.Where(s => s.id == id).ToList();
        }
        public int UpdatePayment(int id, PaymentDetail paymentDtl)
        {
            PaymentDetail pay = md.PaymentDetails.Find(id);
            if (pay != null)
            {
                try
                {
                    pay.amount = paymentDtl.amount;
                    pay.mentorId = paymentDtl.mentorId;
                    pay.mentorName = paymentDtl.mentorName;
                    pay.trainingId = paymentDtl.trainingId;
                    pay.skillName = pay.skillName;
                    pay.totalAmountToMentor = paymentDtl.totalAmountToMentor;
                    pay.commision = paymentDtl.commision;
                    md.SaveChanges();
                }
                catch
                {
                    throw;
                }
            }
            return 1;
        }

        public int EditUserData(int id, SignupDtl userDtl)
        {
            SignupDtl user = md.SignupDtls.Find(id);
            if (user != null)
            {
                try
                {
                    user.email = userDtl.email;
                    user.userName = userDtl.userName;
                    user.password = userDtl.password;
                    user.firstName = userDtl.firstName.ToString();
                    user.lastName = userDtl.lastName.ToString();
                    user.contactNumber = userDtl.contactNumber;
                    user.role = userDtl.role;
                    user.active = userDtl.active;

                    md.SaveChanges();
                }
                catch (DbEntityValidationException e)
                {

                    foreach (var eve in e.EntityValidationErrors)
                    {
                        Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                            eve.Entry.Entity.GetType().Name, eve.Entry.State);
                        foreach (var ve in eve.ValidationErrors)
                        {
                            Console.WriteLine("- Property: \"{0}\", Value: \"{1}\", Error: \"{2}\"",
                    ve.PropertyName,
                    eve.Entry.CurrentValues.GetValue<object>(ve.PropertyName),
                    ve.ErrorMessage);
                        }
                    }
                    throw;
                }
            }
            return 1;
        }

    }
}
