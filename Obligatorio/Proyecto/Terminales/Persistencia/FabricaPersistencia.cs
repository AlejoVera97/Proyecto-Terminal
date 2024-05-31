using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Persistencia
{
    public class FabricaPersistencia
    {
        public static IPersistenciaCompania GetPersistenciaCompania()
        {
            return (PersistenciaCompania.GetInstancia());
        }

        public static IPersistenciaEmpleado GetPersistenciaEmpleado()
        {
            return (PersistenciaEmpleado.GetInstancia());
        }

        public static IPersistenciaTerminalNac GetPersistenciaTerminalNac()
        {
            return (PersistenciaTerminalNac.GetInstancia());
        }

        public static IPersistenciaTerminalInt GetPersistenciaTerminalInt()
        {
            return (PersistenciaTerminalInt.GetInstancia());
        }

        public static IPersistenciaViaje GetPersistenciaViaje()
        {
            return (PersistenciaViaje.GetInstancia());
        }
    }
}
