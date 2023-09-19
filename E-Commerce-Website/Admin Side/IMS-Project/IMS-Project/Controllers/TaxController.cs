using System.Linq;
using System.Web.Mvc;
using IMS_Project.Models;

namespace IMS_Project.Controllers
{
    public class TaxController : Controller
    {
        private KahreedoEntities db = new KahreedoEntities(); // Replace YourDbContext with your actual DbContext class name

        // GET: /Tax/
        // GET: /Tax/
        public ActionResult Index()
        {
            var taxes = db.tbl_Tax.ToList();

            return View(taxes);
        }

        [HttpPost]
        public ActionResult Index(FormCollection form)
        {
            if (ModelState.IsValid)
            {
                var tax = new tbl_Tax
                {
                    TaxRate = decimal.Parse(form["TaxRate"]),
                    Taxcode = form["TaxCode"],
                    TaxValue = decimal.Parse(form["TaxValue"]),
                    CreatedDate = System.DateTime.Now
                };

                db.tbl_Tax.Add(tax);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View();
        }


        [HttpPost]
        public ActionResult Delete(int id)
        {
            var existingTax = db.tbl_Tax.Find(id);
            if (existingTax != null)
            {
                db.tbl_Tax.Remove(existingTax);
                db.SaveChanges();
            }

            return RedirectToAction("Index");
        }


        [HttpPost]
        public ActionResult Update(tbl_Tax tax)
        {
            if (ModelState.IsValid)
            {
                var existingTax = db.tbl_Tax.Find(tax.TaxID);
                if (existingTax != null)
                {
                    existingTax.TaxRate = tax.TaxRate;
                    existingTax.Taxcode = tax.Taxcode;
                    existingTax.TaxValue = tax.TaxValue;
                    db.SaveChanges();

                    return Json(new { success = true });
                }
            }

            return Json(new { success = false });
        }
    }
}
