using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using PagedList;
using Bansach.Models;

namespace Bansach.Areas.Admin.Controllers
{
    public class LOAISACHController : Controller
    {
        private Bán_SáchEntities db = new Bán_SáchEntities();

        // GET: Admin/LOAISACH
        public ActionResult Index(string SearchString, string currentFilter, int? page)
        {
            var loaisach = db.LOAISACHes.ToList();
            if (!String.IsNullOrEmpty(SearchString)) // kiểm tra chuỗi tìm kiếm có rỗng/null hay không
            {
                loaisach = db.LOAISACHes.Where(n => n.Tenloaisach.Contains(SearchString)).ToList(); //lọc theo chuỗi tìm kiếm
            }
            ViewBag.CurrentFilter = SearchString;
            int pageSize = 6;
            int PageNumber = (page ?? 1);
            //loaisach = loaisach.OrderByDescending(n => n.Tenloaisach).ToList();
            //db.CHITIETDAs.Where(n => n.Tieude.Contains(SearchString)).ToList();
            return View(loaisach.ToPagedList(PageNumber, pageSize));
        }

        // GET: Admin/LOAISACH/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LOAISACH lOAISACH = db.LOAISACHes.Find(id);
            if (lOAISACH == null)
            {
                return HttpNotFound();
            }
            return View(lOAISACH);
        }

        // GET: Admin/LOAISACH/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/LOAISACH/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Idloaisach,Tenloaisach")] LOAISACH lOAISACH)
        {
            if (ModelState.IsValid)
            {
                db.LOAISACHes.Add(lOAISACH);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(lOAISACH);
        }

        // GET: Admin/LOAISACH/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LOAISACH lOAISACH = db.LOAISACHes.Find(id);
            if (lOAISACH == null)
            {
                return HttpNotFound();
            }
            return View(lOAISACH);
        }

        // POST: Admin/LOAISACH/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Idloaisach,Tenloaisach")] LOAISACH lOAISACH)
        {
            if (ModelState.IsValid)
            {
                db.Entry(lOAISACH).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(lOAISACH);
        }

        // GET: Admin/LOAISACH/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LOAISACH lOAISACH = db.LOAISACHes.Find(id);
            if (lOAISACH == null)
            {
                return HttpNotFound();
            }
            return View(lOAISACH);
        }

        // POST: Admin/LOAISACH/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            LOAISACH lOAISACH = db.LOAISACHes.Find(id);
            db.LOAISACHes.Remove(lOAISACH);
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
