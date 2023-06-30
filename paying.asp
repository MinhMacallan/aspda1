<!-- #include file="connect.asp" -->
<%
Dim name, phonenum, address,slton,anhm,anht,anhb,anh1,anh2,anh3,anh4,anh5

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
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <title>Pay</title>
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/paying.css">   
</head>
<body>
<!-- #include file="layouts/header.asp" -->
    <form action="">
        <div class="head">Check Out</div>
        <div class="bo">
            <div class="le">
                <div class="del">
                    <div class="namede">Delivery Information</div>
                    <div class="namecus">
                        <input type="text" placeholder="Name">
                        <input type="number" placeholder="Phone Number *">
                    </div>
                    <input type="text" class="addr" placeholder="Address *">
                    <div class="city">
                        <input type="text" placeholder="City *">
                        <input type="text" placeholder="State *">
                        <input type="number" min="100000" max="999999" placeholder="Postal Code">
                    </div>
                    <br>
                    <div class="warn">* Must be filled</div>
                    <br>
                </div>
                <hr>
                <div class="pay">
                    <div class="namede">Payment</div>
                    <div class="opt">
                        <div class="cad">
                            <input id="card" type="radio" name="pay">
                            <label for="card">Pay By Card
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                    class="bi bi-credit-card-2-back" viewBox="0 0 16 16">
                                    <path
                                        d="M11 5.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1z" />
                                    <path
                                        d="M2 2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H2zm13 2v5H1V4a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1zm-1 9H2a1 1 0 0 1-1-1v-1h14v1a1 1 0 0 1-1 1z" />
                                </svg>
                            </label>
                        </div>
                        <div class="cad">
                            <input id="cash" type="radio" name="pay">
                            <label for="cash">Pay By Cash
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                    class="bi bi-cash-coin" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd"
                                        d="M11 15a4 4 0 1 0 0-8 4 4 0 0 0 0 8zm5-4a5 5 0 1 1-10 0 5 5 0 0 1 10 0z" />
                                    <path
                                        d="M9.438 11.944c.047.596.518 1.06 1.363 1.116v.44h.375v-.443c.875-.061 1.386-.529 1.386-1.207 0-.618-.39-.936-1.09-1.1l-.296-.07v-1.2c.376.043.614.248.671.532h.658c-.047-.575-.54-1.024-1.329-1.073V8.5h-.375v.45c-.747.073-1.255.522-1.255 1.158 0 .562.378.92 1.007 1.066l.248.061v1.272c-.384-.058-.639-.27-.696-.563h-.668zm1.36-1.354c-.369-.085-.569-.26-.569-.522 0-.294.216-.514.572-.578v1.1h-.003zm.432.746c.449.104.655.272.655.569 0 .339-.257.571-.709.614v-1.195l.054.012z" />
                                    <path
                                        d="M1 0a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h4.083c.058-.344.145-.678.258-1H3a2 2 0 0 0-2-2V3a2 2 0 0 0 2-2h10a2 2 0 0 0 2 2v3.528c.38.34.717.728 1 1.154V1a1 1 0 0 0-1-1H1z" />
                                    <path d="M9.998 5.083 10 5a2 2 0 1 0-3.132 1.65 5.982 5.982 0 0 1 3.13-1.567z" />
                                </svg>
                            </label>
                        </div>
                    </div>
                </div>
                <hr>
                <div class="forward">
                    <input type="submit" id="forward">
                    <label for="forward">Finish
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                            class="bi bi-check-lg" viewBox="0 0 16 16">
                            <path
                                d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425a.247.247 0 0 1 .02-.022Z" />
                        </svg>
                    </label>
                </div>
            </div>
            <div class="ri">
                <div class="namede">In Your Cart</div>
                <div class="su">
                    Subtotal
                    <div class="pr">150.45 $</div>
                </div>
                <div class="en">
                    Estimated Shipping
                    <div class="prc">2 $</div>
                </div>
                <br>
                <div class="tol">
                    Total
                    <div class="t l">152.45 $</div>
                </div>
                <hr>
                <div data-bs-spy="scroll" data-bs-target="#navbar-example3" data-bs-smooth-scroll="true" class="scrollspy-example-2" tabindex="0">
                    <div class="prod">
                        <img src="https://gmedia.playstation.com/is/image/SIEPDC/hogwarts-packshot-thumb-01-en-12jan21.jpg?$1200px$"
                            alt="product">
                        <div class="napr">
                            <div class="namm">Hogwarts Legacy</div>
                            <div class="price">45.95 $</div>
                        </div>
                    </div>
                    <div class="prod">
                        <img src="https://gmedia.playstation.com/is/image/SIEPDC/dead-island-cover-01-en-22nov22?$2400px$"
                            alt="product">
                        <div class="napr">
                            <div class="namm">Dead Land 2</div>
                            <div class="price">65.45 $</div>
                        </div>
                    </div>
                    <div class="prod">
                        <img src="" alt="product">
                        <div class="napr">
                            <div class="namm"></div>
                            <div class="price"></div>
                        </div>
                    </div>
                    <div class="prod">
                        <img src="" alt="product">
                        <div class="napr">
                            <div class="namm"></div>
                            <div class="price"></div>
                        </div>
                    </div>
                    <div class="prod">
                        <img src="" alt="product">
                        <div class="napr">
                            <div class="namm"></div>
                            <div class="price"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
<!-- #include file="layouts/footer.asp" -->
</body>
</html>
