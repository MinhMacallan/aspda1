<!--#include file="connect.asp"-->
' <%
' id = Request.QueryString("ID")
' Dim cmdPrep, rs
'         Set cmdPrep = Server.CreateObject("ADODB.Command")
'         connDB.Open()
'         cmdPrep.ActiveConnection = connDB
'         cmdPrep.CommandType = 1
'         cmdPrep.CommandText = "DELETE FROM Account WHERE ID = ?"
'         cmdPrep.Parameters(0)=id
'         Response.Write(cmdPrep.CommandText)
'         Set rs = cmdPrep.execute()
'     Session("Success") = "Delete successfully"
'     Response.Redirect("listcus.asp")
'     Response.End
' %>
<%
    id = Request.QueryString("id")
    Set cmdPrep = Server.CreateObject("ADODB.Command")
    connDB.Open()
    cmdPrep.ActiveConnection = connDB
    cmdPrep.CommandType = 1
    cmdPrep.CommandText = "DELETE FROM Account WHERE ID= ?"
    cmdPrep.parameters.Append cmdPrep.createParameter("ID",3,1, ,id)

    cmdPrep.execute
    connDB.Close()
    Response.Redirect("listcus.asp")  
%>