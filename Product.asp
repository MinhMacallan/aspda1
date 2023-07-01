<!-- #include file="connect.asp" -->
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/Product.css">
    <title>Product</title>
</head>

<body>
    <!-- #include file="layouts/header.asp" -->
    <form action="paying.asp" id="pay">
        <div class="mainpro">
            <div class="proleft">
                <h4> Cart </h4>
                    <%
                        if isnull(session("mycarts")) or isempty(session("mycarts")) then
                        response.write("Your cart is empty")
                        else
                        for each item in session("mycarts").keys
                            Dim sql
                            sql = "select * from Item where ID= ?"
                            Dim cmdPrep
                            set cmdPrep = Server.CreateObject("ADODB.Command")
                            connDB.Open()
                            cmdPrep.ActiveConnection = connDB
                            cmdPrep.CommandType=1
                            cmdPrep.Prepared=true
                            cmdPrep.CommandText = sql
                            cmdPrep.Parameters(0)=item
                            Dim result
                            set result = cmdPrep.execute()
                            while not result.EOF                        
                    %>
                    <input type="hidden" value="<%=item%>">
                    <div class="spp">
                    <img src="<%=result("Picm")%>"
                        alt="product">
                    <div class="infsp">
                        <div class="nsp">
                            <div class="n"> <%=result("Nameitem")%> </div>
                            <div class="pp"><%=result("Price") * session("mycarts").item(item)%> $</div>
                        </div>
                        <div class="quan">
                            <div class="tity">
                                Quantity
                                <input list="Quantity" value="<%=session("mycarts").item(item)%>">
                            </div>
                            <a href="addCart.asp?IDProduct=<%=item%>">    
                            <button type="button" >+</button>
                            </a>
                            <a href="addCartminus.asp?IDProduct=<%=item%>">
                            <button type="button" >-</button>
                            </a>
                            <div>
                            Price per item: <%=result("Price")%>$
                            </div>                              
                                <a id="pro1" class="trash" href = "deleteCart.asp?IDProduct=<%=item%>">
                                    <label for="pro1">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                            class="bi bi-trash" viewBox="0 0 16 16">
                                            <path
                                                d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5Zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5Zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6Z" />
                                            <path
                                                d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1ZM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118ZM2.5 3h11V2h-11v1Z" />
                                        </svg>
                                    </label>
                                </a>
                        </div>
                    </div>
                
                </div>
                    <%
                            result.MoveNext
                            WEnd
                            result.Close
                            connDB.Close
                        next
                        end if 
                    %>
                    <hr>
                    <button action="paying.asp" type="submit">Pay Now</button>
        </div>
    </form>
</body>
</html>