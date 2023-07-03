<!--#include file ="connect.asp"-->
<%
dim nameitem,genre,introduction,price,amountleft,picm,pict,picb,pic1,pic2,pic3,pic4,pic5
dim result
            If (Request.ServerVariables("Request_Method") = "POST") Then
            nameitem = Request.form("nameitem")
            genre = Request.form("genre")
            introduction = Request.form("introduction")
            price =Request.form("price")
            amountleft=Request.form("amountleft")
            picm = Request.form("picm")
            pic1 = Request.form("pic1")
            pic2 = Request.form("pic2")
            pic3 = Request.form("pic3")
            pic4 = Request.form("pic4")
            pic5 = Request.form("pic5")
            pict = Request.form("pict")
            picb = Request.form("picb") 
            Set cmdPrepp1 = Server.CreateObject("ADODB.Command")
            connDB.Open()
            cmdPrepp1.ActiveConnection = connDB      
            cmdPrepp1.CommandType = 1
            cmdPrepp1.Prepared = True
            cmdPrepp1.CommandText ="UPDATE Item Set Genre = ?, Introduction=?, price=?, Amountleft=?, picm=?,pic1 =?,pic2 =?,pic3=?,pic4=?,pic5=?,pict=?,picb=? WHERE Nameitem = ? "
            cmdPrepp1.Parameters(0)= genre
            cmdPrepp1.Parameters(1)= introduction
            cmdPrepp1.Parameters(2)= price
            cmdPrepp1.Parameters(3)= CInt(amountleft)
            cmdPrepp1.Parameters(4)= picm
            cmdPrepp1.Parameters(5)= pic1
            cmdPrepp1.Parameters(6)= pic2
            cmdPrepp1.Parameters(7)= pic3
            cmdPrepp1.Parameters(8)= pic4
            cmdPrepp1.Parameters(9)= pic5
            cmdPrepp1.Parameters(10)= pict
            cmdPrepp1.Parameters(11)= picb
            cmdPrepp1.Parameters(12)= nameitem
            dim resultt
            Set resultt = cmdPrepp1.execute()
            session("Sucess") = " Update successful!"
            Response.Redirect("allitem.asp")
            
    End If
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="company.css">
    <link rel="stylesheet" href="header.css">
    <link rel="stylesheet" href="style.css">
</head>
<body>
  </div>
</div>
<% 
        If Not IsEmpty(session("Sucess")) Then %>
            <div id = "alert" class="alert alert-danger d-flex align-items-center" role="alert">
             <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
  <div class="error">
     <% = session("Sucess") %> 
  </div>
</div>
    <% 
        End If
        session.Contents.Remove("Sucess")
    %>