using Bansach.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Bansach.Controllers
{
    public class SachpartialController : Controller
    {
        Bán_SáchEntities db = new Bán_SáchEntities();

        // GET: Sach
        public PartialViewResult Sachmoipartial()
        {
            var lstSachmoi = db.SACHes.Take(3).ToList();
            return PartialView(lstSachmoi);
        }
    }
}