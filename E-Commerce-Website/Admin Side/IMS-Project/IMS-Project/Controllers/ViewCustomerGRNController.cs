using IMS_Project.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace IMS_Project.Controllers
{
    public class ViewCustomerGRNController : Controller
    {
        private KahreedoEntities db = new KahreedoEntities();

        // GET: /SupplierGoodReceiptNote/
        public ActionResult Index()
        {
            var customers = db.Customers.ToList();

            // Pass the data to the view
            ViewBag.Customers = customers;

            var CustomerGoodReceiptNote = db.CustomerGoodReceiptNotes.ToList();
            return View(CustomerGoodReceiptNote);
        }

        // GET: /SupplierGoodReceiptNote/Edit/5
        public ActionResult Edit(int id)
{
    var goodReceiptNote = db.CustomerGoodReceiptNotes.Find(id);
    if (goodReceiptNote == null)
    {
        return HttpNotFound();
    }
    return View(goodReceiptNote);
}

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, CustomerGoodReceiptNote updatedGoodReceiptNote)
        {
            if (ModelState.IsValid)
            {
                var existingGoodReceiptNote = db.CustomerGoodReceiptNotes.Find(id);
                if (existingGoodReceiptNote == null)
                {
                    return HttpNotFound();
                }

                // Update the properties of the existingGoodReceiptNote object
                existingGoodReceiptNote.Product = updatedGoodReceiptNote.Product;
                existingGoodReceiptNote.Customer = updatedGoodReceiptNote.Customer;

                int quantity;
                if (int.TryParse(updatedGoodReceiptNote.SupQuantity, out quantity))
                {
                    existingGoodReceiptNote.SupplierQuantity = quantity;
                }

                // Update other properties as needed

                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(updatedGoodReceiptNote);
        }
    }
}
