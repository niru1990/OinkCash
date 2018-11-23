function CargarGrafico() {
    // Load the Visualization API and the corechart package.
    google.charts.load('current', { 'packages': ['corechart'] });

    // Set a callback to run when the Google Visualization API is loaded.
    google.charts.setOnLoadCallback(drawChart);
}

// Callback that creates and populates a data table,
// instantiates the pie chart, passes in the data and
// draws it.
function drawChart() {

    if (document.getElementById('chart_div') != undefined) {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');

        //var a obtenerDatos();

        // TODO: Mofificar el armado de los rows para que genere el grafico, verificar los limites.
        data.addRows([
            ['Mushrooms', 3],
            ['Onions', 1],
            ['Olives', 1],
            ['Zucchini', 1],
            ['Pepperoni', 2]
        ]); //Vector con estructura de Nombre de cuenta y Monto utilizado del mes.
        // [ ["", # ], ["", #] ]
        // Set chart options
        var options = {
            'title': 'Distribución de los gastos',
            'width': 550,
            'height': 200
        };

        // Instantiate and draw our chart, passing in some options.

        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
    }

}