using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DataTableAPI.Models;
using System.Web.Http.Cors;

namespace DataTableAPI.Controllers
{
    public class DataTableController : ApiController
    {
        // GET api/<controller>
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/<controller>/5
        [HttpGet]
        [EnableCors("*", "*", "GET")]
        public List<Employee> GetEmployees()
        {
            using (var db = new DataTableEntities())
            {
                return db.tblEmployees.Select(x => new Employee
                {
                    FirstName = x.FirstName,
                    Gender = x.Gender,
                    Id = x.ID,
                    HireDate = x.HireDate,
                    JobTitle = x.JobTitle,
                    LastName = x.LastName,
                    Salary = x.Salary,
                    WebSite = x.WebSite
                }).ToList();
            }
        }

        // POST api/<controller>
        public void Post([FromBody]string value)
        {
        }

        // PUT api/<controller>/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/<controller>/5
        public void Delete(int id)
        {
        }
    }
}