//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace OinkCash.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class CuentasPorUsuario
    {
        public string idUsuario { get; set; }
        public long idCuenta { get; set; }
        public decimal limite { get; set; }
        public decimal monto { get; set; }
    
        public virtual AspNetUser AspNetUser { get; set; }
        public virtual Cuenta Cuenta { get; set; }
    }
}
