
//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------


namespace IMS_Project.Models
{

using System;
    using System.Collections.Generic;
    
public partial class RequestforQoutation
{

    public RequestforQoutation()
    {

        this.GoodReceiptNotes = new HashSet<GoodReceiptNote>();

        this.SupplierQoutations = new HashSet<SupplierQoutation>();

    }


    public int ReqQoutationID { get; set; }

    public Nullable<int> Product { get; set; }

    public Nullable<int> Supplier { get; set; }

    public Nullable<int> Quantity { get; set; }

    public Nullable<System.DateTime> ProductDate { get; set; }

    public string suppName { get; set; }



    public virtual ICollection<GoodReceiptNote> GoodReceiptNotes { get; set; }

    public virtual Product Product1 { get; set; }

    public virtual Supplier Supplier1 { get; set; }

    public virtual ICollection<SupplierQoutation> SupplierQoutations { get; set; }

}

}
