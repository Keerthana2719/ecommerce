// using System.Data;
// using System.Data.SqlClient;
// using Ecommerce.Models;
// using Microsoft.AspNetCore.Mvc;

// namespace Ecommerce.Controllers
// {
//     [Route("api/[controller]")]
//     [ApiController]
//     public class RegisterController : ControllerBase
//     {
//         private readonly DbConnection _dbConnection;
//         public RegisterController(DbConnection dbConnection)
//         {
//             _dbConnection = dbConnection;
//         }
        
        
//         [HttpPost]
//         [Route("Signup")]
//         public IActionResult register([FromBody] Registration reg)
//         {
//             try
//             {
//                 using (SqlConnection connection = new SqlConnection(_dbConnection.ConnectionString))
//                 {
//                     connection.Open();
//                     string insertQuery = "INSERT INTO Register(UserName,Email,Mobile_Number,Password)" + "VALUES('" + reg.UserName + "','" +reg.Email + "','" + reg.Mobile_Number + "','" + reg.Password + "')";
//                     using (SqlCommand command = new SqlCommand(insertQuery, connection))
//                     {
//                         command.ExecuteNonQuery();
//                     }
//                     return Ok(new { message = "Register successfully",Registration = reg });
//                 }
//             }
//             catch (Exception ex)
//             {
//                 return StatusCode(500, new { message = "Internal server error", error = ex.Message });
//             }
//         }

//         [HttpPost]
//         [Route("Login")]
//         public IActionResult Login([FromBody] Login login)
//         {
//             try
//             {
//                 using (SqlConnection connection = new SqlConnection(_dbConnection.ConnectionString))
//                 {
//                     connection.Open();

//                     string selectQuery = "SELECT Email, Mobile_Number FROM Register WHERE Email = @Email AND Password = @Password";

//                     using (SqlCommand command = new SqlCommand(selectQuery, connection))
//                     {
//                         command.Parameters.AddWithValue("@Email", login.Email);
//                         command.Parameters.AddWithValue("@Password", login.Password);

//                         using (SqlDataReader reader = command.ExecuteReader())
//                         {
//                             if (reader.HasRows)
//                             {
//                                 reader.Read();
//                                 var user = new
//                                 {
                                   
//                                     Email = reader["Email"],
//                                     MobileNumber = reader["Mobile_Number"]
//                                 };
//                                 return Ok(new { message = "Login successful", user });
//                             }
//                             else
//                             {
//                                 return Unauthorized(new { message = "Invalid email or password" });
//                             }
//                         }
//                     }
//                 }
//             }
//             catch (Exception ex)
//             {
//                 return StatusCode(500, new { message = "Internal server error", error = ex.Message });
//             }
//         }


//     }
// }

