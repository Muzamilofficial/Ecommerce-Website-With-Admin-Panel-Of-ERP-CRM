using IMS_Project.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace IMS_Project.Controllers
{
    public class CustomerQuotationController : Controller
    {
        KahreedoEntities db = new KahreedoEntities();

        // GET: /CustomerQuotation/
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
        public ActionResult SubmitRequest(int purchaseOrderId, string product, string supplier, int quantity, DateTime datepicker, int quantity2, int priceperunit, int? total)
        {
            if (supplier != null)
            {
                // Calculate the total price
                decimal totalPrice = priceperunit * quantity2;

                // Call the stored procedure to insert the data
                db.Database.ExecuteSqlCommand("EXEC InsertcustomerQoutation @ReqQuotationID, @Product, @Customer, @QuantityNeeded, @SupplierQuantity, @UnitPrice, @TotalPrice, @ProductDate",
                    new SqlParameter("@ReqQuotationID", purchaseOrderId),
                    new SqlParameter("@Product", product),
                    new SqlParameter("@Customer", supplier),
                    new SqlParameter("@QuantityNeeded", quantity),
                    new SqlParameter("@SupplierQuantity", quantity2),
                    new SqlParameter("@UnitPrice", priceperunit),
                    new SqlParameter("@ProductDate", datepicker),
                    new SqlParameter("@TotalPrice", totalPrice)); // Pass the calculated total price
            }
            else
            {
                // Handle the case when the supplier field is not filled
                // You can choose to set a default value or perform any other required action
            }

            // Redirect to a success page or perform other actions
            return RedirectToAction("Index", "CustomerQuotation");
        }
    }
}
