using IMS_Project.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace IMS_Project.Controllers
{
    public class ProductController : Controller
    {
        KahreedoEntities db = new KahreedoEntities();

        public ActionResult Index()
        {
            return View(db.Products.ToList());
        }

        public ActionResult Create()
        {
            GetViewBagData();
            return View();
        }
        public void GetViewBagData()
        {
            ViewBag.SupplierID = new SelectList(db.Suppliers, "SupplierID", "CompanyName");
            ViewBag.CategoryID = new SelectList(db.Categories, "CategoryID", "Name");
            ViewBag.SubCategoryID = new SelectList(db.SubCategories, "SubCategoryID", "Name");

            // Retrieve the list of unit measures from the database
            var unitMeasures = db.tbl_UnitofMeasures.ToList();

            // Create a SelectList using the unitMeasures and specify the value, text, and abbreviation fields
            var unitMeasuresList = new SelectList(unitMeasures, "UnitMeasureID", "Abbrevation");

            // Assign the SelectList to the ViewBag
            ViewBag.UnitMeasures = unitMeasuresList;
        }

        [HttpPost]
        public ActionResult Create(Product prod)
        {
            if (ModelState.IsValid)
            {
                // Save the product to the database
                db.Products.Add(prod);
                db.SaveChanges();
                return RedirectToAction("Index", "Product");
            }

            // If the ModelState is not valid, retrieve the necessary ViewBag data
            GetViewBagData();

            // Return the view with the invalid model
            return View(prod);
        }



        //Get Edit
        [HttpGet]
        public ActionResult Edit(int id)
        {
            Product product = db.Products.Single(x => x.ProductID == id);
            if (product == null)
            {
                return HttpNotFound();
            }
            GetViewBagData();
            return View("Edit", product);
        }

        //Post Edit
        [HttpPost]
        public ActionResult Edit(Product prod)
        {
            if (ModelState.IsValid)
            {
                db.Entry(prod).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index", "Product");
            }
            GetViewBagData();
            return View(prod);
        }

        //Get Details
        public ActionResult Details(int id)
        {
            Product  product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        //Get Delete
        public ActionResult Delete(int id)
        {
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);

        }
        [HttpPost]
        public ActionResult SetInActive(int id)
        {
            try
            {
                // Find the product in the database
                Product product = db.Products.Find(id);

                if (product != null)
                {
                    // Set the InActive property to False
                    product.InActive = false;

                    // Save the changes to the database
                    db.SaveChanges();
                }

                return Json(new { success = true });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
        }


        //Post Delete Confirmed
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Product product = db.Products.Find(id);
            db.Products.Remove(product);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
        
    }
}