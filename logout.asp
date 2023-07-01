<%
    Session.Contents.RemoveAll()
    Session("role")=null
    Response.redirect("/index.asp")
%>