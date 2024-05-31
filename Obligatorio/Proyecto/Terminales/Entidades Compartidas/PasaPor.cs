using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades_Compartidas
{
    public class PasaPor
    {
        private int _Orden;
        private Terminal _UnaParada;

        public int Orden
        {
            get { return _Orden; }
            set
            {
                if (value > 0)
                    _Orden = value;
                else
                    throw new Exception("El orden debe ser mayor que 0");
            }
        }

        public Terminal UnaParada
        {
            get { return _UnaParada; }
            set
            {
                if (value == null)
                    throw new Exception("Error - La terminal no puede estar vacía.");
                else
                    _UnaParada = value;
            }
        }

        public PasaPor(int pOrden, Terminal pParada)
        {
            Orden = pOrden;
            UnaParada = pParada;
        }

    }
}
