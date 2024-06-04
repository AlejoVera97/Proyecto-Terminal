using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Entidades_Compartidas;
using System.Data.SqlClient;


namespace Persistencia
{
    internal class PersistenciaCompania : IPersistenciaCompania
    {
        private static PersistenciaCompania _instancia = null;
        private PersistenciaCompania() { }

        public static PersistenciaCompania GetInstancia()
        {
            if (_instancia == null)
                _instancia = new PersistenciaCompania();
            return _instancia;
        }

        public void Alta(Compania UnaCompania)
        {
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);
            SqlCommand _comando = new SqlCommand("SP_AltaCompania", _cnn);
            _comando.CommandType = System.Data.CommandType.StoredProcedure;


            _comando.Parameters.AddWithValue("@Nombre", UnaCompania.NombreC);
            _comando.Parameters.AddWithValue("@Direccion", UnaCompania.Direccion);
            _comando.Parameters.AddWithValue("@Telefono", UnaCompania.Telefono);

            SqlParameter _retorno = new SqlParameter("@Retorno", System.Data.SqlDbType.Int);
            _retorno.Direction = System.Data.ParameterDirection.ReturnValue;
            _comando.Parameters.Add(_retorno);

            try
            {
                _cnn.Open();
                _comando.ExecuteNonQuery();
                if ((int)_retorno.Value == -1)
                    throw new Exception("ERROR - El nombre de la compañía ya existe.");
                else if ((int)_retorno.Value == -2)
                    throw new Exception("ERROR - No fue posible dar el alta de la compañía");
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

        public Compania BuscarC(string pNombre)
        {
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);
            Compania _unaComp = null;

            SqlCommand _comando = new SqlCommand("SP_BuscarCompania", _cnn);
            _comando.CommandType = System.Data.CommandType.StoredProcedure;
            _comando.Parameters.AddWithValue("@Nombre", pNombre);

            try
            {
                _cnn.Open();
                SqlDataReader _lector = _comando.ExecuteReader();
                if (_lector.HasRows)
                {
                    _lector.Read();
                    _unaComp = new Compania(pNombre, (string)_lector["Telefono"], (string)_lector["Direccion"]);
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
            return _unaComp;
        }

        public List<Compania> ListarComp()
        {
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);
            Compania _unaComp = null;
            List<Compania> _lista = new List<Compania>();

            SqlCommand _comando = new SqlCommand("SP_ListadodeCompanias", _cnn);
            _comando.CommandType = System.Data.CommandType.StoredProcedure;

            try
            {
                _cnn.Open();
                SqlDataReader _lector = _comando.ExecuteReader();
                if (_lector.HasRows)
                {
                    while (_lector.Read())
                    {
                        _unaComp = new Compania(_lector["Nombre"].ToString(), _lector["Telefono"].ToString(), _lector["Direccion"].ToString());
                        _lista.Add(_unaComp);
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