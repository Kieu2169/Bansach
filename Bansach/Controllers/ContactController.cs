using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.Services.Description;
using Bansach.Models;

namespace Bansach.Controllers
{
    public class ContactController : Controller
    {
        private Bán_SáchEntities db = new Bán_SáchEntities();
        
        // GET: Contact/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Contact/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Idlienhe,Ho,Ten,Email,SDT,Noidung")] LIENHE lIENHE)
        {
            if (ModelState.IsValid)
            {
                db.LIENHEs.Add(lIENHE);
                db.SaveChanges();
                TempData["StatusMessage"] = "Cảm ơn bạn! Chúng tôi sẽ liên hệ lại cho bạn trong thời gian sớm nhất!";
                return RedirectToAction("Create");
            }

            return View(lIENHE);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
