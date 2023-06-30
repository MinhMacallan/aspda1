<!--#include file ="connect.asp"-->
<%
Dim tensp, theloai, gioithieu,giaban,slton,anhm,anht,anhb,anh1,anh2,anh3,anh4,anh5

If(Request.ServerVariables("REQUEST_METHOD")="POST")THEN
    tensp = Request.form("name")
    theloai = Request.form("type")
    gioithieu = Request.form("introduce")
    giaban =Request.form("price")
    slton=Request.form("howmany")
    anhm = Request.form("picture")
    anh1 = Request.form("image1")
    anh2 = Request.form("image2")
    anh3 = Request.form("image3")
    anh4 = Request.form("image4")
    anh5 = Request.form("image5")
    anht = Request.form("imaget")
    anhb = Request.form("imageb") 

    If (NOT IsNull(tensp) AND NOT isnull(theloai)) Then 'kiem tra xem tensp va the loai da ton tai hay chua'
        Set cmdPrep = Server.CreateObject("ADODB.Command")
        connDB.Open()
        cmdPrep.ActiveConnection = connDB      
        cmdPrep.CommandType = 1
        cmdPrep.Prepared = True
        cmdPrep.CommandText ="SELECT * FROM Item WHERE Nameitem=? AND Genre = ?"
        cmdPrep.parameters(0) = Nameitem
        cmdPrep.parameters(1) = Genre

        Dim Result 
        Dim resultt
        Dim resulttt
        Set Result = cmdPrep.execute()
        If Result.EOF then 
            Dim cmdPrepp1 
            Set cmdPrepp1 = Server.CreateObject("ADODB.Command")
            cmdPrepp1.ActiveConnection = connDB
            cmdPrepp1.CommandType=1
            cmdPrepp1.Prepared=true
            cmdPrepp1.CommandText = "Insert into Item (Nameitem,Genre,Introduction,Price,Amountleft,Picm,Pic1,Pic2,Pic3,Pic4,Pic5,Pict,Picb) values (?,?,?,?,?,?,?,?,?,?,?,?,?)"
            cmdPrepp1.Parameters(0)= tensp
            cmdPrepp1.parameters(1)= theloai
            cmdPrepp1.parameters(2)= gioithieu
            cmdPrepp1.parameters(3)= giaban
            cmdPrepp1.parameters(4)= cint(slton)
            cmdPrepp1.parameters(5)= anhm
            cmdPrepp1.parameters(6)= anh1
            cmdPrepp1.parameters(7)= anh2
            cmdPrepp1.parameters(8)= anh3
            cmdPrepp1.parameters(9)= anh4
            cmdPrepp1.parameters(10)= anh5
            cmdPrepp1.parameters(11)= anht
            cmdPrepp1.parameters(12)= anhb
			Response.Write(cmdPrepp1.CommandText)
            Set resultt = cmdPrepp1.execute()
        Else
            Session("Error") = "The item is already exist"
        End If
    End If
End If

%>
<html lang="en">
<!--#include file ="layouts/header.asp"-->
<head>
    <% 
        If Not IsEmpty(Session("Error")) Then %>
        <div class="error">
            <div class="square">
               <h3 style= "text-align:center;font-family: Times New Roman"> 
               <% = Session("Error") %> 
               </h3>
            </div>        
        </div>
    <% 
        End If
        Session.Contents.Remove("Error")
    %>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/addproduct.css">   
</head>

<body>
    <h2> Add Product</h2>
    <form method="POST" action="addproduct.asp">
        <div class="man">
            <div class="container">
                <div class="row1">
                    <h3>Name Product</h3>
                    <input type="text" name="name" placeholder="Name Product" required>
                </div>
                <div class="row2">
                    <h3>Type</h3>
                    <input type="text" name="type" placeholder="Type Product" required>
                </div>
                <div class="row3">
                    <h3>Introduction</h3>
                    <input type="text" name="introduce" placeholder="Product's Introduction">
                </div>
                <div class="row4">
                    <h3>Price</h3>
                    <input type="number" name="price" placeholder="Product's Price" required>
                </div>
                <div class="row5">
                    <h3>How many</h3>
                    <input type="number" name="howmany" placeholder="How many" required>
                </div>
                <div class="row6">
                    <h3>Product's Picture</h3>
                    <input type="text" name="picture" placeholder="Link picture" required>
                </div>
            </div>
            <div class="anh">
                <div class="intro">
                    <h3>Product's Image 1</h3>
                    <input type="url" name="image1" placeholder="Link picture">
                </div>
                <div class="intro">
                    <h3>Product's Image 2</h3>
                    <input type="url" name="image2" placeholder="Link picture">
                </div>
                <div class="intro">
                    <h3>Product's Image 3</h3>
                    <input type="url" name="image3" placeholder="Link picture">
                </div>
                <div class="intro">
                    <h3>Product's Image 4</h3>
                    <input type="url" name="image4" placeholder="Link picture">
                </div>
                <div class="intro">
                    <h3>Product's Image 5</h3>
                    <input type="url" name="image5" placeholder="Link picture">
                </div>
                <div class="intro">
                    <h3>Product's Image Top</h3>
                    <input type="url" name="imaget" placeholder="Link picture">
                </div>
                <div class="intro">
                    <h3>Product's Image Bottom</h3>
                    <input type="url" name="imageb" placeholder="Link picture">
                </div>
            </div>
        </div>
        <div class="sen">
            <button type="submit" name="save" class="save">Add Product</button>
            <a href="allitem.html">Cancel</a>
        </div>
    </form>
    
</body>

</html>