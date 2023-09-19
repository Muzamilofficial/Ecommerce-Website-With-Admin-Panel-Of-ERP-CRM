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
    public class CustomerQouatController : Controller
    {
        KahreedoEntities db = new KahreedoEntities();

        // GET: /CustomerQouat/
        public ActionResult Index()
        {
            var products = db.Products.ToList();
            var customers = db.Customers.ToList();

            // Pass the data to the view
            ViewBag.Products = products;
            ViewBag.Customers = customers;

            List<CustomerRequestforQoutation> quote = db.CustomerRequestforQoutations.ToList();

            return View(quote);
        }

        [HttpPost]
        public ActionResult SubmitRequest(int purchaseorderid, string product, string supplier, int quantity, DateTime datepicker, int quantity2, int priceperunit, int? total)
        {
            if (!string.IsNullOrEmpty(supplier) && quantity2 > 0 && priceperunit > 0)
            {
                // Calculate the total price
                decimal totalPrice = priceperunit * quantity2;

                // Call the stored procedure to insert the data
                db.Database.ExecuteSqlCommand("EXEC InsertCustomerQoutation @ReqQoutationID, @Product, @Customer, @QuantityNeeded, @CustomerQuantity, @UnitPrice, @TotalPrice, @ProductDate",
                    new SqlParameter("@ReqQoutationID", purchaseorderid),
                    new SqlParameter("@Product", product),
                    new SqlParameter("@Customer", supplier),
                    new SqlParameter("@QuantityNeeded", quantity),
                    new SqlParameter("@CustomerQuantity", quantity2),
                    new SqlParameter("@UnitPrice", priceperunit),
                    new SqlParameter("@ProductDate", datepicker),
                    new SqlParameter("@TotalPrice", totalPrice)); // Pass the calculated total price

                // Redirect to a success page or perform other actions
                return RedirectToAction("Index", "CustomerQouat");
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
            var data = db.CustomerRequestforQoutations
                .Where(t => t.ReqQoutationID == reqQoutationId)
                .ToList();

            string query = "SELECT * FROM RequestforCustomerQuotationItems WHERE reqQuotID = @ReqQoutationID";
            SqlParameter param = new SqlParameter("@ReqQoutationID", reqQoutationId);

            var data2 = db.Database.SqlQuery<CustomerQuotationItem>(query, param).ToList();

            // Map the data to a custom data structure
            StringBuilder sa = new StringBuilder();
            sa.Append("[");
            foreach (var item in data2)
            {
                sa.Append("{");
                sa.AppendFormat("\"reqQuotID\": \"{0}\",", item.reqQuotID);
                sa.AppendFormat("\"productID\": \"{0}\",", item.productID);
                sa.AppendFormat("\"qty\": \"{0}\",", item.qty);
                sa.AppendFormat("\"supplierID\": \"{0}\",", item.CustomerID);
                sa.AppendFormat("\"productName\": \"{0}\"", item.productName);
                sa.Append("},");
            }

            if (data2.Count > 0)
            {
                sa.Length--; // Remove the trailing comma
            }

            sa.Append("]");

            string json2 = sa.ToString();

            int? lastInsertedId = db.Database.SqlQuery<int?>("SELECT MAX(CustomerQoutationID) AS LastInsertedID FROM CustomerQoutation;").FirstOrDefault();

            StringBuilder sb = new StringBuilder();
            sb.Append("[");
            foreach (var item in data)
            {
                sb.Append("{");
                sb.AppendFormat("\"ReqQoutationID\": \"{0}\",", item.ReqQoutationID);
                sb.AppendFormat("\"Product\": \"{0}\",", item.Product);
                sb.AppendFormat("\"Supplier\": \"{0}\",", item.Customer);
                sb.AppendFormat("\"Quantity\": \"{0}\",", item.Quantity);
                sb.AppendFormat("\"ProductDate\": \"{0}\",", item.ProductDate);
                sb.AppendFormat("\"suppName\": \"{0}\",", item.custname);
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

            db.Database.ExecuteSqlCommand("INSERT INTO CustomerQoutation (ReqQoutationID, Customer, TotalPrice, Date, SaveQuantity,Tax,PaymentTerm, ConUnit) VALUES (@ReqQoutationID, @Supplier, @TotalPrice, @Date, @SaveQuantity,@TaxValues, @PaymentTerm, @ConUnit)",
                new SqlParameter("@ReqQoutationID", reqID),
                new SqlParameter("@Supplier", suppID),
                new SqlParameter("@TotalPrice", (int)totalAmount),
                new SqlParameter("@Date", DateTime.Now),
                new SqlParameter("@TaxValues", taxValues),
                new SqlParameter("@PaymentTerm", paymentTerm),
                new SqlParameter("@ConUnit", ConUnit),
                new SqlParameter("@SaveQuantity", saveQuantity));

            return Content("test");
        }
    }
}
