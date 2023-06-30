<!--#include file ="connect.asp"-->
<%
tensp = Request.QueryString("name")

if trim(tensp)= "" or isnull(tensp) then
Response.Write("<script>alert('Cannot delete');document.location='allitem.asp'</script>")
Response.End
else
Dim cmdPrep, rs
        Set cmdPrep = Server.CreateObject("ADODB.Command")
        connDB.Open()
        cmdPrep.ActiveConnection = connDB
        cmdPrep.CommandType = 1
        cmdPrep.CommandText = "DELETE FROM Item WHERE Nameitem = ?"
        cmdPrep.Parameters(0)=tensp
        Response.Write(cmdPrep.CommandText)
        Set rs = cmdPrep.execute()
    Session("Success") = "Delete successfully"
    Response.Redirect("allitem.asp")
    Response.End
end if
%>