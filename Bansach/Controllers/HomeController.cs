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
    public class HomeController : Controller
    {
        Bán_SáchEntities db = new Bán_SáchEntities();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Register()
        {
            return View();
        }
        //POST: Register
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(USER _user)
        {
            if (ModelState.IsValid)
            {
                var check = db.USERs.FirstOrDefault(s => s.Taikhoan == _user.Taikhoan);
                if (check == null)
                {
                    db.Configuration.ValidateOnSaveEnabled = false;
                    db.USERs.Add(_user);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                else
                {
                    ViewBag.error = "Tên tài khoản này đã tồn tại";
                    return View();
                }
            }
            return View();

        }
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(string taikhoan, string matkhau)
        {
            if (ModelState.IsValid)
            {
                var data = db.USERs.Where(s => s.Taikhoan.Equals(taikhoan) && s.Matkhau.Equals(matkhau)).ToList();
                if (data.Count() > 0)
                {
                    //add session
                    Session["Hoten"] = data.FirstOrDefault().Hoten;
                    Session["Taikhoan"] = data.FirstOrDefault().Taikhoan;
                    Session["Iduser"] = data.FirstOrDefault().Iduser;
                    return RedirectToAction("Index");
                }
                else
                {
                    ViewBag.error = "Login failed";
                    return RedirectToAction("Login");
                }
            }
            return View();
        }


        //Logout
        public ActionResult Logout()
        {
            Session.Clear();//remove session
            return RedirectToAction("Login");
        }

    }

}