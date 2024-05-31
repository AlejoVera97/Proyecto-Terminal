using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Entidades_Compartidas;

namespace Logica
{
    public interface ILogicaEmpleado
    {
        void AltaE(Empleado UnEmp);
        Empleado BuscarE(string pUsu);
        Empleado UsuLogueado(string pUsu, string pPass);
    }
}
