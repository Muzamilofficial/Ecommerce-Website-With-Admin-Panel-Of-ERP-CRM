using IMS_Project.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace IMS_Project.Controllers
{
    public class CustSalesOrderController : Controller
    {
        KahreedoEntities db = new KahreedoEntities();

        public ActionResult Index()
        {
            var customers = db.Customers.ToDictionary(s => s.CustomerID, s => s.First_Name);
            ViewBag.Customers = customers;

            var quotes = db.CustomerQoutations.ToList();

            // Retrieve the concatenated product names for each request
            foreach (var quote in quotes)
            {
                var requestItems = db.RequestforCustomerQuotationItems.Where(item => item.reqQuotID == quote.ReqQoutationID).ToList();
                var productNames = requestItems.Select(item => item.productName).ToList();
                quote.Product = string.Join(", ", productNames);
            }

            return View(quotes);
        }
        [HttpPost]
        public ActionResult SaveGoodReceiptNote(int customerQuotationId, string product)
        {
            try
            {
                CustomerQoutation quotation = db.CustomerQoutations.FirstOrDefault(q => q.CustomerQoutationID == customerQuotationId);

                if (quotation != null)
                {
                    CustomerGoodReceiptNote receiptNote = new CustomerGoodReceiptNote();
                    receiptNote.CustomerQoutationID = quotation.CustomerQoutationID;
                    receiptNote.ReqQoutationID = quotation.ReqQoutationID;
                    receiptNote.Product = product;
                    receiptNote.Customer = quotation.Customer;
                    receiptNote.QuantityNeeded = quotation.QuantityNeeded;
                    receiptNote.SupplierQuantity = quotation.SupplierQuantity;
                    receiptNote.UnitPrice = quotation.UnitPrice;
                    receiptNote.TotalPrice = quotation.TotalPrice;
                    receiptNote.SupQuantity = quotation.SaveQuantity;
                    receiptNote.ConUnit = quotation.ConUnit;
                    receiptNote.Tax = quotation.Tax;
                    receiptNote.PaymentTerm = quotation.PaymentTerm;

                    db.CustomerGoodReceiptNotes.Add(receiptNote);
                    db.SaveChanges();

                    // Delete the quotation after saving as a GoodReceiptNote
                    db.CustomerQoutations.Remove(quotation);
                    db.SaveChanges();

                    return Json(new { success = true, message = "Data saved successfully as Sales" });
                }
                else
                {
                    return Json(new { success = false, message = "Quotation not found" });
                }
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = "Error occurred while saving data: " + ex.Message });
            }
        }

        [HttpPost]
        public ActionResult DeleteRow(int customerQuotationId)
        {
            CustomerQoutation quotation = db.CustomerQoutations.FirstOrDefault(q => q.CustomerQoutationID == customerQuotationId);

            if (quotation != null)
            {
                db.CustomerQoutations.Remove(quotation);
                db.SaveChanges();

                return Json(new { success = true, message = "Row deleted successfully" });
            }

            return Json(new { success = false, message = "Quotation not found" });
        }
    }
}
