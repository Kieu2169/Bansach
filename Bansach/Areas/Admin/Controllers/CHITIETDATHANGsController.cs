using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Bansach.Models;

namespace Bansach.Areas.Admin.Controllers
{
    public class CHITIETDATHANGsController : Controller
    {
        private Bán_SáchEntities db = new Bán_SáchEntities();

        // GET: Admin/CHITIETDATHANGs
        public ActionResult Index()
        {
            var cHITIETDATHANGs = db.CHITIETDATHANGs.Include(c => c.DONDATHANG).Include(c => c.SACH);
            return View(cHITIETDATHANGs.ToList());
        }

        // GET: Admin/CHITIETDATHANGs/Details/5
        public ActionResult Details(int? id, int? id1)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CHITIETDATHANG cHITIETDATHANG = db.CHITIETDATHANGs.Find(new object[] { id, id1 });
            if (cHITIETDATHANG == null)
            {
                return HttpNotFound();
            }
            return View(cHITIETDATHANG);
        }

        // GET: Admin/CHITIETDATHANGs/Create
        public ActionResult Create()
        {
            ViewBag.Idddh = new SelectList(db.DONDATHANGs, "Idddh", "Tongtien");
            ViewBag.Idsach = new SelectList(db.SACHes, "Idsach", "Tuasach");
            return View();
        }

        // POST: Admin/CHITIETDATHANGs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Idsach,Idddh,Soluong,Dongia,Thanhtien")] CHITIETDATHANG cHITIETDATHANG)
        {
            if (ModelState.IsValid)
            {
                db.CHITIETDATHANGs.Add(cHITIETDATHANG);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Idddh = new SelectList(db.DONDATHANGs, "Idddh", "Tongtien", cHITIETDATHANG.Idddh);
            ViewBag.Idsach = new SelectList(db.SACHes, "Idsach", "Tuasach", cHITIETDATHANG.Idsach);
            return View(cHITIETDATHANG);
        }

        // GET: Admin/CHITIETDATHANGs/Edit/5
        public ActionResult Edit(int? id, int? id1)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CHITIETDATHANG cHITIETDATHANG = db.CHITIETDATHANGs.Find(new object[] { id, id1 });
            if (cHITIETDATHANG == null)
            {
                return HttpNotFound();
            }
            ViewBag.Idddh = new SelectList(db.DONDATHANGs, "Idddh", "Tongtien", cHITIETDATHANG.Idddh);
            ViewBag.Idsach = new SelectList(db.SACHes, "Idsach", "Tuasach", cHITIETDATHANG.Idsach);
            return View(cHITIETDATHANG);
        }

        // POST: Admin/CHITIETDATHANGs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Idsach,Idddh,Soluong,Dongia,Thanhtien")] CHITIETDATHANG cHITIETDATHANG)
        {
            if (ModelState.IsValid)
            {
                db.Entry(cHITIETDATHANG).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Idddh = new SelectList(db.DONDATHANGs, "Idddh", "Tongtien", cHITIETDATHANG.Idddh);
            ViewBag.Idsach = new SelectList(db.SACHes, "Idsach", "Tuasach", cHITIETDATHANG.Idsach);
            return View(cHITIETDATHANG);
        }

        // GET: Admin/CHITIETDATHANGs/Delete/5
        public ActionResult Delete(int? id, int? id1)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CHITIETDATHANG cHITIETDATHANG = db.CHITIETDATHANGs.Find(new object[] { id, id1 });
            if (cHITIETDATHANG == null)
            {
                return HttpNotFound();
            }
            return View(cHITIETDATHANG);
        }

        // POST: Admin/CHITIETDATHANGs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int? id, int? id1)
        {
            CHITIETDATHANG cHITIETDATHANG = db.CHITIETDATHANGs.Find(new object[] { id, id1 });
            db.CHITIETDATHANGs.Remove(cHITIETDATHANG);
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
