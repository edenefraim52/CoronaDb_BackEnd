using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApi.DTO
{
    public class PatientDTO
    {
        public int ID;
        public string Name;
        public string VaccinType;
        public int DoseNo;
        public bool Sensitive;
        public int VaccinID;

    }
}