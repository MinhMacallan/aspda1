<!--#include file="connect.asp"-->
<%
    connDB.open()
    Dim Id
    Id =request.QueryString("key")
    if(Id>0) then
    Dim sSQL
    sSQL="Exec accountdelete " & Id
    connDB.execute(sSQL)
    response.Redirect("listcus.asp")
    end if
    connDB.close()
 %>