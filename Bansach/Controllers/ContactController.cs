using Bansach.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace Bansach.Controllers
{
    public class ContactController : Controller
    {
        private Bán_SáchEntities db = new Bán_SáchEntities();
        // GET: Contact
        public ActionResult Index()
        {
            return View();
        }
    }
}