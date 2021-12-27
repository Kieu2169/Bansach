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
    public class DANHMUCsController : Controller
    {
        private Bán_SáchEntities db = new Bán_SáchEntities();

        // GET: Admin/DANHMUCs
        public ActionResult Index(string SearchString, string currentFilter, int? page)
        {
            var DM = db.DANHMUCs.Include(d => d.LOAISACH).ToList();
            if (!String.IsNullOrEmpty(SearchString)) // kiểm tra chuỗi tìm kiếm có rỗng/null hay không
            {
                DM = db.DANHMUCs.Where(n => n.Tendanhmuc.Contains(SearchString)).ToList(); //lọc theo chuỗi tìm kiếm
            }
            ViewBag.CurrentFilter = SearchString;
            int pageSize = 15;
            int PageNumber = (page ?? 1);
            return View(DM.ToPagedList(PageNumber, pageSize));
        }

        // GET: Admin/DANHMUCs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DANHMUC dANHMUC = db.DANHMUCs.Find(id);
            if (dANHMUC == null)
            {
                return HttpNotFound();
            }
            return View(dANHMUC);
        }

        // GET: Admin/DANHMUCs/Create
        public ActionResult Create()
        {
            ViewBag.Idloaisach = new SelectList(db.LOAISACHes, "Idloaisach", "Tenloaisach");
            return View();
        }

        // POST: Admin/DANHMUCs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Iddanhmuc,Idloaisach,Tendanhmuc")] DANHMUC dANHMUC)
        {
            if (ModelState.IsValid)
            {
                db.DANHMUCs.Add(dANHMUC);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Idloaisach = new SelectList(db.LOAISACHes, "Idloaisach", "Tenloaisach", dANHMUC.Idloaisach);
            return View(dANHMUC);
        }

        // GET: Admin/DANHMUCs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DANHMUC dANHMUC = db.DANHMUCs.Find(id);
            if (dANHMUC == null)
            {
                return HttpNotFound();
            }
            ViewBag.Idloaisach = new SelectList(db.LOAISACHes, "Idloaisach", "Tenloaisach", dANHMUC.Idloaisach);
            return View(dANHMUC);
        }

        // POST: Admin/DANHMUCs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Iddanhmuc,Idloaisach,Tendanhmuc")] DANHMUC dANHMUC)
        {
            if (ModelState.IsValid)
            {
                db.Entry(dANHMUC).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Idloaisach = new SelectList(db.LOAISACHes, "Idloaisach", "Tenloaisach", dANHMUC.Idloaisach);
            return View(dANHMUC);
        }

        // GET: Admin/DANHMUCs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DANHMUC dANHMUC = db.DANHMUCs.Find(id);
            if (dANHMUC == null)
            {
                return HttpNotFound();
            }
            return View(dANHMUC);
        }

        // POST: Admin/DANHMUCs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            DANHMUC dANHMUC = db.DANHMUCs.Find(id);
            db.DANHMUCs.Remove(dANHMUC);
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
