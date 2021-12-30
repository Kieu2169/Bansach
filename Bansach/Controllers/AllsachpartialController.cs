using Bansach.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Bansach.Controllers
{
    public class AllsachpartialController : Controller
    {
        Bán_SáchEntities db = new Bán_SáchEntities();

        // GET: Sach
        public PartialViewResult Sachmoipartialmain()
        {
            var lstSachmoi = db.SACHes.Take(1).Where(n => n.Idsach == 5).ToList();
            return PartialView(lstSachmoi);
        }
        public PartialViewResult Sachpartialtacgia()
        {
            var lstSach = db.SACHes.Take(3).ToList();
            return PartialView(lstSach);
        }
    }
}