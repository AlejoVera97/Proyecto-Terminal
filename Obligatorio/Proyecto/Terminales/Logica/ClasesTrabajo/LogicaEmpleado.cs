using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades_Compartidas;
using Persistencia;

namespace Logica
{
    internal class LogicaEmpleado : ILogicaEmpleado
    {
        private static LogicaEmpleado _instancia = null;
        private LogicaEmpleado() { }
        public static LogicaEmpleado GetInstancia()
        {
            if (_instancia == null)
                _instancia = new LogicaEmpleado();
            return _instancia;
        }
        public void AltaE(Empleado UnEmpleado)
        {
            FabricaPersistencia.GetPersistenciaEmpleado().Alta(UnEmpleado);
        }
        public Empleado BuscarE(string pUsu)
        {
            return FabricaPersistencia.GetPersistenciaEmpleado().BuscarE(pUsu);
        }
        public Empleado UsuLogueado(string pUsu, string pPass)
        {
            return FabricaPersistencia.GetPersistenciaEmpleado().UsuLogueado(pUsu, pPass);
        }
    }
}
