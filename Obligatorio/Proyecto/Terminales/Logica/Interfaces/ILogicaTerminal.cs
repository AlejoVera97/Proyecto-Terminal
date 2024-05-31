using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Entidades_Compartidas;

namespace Logica
{
    public interface ILogicaTerminal
    {
        void AltaTerminal(Terminal UnaTerminal);
        void ModificarT(Terminal UnaTerminal);
        void EliminarT(Terminal pTerminal);
        Terminal BuscarTermAct(string pCodT);
        List<Terminal> ListarTodasTerm();
    }
}
