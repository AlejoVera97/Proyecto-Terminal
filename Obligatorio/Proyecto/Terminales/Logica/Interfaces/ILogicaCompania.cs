using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Entidades_Compartidas;


namespace Logica
{
    public interface ILogicaCompania
    {
        void AltaComp(Compania pCompania);
        Compania BuscarC(string pNombre);
        List<Compania> ListarComp();
    }
}
