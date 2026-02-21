using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using System.Text.Json;

namespace BackendSGIAC.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ChatbotController : ControllerBase
    {
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] JsonElement body)
        {
            try 
            {
                var queryResult = body.GetProperty("queryResult");
                var parameters = queryResult.GetProperty("parameters");

                string connectionString = "Server=DESKTOP-LQC22RP\\SQLEXPRESS;Database=SGIAC;Trusted_Connection=True;TrustServerCertificate=True;";
                int stock = 0;

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    await conn.OpenAsync();
                    string sql = "SELECT StockActual FROM Productos WHERE Nombre = @prod";
                    
                    using (SqlCommand cmd = new SqlCommand(sql, conn))
                    {
                        cmd.Parameters.AddWithValue("@prod", parameters.GetProperty("producto").GetString());
                        var result = await cmd.ExecuteScalarAsync();
                        
                        if (result != null)
                        {
                            stock = Convert.ToInt32(result);
                        }
                    }
                }

                return Ok(new {
                    fulfillmentText = $"SGIAC informa: El stock actual de {parameters.GetProperty("producto").GetString()} es de {stock} unidades."
                });
            }
            catch (Exception)
            {
                return Ok(new {
                    fulfillmentText = "Error de conexión con la base de datos SGIAC."
                });
            }
        }
    }
}