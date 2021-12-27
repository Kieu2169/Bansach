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
    public class HOADONsController : Controller
    {
        private Bán_SáchEntities db = new Bán_SáchEntities();

        // GET: Admin/HOADONs
        public ActionResult Index(string SearchString, string currentFilter, int? page)
        {
            var HD = db.HOADONs.Include(h => h.DONDATHANG).Include(h => h.NHANVIEN).ToList();
            if (!String.IsNullOrEmpty(SearchString)) // kiểm tra chuỗi tìm kiếm có rỗng/null hay không
            {
                HD = db.HOADONs.Where(n => n.Tongtien.Contains(SearchString)).ToList(); //lọc theo chuỗi tìm kiếm
            }
            ViewBag.CurrentFilter = SearchString;
            int pageSize = 6;
            int PageNumber = (page ?? 1);
            return View(HD.ToPagedList(PageNumber, pageSize));
        }

        // GET: Admin/HOADONs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HOADON hOADON = db.HOADONs.Find(id);
            if (hOADON == null)
            {
                return HttpNotFound();
            }
            return View(hOADON);
        }

        // GET: Admin/HOADONs/Create
        public ActionResult Create()
        {
            ViewBag.Idddh = new SelectList(db.DONDATHANGs, "Idddh", "Tongtien");
            ViewBag.Idnhanvien = new SelectList(db.NHANVIENs, "Idnhanvien", "Hoten");
            return View();
        }

        // POST: Admin/HOADONs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Idhd,Idnhanvien,Ngaygiao,Idddh,Tongtien")] HOADON hOADON)
        {
            if (ModelState.IsValid)
            {
                db.HOADONs.Add(hOADON);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Idddh = new SelectList(db.DONDATHANGs, "Idddh", "Tongtien", hOADON.Idddh);
            ViewBag.Idnhanvien = new SelectList(db.NHANVIENs, "Idnhanvien", "Hoten", hOADON.Idnhanvien);
            return View(hOADON);
        }

        // GET: Admin/HOADONs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HOADON hOADON = db.HOADONs.Find(id);
            if (hOADON == null)
            {
                return HttpNotFound();
            }
            ViewBag.Idddh = new SelectList(db.DONDATHANGs, "Idddh", "Tongtien", hOADON.Idddh);
            ViewBag.Idnhanvien = new SelectList(db.NHANVIENs, "Idnhanvien", "Hoten", hOADON.Idnhanvien);
            return View(hOADON);
        }

        // POST: Admin/HOADONs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Idhd,Idnhanvien,Ngaygiao,Idddh,Tongtien")] HOADON hOADON)
        {
            if (ModelState.IsValid)
            {
                db.Entry(hOADON).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Idddh = new SelectList(db.DONDATHANGs, "Idddh", "Tongtien", hOADON.Idddh);
            ViewBag.Idnhanvien = new SelectList(db.NHANVIENs, "Idnhanvien", "Hoten", hOADON.Idnhanvien);
            return View(hOADON);
        }

        // GET: Admin/HOADONs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HOADON hOADON = db.HOADONs.Find(id);
            if (hOADON == null)
            {
                return HttpNotFound();
            }
            return View(hOADON);
        }

        // POST: Admin/HOADONs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            HOADON hOADON = db.HOADONs.Find(id);
            db.HOADONs.Remove(hOADON);
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
