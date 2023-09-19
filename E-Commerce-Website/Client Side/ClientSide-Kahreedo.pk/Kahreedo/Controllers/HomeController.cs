using Khareedo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace Khareedo.Controllers
{
    public class HomeController : Controller
    {
        KhareedoEntities db = new KhareedoEntities();

        // GET: Home
        public ActionResult Index()
        {
            ViewBag.MenProduct = db.Products.Where(x => x.Category.Name.Equals("Ferodo")).ToList();
            ViewBag.WomenProduct = db.Products.Where(x => x.Category.Name.Equals("Tires & Tubes")).ToList();
            ViewBag.SportsProduct = db.Products.Where(x => x.Category.Name.Equals("misc")).ToList();
            ViewBag.ElectronicsProduct = db.Products.Where(x => x.Category.Name.Equals("Handlebar Accesories")).ToList();

            ViewBag.ElectronicsProduct = db.Products.Where(x => x.Category.Name.Equals("Handlebar Accesories")).ToList();
            ViewBag.Slider = db.genMainSliders.ToList();
            ViewBag.PromoRight = db.genPromoRights.ToList();

            this.GetDefaultData();



            return View();
        }      

    }
}