using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades_Compartidas
{
    public class TerminalNac : Terminal
    {
        private bool _Taxi;

        public bool Taxi
        {
            get { return _Taxi; }

            set { _Taxi = value; }
        }


        public TerminalNac(bool pTaxi, string pCodT, string pCiudad) : base(pCodT, pCiudad)
        {
            Taxi = pTaxi;
        }
    }
}