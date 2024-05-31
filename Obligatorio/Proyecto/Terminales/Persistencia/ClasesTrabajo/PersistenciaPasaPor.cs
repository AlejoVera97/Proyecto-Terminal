using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Entidades_Compartidas;

namespace Persistencia
{
    internal class PersistenciaPasaPor
    {
        private static PersistenciaPasaPor _instancia;

        private PersistenciaPasaPor() { }

        public static PersistenciaPasaPor GetInstancia()
        {
            if (_instancia == null)
                _instancia = new PersistenciaPasaPor();

            return _instancia;
        }

        internal static void Alta(PasaPor Parada, int pCodI, SqlTransaction _pTransaccion)
        {
            SqlCommand _comando = new SqlCommand("SP_AltaPasaPor", _pTransaccion.Connection);
            _comando.CommandType = CommandType.StoredProcedure;
            _comando.Parameters.AddWithValue("@CodInt", pCodI);
            _comando.Parameters.AddWithValue("@CodT", Parada.UnaParada.CodT);
            _comando.Parameters.AddWithValue("@Orden", Parada.Orden);
            SqlParameter _ParmRetorno = new SqlParameter("@Retorno", SqlDbType.Int);
            _ParmRetorno.Direction = ParameterDirection.ReturnValue;
            _comando.Parameters.Add(_ParmRetorno);


            try
            {
                _comando.Transaction = _pTransaccion;

                //ejecuto comando
                _comando.ExecuteNonQuery();

                //verifico si hay errores
                int retorno = Convert.ToInt32(_ParmRetorno.Value);
                if (retorno == -1)
                    throw new Exception("ERROR - No es posible asignar la terminal al viaje.");
                else if (retorno == -2)
                    throw new Exception("ERROR - El viaje aun no se ha generado.");
                else if (retorno == -3)
                    throw new Exception("ERROR - La terminal ya está asignada a este viaje.");
                else if (retorno == -4)
                    throw new Exception("ERROR - La parada ya está asignada a este viaje.");
                else if (retorno == 0)
                    throw new Exception("ERROR - No fue posible asignar las paradas.");

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        internal List<PasaPor> CargoParadasdelViaje(int pCodI)
        {
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);

            SqlCommand _comando = new SqlCommand("SP_ParadasPorViaje", _cnn);
            _comando.CommandType = CommandType.StoredProcedure;
            _comando.Parameters.AddWithValue("@CodI", pCodI);
            PasaPor Parada = null;
            List<PasaPor> _ListaParadas = new List<PasaPor>();

            try
            {
                //me conecto
                _cnn.Open();

                SqlDataReader _lector = _comando.ExecuteReader();

                if (_lector.HasRows)
                {
                    while (_lector.Read())
                    {
                        Terminal _unaTerm = null;
                        _unaTerm = PersistenciaTerminalNac.GetInstancia().BuscarEnTodas((string)_lector["CodT"]);
                        if (_unaTerm == null)
                            _unaTerm = PersistenciaTerminalInt.GetInstancia().BuscarEnTodas((string)_lector["CodT"]);

                        Parada = new PasaPor((int)_lector["Orden"], _unaTerm);
                        _ListaParadas.Add(Parada);
                    }
                }

                _lector.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                _cnn.Close();
            }
            return _ListaParadas;
        }
    }
}
