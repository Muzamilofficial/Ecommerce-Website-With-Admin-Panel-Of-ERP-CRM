using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.EntityModel;
using System.Data.SqlClient;
using IMS_Project.Models;

namespace IMS_Project.Controllers
{
    public class Default1Controller : Controller
    {
        //
        // GET: /Default1/

        KahreedoEntities db = new KahreedoEntities();
        public ActionResult Index()
        {
            var customers = db.Customers.ToList();

            // Pass the data to the view
            ViewBag.Suppliers = customers;

            List<CustomerQoutation> quote = db.CustomerQoutations.ToList();

            return View(quote);
        }
        [HttpPost]
        public ActionResult DeleteRequest(int CustomerQoutationID)
        {
            // Find the request in the database
            var request = db.CustomerQoutations.Find(CustomerQoutationID);
            if (request != null)
            {
                // Remove the request from the database
                db.CustomerQoutations.Remove(request);
                db.SaveChanges();
            }

            // Return a success response
            return Json(new { success = true });
        }

	}
}