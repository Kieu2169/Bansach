using Bansach.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Bansach.Controllers
{
    public class DanhmucpartialController : Controller
    {
        Bán_SáchEntities db = new Bán_SáchEntities();
        // GET: Danhmucpartial
        public PartialViewResult Danhmucpartial()
        {
            var lstdanhmuc = db.DANHMUCs.ToList();
            return PartialView(lstdanhmuc);
        }
    }
}