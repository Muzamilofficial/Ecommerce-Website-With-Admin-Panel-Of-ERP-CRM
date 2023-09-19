using IMS_Project.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace IMS_Project.Controllers
{
    public class SalesController : Controller
    {
        private KahreedoEntities db = new KahreedoEntities(); // Replace YourDbContext with your actual DbContext class

        //
        // GET: /Sales/
        public ActionResult Index()
        {
            var products = db.Products.ToList();
            var customers = db.Customers.ToList();

            ViewBag.Products = products.Select(p => new SelectListItem
            {
                Value = p.ProductID.ToString(),
                Text = p.Name
            }).ToList();

            ViewBag.Customers = customers.Select(c => new SelectListItem
            {
                Value = c.CustomerID.ToString(),
                Text = c.First_Name
            }).ToList();

            return View(products);
        }

        [HttpPost]
        public ActionResult SubmitForm(int product, int customer, int quantity)
        {
            // Add record in SalesReturn table
            var salesReturn = new SalesReturn
            {
                Customer = customer.ToString(),
                Product = product,
                Quantity = quantity
            };
            db.SalesReturns.Add(salesReturn);
            db.SaveChanges();

            // Update UnitInStock column in Products table
            var selectedProduct = db.Products.Find(product);
            if (selectedProduct != null)
            {
                selectedProduct.UnitInStock += quantity;
                db.SaveChanges();

                // Show success message
                TempData["Message"] = "Quantity Added successfully.";
            }

            return RedirectToAction("Index");
        }
    }
}
