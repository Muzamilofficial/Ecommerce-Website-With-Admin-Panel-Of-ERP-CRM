namespace IMS_Project.Models
{

    using System;
    using System.Collections.Generic;

    public class RequestforQuotationItems
    {
        public RequestforQuotationItems()
        {

            
        }

        public int reqQuotID { get; set; }

        public int productID { get; set; }

        public int qty { get; set; }

        public int supplierID { get; set; }

        public System.String productName { get; set; }

    }
}