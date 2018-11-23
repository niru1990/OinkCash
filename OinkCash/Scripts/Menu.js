//Ocultar/Mostrar Div's (Armar script aparte)
OCULTO = "none";
VISIBLE = "block";

function mostrar1(blo) {
    document.getElementById(blo).style.display = VISIBLE;
    document.getElementById('ver_off1').style.display = VISIBLE;
    document.getElementById('ver_on1').style.display = OCULTO;
}

function ocultar1(blo) {
    document.getElementById(blo).style.display = OCULTO;
    document.getElementById('ver_off1').style.display = OCULTO;
    document.getElementById('ver_on1').style.display = VISIBLE;
}
