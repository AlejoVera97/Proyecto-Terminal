using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades_Compartidas;
using Persistencia;

namespace Logica
{
    internal class LogicaViaje : ILogicaViaje
    {
        private static LogicaViaje _instancia = null;
        private LogicaViaje() { }
        public static LogicaViaje GetInstancia()
        {
            if (_instancia == null)
                _instancia = new LogicaViaje();
            return _instancia;
        }
        public void AltaV(Viaje UnViaje)
        {
            if (UnViaje.FechaHoraS <= DateTime.Now)
                throw new Exception("ERROR - El viaje debe partir posterior a este momento.");
            FabricaPersistencia.GetPersistenciaViaje().Alta(UnViaje);
        }
        public List<Viaje> ListarViajesDelMes()
        {
            return FabricaPersistencia.GetPersistenciaViaje().ListarViaje();
        }
        public List<Viaje> ListarViajesProx()
        {
            return FabricaPersistencia.GetPersistenciaViaje().ListaViajesProx();
        }
    }
}
