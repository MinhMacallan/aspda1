<!--#include file="connect.asp"-->
<%
    dim id, stt
    SET cmd = Server.CreateObject("ADODB.Command")
    connDB.Open()
    cmd.ActiveConnection = connDB
    cmd.CommandType=1
    cmd.Prepared=true
    id = Request.queryString("ID")
    stt = Request.queryString("Status")
    cmd.CommandText = "UPDATE Pay set Status = ? WHERE IDPay = ?"
    cmd.Parameters(0)= stt
    cmd.Parameters(1)= id
    cmd.execute()
    response.redirect("custorder.asp")
%>