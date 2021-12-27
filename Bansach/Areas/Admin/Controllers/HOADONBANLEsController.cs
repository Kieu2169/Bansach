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
    public class HOADONBANLEsController : Controller
    {
        private Bán_SáchEntities db = new Bán_SáchEntities();

        // GET: Admin/HOADONBANLEs
        public ActionResult Index(string SearchString, string currentFilter, int? page)
        {
            var HDBL = db.HOADONBANLEs.Include(h => h.NHANVIEN).Include(h => h.USER).ToList();
            if (!String.IsNullOrEmpty(SearchString)) // kiểm tra chuỗi tìm kiếm có rỗng/null hay không
            {
                HDBL = db.HOADONBANLEs.Where(n => n.Hotennguoinhan.Contains(SearchString)).ToList(); //lọc theo chuỗi tìm kiếm
            }
            ViewBag.CurrentFilter = SearchString;
            int pageSize = 6;
            int PageNumber = (page ?? 1);
            return View(HDBL.ToPagedList(PageNumber, pageSize));
        }

        // GET: Admin/HOADONBANLEs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HOADONBANLE hOADONBANLE = db.HOADONBANLEs.Find(id);
            if (hOADONBANLE == null)
            {
                return HttpNotFound();
            }
            return View(hOADONBANLE);
        }

        // GET: Admin/HOADONBANLEs/Create
        public ActionResult Create()
        {
            ViewBag.Idnhanvien = new SelectList(db.NHANVIENs, "Idnhanvien", "Hoten");
            ViewBag.Iduser = new SelectList(db.USERs, "Iduser", "Matkhau");
            return View();
        }

        // POST: Admin/HOADONBANLEs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Idhdbl,Idnhanvien,Iduser,Ngaydat,Ngaygiao,Hotennguoinhan,Diachinhan,SDTnguoinhan,Trangthai,Tongtien")] HOADONBANLE hOADONBANLE)
        {
            if (ModelState.IsValid)
            {
                db.HOADONBANLEs.Add(hOADONBANLE);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Idnhanvien = new SelectList(db.NHANVIENs, "Idnhanvien", "Hoten", hOADONBANLE.Idnhanvien);
            ViewBag.Iduser = new SelectList(db.USERs, "Iduser", "Matkhau", hOADONBANLE.Iduser);
            return View(hOADONBANLE);
        }

        // GET: Admin/HOADONBANLEs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HOADONBANLE hOADONBANLE = db.HOADONBANLEs.Find(id);
            if (hOADONBANLE == null)
            {
                return HttpNotFound();
            }
            ViewBag.Idnhanvien = new SelectList(db.NHANVIENs, "Idnhanvien", "Hoten", hOADONBANLE.Idnhanvien);
            ViewBag.Iduser = new SelectList(db.USERs, "Iduser", "Matkhau", hOADONBANLE.Iduser);
            return View(hOADONBANLE);
        }

        // POST: Admin/HOADONBANLEs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Idhdbl,Idnhanvien,Iduser,Ngaydat,Ngaygiao,Hotennguoinhan,Diachinhan,SDTnguoinhan,Trangthai,Tongtien")] HOADONBANLE hOADONBANLE)
        {
            if (ModelState.IsValid)
            {
                db.Entry(hOADONBANLE).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Idnhanvien = new SelectList(db.NHANVIENs, "Idnhanvien", "Hoten", hOADONBANLE.Idnhanvien);
            ViewBag.Iduser = new SelectList(db.USERs, "Iduser", "Matkhau", hOADONBANLE.Iduser);
            return View(hOADONBANLE);
        }

        // GET: Admin/HOADONBANLEs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HOADONBANLE hOADONBANLE = db.HOADONBANLEs.Find(id);
            if (hOADONBANLE == null)
            {
                return HttpNotFound();
            }
            return View(hOADONBANLE);
        }

        // POST: Admin/HOADONBANLEs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            HOADONBANLE hOADONBANLE = db.HOADONBANLEs.Find(id);
            db.HOADONBANLEs.Remove(hOADONBANLE);
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
