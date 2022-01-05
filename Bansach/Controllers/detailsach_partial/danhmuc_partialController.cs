using Bansach.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Bansach.Controllers.detailsach_partial
{
    public class danhmuc_partialController : Controller
    {
        Bán_SáchEntities db = new Bán_SáchEntities();
        // GET: danhmucpartial
        public ActionResult Index()
        {
            var lstdanhmuc = db.DANHMUCs.Take(7).ToList();
            return PartialView(lstdanhmuc);
        }
    }
}