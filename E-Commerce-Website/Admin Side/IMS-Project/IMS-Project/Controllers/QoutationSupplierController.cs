using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IMS_Project.Models;
using System.Data.SqlClient;
using Newtonsoft.Json;
using System.Text;
using Newtonsoft.Json.Linq;

namespace IMS_Project.Controllers
{
    public class QoutationSupplierController : Controller
    {
        KahreedoEntities db = new KahreedoEntities();

        // GET: /QoutationSupplier/
        public ActionResult Index()
        {
            var products = db.Products.ToList();
            var suppliers = db.Suppliers.ToList();
            var taxRates = db.tbl_Tax.ToList(); // Assuming you have a table or DbSet for tax rates

            // Pass the data to the view
            ViewBag.Products = products;
            ViewBag.Suppliers = suppliers;
            ViewBag.tbl_Tax = taxRates; // Set the ViewBag.tbl_Tax with the tax rates

            List<RequestforQoutation> quote = db.RequestforQoutations.ToList();

            return View(quote);
        }

        [HttpPost]
        public ActionResult SubmitRequest(int purchaseorderid, string product, string supplier, int quantity, DateTime datepicker, int quantity2, int priceperunit, int? total, int taxrate)
        {
            if (!string.IsNullOrEmpty(supplier) && quantity2 > 0 && priceperunit > 0)
            {
                // Calculate the total price
                decimal totalPrice = priceperunit * quantity2;

                // Call the stored procedure to insert the data
                db.Database.ExecuteSqlCommand("EXEC InsertSupplierQoutation @ReqQoutationID, @Product, @Supplier, @QuantityNeeded, @SupplierQuantity, @UnitPrice, @TotalPrice, @ProductDate, @TaxRateID",
                    new SqlParameter("@ReqQoutationID", purchaseorderid),
                    new SqlParameter("@Product", product),
                    new SqlParameter("@Supplier", supplier),
                    new SqlParameter("@QuantityNeeded", quantity),
                    new SqlParameter("@SupplierQuantity", quantity2),
                    new SqlParameter("@UnitPrice", priceperunit),
                    new SqlParameter("@ProductDate", datepicker),
                    new SqlParameter("@TotalPrice", totalPrice), // Pass the calculated total price
                    new SqlParameter("@TaxRateID", taxrate)); // Pass the selected tax rate

                // Redirect to a success page or perform other actions
                return RedirectToAction("Index", "QoutationSupplier");
            }
            else
            {
                // Handle the case when the supplier field is not filled or quantity/price is not greater than 0
                // You can choose to display an error message or perform any other required action
                ViewBag.Error = "Please fill in all the fields and ensure quantity/price is greater than 0.";
                return View();
            }
        }

        [HttpPost]
        public ActionResult getQuoteReqData(int reqQoutationId)
        {
            var data = db.RequestforQoutations
                .Where(t => t.ReqQoutationID == reqQoutationId)
                .ToList();

            string query = "SELECT * FROM RequestforQuotationItems WHERE reqQuotID = @ReqQoutationID";
            SqlParameter param = new SqlParameter("@ReqQoutationID", reqQoutationId);

            var data2 = db.Database.SqlQuery<RequestforQuotationItems>(query, param).ToList();

            // Map the data to a custom data structure
            StringBuilder sa = new StringBuilder();
            sa.Append("[");
            foreach (var item in data2)
            {
                sa.Append("{");
                sa.AppendFormat("\"reqQuotID\": \"{0}\",", item.reqQuotID);
                sa.AppendFormat("\"productID\": \"{0}\",", item.productID);
                sa.AppendFormat("\"qty\": \"{0}\",", item.qty);
                sa.AppendFormat("\"supplierID\": \"{0}\",", item.supplierID);
                sa.AppendFormat("\"productName\": \"{0}\"", item.productName);
                sa.Append("},");
            }

            if (data2.Count > 0)
            {
                sa.Length--; // Remove the trailing comma
            }

            sa.Append("]");

            string json2 = sa.ToString();

            int? lastInsertedId = db.Database.SqlQuery<int?>("SELECT MAX(SupplierQoutationID) AS LastInsertedID FROM SupplierQoutation;").FirstOrDefault();

            StringBuilder sb = new StringBuilder();
            sb.Append("[");
            foreach (var item in data)
            {
                sb.Append("{");
                sb.AppendFormat("\"ReqQoutationID\": \"{0}\",", item.ReqQoutationID);
                sb.AppendFormat("\"Product\": \"{0}\",", item.Product);
                sb.AppendFormat("\"Supplier\": \"{0}\",", item.Supplier);
                sb.AppendFormat("\"Quantity\": \"{0}\",", item.Quantity);
                sb.AppendFormat("\"ProductDate\": \"{0}\",", item.ProductDate);
                sb.AppendFormat("\"suppName\": \"{0}\",", item.suppName);
                sb.AppendFormat("\"newSupplieID\": \"{0}\",", (lastInsertedId + 1));
                sb.AppendFormat("\"items\": {0}", json2); // Removed the quotes around json2

                // Add more properties as needed
                sb.Append("},");
            }
            sb.Length--; // Remove the trailing comma
            sb.Append("]");

            string json = sb.ToString();

            return Content(json, "application/json");
        }

        [HttpPost]
        public ActionResult submitSupplierQuote(int reqID, string data, int suppID, int paymentTerm)
        {
            JObject jsonObject = JObject.Parse(data);

            float totalAmount = 0;
            string saveQuantity = ""; // Initialize the saveQuantity string
            string taxValues = ""; // Initialize the taxValues string
            string ConUnit = "";

            foreach (var dd in jsonObject)
            {
                float qtyHave = float.Parse((string)dd.Value["qtyHave"]);
                float priceUnit = float.Parse((string)dd.Value["priceUnit"]);
                float tax = float.Parse((string)dd.Value["tax"]); // Get the tax value

                totalAmount += qtyHave * priceUnit * tax;
                saveQuantity += qtyHave.ToString() + ",";
                taxValues += tax.ToString() + ","; // Append the tax value

                ConUnit += priceUnit.ToString() + ",";
            }

            // Remove the last comma from the saveQuantity, taxValues, and ConUnit strings
            saveQuantity = saveQuantity.TrimEnd(',');
            taxValues = taxValues.TrimEnd(',');
            ConUnit = ConUnit.TrimEnd(',');

            db.Database.ExecuteSqlCommand("INSERT INTO SupplierQoutation (ReqQoutationID, Supplier, TotalPrice, Date, SaveQuantity, Tax, PaymentTerm, ConUnit) VALUES (@ReqQoutationID, @Supplier, @TotalPrice, @Date, @SaveQuantity, @TaxValues, @PaymentTerm, @ConUnit)",
                new SqlParameter("@ReqQoutationID", reqID),
                new SqlParameter("@Supplier", suppID),
                new SqlParameter("@TotalPrice", (int)totalAmount),
                new SqlParameter("@Date", DateTime.Now),
                new SqlParameter("@SaveQuantity", saveQuantity),
                new SqlParameter("@TaxValues", taxValues),
                new SqlParameter("@PaymentTerm", paymentTerm),
                new SqlParameter("@ConUnit", ConUnit));

            return Content("test");
        }
    }
}
