using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades_Compartidas;
using Persistencia;

namespace Logica
{
    internal class LogicaTerminal : ILogicaTerminal
    {
        private static LogicaTerminal _instancia = null;

        private LogicaTerminal() { }

        public static LogicaTerminal GetInstancia()
        {
            if (_instancia == null)
                _instancia = new LogicaTerminal();
            return _instancia;
        }
        public void AltaTerminal(Terminal Terminal)
        {
            if (Terminal is TerminalNac)
                FabricaPersistencia.GetPersistenciaTerminalNac().Alta((TerminalNac)Terminal);
            else
                FabricaPersistencia.GetPersistenciaTerminalInt().Alta((TerminalInt)Terminal);
        }
        public void ModificarT(Terminal Terminal)
        {
            if (Terminal is TerminalNac)
                FabricaPersistencia.GetPersistenciaTerminalNac().Modificar((TerminalNac)Terminal);
            else
                FabricaPersistencia.GetPersistenciaTerminalInt().Modificar((TerminalInt)Terminal);
        }
        public void EliminarT(Terminal Terminal)
        {
            if (Terminal is TerminalNac)
                FabricaPersistencia.GetPersistenciaTerminalNac().Eliminar((TerminalNac)Terminal);
            else
                FabricaPersistencia.GetPersistenciaTerminalInt().Eliminar((TerminalInt)Terminal);
        }
        public Terminal BuscarTermAct(string pCodT)
        {
            Terminal _unaT = null;
            _unaT = FabricaPersistencia.GetPersistenciaTerminalNac().BuscarAct(pCodT);
            if (_unaT == null)
                _unaT = FabricaPersistencia.GetPersistenciaTerminalInt().BuscarAct(pCodT);
            return _unaT;
        }
        public List<Terminal> ListarTodasTerm()
        {
            List<Terminal> _lista = new List<Terminal>();
            _lista.AddRange(FabricaPersistencia.GetPersistenciaTerminalNac().ListadoTAct());
            _lista.AddRange(FabricaPersistencia.GetPersistenciaTerminalInt().ListadoTAct());
            return _lista;
        }
    }
}
