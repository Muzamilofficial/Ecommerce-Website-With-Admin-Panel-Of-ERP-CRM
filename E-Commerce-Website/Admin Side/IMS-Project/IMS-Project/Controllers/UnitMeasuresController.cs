using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IMS_Project.Models;

namespace IMS_Project.Controllers
{
    public class UnitMeasuresController : Controller
    {
        private KahreedoEntities db = new KahreedoEntities();

        public ActionResult Index()
        {
            List<tbl_UnitofMeasures> unitMeasures = db.tbl_UnitofMeasures.ToList();
            ViewBag.UnitMeasures = unitMeasures;
            return View();
        }

        [HttpPost]
        public ActionResult Create(string unitMeasure, string description, string abbreviation)
        {
            if (string.IsNullOrEmpty(unitMeasure) || string.IsNullOrEmpty(description) || string.IsNullOrEmpty(abbreviation))
            {
                ViewBag.ErrorMessage = "Please fill in all fields.";
                return View("Index");
            }

            tbl_UnitofMeasures newUnitMeasure = new tbl_UnitofMeasures
            {
                UnitMeasure = unitMeasure,
                Description = description,
                Abbrevation = abbreviation
            };

            db.tbl_UnitofMeasures.Add(newUnitMeasure);
            db.SaveChanges();

            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult Update(int UnitMeasureID, string unitMeasure, string description, string abbreviation)
        {
            tbl_UnitofMeasures existingUnitMeasure = db.tbl_UnitofMeasures.Find(UnitMeasureID);
            if (existingUnitMeasure == null)
            {
                // Handle unit measure not found error
                return RedirectToAction("Index");
            }

            existingUnitMeasure.UnitMeasure = unitMeasure;
            existingUnitMeasure.Description = description;
            existingUnitMeasure.Abbrevation = abbreviation;
            db.SaveChanges();

            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult Delete(int UnitMeasureID)
        {
            tbl_UnitofMeasures unitMeasure = db.tbl_UnitofMeasures.Find(UnitMeasureID);
            if (unitMeasure == null)
            {
                // Handle unit measure not found error
                return RedirectToAction("Index");
            }

            db.tbl_UnitofMeasures.Remove(unitMeasure);
            db.SaveChanges();

            return RedirectToAction("Index");
        }
    }
}
