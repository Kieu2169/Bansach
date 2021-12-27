using Bansach.Models;
using PagedList;
using System;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;

namespace Bansach.Areas.Admin.Controllers
{
    public class DANHGIAsController : Controller
    {
        private Bán_SáchEntities db = new Bán_SáchEntities();

        // GET: Admin/DANHGIAs
        public ActionResult Index(string SearchString, string currentFilter, int? page)
        {
            var DG = db.DANHGIAs.Include(d => d.SACH).Include(d => d.USER).ToList();
            if (!String.IsNullOrEmpty(SearchString)) // kiểm tra chuỗi tìm kiếm có rỗng/null hay không
            {
                DG = db.DANHGIAs.Where(n => n.Noidung.Contains(SearchString)).ToList(); //lọc theo chuỗi tìm kiếm
            }
            ViewBag.CurrentFilter = SearchString;
            int pageSize = 6;
            int PageNumber = (page ?? 1);
            return View(DG.ToPagedList(PageNumber, pageSize));
        }

        // GET: Admin/DANHGIAs/Details/5
        public ActionResult Details(int? id, int? id1)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DANHGIA dANHGIA = db.DANHGIAs.Find(new object[] { id, id1 });
            if (dANHGIA == null)
            {
                return HttpNotFound();
            }
            return View(dANHGIA);
        }

        // GET: Admin/DANHGIAs/Create
        public ActionResult Create()
        {
            ViewBag.Idsach = new SelectList(db.SACHes, "Idsach", "Tuasach");
            ViewBag.Iduser = new SelectList(db.USERs, "Iduser", "Hoten");
            return View();
        }

        // POST: Admin/DANHGIAs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Iduser,Idsach,Noidung,Thoigian")] DANHGIA dANHGIA)
        {
            if (ModelState.IsValid)
            {
                db.DANHGIAs.Add(dANHGIA);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Idsach = new SelectList(db.SACHes, "Idsach", "Tuasach", dANHGIA.Idsach);
            ViewBag.Iduser = new SelectList(db.USERs, "Iduser", "Hoten", dANHGIA.Iduser);
            return View(dANHGIA);
        }

        // GET: Admin/DANHGIAs/Edit/5
        public ActionResult Edit(int? id, int? id1)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DANHGIA dANHGIA = db.DANHGIAs.Find(new object[] { id, id1 });
            if (dANHGIA == null)
            {
                return HttpNotFound();
            }
            ViewBag.Idsach = new SelectList(db.SACHes, "Idsach", "Tuasach", dANHGIA.Idsach);
            ViewBag.Iduser = new SelectList(db.USERs, "Iduser", "Hoten", dANHGIA.Iduser);
            return View(dANHGIA);
        }

        // POST: Admin/DANHGIAs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Iduser,Idsach,Noidung,Thoigian")] DANHGIA dANHGIA)
        {
            if (ModelState.IsValid)
            {
                db.Entry(dANHGIA).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Idsach = new SelectList(db.SACHes, "Idsach", "Tuasach", dANHGIA.Idsach);
            ViewBag.Iduser = new SelectList(db.USERs, "Iduser", "Hoten", dANHGIA.Iduser);
            return View(dANHGIA);
        }

        // GET: Admin/DANHGIAs/Delete/5
        public ActionResult Delete(int? id, int? id1)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DANHGIA dANHGIA = db.DANHGIAs.Find(new object[] { id, id1 });
            if (dANHGIA == null)
            {
                return HttpNotFound();
            }
            return View(dANHGIA);
        }

        // POST: Admin/DANHGIAs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int? id, int? id1)
        {
            DANHGIA dANHGIA = db.DANHGIAs.Find(new object[] { id, id1 });
            db.DANHGIAs.Remove(dANHGIA);
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
