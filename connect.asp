<%
'code here
Dim connDB
set connDB = Server.CreateObject("ADODB.Connection")
Dim strConnection
strConnection = "PROVIDER=SQLOLEDB;SERVER=DESKTOP-5JBPVP5\SQLEXPRESS;DATABASE=gamedisc;User Id = sa; Password = 123456"
connDB.ConnectionString = strConnection
%>
