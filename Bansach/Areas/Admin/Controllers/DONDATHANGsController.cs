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
    public class DONDATHANGsController : Controller
    {
        private Bán_SáchEntities db = new Bán_SáchEntities();

        // GET: Admin/DONDATHANGs
        public ActionResult Index(string SearchString, string currentFilter, int? page)
        {
            var DDH = db.DONDATHANGs.Include(d => d.NHACUNGCAP).Include(d => d.NHANVIEN).ToList();
            if (!String.IsNullOrEmpty(SearchString)) // kiểm tra chuỗi tìm kiếm có rỗng/null hay không
            {
                DDH = db.DONDATHANGs.Where(n => n.Trangthai.Contains(SearchString)).ToList(); //lọc theo chuỗi tìm kiếm
            }
            ViewBag.CurrentFilter = SearchString;
            int pageSize = 6;
            int PageNumber = (page ?? 1);
            return View(DDH.ToPagedList(PageNumber, pageSize));
        }

        // GET: Admin/DONDATHANGs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DONDATHANG dONDATHANG = db.DONDATHANGs.Find(id);
            if (dONDATHANG == null)
            {
                return HttpNotFound();
            }
            return View(dONDATHANG);
        }

        // GET: Admin/DONDATHANGs/Create
        public ActionResult Create()
        {
            ViewBag.Idnhacungcap = new SelectList(db.NHACUNGCAPs, "IdNCC", "TenNCC");
            ViewBag.Idnhanvien = new SelectList(db.NHANVIENs, "Idnhanvien", "Hoten");
            return View();
        }

        // POST: Admin/DONDATHANGs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Idddh,Idnhanvien,Idnhacungcap,Ngaydat,Tongtien,Trangthai")] DONDATHANG dONDATHANG)
        {
            if (ModelState.IsValid)
            {
                db.DONDATHANGs.Add(dONDATHANG);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Idnhacungcap = new SelectList(db.NHACUNGCAPs, "IdNCC", "TenNCC", dONDATHANG.Idnhacungcap);
            ViewBag.Idnhanvien = new SelectList(db.NHANVIENs, "Idnhanvien", "Hoten", dONDATHANG.Idnhanvien);
            return View(dONDATHANG);
        }

        // GET: Admin/DONDATHANGs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DONDATHANG dONDATHANG = db.DONDATHANGs.Find(id);
            if (dONDATHANG == null)
            {
                return HttpNotFound();
            }
            ViewBag.Idnhacungcap = new SelectList(db.NHACUNGCAPs, "IdNCC", "TenNCC", dONDATHANG.Idnhacungcap);
            ViewBag.Idnhanvien = new SelectList(db.NHANVIENs, "Idnhanvien", "Hoten", dONDATHANG.Idnhanvien);
            return View(dONDATHANG);
        }

        // POST: Admin/DONDATHANGs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Idddh,Idnhanvien,Idnhacungcap,Ngaydat,Tongtien,Trangthai")] DONDATHANG dONDATHANG)
        {
            if (ModelState.IsValid)
            {
                db.Entry(dONDATHANG).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Idnhacungcap = new SelectList(db.NHACUNGCAPs, "IdNCC", "TenNCC", dONDATHANG.Idnhacungcap);
            ViewBag.Idnhanvien = new SelectList(db.NHANVIENs, "Idnhanvien", "Hoten", dONDATHANG.Idnhanvien);
            return View(dONDATHANG);
        }

        // GET: Admin/DONDATHANGs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DONDATHANG dONDATHANG = db.DONDATHANGs.Find(id);
            if (dONDATHANG == null)
            {
                return HttpNotFound();
            }
            return View(dONDATHANG);
        }

        // POST: Admin/DONDATHANGs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            DONDATHANG dONDATHANG = db.DONDATHANGs.Find(id);
            db.DONDATHANGs.Remove(dONDATHANG);
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
