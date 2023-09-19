using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IMS_Project.Models;

namespace IMS_Project.Controllers
{
    public class SupplierPaymentController : Controller
    {
        private KahreedoEntities db = new KahreedoEntities();

        // GET: /SupplierPayment/
        public ActionResult Index()
        {
            // Retrieve the suppliers from the database
            List<Supplier> suppliers = db.Suppliers.ToList();

            // Map the suppliers to SelectListItem objects
            List<SelectListItem> supplierList = suppliers.Select(s => new SelectListItem
            {
                Value = s.SupplierID.ToString(),
                Text = s.CompanyName
            }).ToList();

            // Retrieve the taxes from the database
            List<tbl_Tax> taxes = db.tbl_Tax.ToList();

            // Map the taxes to SelectListItem objects
            List<SelectListItem> taxList = taxes.Select(t => new SelectListItem
            {
                Value = t.TaxID.ToString(),
                Text = t.TaxRate.ToString()
            }).ToList();

            // Set the ViewBag variables to be used in the view
            ViewBag.SupplierList = supplierList;
            ViewBag.TaxList = taxList;

            // Retrieve the supplier payments from the database in descending order
            List<tbl_SupplierPayment> supplierPayments = db.tbl_SupplierPayment.OrderByDescending(s => s.SupplierPaymentID).ToList();

            // Pass the supplier payments to the view
            ViewBag.SupplierPayments = supplierPayments;

            return View();
        }

        [HttpPost]
        public ActionResult DeletePayment(int paymentId)
        {
            try
            {
                // Find the supplier payment record by paymentId
                tbl_SupplierPayment supplierPayment = db.tbl_SupplierPayment.Find(paymentId);

                if (supplierPayment == null)
                {
                    // Record not found, return an error response
                    return Json(new { success = false, message = "Record not found." });
                }

                // Remove the supplier payment record from the database
                db.tbl_SupplierPayment.Remove(supplierPayment);
                db.SaveChanges();

                // Return a success response
                return Json(new { success = true, message = "Record deleted successfully." });
            }
            catch (Exception ex)
            {
                // Return an error response with the exception message
                return Json(new { success = false, message = "An error occurred while deleting the record. " + ex.Message });
            }
        }

        // Helper method to retrieve the tax rate based on the tax ID
        private string GetTaxRate(int taxId)
        {
            var tax = db.tbl_Tax.FirstOrDefault(t => t.TaxID == taxId);
            return tax != null ? tax.TaxRate.ToString() : "";
        }
        private string GetSup(int supplierId)
        {
            var supp = db.Suppliers.FirstOrDefault(t => t.SupplierID == supplierId);
            return supp != null ? supp.CompanyName.ToString() : "";
        }

        [HttpPost]
        public ActionResult SubmitRequest(int invoiceId, DateTime paymentDate, int paymentTerm, int taxId, int totalAmount, int netAmount, int supplierId)
        {
            // Check if the invoice ID already exists in the database
            bool invoiceExists = db.tbl_SupplierPayment.Any(s => s.invoiceId == invoiceId);

            if (invoiceExists)
            {
                return Json(new { success = false, message = "Invoice ID already exists. Please enter a different invoice ID." });
            }

            // Get the supplier from the database based on the supplierId
            var supplier = db.Suppliers.FirstOrDefault(s => s.SupplierID == supplierId);

            if (supplier == null)
            {
                return Json(new { success = false, message = "Supplier not found." });
            }

            // Create a new SupplierPayment object
            tbl_SupplierPayment supplierPayment = new tbl_SupplierPayment();

            // Assign values to the properties of the SupplierPayment object
            supplierPayment.invoiceId = invoiceId;
            supplierPayment.PaymentDate = paymentDate;
            supplierPayment.PaymentTerm = paymentTerm;
            supplierPayment.CreatedDate = DateTime.Now;
            supplierPayment.Tax = taxId; // Assign the tax ID directly
            supplierPayment.Totalamount = totalAmount;
            supplierPayment.NetAmount = netAmount;
            supplierPayment.Sup = supplier.CompanyName; // Assign the CompanyName of the supplier

            // Save the SupplierPayment object to the database
            db.tbl_SupplierPayment.Add(supplierPayment);
            db.SaveChanges();

            return Json(new { success = true, message = "Request submitted successfully" });
        }

    }
}
