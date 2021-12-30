using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Bansach.Models;

namespace Bansach.Controllers.main_partial
{
    public class LController : Controller
    {
        private Bán_SáchEntities db = new Bán_SáchEntities();

        // GET: L
        public ActionResult Index()
        {
            return View(db.LIENHEs.ToList());
        }

        // GET: L/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LIENHE lIENHE = db.LIENHEs.Find(id);
            if (lIENHE == null)
            {
                return HttpNotFound();
            }
            return View(lIENHE);
        }

        // GET: L/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: L/Create
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
                return RedirectToAction("Index");
            }

            return View(lIENHE);
        }

        // GET: L/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LIENHE lIENHE = db.LIENHEs.Find(id);
            if (lIENHE == null)
            {
                return HttpNotFound();
            }
            return View(lIENHE);
        }

        // POST: L/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Idlienhe,Ho,Ten,Email,SDT,Noidung")] LIENHE lIENHE)
        {
            if (ModelState.IsValid)
            {
                db.Entry(lIENHE).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(lIENHE);
        }

        // GET: L/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LIENHE lIENHE = db.LIENHEs.Find(id);
            if (lIENHE == null)
            {
                return HttpNotFound();
            }
            return View(lIENHE);
        }

        // POST: L/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            LIENHE lIENHE = db.LIENHEs.Find(id);
            db.LIENHEs.Remove(lIENHE);
            db.SaveChanges();
            return RedirectToAction("Index");
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
