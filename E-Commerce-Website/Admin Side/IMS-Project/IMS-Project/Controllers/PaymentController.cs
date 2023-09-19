using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IMS_Project.Models;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;

namespace IMS_Project.Controllers
{
    public class PaymentController : Controller
    {
        private KahreedoEntities db = new KahreedoEntities();

        // GET: /Payment/
        public ActionResult Index(int? selectedSupplierQoutationID)
        {
            // Get all supplier quotation IDs from the database
            List<int> supplierQuotationIDs = db.SupplierQoutations
                .Select(q => q.SupplierQoutationID)
                .ToList();

            // Create a list of SelectListItem for the ComboBox
            List<SelectListItem> supplierQuotations = supplierQuotationIDs
                .Select(id => new SelectListItem
                {
                    Value = id.ToString(),
                    Text = id.ToString(),
                    Selected = (id == selectedSupplierQoutationID) // Set selected item based on input parameter
                })
                .ToList();

            ViewBag.SupplierQuotations = supplierQuotations;

            // Retrieve the SupplierQoutation record based on the selected ID
            SupplierQoutation selectedQuotation = db.SupplierQoutations
                .FirstOrDefault(q => q.SupplierQoutationID == selectedSupplierQoutationID);

            // Pass the selected quotation to the view
            return View(selectedQuotation);
        }
        public ActionResult PrintPDF(int? selectedSupplierQoutationID)
        {
            // Retrieve the SupplierQoutation record based on the selected ID
            SupplierQoutation selectedQuotation = db.SupplierQoutations
                .FirstOrDefault(q => q.SupplierQoutationID == selectedSupplierQoutationID);

            // Generate the PDF
            MemoryStream stream = new MemoryStream();
            Document document = new Document();
            PdfWriter writer = PdfWriter.GetInstance(document, stream);

            document.Open();

            // Create a PdfPTable and add the table headers
            PdfPTable table = new PdfPTable(5);
            table.WidthPercentage = 100;
            table.SetWidths(new float[] { 1, 1, 2, 1, 2 });

            table.AddCell("Supplier Quotation ID");
            table.AddCell("ReqQoutationID");
            table.AddCell("Supplier");
            table.AddCell("Total Price");
            table.AddCell("Date");

            // Add the row data to the table
            table.AddCell(selectedQuotation.SupplierQoutationID.ToString());
            table.AddCell(selectedQuotation.ReqQoutationID.ToString());
            table.AddCell(selectedQuotation.Supplier);
            table.AddCell(selectedQuotation.TotalPrice.ToString());
            table.AddCell(selectedQuotation.Date.ToString());

            document.Add(table);
            document.Close();

            // Set the response headers to force download the PDF
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=SupplierQuotation.pdf");
            Response.BinaryWrite(stream.ToArray());
            Response.End();

            return null;
        }

    }
}
