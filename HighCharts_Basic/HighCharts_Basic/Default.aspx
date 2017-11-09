<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HighCharts_Basic.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    
    <script src="../../code/highcharts.js"></script>
<script src="../../code/modules/exporting.js"></script>
    
<script src="/scripts/jquery.js"></script>
<script src="/scripts/highcharts.js"></script>
<script src="/scripts/exporting.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="container" style="width: 100%;" >

       <!-- <asp:TextBox ID="TXT" runat="server" Text="id"></asp:TextBox><br />
        <asp:Label ID="LabelID" runat="server" Text="id"></asp:Label><br />
        <asp:Label ID="LabelMARCA" runat="server" Text="marca"></asp:Label><br />
        <asp:Label ID="LabelMODELO" runat="server" Text="modelo"></asp:Label><br />
        <asp:Label ID="LabelVELOCIDAD" runat="server" Text="velocidad"></asp:Label><br />
        <asp:Label ID="LabelESTABILIDAD" runat="server" Text="estabilidad"></asp:Label><br />
        <asp:Label ID="LabelPRECIO" runat="server" Text="precio"></asp:Label><br />

        <asp:Button ID="ButtonMostrar" runat="server" Text="Mostrar" OnClick="ButtonMostrar_Click" />-->
        <button type="button" id="btnGrafico">LLenar Gráfico</button> 
        <hr />
        <div id="grafico"></div>
        <br />
        <div id="graficaColumna"></div>
    </div>
    </form>
</body>
    <script>
        $(document).ready(function (){
            $("#btnGrafico").click("click", function (){
               DibujaColumna();
               ListaCoches();
               // listaMarca();

            });
        });

        function ListaCoches(){
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Default.aspx/ListaCarro",
                data: "{}",
                dataType: "json",
                success: function (Result) {
                    var aData = Result.d;
                    var data = [];
                    for (var i in aData) {
                        var serie = new Array(aData[i].Marca, aData[i].Precio);
                        data.push(serie);
                    }
                    //alert("dddd" + data);
                    DibujaGrafico(data);
                    //DibujaColumna(data);
                    //DreawChartPubli(data, 'container2');
                },
                error: function (Result) {
                    alert("Errorooo");
                }
            });
        }
        function listaMarca() {
            var dataM = [];
            var dataV = [];
           // $('#ee').ajaxStart({
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Default.aspx/listaMarc",
                data: "{}",
                dataType: "json",
                success: function (Result) {
                    var aData = Result.d;
                    //var dataM = [];
                    for (var i in aData) {
                        var serieMarca = new Array(aData[i].Marca);
                        dataM.push(serieMarca);
                    }

                    //DibujaColumna(data);
                },
                error: function (Result) {
                    alert("Error Marca");
                }
            });
            //
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Default.aspx/listaVeloc",
                data: "{}",
                dataType: "json",
                success: function (Result) {
                    var aData = Result.d;
                    //var data = [];
                    for (var i in aData) {
                        var serieVelo = new Array(aData[i].Velocidad);
                        dataV.push(serieVelo);
                    }
                    alert("dfdf" + dataV);


                },
                error: function (Result) {
                    alert("Error Velocidad");
                }
            });
            DibujaColumna(dataM, dataV);
        }

        function DibujaGrafico (seriesD) {
            $('#grafico').highcharts({
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false,
                    type: 'pie'
                },
                title: {
                    text: 'Precios de Coches'
                },
                subtitle:{
                    text: '¿Cual comprarias?'
                },
                tooltip: {
                    pointFormat: '{series.name}: {point.y} (<b>{point.percentage:.1f}%</b>)'
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            format: '<b>{point.name}</b>: {point.y}',
                            style: {
                                color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                            }
                        }
                    }
                },
                series: [{
                    name: 'Precio:',
                    colorByPoint: true,
                    
                    data: seriesD
                 }]
            });
        }
        
        //function DibujaColumna() {
        //$('#columna').Highcharts( {
        
        function DibujaColumna(/*seriesM, seriesV*/) {
            $('#graficaColumna').highcharts({
                // Highcharts.chart('container', {
                chart: {
                    type: 'column'
                },
                title: {
                    text: 'Velocidad del Auto'
                },
                subtitle: {
                    text: 'Mejora cada año'
                },
                xAxis: {
                    title: {
                        text: 'Modelo (año)'
                    },
                    categories: [
                        '2010',
                        '2011',
                        '2012',
                        '2013'
                    ],
                    crosshair: true
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: 'Velocidad (km/h)'
                    }
                },
                tooltip: {
                    headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                        '<td style="padding:0"><b>{point.y:.1f} km/h</b></td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true
                },
                plotOptions: {
                    column: {
                        pointPadding: 0.2,
                        borderWidth: 0
                    }
                },
                series: 
                    [{
                    name: 'Renault',
                    data: [180, 160, 150]

                }, {
                    name: 'Porshe',
                    data: [210, 230, 250]

                }, {
                    name: 'Mazda',
                    data: [180, 200, 210]

                }, {
                    name: 'Zusuky',
                    data: [150, 140, 160]

                }]
            });
        }

    </script>
</html>
