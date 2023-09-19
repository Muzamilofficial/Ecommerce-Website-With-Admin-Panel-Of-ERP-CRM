using IMS_Project.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace IMS_Project.Controllers
{
    public class SupplierGoodReceiptNoteController : Controller
    {
        private KahreedoEntities db = new KahreedoEntities();

        // GET: /SupplierGoodReceiptNote/
        public ActionResult Index()
        {
            var suppliers = db.Suppliers.ToList();

            // Pass the data to the view
            ViewBag.Suppliers = suppliers;

            var goodReceiptNotes = db.GoodReceiptNotes.ToList();
            return View(goodReceiptNotes);
        }

        // GET: /SupplierGoodReceiptNote/Edit/5
        public ActionResult Edit(int id)
        {
            var goodReceiptNote = db.GoodReceiptNotes.Find(id);
            if (goodReceiptNote == null)
            {
                return HttpNotFound();
            }
            return View(goodReceiptNote);
        }

        // POST: /SupplierGoodReceiptNote/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, GoodReceiptNote updatedGoodReceiptNote)
        {
            if (ModelState.IsValid)
            {
                var existingGoodReceiptNote = db.GoodReceiptNotes.Find(id);
                if (existingGoodReceiptNote == null)
                {
                    return HttpNotFound();
                }

                // Update the properties of the existingGoodReceiptNote object
                existingGoodReceiptNote.Product = updatedGoodReceiptNote.Product;
                existingGoodReceiptNote.Supplier = updatedGoodReceiptNote.Supplier;

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
