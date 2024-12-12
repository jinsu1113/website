<%@ Page Title="" Language="C#"MasterPageFile="~/top.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<asp:Content ID="cntContent" ContentPlaceHolderID="cphContent" Runat="Server">
    <div style="text-align: center; width: 94%; margin: 0 auto;">
        <!-- 이미지와 텍스트를 한 줄에 배치 -->
        <div style="display: flex; align-items: center; margin-bottom: 20px; text-align: left;">
            <!-- 이미지 -->
            <img src="/images/book.jpg" alt="설명" style="width: 240px; height: 290px; margin-right: 20px;" />
            
            <!-- 텍스트와 별점 입력 -->
            <div style="display: flex; flex-direction: row; gap: 20px;">
                <!-- 책 정보 텍스트 -->
                <div>
                    <h2 style="margin: 0;">소년이 온다</h2>
                    <p style="margin: 5px 0; width: 237px;">
                        한강 작가 본인이 맨부커상을 《채식주의자》로 수상한 뒤 《채식주의자》보다 《소년이 온다》가 많이 읽혔으면 좋겠다고 밝히면서 유명해진 책이기도 하다.
                        그만큼 작가 자신도 많은 애착과 정성을 기울인 역작이라는 뜻이다.
                    </p>
                </div>
                
                <!-- 별점 입력 시스템 -->
                <div>
                    <label style="font-weight: bold; display: block; margin-bottom: 4px;">별점</label>
                    <div style="display: flex; flex-direction: column;">
                        <asp:RadioButton ID="star1" runat="server" GroupName="rating" Text="★" CssClass="star" />
                        <asp:RadioButton ID="star2" runat="server" GroupName="rating" Text="★★" CssClass="star" />
                        <asp:RadioButton ID="star3" runat="server" GroupName="rating" Text="★★★" CssClass="star" />
                        <asp:RadioButton ID="star4" runat="server" GroupName="rating" Text="★★★★" CssClass="star" />
                        <asp:RadioButton ID="star5" runat="server" GroupName="rating" Text="★★★★★" CssClass="star" />
                    </div>
                </div>
            </div>
        </div>

        <!-- 댓글 리스트 -->
        <div style="height: 300px; overflow-y: scroll; border: 1px solid #ccc; padding: 10px; width: 704px;">
            <asp:SqlDataSource ID="CommentDataSource" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ASPNET %>"
                SelectCommand="SELECT [id], [comment], [created_at] FROM [comments] ORDER BY [created_at] DESC"
                DeleteCommand="DELETE FROM [comments] WHERE [id] = @id">
            </asp:SqlDataSource>

            <asp:GridView ID="gvComments" runat="server" DataSourceID="CommentDataSource" AutoGenerateColumns="False" CssClass="commentGrid" 
                CellPadding="5" GridLines="None" Width="670px">
                <Columns>
                    <asp:BoundField DataField="comment" HeaderText="내용" HeaderStyle-Width="50%" />
                    <asp:BoundField DataField="created_at" HeaderText="작성 날짜" HeaderStyle-Width="20%" DataFormatString="{0:yyyy-MM-dd HH:mm}" />
                    <asp:CommandField ShowDeleteButton="True" HeaderText="삭제" HeaderStyle-Width="10%" />
                </Columns>
                <RowStyle BackColor="#EFF3FB" />
                <AlternatingRowStyle BackColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
        </div>

        <!-- 댓글 작성 폼 -->
        <table class="tbl01" cellpadding="5" cellspacing="0" style="width: 100%; margin-top: 20px;">
            <tr>
                <td style="width: 33%; text-align: left;">
                    <asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine" CssClass="inputText" Rows="5" Width="93%" 
                        style="padding: 10px; margin-bottom: 10px;" />
                </td>
                <td style="text-align: left;">
                    <asp:Button ID="btnSubmit" runat="server" Text="댓글 작성" OnClick="btnSubmit_Click" CssClass="btn" 
                        style="padding: 30px;" Height="50px" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
