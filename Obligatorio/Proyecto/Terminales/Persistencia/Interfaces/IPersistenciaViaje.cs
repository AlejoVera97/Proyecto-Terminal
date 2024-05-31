using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades_Compartidas;

namespace Persistencia
{
    public interface IPersistenciaViaje
    {
        void Alta(Viaje UnViaje);
        List<Viaje> ListarViaje();
        List<Viaje> ListaViajesProx();
    }
}
