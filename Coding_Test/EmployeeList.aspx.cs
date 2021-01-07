using Coding_Test.AppDBConnection;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Coding_Test
{
    public partial class EmployeeList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }
        private void BindGridView()
        {
            try
            {
                string sqlStatement = "SELECT * FROM EMP.EMPLOYEE";
                DataTable dt = DBConnect.RetrieveData(sqlStatement);

                if (dt.Rows.Count > 0)
                {
                    EmployeeGridView.DataSource = dt;
                    EmployeeGridView.DataBind();
                }
            }
            catch (SqlException ex)
            {
                string msg = "Fetch Error:";
                msg += ex.Message;
                throw new Exception(msg);
            }
            finally
            {
                DBConnect.CloseConnection();
            }
        }


        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtFirstName.Text == "" || txtLastName.Text == "" || txtHomeAddress.Text == "" || txtEmailAddress.Text == "" || txtPhoneNumber.Text == "" || txtPosition.Text == "" || txtSalary.Text == "")
                {
                    lblErrorMsg.Text = "Kindly Fill all TextBoxes";
                    lblErrorMsg.ForeColor = System.Drawing.Color.Red;
                    return;
                }
             
                string firstName = txtFirstName.Text.Trim();
                string lastName = txtLastName.Text.Trim();
                string homeAddress = txtHomeAddress.Text.Trim();
                string emailAddress = txtEmailAddress.Text.Trim();
                string phoneNumber = txtPhoneNumber.Text.Trim();
                string position = txtPosition.Text.Trim();
                long salary = Convert.ToInt64(txtSalary.Text);

                string checkStatement = string.Empty;

                //select employee query 
                checkStatement = "SELECT * FROM  EMP.EMPLOYEE WHERE Email_Address = '" + emailAddress + "'";
                SqlDataReader reader = DBConnect.DataExistQuery(checkStatement);

                //Check if the Employee with Email Address exists
                if (reader.HasRows == false)
                {
                    string sqlStatement = string.Empty;
                    sqlStatement = "INSERT INTO  EMP.EMPLOYEE (First_Name,Last_Name,Home_Address,Email_Address,Phone_Number,Position,Salary) " +
                                    "VALUES ('" + firstName + "','" + lastName + "','" + homeAddress + "','" + emailAddress + "','" + phoneNumber + "','" + position + "', '" + salary + "')";

                    DBConnect.ExecuteQuery(sqlStatement);

                    lblMessage.Text = "Employee Record Saved Successfully";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblErrorMsg.Visible = false;
                    BindGridView();
                    ClearContents();
                }
                else
                {
                    lblErrorMsg.Text = "An Employee With Email Address Already Exists!";
                    lblErrorMsg.ForeColor = System.Drawing.Color.Red;
                    BindGridView();
                }
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = "An Error Occured" + ex.Message;
                lblErrorMsg.ForeColor = System.Drawing.Color.Red;
            }
        }


        //clears all the input in the textboxes
        public void ClearContents()
        {
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtHomeAddress.Text = "";
            txtEmailAddress.Text = "";
            txtPhoneNumber.Text = "";
            txtPosition.Text = "";
            txtSalary.Text = "";
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ClearContents();
        }

        protected void EmployeeGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            EmployeeGridView.EditIndex = -1;
            BindGridView();
        }
        protected void EmployeeGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            EmployeeGridView.PageIndex = e.NewPageIndex;
            BindGridView();
        }
        protected void EmployeeGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            EmployeeGridView.EditIndex = e.NewEditIndex;
            BindGridView();
        }
      
        protected void EmployeeGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                Label lblId = (Label)EmployeeGridView.Rows[e.RowIndex].FindControl("lblId");
                TextBox txtFirstName = (TextBox)EmployeeGridView.Rows[e.RowIndex].FindControl("txtFirstName");
                TextBox txtLastName = (TextBox)EmployeeGridView.Rows[e.RowIndex].FindControl("txtLastName");
                TextBox txtHomeAddress = (TextBox)EmployeeGridView.Rows[e.RowIndex].FindControl("txtHomeAddress");
                TextBox txtEmailAddress = (TextBox)EmployeeGridView.Rows[e.RowIndex].FindControl("txtEmailAddress");
                TextBox txtPhoneNumber = (TextBox)EmployeeGridView.Rows[e.RowIndex].FindControl("txtPhoneNumber");
                TextBox txtPosition = (TextBox)EmployeeGridView.Rows[e.RowIndex].FindControl("txtPosition");
                TextBox txtSalary = (TextBox)EmployeeGridView.Rows[e.RowIndex].FindControl("txtSalary");

                if (txtFirstName.Text == "" || txtLastName.Text == "" || txtHomeAddress.Text == "" || txtEmailAddress.Text == "" || txtPhoneNumber.Text == "" || txtPosition.Text == "" || txtSalary.Text == "")
                {
                    lblErrorMsg.Text = "Kindly Fill all TextBoxes";
                    lblErrorMsg.ForeColor = System.Drawing.Color.Red;
                    return;
                }

                long employeeId = Convert.ToInt64(lblId.Text);
                string firstName = txtFirstName.Text.Trim();
                string lastName = txtLastName.Text.Trim();
                string homeAddress = txtHomeAddress.Text.Trim();
                string emailAddress = txtEmailAddress.Text.Trim();
                string phoneNumber = txtPhoneNumber.Text.Trim();
                string position = txtPosition.Text.Trim();
                long salary = Convert.ToInt64(txtSalary.Text);

                string sqlStatement = string.Empty;

                //sql query string
                sqlStatement = "UPDATE  EMP.EMPLOYEE SET First_Name = '" + firstName +"',Last_Name = '"+ lastName +"',Home_Address = '"+ homeAddress +"',Email_Address = '"+ emailAddress +"',Phone_Number = '"+ phoneNumber +"',Position = '"+ position +"', Salary = '"+ salary +"' WHERE Id = '"+ employeeId +"'";

                //executes the query
                DBConnect.ExecuteQuery(sqlStatement);

                //Response Message to the User
                lblMessage.Text = "Employee Record Updated Successfully";
                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblErrorMsg.Visible = false;


                EmployeeGridView.EditIndex = -1;
                BindGridView();

            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = "An Error Occured" + ex.Message;
                lblErrorMsg.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void EmployeeGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                Label lblId = (Label)EmployeeGridView.Rows[e.RowIndex].FindControl("lblId");
                long employeeId = Convert.ToInt64(lblId.Text);
                
                string sqlStatement = string.Empty;

                //sql query string
                sqlStatement = "DELETE FROM  EMP.EMPLOYEE WHERE Id = '" + employeeId + "'";

                //executes the query
                DBConnect.ExecuteQuery(sqlStatement);

                //Response Message to the User
                lblMessage.Text = "Employee Record Deleted Successfully";
                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblErrorMsg.Visible = false;
                BindGridView();

            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = "An Error Occured" + ex.Message;
                lblErrorMsg.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}