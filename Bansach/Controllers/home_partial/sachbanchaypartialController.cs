using Bansach.Models;
using System;
using System.Collections.Generic;
using System.Linq;
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
            var lstSachbanchay = db.SACHes.Take(7).ToList();
            return PartialView(lstSachbanchay);
        }
    }
}