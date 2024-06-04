using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Entidades_Compartidas;
using System.Data.SqlClient;

namespace Persistencia
{
    internal class PersistenciaTerminalNac : IPersistenciaTerminalNac
    {
        private static PersistenciaTerminalNac _instancia = null;
        private PersistenciaTerminalNac() { }
        public static PersistenciaTerminalNac GetInstancia()
        {
            if (_instancia == null)
                _instancia = new PersistenciaTerminalNac();
            return _instancia;
        }
        public void Alta(TerminalNac UnaTerminal)
        {
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);

            SqlCommand _comando = new SqlCommand("SP_AltaTerminalNac", _cnn);
            _comando.CommandType = System.Data.CommandType.StoredProcedure;

            _comando.Parameters.AddWithValue("@CodT", UnaTerminal.CodT);
            _comando.Parameters.AddWithValue("@Ciudad", UnaTerminal.Ciudad);
            _comando.Parameters.AddWithValue("@Taxi", UnaTerminal.Taxi);
            SqlParameter _retorno = new SqlParameter("@Retorno", System.Data.SqlDbType.Int);
            _retorno.Direction = System.Data.ParameterDirection.ReturnValue;
            _comando.Parameters.Add(_retorno);

            try
            {
                _cnn.Open();
                _comando.ExecuteNonQuery();

                if ((int)_retorno.Value == -1)
                    throw new Exception("ERROR - El código de terminal ya existe.");
                else if ((int)_retorno.Value == -2)
                    throw new Exception("ERROR - No se pudo dar de alta la Terminal.");
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }
            finally
            {
                _cnn.Close();
            }
        }
        public void Modificar(TerminalNac UnaTerminal)
        {
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);

            SqlCommand _comando = new SqlCommand("SP_ModificarTerminalNac", _cnn);
            _comando.CommandType = System.Data.CommandType.StoredProcedure;

            _comando.Parameters.AddWithValue("@CodT", UnaTerminal.CodT);
            _comando.Parameters.AddWithValue("@Ciudad", UnaTerminal.Ciudad);
            _comando.Parameters.AddWithValue("@Taxi", UnaTerminal.Taxi);

            SqlParameter _retorno = new SqlParameter("@Retorno", System.Data.SqlDbType.Int);
            _retorno.Direction = System.Data.ParameterDirection.ReturnValue;
            _comando.Parameters.Add(_retorno);

            try
            {
                _cnn.Open();

                _comando.ExecuteNonQuery();
                if ((int)_retorno.Value == -1)
                    throw new Exception("ERROR - La terminal que intenta modificar no existe");
                else if ((int)_retorno.Value == -2)
                    throw new Exception("Error en Modificacion de la terminal");
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                _cnn.Close();
            }
        }
        public void Eliminar(TerminalNac pTerminalNac)
        {
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);

            SqlCommand _comando = new SqlCommand("SP_EliminarTerminal", _cnn);
            _comando.CommandType = System.Data.CommandType.StoredProcedure;
            _comando.Parameters.AddWithValue("@CodT", pTerminalNac.CodT);
            SqlParameter _retorno = new SqlParameter("@Retorno", System.Data.SqlDbType.Int);
            _retorno.Direction = System.Data.ParameterDirection.ReturnValue;
            _comando.Parameters.Add(_retorno);

            try
            {
                _cnn.Open();

                _comando.ExecuteNonQuery();
                if ((int)_retorno.Value == -1)
                    throw new Exception("ERROR - La terminal que intenta modificar no existe");
                else if ((int)_retorno.Value == -3)
                    throw new Exception("ERROR - La terminal que desea eliminar tiene viajes asociados y no es posible su eliminación.");
                else if ((int)_retorno.Value == -2)
                    throw new Exception("Error en Modificacion de la terminal");

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                _cnn.Close();
            }
        }
        public TerminalNac BuscarAct(string pCodT)
        {
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);
            TerminalNac _unaTNA = null;

            SqlCommand _comando = new SqlCommand("SP_BuscarTerNacAct", _cnn);
            _comando.CommandType = System.Data.CommandType.StoredProcedure;
            _comando.Parameters.AddWithValue("@CodT", pCodT);

            try
            {
                _cnn.Open();
                SqlDataReader _lector = _comando.ExecuteReader();
                if (_lector.HasRows)
                {
                    _lector.Read();
                    _unaTNA = new TerminalNac(Convert.ToBoolean(_lector["TieneT"]), pCodT, (string)_lector["Ciudad"]);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                _cnn.Close();
            }
            return _unaTNA;
        }
        internal TerminalNac BuscarEnTodas(string pCodT)
        {
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);
            TerminalNac _unaTTN = null;

            SqlCommand _comando = new SqlCommand("SP_BuscarTodasTerNac", _cnn);
            _comando.CommandType = System.Data.CommandType.StoredProcedure;
            _comando.Parameters.AddWithValue("@CodT", pCodT);

            try
            {
                _cnn.Open();
                SqlDataReader _lector = _comando.ExecuteReader();
                if (_lector.HasRows)
                {
                    _lector.Read();
                    _unaTTN = new TerminalNac(Convert.ToBoolean(_lector["TieneT"]), pCodT, (string)_lector["Ciudad"]);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                _cnn.Close();
            }
            return _unaTTN;
        }
        public List<TerminalNac> ListadoTAct()
        {
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);
            TerminalNac _unaTerm = null;
            List<TerminalNac> _lista = new List<TerminalNac>();

            SqlCommand _comando = new SqlCommand("SP_ListadoDeTerNacAct", _cnn);
            _comando.CommandType = System.Data.CommandType.StoredProcedure;
            try
            {
                _cnn.Open();
                SqlDataReader _lector = _comando.ExecuteReader();
                if (_lector.HasRows)
                {
                    while (_lector.Read())
                    {
                        _unaTerm = new TerminalNac(Convert.ToBoolean(_lector["TieneT"]), (string)_lector["CodT"], (string)_lector["Ciudad"]);
                        _lista.Add(_unaTerm);
                    }
                }
                _lector.Close();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                _cnn.Close();
            }
            return _lista;
        }
    }
}
