using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades_Compartidas;
using Persistencia;

namespace Logica
{
    internal class LogicaCompania : ILogicaCompania
    {
        private static LogicaCompania _instancia = null;
        private LogicaCompania() { }
        public static LogicaCompania GetInstancia()
        {
            if (_instancia == null)
                _instancia = new LogicaCompania();
            return _instancia;
        }

        public void AltaComp(Compania pCompania)
        {
            FabricaPersistencia.GetPersistenciaCompania().Alta(pCompania);
        }
        public Compania BuscarC(string pNombre)
        {
            return FabricaPersistencia.GetPersistenciaCompania().BuscarC(pNombre);
        }
        public List<Compania> ListarComp()
        {
            return FabricaPersistencia.GetPersistenciaCompania().ListarComp();
        }
    }
}
