using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades_Compartidas
{
    public class Viaje
    {
        private int codInt;
        private byte cantPas;
        private byte anden;
        private decimal precioB;
        private DateTime fechaHoraS;
        private DateTime fechaHoraL;
        private Compania compania;
        private Empleado empleado;
        private List<PasaPor> paradas;

        public int CodInt
        {
            get { return codInt; }
            set { codInt = value; }
        }

        public byte CantPas
        {
            get { return cantPas; }

            set
            {
                if (value < 25 || value > 50)
                    throw new Exception("ERROR - La cantidad mínima de pasajeros para un viaje es debe ser entre 25 y 50.");
                else
                    cantPas = value;
            }
        }

        public byte Anden
        {
            get { return anden; }

            set
            {
                if (value < 1 || value > 35)
                    throw new Exception("ERROR - Solo existen andenes del 1 al 35");
                else
                    anden = value;
            }
        }

        public decimal PrecioB
        {
            get { return precioB; }

            set
            {
                if (value <= 0)
                    throw new Exception("ERROR - El boleto debe tener un valor mayor a 0");

                else
                    precioB = value;
            }

        }

        public DateTime FechaHoraS
        {
            get { return fechaHoraS; }
            set { fechaHoraS = value; }
        }

        public DateTime FechaHoraL
        {
            get { return fechaHoraL; }
            set
            {
                if (value < fechaHoraS)
                    throw new Exception("ERROR - La fecha y la hora del viaje debe ser posterior a la salida");
                fechaHoraL = value;
            }
        }

        public Compania Compania
        {
            get { return compania; }

            set
            {
                if (value == null)
                    throw new Exception("ERROR - Los viajes deben tener una compañía existente asociada");

                else
                    compania = value;
            }
        }

        public Empleado Empleado
        {
            get { return empleado; }

            set
            {
                if (value == null)
                    throw new Exception("ERROR - Un empleado existente debe ser el creador del viaje");

                else
                    empleado = value;
            }
        }

        public List<PasaPor> Paradas
        {
            get { return paradas; }

            set
            {
                if (value == null)
                    throw new Exception("Este viaje debe tener al menos una terminal existente que esté ingresada");
                
                else
                    paradas = value;
            }
        }
        public Viaje(int pCodInt, byte pCantPas, byte pAnden, decimal pPrecioB, DateTime pFechaHoraS, DateTime pFechaHoraL, Compania pCompania, Empleado pEmpleado, List<PasaPor> pParada)
        {
            CodInt = pCodInt;
            CantPas = pCantPas;
            Anden = pAnden;
            PrecioB = pPrecioB;
            FechaHoraS = pFechaHoraS;
            FechaHoraL = pFechaHoraL;
            Compania = pCompania;
            Paradas = pParada;
        }
    }
}
