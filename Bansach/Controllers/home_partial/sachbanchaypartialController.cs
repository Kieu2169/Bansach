using Bansach.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace Bansach.Controllers.home_partial
{
    public class sachbanchaypartialController : Controller
    {
        Bán_SáchEntities db = new Bán_SáchEntities();
        // GET: sachbanchaypartial
        public ActionResult Index()
        {
            var sACHes = db.SACHes.Take(7).ToList();
            return PartialView(sACHes);
        }
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
    }
}