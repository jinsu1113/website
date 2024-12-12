<%@ Page Title="로그인" Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8" />
    <title>로그인 페이지</title>
    <link rel="stylesheet" type="text/css" href="stylesheet.css" /> <!-- 필요한 CSS 파일 링크 -->
</head>
<body>
    <form id="form1" runat="server">
        <div style=" width: 300px; margin: 100px auto; height: 324px;">
            <h2>로그인</h2>
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />
            <asp:TextBox ID="txtUsername" runat="server" Placeholder="아이디" CssClass="inputText" />
            <br /><br />
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Placeholder="비밀번호" CssClass="inputText" />
            <br /><br />
            <asp:Button ID="btnLogin" runat="server" Text="로그인" OnClick="btnLogin_Click" CssClass="btn" />
            <asp:Button ID="btnRegister" runat="server" Text="회원가입" OnClick="btnRegister_Click" CssClass="btn" />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
