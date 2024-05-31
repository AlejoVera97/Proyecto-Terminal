using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades_Compartidas;

namespace Persistencia
{
    public interface IPersistenciaEmpleado
    {
        void Alta(Empleado pUsu);

        Empleado BuscarE(string pUsu);

        Empleado UsuLogueado(string pUsu, string pPassw);
    }
}
