using System;
using System.Web.UI;

public partial class Login : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string username = txtUsername.Text;
        string password = txtPassword.Text;

        // 사용자 인증 로직 (예: 데이터베이스에서 사용자 확인)
        if (IsValidUser(username, password))
        {
            // 로그인 성공 시 리다이렉트
            Response.Redirect("index.aspx"); // 로그인 후 이동할 페이지
        }
        else
        {
            // 로그인 실패 시 메시지 표시
            lblMessage.Text = "아이디 또는 비밀번호가 잘못되었습니다.";
        }
    }

    private bool IsValidUser(string username, string password)
    {
        // 여기서 사용자 인증 로직을 구현합니다.
        // 예를 들어, 데이터베이스에서 사용자 정보를 확인할 수 있습니다.
        // 아래는 예시로 하드코딩된 사용자 정보를 사용합니다.
        return username == "qwe" && password == "qwe"; // 예시 사용자
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        // 회원가입 페이지로 리다이렉트
        Response.Redirect("Register.aspx"); // 회원가입 페이지의 URL로 변경
    }
}
