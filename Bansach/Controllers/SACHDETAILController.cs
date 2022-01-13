using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Bansach.Models;

namespace Bansach.Controllers
{
    public class SACHDETAILController : Controller
    {
        private Bán_SáchEntities db = new Bán_SáchEntities();

        // GET: SACHDETAIL
        public ActionResult Index()
        {
            var sACHes = db.SACHes.Include(s => s.DANHMUC).Include(s => s.NHAXUATBAN);
            return PartialView(sACHes.ToList());
        }

        // GET: SACHDETAIL/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SACH sACH = db.SACHes.Find(id);
            if (sACH == null)
            {
                return HttpNotFound();
            }
            return View(sACH);
        }

        // GET: SACHDETAIL/Create
        public ActionResult Create()
        {
            ViewBag.Iddanhmuc = new SelectList(db.DANHMUCs, "Iddanhmuc", "Tendanhmuc");
            ViewBag.IdNXB = new SelectList(db.NHAXUATBANs, "IdNXB", "Ten");
            return View();
        }

        // POST: SACHDETAIL/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Idsach,IdNXB,Iddanhmuc,Soluong,Tuasach,Gioithieusach,Khoiluong,Ngayphathanh,Ngonngu,Nguoidich,Kichthuoc,Sotrang,Giagoc,Giamgia,Giaban,Motangan,Hinhanh,Masach")] SACH sACH)
        {
            if (ModelState.IsValid)
            {
                db.SACHes.Add(sACH);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Iddanhmuc = new SelectList(db.DANHMUCs, "Iddanhmuc", "Tendanhmuc", sACH.Iddanhmuc);
            ViewBag.IdNXB = new SelectList(db.NHAXUATBANs, "IdNXB", "Ten", sACH.IdNXB);
            return View(sACH);
        }

        // GET: SACHDETAIL/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SACH sACH = db.SACHes.Find(id);
            if (sACH == null)
            {
                return HttpNotFound();
            }
            ViewBag.Iddanhmuc = new SelectList(db.DANHMUCs, "Iddanhmuc", "Tendanhmuc", sACH.Iddanhmuc);
            ViewBag.IdNXB = new SelectList(db.NHAXUATBANs, "IdNXB", "Ten", sACH.IdNXB);
            return View(sACH);
        }

        // POST: SACHDETAIL/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Idsach,IdNXB,Iddanhmuc,Soluong,Tuasach,Gioithieusach,Khoiluong,Ngayphathanh,Ngonngu,Nguoidich,Kichthuoc,Sotrang,Giagoc,Giamgia,Giaban,Motangan,Hinhanh,Masach")] SACH sACH)
        {
            if (ModelState.IsValid)
            {
                db.Entry(sACH).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Iddanhmuc = new SelectList(db.DANHMUCs, "Iddanhmuc", "Tendanhmuc", sACH.Iddanhmuc);
            ViewBag.IdNXB = new SelectList(db.NHAXUATBANs, "IdNXB", "Ten", sACH.IdNXB);
            return View(sACH);
        }

        // GET: SACHDETAIL/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SACH sACH = db.SACHes.Find(id);
            if (sACH == null)
            {
                return HttpNotFound();
            }
            return View(sACH);
        }

        // POST: SACHDETAIL/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            SACH sACH = db.SACHes.Find(id);
            db.SACHes.Remove(sACH);
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
