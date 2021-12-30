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
        public PartialViewResult Danhmucpartial1()
        {
            var lstdanhmuc = db.DANHMUCs.Where(n => n.Idloaisach == 1).ToList();
            return PartialView(lstdanhmuc);
        }
        public PartialViewResult Danhmucpartial2()
        {
            var lstdanhmuc = db.DANHMUCs.Where(n => n.Idloaisach == 4).ToList();
            return PartialView(lstdanhmuc);
        }
        public PartialViewResult Danhmucpartial4()
        {
            var lstdanhmuc = db.DANHMUCs.Where(n => n.Idloaisach == 6).ToList();
            return PartialView(lstdanhmuc);
        }
        public PartialViewResult Danhmucpartial5()
        {
            var lstdanhmuc = db.DANHMUCs.Where(n => n.Idloaisach == 7).ToList();
            return PartialView(lstdanhmuc);
        }
        public PartialViewResult Danhmucpartial6()
        {
            var lstdanhmuc = db.DANHMUCs.Where(n => n.Idloaisach == 8).ToList();
            return PartialView(lstdanhmuc);
        }
        public PartialViewResult Danhmucpartial7()
        {
            var lstdanhmuc = db.DANHMUCs.Where(n => n.Idloaisach == 9).ToList();
            return PartialView(lstdanhmuc);
        }
        public PartialViewResult Danhmucpartial8()
        {
            var lstdanhmuc = db.DANHMUCs.Where(n => n.Idloaisach == 10).ToList();
            return PartialView(lstdanhmuc);
        }
        public PartialViewResult Danhmucpartial9()
        {
            var lstdanhmuc = db.DANHMUCs.Where(n => n.Idloaisach == 11).ToList();
            return PartialView(lstdanhmuc);
        }
        public PartialViewResult Danhmucpartial10()
        {
            var lstdanhmuc = db.DANHMUCs.Where(n => n.Idloaisach == 12).ToList();
            return PartialView(lstdanhmuc);
        }
        public PartialViewResult Danhmucpartial11()
        {
            var lstdanhmuc = db.DANHMUCs.Where(n => n.Idloaisach == 13).ToList();
            return PartialView(lstdanhmuc);
        }
        public PartialViewResult Danhmucpartial12()
        {
            var lstdanhmuc = db.DANHMUCs.Where(n => n.Idloaisach == 14).ToList();
            return PartialView(lstdanhmuc);
        }
        public PartialViewResult Danhmucpartial13()
        {
            var lstdanhmuc = db.DANHMUCs.Where(n => n.Idloaisach == 15).ToList();
            return PartialView(lstdanhmuc);
        }
    }
}