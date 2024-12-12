using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Board_List : System.Web.UI.Page
{
    protected string ShowDepth(int depth)
    {
        string returnString = "";
        for (int i = 0; i < depth; i++)
        {
            returnString += "&nbsp;&nbsp;&nbsp;";
        }
        return returnString;
    }

    protected string ShowReplyIcon(int innerId)
    {
        string returnString = "";

        if (innerId != 0)
        {
            returnString += "<img src='/WebEx/13/images/reply_icon.gif' />";
        }
        return returnString;
    }

    protected string ShowTitle(string serialNo, string title, string delFlag)
    {
        string returnString = "";
        // del_flag 필드 값이 N인 경우, 즉 삭제되지 않은 게시물
        if (delFlag == "N")
        {
            returnString += "<a href='Read.aspx?sn=" + serialNo;
            returnString += "' class='a01'>" + title + "</a>";
        }
        // del_flag 필드 값이 Y인 경우, 즉 삭제된 게시물
        else
        {
            returnString += "삭제된 게시물입니다.";
        }
        return returnString;
    }

    protected string ShowDate(DateTime regDate)
    {
        return string.Format("{0:yyyy-MM-dd}", regDate);
    }

    // gvList의 SelectedIndexChanged 이벤트 핸들러 추가
    protected void gvList_SelectedIndexChanged(object sender, EventArgs e)
    {
        // 선택된 행의 serial_no를 가져옵니다.
        GridViewRow row = gvList.SelectedRow;
        string serialNo = row.Cells[0].Text; // 첫 번째 셀에서 serial_no 가져오기
        Response.Redirect("Read.aspx?sn=" + serialNo); // 세부 정보 페이지로 리다이렉트
    }
}
