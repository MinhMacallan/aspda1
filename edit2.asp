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
            Response.Redirect("edit.asp?nameitem="&nameitem)
            
    End If
%>
