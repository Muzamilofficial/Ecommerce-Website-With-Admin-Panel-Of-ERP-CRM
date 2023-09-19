using IMS_Project.Models;
using System.Linq;
using System.Web.Mvc;

namespace IMS_Project.Controllers
{
    public class PurchaseOrderController : Controller
    {
        KahreedoEntities db = new KahreedoEntities();

        public ActionResult Index()
        {
            var suppliers = db.Suppliers.ToDictionary(s => s.SupplierID, s => s.CompanyName);
            ViewBag.Suppliers = suppliers;

            var quotes = db.SupplierQoutations.ToList();

            // Retrieve the concatenated product names for each request
            foreach (var quote in quotes)
            {
                var requestItems = db.RequestforQuotationItems.Where(item => item.reqQuotID == quote.ReqQoutationID).ToList();
                var productNames = requestItems.Select(item => item.productName).ToList();
                quote.Product = string.Join(", ", productNames);
            }

            return View(quotes);
        }

        [HttpPost]
        public ActionResult SaveGoodReceiptNote(int supplierQuotationId, string product)
        {
            SupplierQoutation quotation = db.SupplierQoutations.FirstOrDefault(q => q.SupplierQoutationID == supplierQuotationId);

            if (quotation != null)
            {
                GoodReceiptNote receiptNote = new GoodReceiptNote();
                receiptNote.SupplierQoutationID = quotation.SupplierQoutationID;
                receiptNote.ReqQoutationID = quotation.ReqQoutationID;
                receiptNote.Product = product;
                receiptNote.Supplier = quotation.Supplier;
                receiptNote.QuantityNeeded = quotation.QuantityNeeded;
                receiptNote.SupplierQuantity = quotation.SupplierQuantity;
                receiptNote.UnitPrice = quotation.UnitPrice;
                receiptNote.TotalPrice = quotation.TotalPrice;
                receiptNote.SupQuantity = quotation.SaveQuantity;
                receiptNote.Tax = quotation.Tax;
                receiptNote.ConUnit = quotation.ConUnit;
                receiptNote.PaymentTerm = quotation.PaymentTerm;

                db.GoodReceiptNotes.Add(receiptNote);
                db.SaveChanges();

                // Delete the quotation after saving as a GoodReceiptNote
                db.SupplierQoutations.Remove(quotation);
                db.SaveChanges();

                return Json(new { success = true, message = "Data saved successfully as Purchase Order" });
            }

            return Json(new { success = false, message = "Quotation not found" });
        }

        [HttpPost]
        public ActionResult DeleteRow(int supplierQuotationId)
        {
            SupplierQoutation quotation = db.SupplierQoutations.FirstOrDefault(q => q.SupplierQoutationID == supplierQuotationId);

            if (quotation != null)
            {
                db.SupplierQoutations.Remove(quotation);
                db.SaveChanges();

                return Json(new { success = true, message = "Row deleted successfully" });
            }

            return Json(new { success = false, message = "Quotation not found" });
        }
    }
}
