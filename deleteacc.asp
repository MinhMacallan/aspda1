<%

set conn = server.createobject("adodb.connection")
set Cmd = Server.CreateObject("ADODB.Command")
'-------------------------------------------------------
conn.open (db_connection)
'-------------------------------------------------------
set rs = Server.CreateObject("ADODB.RecordSet")
%>
    <% 
        Id=request.QueryString("ID")
        if(Id>0) then
        sSQL="Exec accountdelete "&request.QueryString("ID")&""
     
        conn.execute(sSQL)
         response.Redirect("List.asp")
        end if
 %>