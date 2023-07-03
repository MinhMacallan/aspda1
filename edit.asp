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
    <link rel="stylesheet" href="company.css">
    <link rel="stylesheet" href="header.css">
    <style>
        body {
            margin: 0;
            padding: 0;
        }

        h2 {
            font-size: 42px;
            font-weight: 600;
            font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
            color: rgb(255, 178, 85);
            margin: 50px 0 50px 200px;
        }

        form {
            width: 80%;
            position: relative;
            left: 10%;
            border: 2px solid rgb(255, 178, 85);
            border-radius: 30px;
            margin: 0 0 50px 0;
        }

        .man {
            display: flex;
        }

        .container {
            width: 65%;
            height: auto;
            margin: 30px 20px 30px 50px;
        }

        .container input,
        .anh input {
            position: relative;
            border: 1px solid rgb(255, 178, 85);
            border-radius: 15px;
            width: 90%;
            height: 30px;
            margin-bottom: 5px;
            padding: 0 50px;
        }

        input::-webkit-input-placeholder {
            color: rgb(255, 178, 85);
            opacity: .6;
        }

        .container h3{
            font-size: 18px;
            width: 100%;
            height: 30px;
            margin: 0 0 5px 20px;
            opacity: .7;
        }

        .anh h3 {
            font-size: 18px;
            width: 100%;
            height: 30px;
            margin: 0 0 0 20px;
            opacity: .7;
        }

        .anh {
            width: 35%;
            margin: 30px 0;
        }

        .sen{
            position: relative;
            display: flex;
            width: 100%;
            gap: 20px;
            justify-content: end;
            padding: 0 220px;
        }
        .sen .save {
            color: rgb(255, 178, 85);
            font-size: 16px;
            padding: 10px 26px;
            background-color: transparent;
            border: 2px solid rgb(255, 178, 85);
            border-radius: 15px;
            width: 250px;
            height: 50px;
            position: relative;
            margin: 0 0 10px 0;
        }

        .sen .save:hover {
            background: rgb(255, 178, 85);
            color: #fff;
            border-radius: 30px;
        }

        .sen a{
            text-decoration: none;
            width: 150px;
            height: 50px;
            color: red;
            border: 2px solid red;
            border-radius: 15px;
            display: grid;
            place-content: center;
        }

        .sen a:hover {
            border-radius: 25px;
            color: #fff;
            background-color: red;
        }
    </style>
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