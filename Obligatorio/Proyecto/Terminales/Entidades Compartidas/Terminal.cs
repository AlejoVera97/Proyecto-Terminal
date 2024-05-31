using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Text.RegularExpressions;


namespace Entidades_Compartidas
{
    public abstract class Terminal
    {
        private string _CodT;
        private string _Ciudad;

        public string CodT
        {
            get { return _CodT; }

            set
            {
                if (Regex.IsMatch(value, "[a-zA-Z]{6}"))
                    _CodT = value;
                else
                    throw new Exception("ERROR - El codigo debe de tener 6 letras");
            }
        }

        public string Ciudad
        {
            get { return _Ciudad; }

            set
            {
                if (value.Trim().Length <= 50 && value.Trim().Length > 0)
                    _Ciudad = value;
                else
                    throw new Exception("ERROR - La ciudad debe de contener hasta 50 caracteres");
            }
        }

        public Terminal(string pCodT, string pCiudad)
        {
            CodT = pCodT;
            Ciudad = pCiudad;
        }
    }
}
