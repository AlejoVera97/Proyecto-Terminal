using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Entidades_Compartidas;

namespace Logica
{
    public interface ILogicaViaje
    {
        void AltaV(Viaje UnViaje);
        List<Viaje> ListarViajesDelMes();
        List<Viaje> ListarViajesProx();
    }
}
