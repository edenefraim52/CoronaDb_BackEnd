using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebApi.DTO;
using DATA.EF;

namespace WebApi.Controllers
{
    public class PatientController : ApiController
    {
        // GET: api/Patient
        [HttpGet]
        [Route("api/Patient/showVacciened")]
        public List<PatientDTO> showVacciened()
        {
            CoronaDbContext db = new CoronaDbContext();
            List<PatientDTO> patients= db.PatientVaccins.Select(p => new PatientDTO()
            {
                ID = p.PatientID,
                Name = p.Patient.Name,
                VaccinType = p.Vaccin.Name,
                DoseNo = p.DoseNo,
                Sensitive = p.Sensitive
            }).ToList();
            return patients;
        }

        // GET: api/Patient/5
        [HttpGet]
        [Route("api/Patient/")]
        public List<PatientDTO> GET()
        {
            CoronaDbContext db = new CoronaDbContext();
                return db.PatientVaccins.Select(p => new PatientDTO()
                {
                    ID = p.PatientID,
                    Name = p.Patient.Name,
                    VaccinType = p.Vaccin.Name,
                    DoseNo = p.DoseNo,
                    Sensitive = p.Sensitive
                }).ToList();
        }

        [Route("api/Patient/{str}")]
        public List<PatientDTO> Get(string str)
        {
            CoronaDbContext db = new CoronaDbContext();
  
            return db.PatientVaccins.Where(p=> p.Patient.Name.Equals(str)).Select(p=> new PatientDTO() {
                ID = p.PatientID,
                Name = p.Patient.Name,
                VaccinType = p.Vaccin.Name,
                DoseNo = p.DoseNo,
                Sensitive = p.Sensitive
            }).ToList();
      
        }

       // POST: api/Patient
       [HttpPost]
       [Route("api/Patient/AddPatient")]
        public HttpResponseMessage AddPatient(PatientDTO p)
        {
            CoronaDbContext db = new CoronaDbContext();
            Patient patient = db.Patients.SingleOrDefault(x => x.ID == p.ID);
           
            if (patient == null)
                return Request.CreateResponse(HttpStatusCode.NotFound, "לקוח לא קיים");

            int doseNum = db.PatientVaccins.Where(x => x.PatientID == p.ID).Count();

            if (doseNum >= p.DoseNo)
                return Request.CreateResponse(HttpStatusCode.BadRequest, "הלקוח כבר התחסן במנת חיסון זו");
            if (doseNum == 0 && p.DoseNo != 1)
                return Request.CreateResponse(HttpStatusCode.BadRequest, "לא ניתן לחסן מנה 2 לפני מנה 1");

            PatientVaccin pa = new PatientVaccin();
            pa.PatientID = p.ID;
            pa.DoseNo = p.DoseNo;
            pa.Sensitive = p.Sensitive;
            pa.VaccinID = p.VaccinID;

            
            Vaccin vaccin = db.Vaccins.SingleOrDefault(x => x.ID == p.VaccinID);
            vaccin.Quantity--;
            if (vaccin == null)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound, "חיסון זה לא קיים במערכת");
            }
            try
            {
                db.PatientVaccins.Add(pa);
                db.SaveChanges();
            }
            catch (Exception e)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "שגיאה כללית");
            }
            return Request.CreateResponse(HttpStatusCode.OK, "לקוח התווסף בהצלחה");
        }

        // PUT: api/Patient/5
        [HttpPut]
        [Route("api/Patient/update")]
        public HttpResponseMessage update(PatientDTO p)
        {
            CoronaDbContext db = new CoronaDbContext();
            Patient patient = db.Patients.SingleOrDefault(x => x.ID == p.ID);
            if (patient == null)
                return Request.CreateResponse(HttpStatusCode.NotFound, "לא קיים לקוח זה");
            patient.Name = p.Name;
            try
            {
                db.SaveChanges();
            }
            catch (Exception e)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "שגיאה כללית");
            }
            return Request.CreateResponse(HttpStatusCode.OK, "שם הלקוח עודכן בהצלחה");

        }

        // DELETE: api/Patient/5
        public void Delete(int id)
        {
        }
    }
}
