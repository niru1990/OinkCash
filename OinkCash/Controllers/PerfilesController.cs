using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OinkCash.Models;

//Importar modelo


namespace OinkCash.Controllers
{
    public class PerfilesController : Controller
    {
        // GET: Perfil
        [Authorize]
        public ActionResult Index()
        {
            //Viewbag permite pasar a las vistas con este objeto dinamico
            ViewBag.algo = "algo";

            /*
             Se debe instanciar la clase del modelo
             Asignar los valores
             Pasando el objeto a la View
             */

            return View();
        }

        // GET: Perfil
        [Authorize]
        public ActionResult GestorDeCuentas()
        {
            return View();
        }

        // GET: Perfil
        [Authorize]
        public ActionResult GestorDeGastos()
        {
            return View();
        }

        // GET: Perfil
        [Authorize]
        public ActionResult Reportes()
        {
            return View();
        }
    }
}
