using System;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // 페이지 로드 시 별도의 작업이 필요하면 여기에 추가
        if (!IsPostBack)
        {
            // 페이지가 처음 로드될 때 할 수 있는 초기화 작업
            LoadComments();
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        // 댓글 작성 처리
        string comment = txtComment.Text.Trim();

        if (string.IsNullOrEmpty(comment))
        {
            // 댓글 내용이 비어있으면 경고 메시지 출력
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('댓글 내용을 입력해주세요.');", true);
            return;
        }

        string connectionString = WebConfigurationManager.ConnectionStrings["ASPNET"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            string query = "INSERT INTO comments (comment, created_at) VALUES (@comment, @created_at)";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@comment", comment);
            cmd.Parameters.AddWithValue("@created_at", DateTime.Now);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        // 댓글 작성 후 페이지 새로고침
        Response.Redirect(Request.RawUrl);
    }

    // 댓글 삭제 처리
    protected void gvComments_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = gvComments.Rows[index];
            int commentId = Convert.ToInt32(gvComments.DataKeys[row.RowIndex].Value);

            string connectionString = WebConfigurationManager.ConnectionStrings["ASPNET"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM comments WHERE id = @id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@id", commentId);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }

            // 댓글 삭제 후 페이지 새로고침
            Response.Redirect(Request.RawUrl);
        }
    }

    // 댓글 리스트를 로드하는 메소드
    private void LoadComments()
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["ASPNET"].ConnectionString;
        string query = "SELECT [id], [comment], [created_at] FROM [comments] ORDER BY [created_at] DESC";

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
            System.Data.DataTable dt = new System.Data.DataTable();
            adapter.Fill(dt);

            // GridView에 데이터를 바인딩
          
            gvComments.DataBind();
        }
    }
}
