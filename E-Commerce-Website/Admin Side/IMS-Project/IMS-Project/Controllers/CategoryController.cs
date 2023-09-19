using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IMS_Project.Models;

namespace IMS_Project.Controllers
{
    public class CategoryController : Controller
    {
        private KahreedoEntities db = new KahreedoEntities();

        public ActionResult Index()
        {
            List<Category> categories = db.Categories.ToList();
            ViewBag.Categories = categories;
            return View();
        }

        [HttpPost]
        public ActionResult Create(string name, string description)
        {
            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(description))
            {
                ViewBag.ErrorMessage = "Please fill in all fields.";
                return View("Index");
            }

            Category category = new Category
            {
                Name = name,
                Description = description
            };

            db.Categories.Add(category);
            db.SaveChanges();

            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult Update(int CategoryID, string name, string description)
        {
            Category category = db.Categories.Find(CategoryID);
            if (category == null)
            {
                // Handle category not found error
                return RedirectToAction("Index");
            }

            category.Name = name;
            category.Description = description;
            db.SaveChanges();

            return RedirectToAction("Index");
        }
        [HttpPost]
        public ActionResult Delete(int CategoryID)
        {
            Category category = db.Categories.Find(CategoryID);
            if (category == null)
            {
                // Handle category not found error
                return RedirectToAction("Index");
            }

            db.Categories.Remove(category);
            db.SaveChanges();

            return RedirectToAction("Index");
        }
    }
}
