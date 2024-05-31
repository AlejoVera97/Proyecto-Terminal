using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades_Compartidas;
using Persistencia;

namespace Persistencia
{
    public interface IPersistenciaTerminalNac
    {
        void Alta(TerminalNac pCodT);
        void Modificar(TerminalNac pCodT);
        void Eliminar(TerminalNac pCodT);
        TerminalNac BuscarAct(string pCodT);
        List<TerminalNac> ListadoTAct();
    }
}
