﻿<%@ Page Title="" Language="C#" MasterPageFile="~/top.master" AutoEventWireup="true" CodeFile="List.aspx.cs" Inherits="Board_List" %>

<asp:Content ID="cntContent" ContentPlaceHolderID="cphContent" Runat="Server">
    <table class="tbl01" cellpadding="0" cellspacing="0">
        <tr><td width="5px"></td><td class="td01"></td></tr>
        <tr><td></td><td class="td03">
            
            &nbsp;&nbsp;&nbsp;글 목 록</td></tr>
        <tr><td></td><td class="td01"></td></tr>
        <tr><td></td><td height="15"></td></tr>
    </table>
    <table class="tbl01" cellpadding="0" cellspacing="0">
        <tr><td width="5px"></td><td>
            <asp:SqlDataSource ID="sa" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ASPNET %>" 
                SelectCommand="SELECT [serial_no], [writer], [title], [ref_id], 
                [inner_id], [depth], [read_count], [del_flag], [reg_date] 
                FROM [board] ORDER BY [ref_id] DESC, [inner_id]">
            </asp:SqlDataSource>
            <asp:GridView ID="gvList" runat="server" DataSourceID="sa" 
                AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
                AllowPaging="True" GridLines="None" PagerSettings-Mode="NextPrevious" OnSelectedIndexChanged="gvList_SelectedIndexChanged">
                <RowStyle BackColor="#EFF3FB" />
                <AlternatingRowStyle BackColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#FFFFFF" HorizontalAlign="Left" />
                <PagerSettings 
                    NextPageImageUrl="/WebEx/13/images/btn_next.gif"
                    PreviousPageImageUrl="/WebEx/13/images/btn_prev.gif" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <EmptyDataTemplate>
                    등록된 게시물이 없습니다.
                </EmptyDataTemplate>
                <Columns>
                    <asp:BoundField DataField="serial_no" HeaderText="번호">
                        <HeaderStyle Width="60px" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="제목" HeaderStyle-Width="330px">
                        <ItemTemplate>
                            <%# ShowDepth((int)Eval("depth")) %>
                            <%# ShowReplyIcon((int)Eval("inner_id")) %>
                            <%# ShowTitle(
                                Eval("serial_no").ToString(), Eval("title").ToString(),
                                Eval("del_flag").ToString()) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="writer" HeaderText="작성자">
                        <HeaderStyle Width="70px" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="날짜" HeaderStyle-Width="70px">
                        <ItemTemplate>
                            <%# ShowDate((DateTime)Eval("reg_date")) %>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="read_count" HeaderText="조회">
                        <HeaderStyle Width="40px" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
        </td></tr>
    </table>
    <table class="tbl01" cellpadding="0" cellspacing="0">
        <tr><td width="5px" height="15px"></td><td colspan="3"></td></tr>
        <tr><td></td><td class="td06"></td><td align="left">
                &nbsp;</td>
            <td align="right">
                <asp:ImageButton ID="btnWrite" runat="server" 
                    ImageUrl="~/images/btn_write.gif" 
                    PostBackUrl="~/Board/Write.aspx"/>
            </td></tr>
        <tr><td height="10px"></td><td colspan="3"></td></tr>
    </table>
</asp:Content>

