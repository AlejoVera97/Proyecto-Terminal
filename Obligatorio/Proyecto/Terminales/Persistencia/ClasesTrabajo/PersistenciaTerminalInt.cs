using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Entidades_Compartidas;
using System.Data.SqlClient;

namespace Persistencia
{
    internal class PersistenciaTerminalInt : IPersistenciaTerminalInt
    {
        private static PersistenciaTerminalInt _instancia = null;
        private PersistenciaTerminalInt() { }
        public static PersistenciaTerminalInt GetInstancia()
        {
            if (_instancia == null)
                _instancia = new PersistenciaTerminalInt();
            return _instancia;
        }
        public void Alta(TerminalInt UnaTerminal)
        {
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);

            SqlCommand _comando = new SqlCommand("SP_AltaTerminalInt", _cnn);
            _comando.CommandType = System.Data.CommandType.StoredProcedure;

            _comando.Parameters.AddWithValue("@CodT", UnaTerminal.CodT);
            _comando.Parameters.AddWithValue("@Ciudad", UnaTerminal.Ciudad);
            _comando.Parameters.AddWithValue("@Pais", UnaTerminal.Pais);
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
        public void Modificar(TerminalInt UnaTerminal)
        {
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);

            SqlCommand _comando = new SqlCommand("SP_ModificarTerminalInt", _cnn);
            _comando.CommandType = System.Data.CommandType.StoredProcedure;

            _comando.Parameters.AddWithValue("@CodT", UnaTerminal.CodT);
            _comando.Parameters.AddWithValue("@Ciudad", UnaTerminal.Ciudad);
            _comando.Parameters.AddWithValue("@Pais", UnaTerminal.Pais);
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
        public void Eliminar(TerminalInt pTerminalInt)
        {
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);

            SqlCommand _comando = new SqlCommand("SP_EliminarTerminal", _cnn);
            _comando.CommandType = System.Data.CommandType.StoredProcedure;
            _comando.Parameters.AddWithValue("@CodT", pTerminalInt.CodT);
            SqlParameter _retorno = new SqlParameter("@Retorno", System.Data.SqlDbType.Int);
            _retorno.Direction = System.Data.ParameterDirection.ReturnValue;
            _comando.Parameters.Add(_retorno);

            try
            {
                _cnn.Open();

                _comando.ExecuteNonQuery();
                if ((int)_retorno.Value == -1)
                    throw new Exception("ERROR - La terminal que intenta eliminar no existe");
                else if ((int)_retorno.Value == -3)
                    throw new Exception("ERROR - La terminal que desea eliminar tiene viajes asociados y no es posible su eliminación.");
                else if ((int)_retorno.Value == -2)
                    throw new Exception("ERROR - En Eliminación de la terminal");

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
        public TerminalInt BuscarAct(string pCodT)
        {
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);
            TerminalInt _unaTIA = null;

            SqlCommand _comando = new SqlCommand("SP_BuscarTerIntAct", _cnn);
            _comando.CommandType = System.Data.CommandType.StoredProcedure;
            _comando.Parameters.AddWithValue("@CodT", pCodT);

            try
            {
                _cnn.Open();
                SqlDataReader _lector = _comando.ExecuteReader();
                if (_lector.HasRows)
                {
                    _lector.Read();
                    _unaTIA = new TerminalInt((string)_lector["Pais"], pCodT, (string)_lector["Ciudad"]);
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
            return _unaTIA;
        }
        internal TerminalInt BuscarEnTodas(string pCodT)
        {
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);
            TerminalInt _unaTTI = null;

            SqlCommand _comando = new SqlCommand("SP_BuscarTodasTerInt", _cnn);
            _comando.CommandType = System.Data.CommandType.StoredProcedure;
            _comando.Parameters.AddWithValue("@CodT", pCodT);

            try
            {
                _cnn.Open();
                SqlDataReader _lector = _comando.ExecuteReader();
                if (_lector.HasRows)
                {
                    _lector.Read();
                    _unaTTI = new TerminalInt((string)_lector["Pais"], pCodT, (string)_lector["Ciudad"]);
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
            return _unaTTI;
        }
        public List<TerminalInt> ListadoTAct()
        {
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);
            TerminalInt _unaTerm = null;
            List<TerminalInt> _lista = new List<TerminalInt>();

            SqlCommand _comando = new SqlCommand("SP_ListadoDeTerIntAct", _cnn);
            _comando.CommandType = System.Data.CommandType.StoredProcedure;
            try
            {
                _cnn.Open();
                SqlDataReader _lector = _comando.ExecuteReader();
                if (_lector.HasRows)
                {
                    while (_lector.Read())
                    {
                        _unaTerm = new TerminalInt((string)_lector["Pais"], (string)_lector["CodT"], (string)_lector["Ciudad"]);
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
