using Bansach.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Bansach.Controllers.home_partial
{
    public class TintucpartialController : Controller
    {
        Bán_SáchEntities db = new Bán_SáchEntities();
        // GET: Tintucpartial
        public ActionResult Index()
        {
            var lsttintuc = db.TINTUCs.Take(6).ToList();
            return PartialView(lsttintuc);
        }
    }
}