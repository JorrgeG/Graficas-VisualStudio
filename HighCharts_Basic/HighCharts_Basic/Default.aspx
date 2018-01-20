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
    <link href="bootstrap-3.3.7-dist/css/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Permanent+Marker" rel="stylesheet">
    <link href="bootstrap-3.3.7-dist/css/estiloTexto.css" rel="stylesheet" />
    

</head>
<body style="background-color:#F2FBEF">
    <form id="form1" runat="server">
    <div id="container" style="width: 100%;">
        <div class="row" >

            <div class="col-lg-12" align="center">
                <h1 class="fondoTexto">Visualizacion de Datos</h1>
            </div>

            <div id="grafico" class="col-lg-8">


            </div>

            <div class="col-lg-4">
                <br />
                <br />
                <br />
                <br />
               
                <div class="text-center">
                    <h3 class="fondoTexto">Añadir Datos</h3><br />
                     <asp:Label ID="LabelPRECIO" class="fondoTexto" runat="server" Text="Marca de Auto"></asp:Label>
                <br />
                    <asp:TextBox ID="txtBoxMarca" CssClass="input-sm" runat="server" Text=""></asp:TextBox><br />

                <asp:Label ID="Label1" class="fondoTexto" runat="server" Text="Cantidad Vendidos"></asp:Label>
                <br />
                    <asp:TextBox ID="textBoxCantidad" CssClass="input-sm" runat="server" Text=""></asp:TextBox><br /><br />
                
                    <asp:Button ID="ButtonMostrar" CssClass="btn-group btn-lg btn-primary" runat="server" Text="Agregar" OnClick="ButtonMostrar_Click" />
               <br />
                
                     <button type="button"  class="btn-group btn-lg btn-success" id="btnGrafico">Ver Grafico</button> 
                    </div>
                
        </div>

        </div>
        
        
        <hr />
        
        <br />
        <div id="graficaColumna"></div>
    </div>
    </form>
    <%
        

         %>
</body>
    
    <script>
        $(document).ready(function (){
            $("#btnGrafico").click("click", function () {
               ListaCoches();

            });
        });

        
        function ListaCoches() {
            
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
                        var serie = new Array(aData[i].Marca, aData[i].Cantidad);
                        data.push(serie);
                    }
                    DibujaGrafico(data);
                },
                error: function (Result) {
                    alert("Errorooo");
                }
            });
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
                    text: 'Ventas Concesionario'
                },
                subtitle:{
                    text: 'Ventas del año 2017'
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
                    name: 'Vendidos:',
                    colorByPoint: true,
                    
                    data: seriesD
                 }]
            });
        }     

    </script>
</html>
