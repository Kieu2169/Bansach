using Bansach.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Bansach.Controllers
{
    public class ProductdetailController : Controller
    {
        Bán_SáchEntities db = new Bán_SáchEntities();
        // GET: Productdetail
        public ActionResult Index(int? Id)
        {
            var sach = db.SACHes.Where(n => n.Idsach == Id).FirstOrDefault();
            return View(sach);
        }
    }
}