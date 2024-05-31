using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades_Compartidas;
using System.Data.SqlClient;


namespace Persistencia
{
    internal class PersistenciaViaje : IPersistenciaViaje
    {
        private static PersistenciaViaje _instancia = null;
        private PersistenciaViaje() { }
        public static PersistenciaViaje GetInstancia()
        {
            if (_instancia == null)
                _instancia = new PersistenciaViaje();

            return _instancia;
        }
        public void Alta(Viaje UnViaje)
        {
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);

            SqlCommand _comando = new SqlCommand("SP_AltaViaje", _cnn);
            _comando.CommandType = System.Data.CommandType.StoredProcedure;
            _comando.Parameters.AddWithValue("@CodInt", UnViaje.CodInt);
            _comando.Parameters.AddWithValue("@FechaHoraS", UnViaje.FechaHoraS);
            _comando.Parameters.AddWithValue("@FechaHoraL", UnViaje.FechaHoraL);
            _comando.Parameters.AddWithValue("@CantPas", UnViaje.CantPas);
            _comando.Parameters.AddWithValue("@Precio", UnViaje.PrecioB);
            _comando.Parameters.AddWithValue("@Anden", UnViaje.Anden);
            _comando.Parameters.AddWithValue("@Nombre", UnViaje.Compania.NombreC);
            _comando.Parameters.AddWithValue("@Usu", UnViaje.Empleado.UsuLog);
            SqlParameter _retorno = new SqlParameter("@Retorno", System.Data.SqlDbType.Int);
            _retorno.Direction = System.Data.ParameterDirection.ReturnValue;
            _comando.Parameters.Add(_retorno);

            SqlTransaction _miTransaccion = null;

            try
            {
                _cnn.Open();
                _miTransaccion = _cnn.BeginTransaction();

                _comando.Transaction = _miTransaccion;
                _comando.ExecuteNonQuery();

                int _CodI = Convert.ToInt32(_retorno.Value);
                if (_CodI == -1)
                    throw new Exception("ERROR - La companía ingresada no existe.");
                else if (_CodI == -2)
                    throw new Exception("ERROR - El empleado ingresado no existe");
                else if (_CodI == -3)
                    throw new Exception("ERROR - Los viajes deben tener 30 minutos de diferencia de salida entre ellos");

                foreach (PasaPor Parada in UnViaje.Paradas)
                {
                    PersistenciaPasaPor.Alta(Parada, _CodI, _miTransaccion);
                }

                _miTransaccion.Commit();
            }

            catch (Exception ex)
            {
                _miTransaccion.Rollback();
                throw new Exception(ex.Message);
            }
            finally
            {
                _cnn.Close();
            }
        }
        public List<Viaje> ListarViaje()
        {
            Viaje unViaje = null;
            int codInt;
            byte cantPas;
            byte anden;
            decimal precioB;
            DateTime fechaHoraS;
            DateTime fechaHoraL;
            Compania compania;
            Empleado empleado;
            List<PasaPor> paradas;

            List<Viaje> _Lista = new List<Viaje>();
            SqlConnection _Conexion = new SqlConnection(Conexion.Cnn);
            SqlCommand _Comando = new SqlCommand("SP_ListadoDeViajes", _Conexion);
            SqlDataReader _Reader;

            try
            {
                _Conexion.Open();
                _Reader = _Comando.ExecuteReader();

                while (_Reader.Read())
                {
                    codInt = (int)_Reader["CodInt"];
                    cantPas = (byte)_Reader["CantPas"];
                    anden = (byte)_Reader["Anden"];
                    precioB = (decimal)_Reader["Precio"];
                    fechaHoraS = (DateTime)_Reader["FechaHoraS"];
                    fechaHoraL = (DateTime)_Reader["FechaHoraLl"];
                    compania = (PersistenciaCompania.GetInstancia().BuscarC((string)_Reader["Nombre"]));
                    empleado = (PersistenciaEmpleado.GetInstancia().BuscarE((string)_Reader["UsuLog"]));
                    paradas = (List<PasaPor>)_Reader["Paradas"];
                    unViaje = new Viaje(codInt, cantPas, anden, precioB, fechaHoraS, fechaHoraL, compania, empleado, paradas);
                    _Lista.Add(unViaje);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                _Conexion.Close();
            }
            return _Lista;
        }
        public List<Viaje> ListaViajesProx()
        {
            Viaje unViaje = null;
            int codInt;
            byte cantPas;
            byte anden;
            decimal precioB;
            DateTime fechaHoraS;
            DateTime fechaHoraL;
            Compania compania;
            Empleado empleado;
            List<PasaPor> paradas;

            List<Viaje> _Lista = new List<Viaje>();
            SqlConnection _Conexion = new SqlConnection(Conexion.Cnn);
            SqlCommand _Comando = new SqlCommand("SP_ListadoDeViajesProximos", _Conexion);
            SqlDataReader _Reader;

            try
            {
                _Conexion.Open();
                _Reader = _Comando.ExecuteReader();

                while (_Reader.Read())
                {
                    codInt = (int)_Reader["CodInt"];
                    cantPas = (byte)_Reader["CantPas"];
                    anden = (byte)_Reader["Anden"];
                    precioB = (decimal)_Reader["Precio"];
                    fechaHoraS = (DateTime)_Reader["FechaHoraS"];
                    fechaHoraL = (DateTime)_Reader["FechaHoraLl"];
                    compania = (PersistenciaCompania.GetInstancia().BuscarC((string)_Reader["Nombre"]));
                    empleado = (PersistenciaEmpleado.GetInstancia().BuscarE((string)_Reader["UsuLog"]));
                    paradas = (PersistenciaPasaPor.GetInstancia().CargoParadasdelViaje(codInt));
                    unViaje = new Viaje(codInt, cantPas, anden, precioB, fechaHoraS, fechaHoraL, compania, empleado, paradas);
                    _Lista.Add(unViaje);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                _Conexion.Close();
            }
            return _Lista;
        }
    }
}
