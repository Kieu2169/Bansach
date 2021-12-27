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
    public class LIENHEsController : Controller
    {
        private Bán_SáchEntities db = new Bán_SáchEntities();

        // GET: Admin/LIENHEs
        public ActionResult Index(string SearchString, string currentFilter, int? page)
        {

            var LH = db.LIENHEs.ToList();
            if (!String.IsNullOrEmpty(SearchString)) // kiểm tra chuỗi tìm kiếm có rỗng/null hay không
            {
                LH = db.LIENHEs.Where(n => n.Ten.Contains(SearchString)).ToList(); //lọc theo chuỗi tìm kiếm
            }
            ViewBag.CurrentFilter = SearchString;
            int pageSize = 6;
            int PageNumber = (page ?? 1);
            //loaisach = loaisach.OrderByDescending(n => n.Tenloaisach).ToList();
            //db.CHITIETDAs.Where(n => n.Tieude.Contains(SearchString)).ToList();
            return View(LH.ToPagedList(PageNumber, pageSize));
        }

        // GET: Admin/LIENHEs/Details/5
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

        // GET: Admin/LIENHEs/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/LIENHEs/Create
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

        // GET: Admin/LIENHEs/Edit/5
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

        // POST: Admin/LIENHEs/Edit/5
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

        // GET: Admin/LIENHEs/Delete/5
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

        // POST: Admin/LIENHEs/Delete/5
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
