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
    public class NHANVIENsController : Controller
    {
        private Bán_SáchEntities db = new Bán_SáchEntities();

        // GET: Admin/NHANVIENs
        public ActionResult Index(string SearchString, string currentFilter, int? page)
        {

            var NV = db.NHANVIENs.Include(n => n.LOAINV).ToList();
            if (!String.IsNullOrEmpty(SearchString)) // kiểm tra chuỗi tìm kiếm có rỗng/null hay không
            {
                NV = db.NHANVIENs.Where(n => n.Hoten.Contains(SearchString)).ToList(); //lọc theo chuỗi tìm kiếm
            }
            ViewBag.CurrentFilter = SearchString;
            int pageSize = 6;
            int PageNumber = (page ?? 1);
            //loaisach = loaisach.OrderByDescending(n => n.Tenloaisach).ToList();
            //db.CHITIETDAs.Where(n => n.Tieude.Contains(SearchString)).ToList();
            return View(NV.ToPagedList(PageNumber, pageSize));
        }

        // GET: Admin/NHANVIENs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NHANVIEN nHANVIEN = db.NHANVIENs.Find(id);
            if (nHANVIEN == null)
            {
                return HttpNotFound();
            }
            return View(nHANVIEN);
        }

        // GET: Admin/NHANVIENs/Create
        public ActionResult Create()
        {
            ViewBag.Idloainhanvien = new SelectList(db.LOAINVs, "Idloainhanvien", "Tenloai");
            return View();
        }

        // POST: Admin/NHANVIENs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Idnhanvien,Idloainhanvien,Hoten,Diachi,SDT,Tendangnhap,Matkhau")] NHANVIEN nHANVIEN)
        {
            if (ModelState.IsValid)
            {
                db.NHANVIENs.Add(nHANVIEN);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Idloainhanvien = new SelectList(db.LOAINVs, "Idloainhanvien", "Tenloai", nHANVIEN.Idloainhanvien);
            return View(nHANVIEN);
        }

        // GET: Admin/NHANVIENs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NHANVIEN nHANVIEN = db.NHANVIENs.Find(id);
            if (nHANVIEN == null)
            {
                return HttpNotFound();
            }
            ViewBag.Idloainhanvien = new SelectList(db.LOAINVs, "Idloainhanvien", "Tenloai", nHANVIEN.Idloainhanvien);
            return View(nHANVIEN);
        }

        // POST: Admin/NHANVIENs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Idnhanvien,Idloainhanvien,Hoten,Diachi,SDT,Tendangnhap,Matkhau")] NHANVIEN nHANVIEN)
        {
            if (ModelState.IsValid)
            {
                db.Entry(nHANVIEN).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Idloainhanvien = new SelectList(db.LOAINVs, "Idloainhanvien", "Tenloai", nHANVIEN.Idloainhanvien);
            return View(nHANVIEN);
        }

        // GET: Admin/NHANVIENs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NHANVIEN nHANVIEN = db.NHANVIENs.Find(id);
            if (nHANVIEN == null)
            {
                return HttpNotFound();
            }
            return View(nHANVIEN);
        }

        // POST: Admin/NHANVIENs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            NHANVIEN nHANVIEN = db.NHANVIENs.Find(id);
            db.NHANVIENs.Remove(nHANVIEN);
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
