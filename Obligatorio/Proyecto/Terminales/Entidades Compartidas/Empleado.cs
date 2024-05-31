using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Text.RegularExpressions;

namespace Entidades_Compartidas
{
    public class Empleado
    {
        private string _UsuLog;
        private string _PassW;
        private string _NombreCompleto;

        public string UsuLog
        {
            get { return _UsuLog; }

            set
            {
                if (value.Trim().Length == 8)
                    _UsuLog = value;
                else
                    throw new Exception("El nombre de usuario debe de tener 8 caractres");
            }
        }

        public string PassW
        {
            get { return _PassW; }

            set
            {
                if (Regex.IsMatch(value, "^(?=(?:.*[a-zA-Z]){3})(?=(?:.*\\d){3})[a-zA-Z\\d]{6}$"))
                    _PassW = value;
                else
                    throw new Exception("ERROR - La contraseña debe estar compuesta por 3 numeros y 3 letras");
            }
        }

        public string NombreCompleto
        {
            get { return _NombreCompleto; }

            set
            {
                if (value.Trim().Length <= 60 && value.Trim().Length >= 5)

                    _NombreCompleto = value;
                else
                    throw new Exception("El nombre completo debe estar comprendido entre 5 y 60 caracteres");
            }
        }

        public Empleado(string pUsuLog, string pPassW, string pNombreCompleto)
        {
            UsuLog = pUsuLog;
            PassW = pPassW;
            NombreCompleto = pNombreCompleto;
        }
    }
}
