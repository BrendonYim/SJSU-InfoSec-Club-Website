using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.Security;
using System.Security.Cryptography;

namespace WebApplication5
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            this.cmdLogin.ServerClick += new System.EventHandler(this.cmdLogin_ServerClick);
      
        }
        private void cmdLogin_ServerClick(object sender, System.EventArgs e)
        {
            string validation = ValidateUser(txtUserName.Value, txtUserPass.Value);
            if (validation.Equals("True"))
                FormsAuthentication.RedirectFromLoginPage(txtUserName.Value,
                    chkPersistCookie.Checked);
            else
                ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Success", "alert('"+validation+"')", true);

           

           
        }
		
        protected String ValidateUser(string username, string password)
            {
                byte[] myByteArr = Convert.FromBase64String("UVZzDzqd2YLgGACFw+ez/Poru+o96a4zgXlg");
                string check = Convert.ToBase64String(myByteArr);
                int poop = check.Length;
                /* Fetch the stored value */
                string savedPasswordHash = grabHashedPassword(username);
                if (savedPasswordHash.Equals("ERROR1"))
                {
                    return "Invalid Credentials";
                   
                }
                else if (savedPasswordHash.Equals("ERROR2"))
                {
                    return "Please verify your email";
                   
                }
                /* Extract the bytes */
                byte[] hashBytes = Convert.FromBase64String(savedPasswordHash);
                /* Get the salt */
                byte[] salt = new byte[16];
                Array.Copy(hashBytes, 0, salt, 0, 16);
                /* Compute the hash on the password the user entered */
                var pbkdf2 = new Rfc2898DeriveBytes(password, salt, 10000);
                byte[] hash = pbkdf2.GetBytes(20);
                /* Compare the results */
                for (int i = 0; i < 20; i++)
                    if (hashBytes[i + 16] != hash[i])
                        return "Invalid Credentials";
                return "True";
                
            }
        protected string grabHashedPassword(string username)
            {
                string response;
                String connection = ConfigurationManager.ConnectionStrings["InfoGuest"].ConnectionString;
                SqlConnection sqlConnection1 = new SqlConnection(connection);
                SqlCommand cmd = new SqlCommand();

                cmd.CommandText = "SP_GET_HASH";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlConnection1;
                cmd.Parameters.Add("@STUDENT_ID", SqlDbType.VarChar, 9);
                cmd.Parameters["@STUDENT_ID"].Value = username;
               
                SqlDataAdapter objDA = new SqlDataAdapter();
                objDA.SelectCommand = cmd;
                sqlConnection1.Open();
                DataSet objDS = new DataSet();
                response = cmd.ExecuteScalar().ToString();
                if (response.Equals("0"))
                {
                    return "ERROR1";
                }
                else if (response.Equals("EMAIL"))
                {
                    return "ERROR2";
                }
                else return response;

            }
       
       
    }
}