using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IMS_Project.Models;
using System.Data;
using System.Data.SqlClient;
using Newtonsoft.Json;


namespace IMS_Project.Views
{
    public class CustomerRequestAddController : Controller
    {
        KahreedoEntities db = new KahreedoEntities();

        public ActionResult Index()
        {
            var products = db.Products.ToList();
            var customer = db.Customers.ToList();

            // Pass the data to the view
            ViewBag.Products = products;
            ViewBag.Customers = customer;

            List<CustomerRequestforQoutation> quote = db.CustomerRequestforQoutations.ToList();

            return View(quote);
        }

        [HttpPost]
        public ActionResult SubmitRequest(int combobox1, int combobox2, int quantity, DateTime? datepicker)
        {
            if (datepicker.HasValue)
            {
                // Call the stored procedure to insert the data
                db.Database.ExecuteSqlCommand("EXEC InsertCustomerRequestforQoutation @Product, @Customer, @Quantity, @ProductDate",
                    new SqlParameter("@Product", combobox1),
                    new SqlParameter("@Supplier", combobox2),
                    new SqlParameter("@Quantity", quantity),
                    new SqlParameter("@ProductDate", datepicker.Value));
            }
            else
            {
                // Handle the case when the datepicker field is not filled
                // You can choose to set a default value or perform any other required action
            }

            // Redirect to a success page or perform other actions
            return RedirectToAction("Index");
        }
        [HttpPost]
        public ActionResult DeleteRequest(int reqQoutationId)
        {
            // Find the request in the database
            var request = db.RequestforCustomerQuotationItems.Find(reqQoutationId);
            if (request != null)
            {
                // Remove the request from the database
                db.RequestforCustomerQuotationItems.Remove(request);
                db.SaveChanges();
            }

            // Return a success response
            return Json(new { success = true });
        }
        [HttpPost]
        public ActionResult UpdateRequest(int reqQoutationId, int combobox1, int combobox2, int quantity, DateTime? datepicker)
        {
            var request = db.CustomerRequestforQoutations.Find(reqQoutationId);
            if (request != null)
            {
                if (datepicker.HasValue)
                {
                    // Update the request with the new values
                    request.Product = combobox1;
                    request.Customer = combobox2;
                    request.Quantity = quantity;
                    request.ProductDate = datepicker.Value;
                }
                else
                {
                    // Handle the case when the datepicker field is not filled
                    // You can choose to set a default value or perform any other required action
                }

                // Save the changes to the database
                db.SaveChanges();
            }

            // Redirect to the index page or perform other actions
            return RedirectToAction("Index");
        }

        [HttpPost]
        public int AddItemToListRequest(int reqQoutationId, int combobox1, string proTxt, int combobox2, string suppTxt, int quantity, DateTime? datepicker)
        {
            if (reqQoutationId != 0)
            {
                var request = db.RequestforQoutations.Find(reqQoutationId);
                if (request != null)
                {
                    if (datepicker.HasValue)
                    {
                        // Update the request with the new values
                        db.Database.ExecuteSqlCommand("Insert INTO RequestforCustomerQuotationItems (reqQuotID, productID, qty, CustomerID, productName) VALUES (@reqQuotID, @productID, @qty, @supplierID, @productName)",
                    new SqlParameter("@reqQuotID", reqQoutationId),
                    new SqlParameter("@productID", combobox1),
                    new SqlParameter("@qty", quantity),
                        new SqlParameter("@CustomerID", combobox2),
                        new SqlParameter("@productName", proTxt));

                    }
                    else
                    {
                        // Handle the case when the datepicker field is not filled
                        // You can choose to set a default value or perform any other required action
                    }

                    // Save the changes to the database
                    return reqQoutationId;
                }
                else
                {
                    var outputParameter = new SqlParameter("@ReqQoutationID", SqlDbType.Int)
                    {
                        Direction = ParameterDirection.Output
                    };

                    db.Database.ExecuteSqlCommand("INSERT INTO CustomerRequestforQoutation (Customer, ProductDate, CustomerName) OUTPUT Inserted.ReqQoutationID VALUES (@Customer, @ProductDate, @CustomerName)",
                        new SqlParameter("@Customer", combobox2),
                        new SqlParameter("@ProductDate", datepicker.Value),
                        new SqlParameter("@CustomerName", suppTxt),
                        outputParameter);

                    int insertedID = (int)outputParameter.Value;


                    db.Database.ExecuteSqlCommand("EXEC Insert RequestforQuotationItems @reqQuotID, @productID, @qty, @supplierID, @productName",
                    new SqlParameter("@reqQuotID", insertedID),
                    new SqlParameter("@productID", combobox1),
                    new SqlParameter("@qty", quantity),
                        new SqlParameter("@Supplier", combobox2),
                    new SqlParameter("@productName", proTxt));
                    return insertedID;

                }

                // Redirect to the index page or perform other actions
                //return RedirectToAction("Index");

            }
            else
            {
                var outputParameter = new SqlParameter("@ReqQoutationID", SqlDbType.Int)
                {
                    Direction = ParameterDirection.Output
                };

                db.Database.ExecuteSqlCommand("INSERT INTO RequestforQoutation (Supplier, ProductDate, suppName) OUTPUT INSERTED.ReqQoutationID VALUES (@Supplier, @ProductDate, @suppName)",
                    new SqlParameter("@Supplier", combobox2),
                    new SqlParameter("@ProductDate", datepicker.Value),
                    new SqlParameter("@suppName", suppTxt),
                    outputParameter);

                int lastInsertedId = db.Database.SqlQuery<int>("SELECT MAX(ReqQoutationID) AS LastInsertedID FROM RequestforQoutation;").FirstOrDefault();


                db.Database.ExecuteSqlCommand("Insert into RequestforQuotationItems (reqQuotID, productID, qty, supplierID, productName) VALUES (@reqQuotID, @productID, @qty, @supplierID, @productName)",
                new SqlParameter("@reqQuotID", lastInsertedId),
                new SqlParameter("@productID", combobox1),
                new SqlParameter("@qty", quantity),
                    new SqlParameter("@supplierID", combobox2),
                new SqlParameter("@productName", proTxt));
                return lastInsertedId;
            }
            return 0;
        }

        [HttpPost]
        public string getQuoteReqData(int reqQoutationId)
        {
            // Sample data

            var data = db.RequestforCustomerQuotationItems.Where(t => t.reqQuotID == reqQoutationId).ToList();
            var json = JsonConvert.SerializeObject(data);
            return json;

        }
    }
}