using IMS_Project.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace IMS_Project.Controllers
{
    public class PurchaseController : Controller
    {
        KahreedoEntities db = new KahreedoEntities();

        public ActionResult Index()
        {
            var products = db.Products.ToList();
            var suppliers = db.Suppliers.ToList();

            // Pass the data to the view
            ViewBag.Products = products;
            ViewBag.Suppliers = suppliers;

            return View();
        }
        [HttpPost]
        public ActionResult SubmitRequest(int combobox1, int combobox2, int quantity)
        {
            var product = db.Products.FirstOrDefault(p => p.ProductID == combobox1);
            var supplier = db.Suppliers.FirstOrDefault(s => s.SupplierID == combobox2);

            if (product != null && supplier != null)
            {
                if (quantity > 0)
                {
                    if (product.UnitInStock >= quantity)
                    {
                        // Subtract quantity from UnitInStock
                        product.UnitInStock -= quantity;

                        // Create a new PurchaseReturn object
                        var purchaseReturn = new PurchaseReturn
                        {
                            Supplier = supplier.SupplierID,
                            Product = product.ProductID,
                            Quantity = quantity
                        };

                        // Add the PurchaseReturn to the database
                        db.PurchaseReturns.Add(purchaseReturn);
                        db.SaveChanges();

                        // Show success message
                        TempData["Message"] = "Quantity subtracted successfully.";

                        // Redirect to a success page or perform any additional actions
                        return RedirectToAction("Index");
                    }
                    else
                    {
                        // Show alert box for insufficient stock
                        TempData["Message"] = "Insufficient stock available.";
                    }
                }
                else
                {
                    // Show alert box for invalid quantity
                    TempData["Message"] = "Please enter a positive value for quantity.";
                }
            }

            var products = db.Products.ToList();
            var suppliers = db.Suppliers.ToList();
            ViewBag.Products = products;
            ViewBag.Suppliers = suppliers;
            return View("Index");
        }

    }
}
