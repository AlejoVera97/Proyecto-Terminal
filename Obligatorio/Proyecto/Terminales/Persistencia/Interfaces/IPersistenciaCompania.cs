using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades_Compartidas;

namespace Persistencia
{
    public interface IPersistenciaCompania
    {
        void Alta(Compania pNombre);

        Compania BuscarC(string pNombre);

        List<Compania> ListarComp();
    }
}
