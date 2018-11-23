using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using OinkCash.Models;

using System.Data.Entity.Validation;

using Microsoft.AspNet.Identity;

namespace OinkCash.Controllers
{
    public class PerfilController : Controller
    {
        private Perfiles db = new Perfiles();

        // GET: Perfil
        [Authorize]
        public async Task<ActionResult> TipoDeCuenta(string returnUrl)
        {
            ViewBag.ReturnUrl = returnUrl;

            ViewBag.error = "";

            return View();
        }

        // POST: Perfil/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [Authorize]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> TipoDeCuenta([Bind(Include = "Id,Nombre")] TiposCuenta tiposCuentas)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.TiposCuentas.Add(tiposCuentas);
                    await db.SaveChangesAsync();
                    return RedirectToAction("Index");
                }

                return View(tiposCuentas);
            }
            catch(DbEntityValidationException ex)
            {
                ViewBag.error = "Debe ingresar un nombre para el tipo de cuenta";
                return View(tiposCuentas);
            }

        }


        // GET: Perfil
        [Authorize]
        public async Task<ActionResult> ajax()
        {
            return View(getCuentas());
        }

        private IList<CuentasPorUsuario> getCuentas()
        {
            //Obtengo el Id del usuario
            string userId = User.Identity.GetUserId();

            //Consigo las cuentas del usuario.
            var cuentas = db.CuentasPorUsuarios.Where(x => x.idUsuario == userId).ToList();
            return cuentas;
        }

        [Authorize]
        public async Task<ActionResult> Grafigrafico()
        {
            var c = getCuentas();
            //TODO: Asociar info de las cuentas grafico
            return View();
        }


        //Reportes
        public async Task<ActionResult> GastosPorMonto()
        {
            return View();
        }

        public async Task<ActionResult> ControlDeGastos()
        {
            return View();
        }

        public async Task<ActionResult> Ahorro()
        {
            return View();
        }

        // GET: Perfil
        public async Task<ActionResult> Index()
        {
            return View(getCuentas());
        }

        // GET: Perfil/Details/5
        public async Task<ActionResult> Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AspNetUser aspNetUser = await db.AspNetUsers.FindAsync(id);
            if (aspNetUser == null)
            {
                return HttpNotFound();
            }
            return View(aspNetUser);
        }

        // GET: Perfil/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Perfil/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "Id,Email,EmailConfirmed,PasswordHash,SecurityStamp,PhoneNumber,PhoneNumberConfirmed,TwoFactorEnabled,LockoutEndDateUtc,LockoutEnabled,AccessFailedCount,UserName")] AspNetUser aspNetUser)
        {
            if (ModelState.IsValid)
            {
                db.AspNetUsers.Add(aspNetUser);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            return View(aspNetUser);
        }

        // GET: Perfil/Edit/5
        public async Task<ActionResult> Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AspNetUser aspNetUser = await db.AspNetUsers.FindAsync(id);
            if (aspNetUser == null)
            {
                return HttpNotFound();
            }
            return View(aspNetUser);
        }

        // POST: Perfil/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "Id,Email,EmailConfirmed,PasswordHash,SecurityStamp,PhoneNumber,PhoneNumberConfirmed,TwoFactorEnabled,LockoutEndDateUtc,LockoutEnabled,AccessFailedCount,UserName")] AspNetUser aspNetUser)
        {
            if (ModelState.IsValid)
            {
                db.Entry(aspNetUser).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(aspNetUser);
        }

        // GET: Perfil/Delete/5
        public async Task<ActionResult> Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AspNetUser aspNetUser = await db.AspNetUsers.FindAsync(id);
            if (aspNetUser == null)
            {
                return HttpNotFound();
            }
            return View(aspNetUser);
        }

        // POST: Perfil/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(string id)
        {
            AspNetUser aspNetUser = await db.AspNetUsers.FindAsync(id);
            db.AspNetUsers.Remove(aspNetUser);
            await db.SaveChangesAsync();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
