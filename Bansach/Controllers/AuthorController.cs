using Bansach.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Bansach.Controllers
{
    public class AuthorController : Controller
    {
        Bán_SáchEntities db = new Bán_SáchEntities();
        // GET: Tacgiapartial
        public ActionResult Index()
        {
            var lsttacgia = db.TACGIAs.ToList();
            return PartialView(lsttacgia);
        }
        public ActionResult partial_tacgia()
        {
            var lstsach = db.SACHes.ToList();
            return PartialView(lstsach);
        }
    }
}