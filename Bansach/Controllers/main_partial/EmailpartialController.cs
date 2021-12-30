using Bansach.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Bansach.Controllers.main_partial
{
    public class EmailpartialController : Controller
    {
        private Bán_SáchEntities db = new Bán_SáchEntities();
        // GET: Emailpartial
        public ActionResult Index()
        {
            return PartialView();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index(LIENHE lIENHE)
        {
            if (ModelState.IsValid)
            {
                db.LIENHEs.Add(lIENHE);
                db.SaveChanges();
            }
            return PartialView(lIENHE);

        }
    }
}