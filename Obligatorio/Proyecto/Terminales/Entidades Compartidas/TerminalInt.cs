using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades_Compartidas
{
    public class TerminalInt : Terminal
    {
        private string _Pais;

        public string Pais
        {
            get { return _Pais; }
            set
            {
                if (value.Trim().Length <= 50 && value.Trim().Length > 0)
                    _Pais = value;
                else
                    throw new Exception("El país debe de contener hasta 50 caracteres");
            }
        }

        public TerminalInt(string pPais, string pCodT, string pCiudad) : base(pCodT, pCiudad)
        {
            Pais = pPais;
        }
    }
}
