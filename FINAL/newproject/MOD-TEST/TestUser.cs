using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MOD_BAL;
using MOD_DAL;
using NUnit;
using NUnit.Framework;

namespace MOD_TEST
{
    public class TestUser
    {
        public User user = new User();
        [Test]
        public void GetAll()
        {
            User uL = new User();
            IList<SignupDtl> user = uL.GetAll();
            Assert.IsNotNull(user);

        }
        [Test]
        public void GetById()
        {

            SignupDtl user1 = user.GetDetails(1004);
            Assert.IsNotNull(user1);
        }

        [Test]
        public void Register()
        {
            User user = new User();
            SignupDtl user1 = new SignupDtl()
            {
                firstName = "Swagata",
                lastName = "Nath",
                userName = "swaggydada",
                password = "1212131313",
                email = "swaggy12342@gmail.com",
                contactNumber = 9876555565,
                linkdinUrl = "",
                yearOfExperience = null,
                technology = null,
                active = true,
                role = 1,
            };
            user.New(user1);
            SignupDtl user2 = user.GetDetails(1016);
            Assert.IsNotNull(user2);
        }


        [Test]
        public void Update()
        {
            PaymentDetail user1 = new PaymentDetail()
            {
                remarks = "",
                amount = 6000,
                mentorId = 46,
                mentorName = "Cornel",
                trainingId = 9,
                skillName = "Artifical Intellegience",
                totalAmountToMentor = 5700,
                commision = 400
            };
            user.UpdatePayment(1003, user1);
            PaymentDetail user2 = user.GetPaymentDetails(1003);
            Assert.IsTrue(user1.amount == user2.amount && user1.mentorName == user2.mentorName);
        }
    }
}
