using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HighCharts_Basic.Modelo
{
    public class Eleccionauto
    {
        int id, modelo, velocidad, precio, cantidad;
        string marcafavorita, estabilidad;

        public int Cantidad
        {
            get
            {
                return cantidad;
            }

            set
            {
                cantidad = value;
            }
        }

        public string Estabilidad
        {
            get
            {
                return estabilidad;
            }

            set
            {
                estabilidad = value;
            }
        }

        public int Id
        {
            get
            {
                return id;
            }

            set
            {
                id = value;
            }
        }

        public string Marca
        {
            get
            {
                return marcafavorita;
            }

            set
            {
                marcafavorita = value;
            }
        }

        public int Modelo
        {
            get
            {
                return modelo;
            }

            set
            {
                modelo = value;
            }
        }

        public int Precio
        {
            get
            {
                return precio;
            }

            set
            {
                precio = value;
            }
        }

        public int Velocidad
        {
            get
            {
                return velocidad;
            }

            set
            {
                velocidad = value;
            }
        }
    }
}