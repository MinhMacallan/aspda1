<!--#include file ="connect.asp"-->
<% 
dim nameitem,genre,introduction,price,amountleft,picm,pict,picb,pic1,pic2,pic3,pic4,pic5
dim result
nameitem = Request.QueryString("nameitem")
    If (not isnull(nameitem) or not trim(nameitem)="") then
        Set cmdPrep = Server.CreateObject("ADODB.Command")
        connDB.Open()
        cmdPrep.ActiveConnection = connDB      
        cmdPrep.CommandType = 1
        cmdPrep.Prepared = True
        cmdPrep.CommandText ="SELECT * FROM Item WHERE Nameitem=?"
        cmdPrep.parameters(0) = nameitem
        set result = cmdPrep.execute() 
        If not result.EOF then
            nameitem = result("nameitem")
            genre = result("genre")
            introduction = result("introduction")
            price = result("price")
            amountleft = result("amountleft")
            picm = result("picm")
            pic1 = result("pic1")
            pic2 = result("pic2")
            pic3 = result("pic3")
            pic4 = result("pic4")
            pic5 = result("pic5")
            pict = result("pict")
            picb = result("picb")      
        End If
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
    <link rel="stylesheet" href="css/edit.css">
</head>

<body>
  </div>
</div>
    <h2> Edit Product </h2>
    <form method="POST" action="edit2.asp">
        <div class="man">
            <div class="container">
                <div class="row1">
                    <h3>Name Product</h3>
                    <input type="text" name="nameitem" value = "<%= nameitem%>" required>
                </div>
                <div class="row2">
                    <h3>Type</h3>
                    <input type="text" name="genre" value ="<%= genre%>" required>
                </div>
                <div class="row3">
                    <h3>Introduction</h3>
                    <input type="text" name="introduction" value ="<%= introduction%>">
                </div>
                <div class="row4">
                    <h3>Price</h3>
                    <input type="number" name="price" value = "<%= price%>" required>
                </div>
                <div class="row5">
                    <h3>How many</h3>
                    <input type="number" name="amountleft"  value = "<%= amountleft%>" required>
                </div>
                <div class="row6">
                    <h3>Product's Picture</h3>
                    <input type="url" name="picm"  value = "<%= picm%>" required>
                </div>
            </div>
            <div class="anh">
                <div class="intro">
                    <h3>Product's Image 1</h3>
                    <input type="url" name="pic1"  value = "<%= pic1%>">
                </div>
                <div class="intro">
                    <h3>Product's Image 2</h3>
                    <input type="url" name="pic2"  value = "<%= pic2%>">
                </div>
                <div class="intro">
                    <h3>Product's Image 3</h3>
                    <input type="url" name="pic3"  value = "<%= pic3%>">
                </div>
                <div class="intro">
                    <h3>Product's Image 4</h3>
                    <input type="url" name="pic4"  value = "<%= pic4%>">
                </div>
                <div class="intro">
                    <h3>Product's Image 5</h3>
                    <input type="url" name="pic5"  value = "<%= pic5%>">
                </div>
                <div class="intro">
                    <h3>Product's Image Top</h3>
                    <input type="url" name="pict"  value = "<%= pict%>">
                </div>
                <div class="intro">
                    <h3>Product's Image Bottom</h3>
                    <input type="url" name="picb"  value = "<%= picb%>">
                </div>
            </div>
        </div>
         <div class="sen">
            <button type="submit" class="save">Submit
            </button>
             <a href ='allitem.asp'> Back </a>
            </div>
    </form>   
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" 
crossorigin="anonymous">
</script>
<script type="text/javascript">
        setTimeout(function () {
            // Closing the alert
            $('#alert').alert('close');
        }, 5000);
    </script>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</body>

</html>