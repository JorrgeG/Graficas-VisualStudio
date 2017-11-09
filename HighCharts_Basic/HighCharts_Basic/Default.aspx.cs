using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//##
using HighCharts_Basic.Modelo;
using HighCharts_Basic.DAO;
using HighCharts_Basic.Conexion;
using System.Web.Services;


namespace HighCharts_Basic
{
    public partial class Default : System.Web.UI.Page
    {
        Eleccionauto elecct = new Eleccionauto();
        EleccionDAO elecctDAO = new EleccionDAO();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonMostrar_Click(object sender, EventArgs e)
        {
            elecct = elecctDAO.mostrarDatos(int.Parse(TXT.Text));
            LabelID.Text = Convert.ToString( elecct.Id);
            LabelMARCA.Text = elecct.Marca;
            LabelMODELO.Text = Convert.ToString(elecct.Modelo);
            LabelVELOCIDAD.Text = Convert.ToString(elecct.Velocidad);
            LabelESTABILIDAD.Text = elecct.Estabilidad;
            LabelPRECIO.Text = Convert.ToString(elecct.Precio);

        }

        [WebMethod()]
        public static List<Eleccionauto> ListaCarro()
        {
            EleccionDAO elecDao = new EleccionDAO();
            return elecDao.viewMotos().ToList();
        }

        [WebMethod]
        public static List<Eleccionauto> listaMarc()
        {
            EleccionDAO elcDao = new EleccionDAO();
            return elcDao.listaMarca().ToList();
        }

        [WebMethod]
        public static List<Eleccionauto> listaVeloc()
        {
            EleccionDAO elecdao = new EleccionDAO();
            
            return elecdao.listaVelocidad().ToList();
        }
        
    }
}