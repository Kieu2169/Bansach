using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Bansach.Models;

namespace Bansach.Controllers.home_partial
{
    public class sachpartialController : Controller
    {
        private Bán_SáchEntities db = new Bán_SáchEntities();

        // GET: sachpartial
        public ActionResult Index()
        {
            var sACHes = db.SACHes.Include(s => s.DANHMUC).Include(s => s.NHAXUATBAN).Take(7);
            return PartialView(sACHes.ToList());
        }

        public ActionResult sachdexuat()
        {
            var sACHes = db.SACHes.Include(s => s.DANHMUC).Include(s => s.NHAXUATBAN).Take(3);
            return PartialView(sACHes.ToList());
        }
        public ActionResult sachlienquan()
        {
            var sACHes = db.SACHes.Include(s => s.DANHMUC).Include(s => s.NHAXUATBAN).Take(4);
            return PartialView(sACHes.ToList());
        }
        // GET: sachpartial/Details/5
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
