function principioIndex()
{
    debugger;
    CargarGrafico();
    CuentasPorUsuario();
}


function obtenerDatos()
{
    debugger;
    $.post("/Perfil/grafico", {}, function (responseText, textStatus, jqXHR) {


        //console.log(responseText);
        //$("#chart_div").html(responseText);
    });
}

//Obtener información desde el lado Servidor
function CuentasPorUsuario()
{
    //Llamado al servidor
    $.post("/Perfil/ajax", {}, function (responseText, textStatus, jqXHR ) {
        console.log(responseText);
        $("#CuentasMontos").html(responseText);
    });
}

//Reportes (Script aparte)
function gastosPorMontoDesc() 
{
}

function gastosPorMontoAsc()
{
}

function ahorros()
{
}
