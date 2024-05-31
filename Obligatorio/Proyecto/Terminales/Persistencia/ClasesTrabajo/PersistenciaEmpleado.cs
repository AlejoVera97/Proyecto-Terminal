using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

using Entidades_Compartidas;
using System.Data.SqlClient;


namespace Persistencia
{
    internal class PersistenciaEmpleado : IPersistenciaEmpleado
    {
        private static PersistenciaEmpleado _instancia = null;
        private PersistenciaEmpleado() { }

        public static PersistenciaEmpleado GetInstancia()
        {
            if (_instancia == null)
                _instancia = new PersistenciaEmpleado();
            return _instancia;
        }
        public void Alta(Empleado UnEmpleado)
        {
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);

            SqlCommand _comando = new SqlCommand("SP_AltaEmpleado", _cnn);
            _comando.CommandType = CommandType.StoredProcedure;

            _comando.Parameters.AddWithValue("@Usu", UnEmpleado.UsuLog);
            _comando.Parameters.AddWithValue("@Pasw", UnEmpleado.PassW);
            _comando.Parameters.AddWithValue("@Nombre", UnEmpleado.NombreCompleto);
            SqlParameter _retorno = new SqlParameter("@Retorno", System.Data.SqlDbType.Int);
            _retorno.Direction = ParameterDirection.ReturnValue;
            _comando.Parameters.Add(_retorno);

            try
            {
                _cnn.Open();
                _comando.ExecuteNonQuery();
                if ((int)_retorno.Value == -1)
                    throw new Exception("ERROR - El usuario ya existe.");
                else if ((int)_retorno.Value == -2)
                    throw new Exception("ERROR - No fue posible dar el alta del empleado");
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

        public Empleado BuscarE(string pUsu)
        {
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);
            Empleado _unUsu = null;

            SqlCommand _comando = new SqlCommand("SP_BuscarUsuario", _cnn);
            _comando.CommandType = CommandType.StoredProcedure;
            _comando.Parameters.AddWithValue("@Usu", pUsu);

            try
            {
                _cnn.Open();
                SqlDataReader _lector = _comando.ExecuteReader();
                if (_lector.HasRows)
                {
                    if(_lector.Read())
                    _unUsu = new Empleado(pUsu, (string)_lector["PassLog"], (string)_lector["NombreComp"]);
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
            return _unUsu;
        }

        public Empleado UsuLogueado(string pUsu, string pPassw)
        {
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);
            Empleado _usuLog = null;

            SqlCommand _comando = new SqlCommand("SP_BuscarUsuarioLog", _cnn);
            _comando.CommandType = CommandType.StoredProcedure;
            _comando.Parameters.AddWithValue("@Usu", pUsu);
            _comando.Parameters.AddWithValue("@Pasw", pPassw);

            try
            {
                _cnn.Open();
                SqlDataReader _lector = _comando.ExecuteReader();
                if (_lector.HasRows)
                {
                    if (_lector.Read())
                    {
                        _usuLog = new Empleado(pUsu, (string)_lector["PassLog"], (string)_lector["NombreComp"]);
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
            return _usuLog;
        }
    }
}
