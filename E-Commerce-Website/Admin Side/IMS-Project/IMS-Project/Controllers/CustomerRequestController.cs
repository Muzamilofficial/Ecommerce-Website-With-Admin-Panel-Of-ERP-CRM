
using IMS_Project.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace IMS_Project.Controllers
{
    public class CustomerRequestController : Controller
    {
        //
        // GET: /CustomerRequest/
        KahreedoEntities db = new KahreedoEntities();
        public ActionResult Index()
        {
            var products = db.Products.ToList();
            var customers = db.Customers.ToList();

            // Pass the data to the view
            ViewBag.Products = products;
            ViewBag.Customers = customers;

            List<CustomerRequestforQoutation> requests = db.CustomerRequestforQoutations.ToList();

            return View(requests);
        }

        [HttpPost]
        public ActionResult SubmitRequest(int combobox1, int combobox2, int quantity, DateTime? datepicker)
        {
            if (datepicker.HasValue)
            {
                // Call the stored procedure to insert the data
                db.Database.ExecuteSqlCommand("EXEC InsertCustomerRequestforQoutation @Product, @Customer, @Quantity, @ProductDate",
                    new SqlParameter("@Product", combobox1),
                    new SqlParameter("@Customer", combobox2),
                    new SqlParameter("@Quantity", quantity),
                    new SqlParameter("@ProductDate", datepicker.Value));
            }
            else
            {
                // Handle the case when the datepicker field is not filled
                // You can choose to set a default value or perform any other required action
            }

            // Redirect to a success page or perform other actions
            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult DeleteRequest(int reqQoutationId)
        {
            // Find the request in the database
            var request = db.CustomerRequestforQoutations.Find(reqQoutationId);
            if (request != null)
            {
                // Remove the request from the database
                db.CustomerRequestforQoutations.Remove(request);
                db.SaveChanges();
            }

            // Return a success response
            return Json(new { success = true });
        }

        [HttpPost]
        public ActionResult UpdateRequest(int reqQoutationId, int combobox1, int combobox2, int quantity, DateTime? datepicker)
        {
            var request = db.CustomerRequestforQoutations.Find(reqQoutationId);
            if (request != null)
            {
                if (datepicker.HasValue)
                {
                    // Update the request with the new values
                    request.Product = combobox1;
                    request.Customer = combobox2;
                    request.Quantity = quantity;
                    request.ProductDate = datepicker.Value;
                }
                else
                {
                    // Handle the case when the datepicker field is not filled
                    // You can choose to set a default value or perform any other required action
                }

                // Save the changes to the database
                db.SaveChanges();
            }

            // Redirect to the index page or perform other actions
            return RedirectToAction("Index");
        }
    }
}