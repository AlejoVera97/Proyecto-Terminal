using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Text.RegularExpressions;

namespace Entidades_Compartidas
{
    public class Compania
    {
        // Variables (campos) de instancia
        private string _NombreC;
        private string _Telefono;
        private string _Direccion;

        // propiedades

        public string NombreC
        {
            get { return _NombreC; }

            set
            {
                if (value.Trim().Length <= 50 && value.Trim().Length > 0)
                    _NombreC = value;
                else
                    throw new Exception("ERROR - El nombre no puede estar vacío y debe tener menos de 50 caracteres");
            }
        }

        public string Telefono
        {
            get { return _Telefono; }

            set
            {
                if (value.Trim().Length > 9 || value.Trim().Length < 8)
                    throw new Exception("ERROR - El numero de telefono debe de tener entre 8 y 9 caracteres");
                else if (Regex.IsMatch(value, "[0-9]"))
                    _Telefono = value;
                else
                    throw new Exception("ERROR - Solo debe ingresar números");
            }
        }
        public string Direccion
        {
            get { return _Direccion; }

            set
            {
                if (value.Trim().Length <= 50 && value.Trim().Length > 0)
                    _Direccion = value;
                else
                    throw new Exception("ERROR - La direccion no puede estar vacía y debe tener menos de 50 caracteres");
            }
        }

        // Constructor

        public Compania(string pNombreC, string pTelefono, string pDireccion)
        {
            NombreC = pNombreC;
            Telefono = pTelefono;
            Direccion = pDireccion;
        }
    }
}

