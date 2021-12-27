using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Bansach.Models;
using PagedList;

namespace Bansach.Areas.Admin.Controllers
{
    public class SACHesController : Controller
    {
        private Bán_SáchEntities db = new Bán_SáchEntities();

        // GET: Admin/SACHes
        public ActionResult Index(string SearchString, string currentFilter, int? page)
        {
            var SACH = db.SACHes.Include(s => s.DANHMUC).Include(s => s.NHAXUATBAN).ToList();
            if (!String.IsNullOrEmpty(SearchString)) // kiểm tra chuỗi tìm kiếm có rỗng/null hay không
            {
                SACH = db.SACHes.Where(n => n.Tuasach.Contains(SearchString)).ToList(); //lọc theo chuỗi tìm kiếm
            }
            ViewBag.CurrentFilter = SearchString;
            int pageSize = 6;
            int PageNumber = (page ?? 1);
            return View(SACH.ToPagedList(PageNumber, pageSize));
        }

        // GET: Admin/SACHes/Details/5
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

        // GET: Admin/SACHes/Create
        public ActionResult Create()
        {
            ViewBag.Iddanhmuc = new SelectList(db.DANHMUCs, "Iddanhmuc", "Tendanhmuc");
            ViewBag.IdNXB = new SelectList(db.NHAXUATBANs, "IdNXB", "Ten");
            return View();
        }

        // POST: Admin/SACHes/Create
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

        // GET: Admin/SACHes/Edit/5
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

        // POST: Admin/SACHes/Edit/5
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

        // GET: Admin/SACHes/Delete/5
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

        // POST: Admin/SACHes/Delete/5
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
