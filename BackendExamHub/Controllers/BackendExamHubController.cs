using BackendExamHub.Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Data.SqlClient;

namespace BackendExamHub.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BackendExamHubController : ControllerBase
    {
        private readonly string _connectionString;

        public BackendExamHubController(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("BackendExamHub");
        }

        //Create
        [HttpPost]
        public async Task<ActionResult> CreateMyoffice_ACPDAsync(string Json)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(_connectionString))
                {
                    SqlCommand cmd = new SqlCommand("PR_Myoffice_ACPD_Add", conn);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Json", Json);

                    await conn.OpenAsync();
                    await cmd.ExecuteNonQueryAsync();
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
            return Ok("User created successfully!!");
        }

        //Read
        [HttpGet("{acpd_sid}")]
        public async Task<ActionResult<Myoffice_ACPD>> GetMyoffice_ACPDAsync(string acpd_sid)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(_connectionString))
                {
                    SqlCommand cmd = new SqlCommand("PR_Myoffice_ACPD_Read", conn);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@acpd_sid", acpd_sid);

                    await conn.OpenAsync();
                    using (SqlDataReader reader = await cmd.ExecuteReaderAsync())
                    {
                        if (await reader.ReadAsync())
                        {
                            return new Myoffice_ACPD
                            {
                                acpd_sid = (string)reader["acpd_sid"],
                                acpd_cname = (string)reader["acpd_cname"],
                                acpd_ename = (string)reader["acpd_ename"],
                                acpd_sname = (string)reader["acpd_sname"],
                                acpd_email = (string)reader["acpd_email"],
                                acpd_status = (byte)reader["acpd_status"],
                                acpd_stop = (bool)reader["acpd_stop"],
                                acpd_stopMemo = (string)reader["acpd_stopMemo"],
                                acpd_LoginID = (string)reader["acpd_LoginID"],
                                acpd_LoginPW = (string)reader["acpd_LoginPW"],
                                acpd_memo = (string)reader["acpd_memo"],
                                acpd_nowdatetime = (DateTime)reader["acpd_nowdatetime"],
                                appd_nowid = (string)reader["appd_nowid"],
                                acpd_upddatetitme = (DateTime)reader["acpd_upddatetitme"],
                                acpd_updid = (string)reader["acpd_updid"]
                            };
                        }
                        throw new Exception("Myoffice_ACPD is Empty!");
                    }
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        //Update
        [HttpPut]
        public async Task<ActionResult> UpdateMyoffice_ACPDAsync(string Json)
        {           
            try
            {
                

                
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
            return Ok("User updated successfully!");
        }

        //Delete
        [HttpDelete("{acpd_sid}")]
        public async Task<ActionResult> DeleteMyoffice_ACPDAsync(string acpd_sid)
        {
            try
            {
                

                return Ok("User deleted successfully!");
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }
    }       
}
