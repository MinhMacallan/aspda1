<!-- #include file="connect.asp" -->
<%
if isnull(session("role")) then
session("paying")=1
response.redirect("login.asp")
end if
if not isnull(session("role")) then
Dim name, phonenum, address, note
If(Request.ServerVariables("REQUEST_METHOD")="POST")THEN
    name = Request.form("name")
    phonenum = Request.form("phonenum")
    address = Request.form("addr")
    note =Request.form("note")
    atotal =Request.form("total")

    If (NOT isnull(name) AND NOT isnull(phonenum)AND NOT isnull(address)) THEN
        Set cmdPrep = Server.CreateObject("ADODB.Command")
        connDB.Open()
            Dim cmdPrepp1 
            Set cmdPrepp1 = Server.CreateObject("ADODB.Command")
            cmdPrepp1.ActiveConnection = connDB
            cmdPrepp1.CommandType=1
            cmdPrepp1.Prepared=true
            cmdPrepp1.CommandText = "Insert into Pay(IDCus,Name,Addr,Phone,Totalpay,Takenote) values (?,?,?,?,?,?)"
            cmdPrepp1.Parameters(0)= session("id")
            cmdPrepp1.parameters(1)= name
            cmdPrepp1.parameters(2)= address
            cmdPrepp1.parameters(3)= phonenum
            cmdPrepp1.parameters(4)= atotal
            cmdPrepp1.parameters(5)= note
            Set resultt = cmdPrepp1.execute()
            response.redirect("Listorder.html")
            connDB.Close()
    else Session("ErrorPaying")="Please fill out the requirements"
    End If
End If
else response.redirect("login.asp")
End if
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
    <link rel="stylesheet" href="css/paying.css?v=1">   
</head>
<body>
<!-- #include file="layouts/header.asp" -->
    <form action="Paying.asp" method="POST">
        <div class="head">Check Out</div>
        <div class="bo">
            <div class="le">
                <div class="del">
                    <div class="namede">Delivery Information</div>
                    <div class="namecus">
                        <input type="text" name="name" placeholder="Name">
                        <input type="number" name="phonenum" placeholder="Phone Number *">
                    </div>
                    <input type="text" name="addr" class="addr" placeholder="Address *">
                    <input type="text" name="note" class="city" placeholder="Your note ">
                    <br>
                    <div class="warn">* Must be filled</div>
                    <br>
                </div>
                <hr>
                <%
                If not isnull(session("ErrorPaying")) then
                response.Write("<p style= 'color: red; margin-bottom:40px';>"&session("ErrorPaying")&"</p>")
                session("ErrorPaying") = null
                end if
            %>
                <div class="forward" href="Listorder.html">
                    <button type="submit" id="forward" >
                    <label for="forward">Finish
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                            class="bi bi-check-lg" viewBox="0 0 16 16">
                            <path
                                d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425a.247.247 0 0 1 .02-.022Z" />
                        </svg>
                    </label>
                    </button>
                </div>
            </div>
            
                <hr>
            <%
                Dim subtotal
                subtotal = 0
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
                    Dim result4
                    set result4 = cmdPrep.execute()
                    if not result4.EOF then
                    subtotal = subtotal + result4("price")*session("mycarts").item(item)
            %>
                <div data-bs-spy="scroll" data-bs-target="#navbar-example3" data-bs-smooth-scroll="true" class="scrollspy-example-2" tabindex="0">
                    <div class="prod">
                        <img src="<%=result4("Picm")%>" alt="product">
                        <div class="napr">
                            <div class="namm"><%=result4("Nameitem")%></div>
                            <div class="price"><%=result4("Price") * session("mycarts").item(item)%> $</div>
                        </div>
                    </div>                                        
                </div>
            <%               
                end if
                connDB.Close()
                Next
                %>
                <div class="ri">
                <div class="namede">In Your Cart</div>
                <div class="su">
                    Subtotal
                    <div class="pr"></div><%=Cint(subtotal)%> $
                </div>
                <div class="en">
                    Estimated Shipping
                    <div class="prc">2 $</div>
                </div>
                <br>
                <div class="tol">
                    Total
                    <input type="hidden" class="t l" name="total" value="<%=Cint(subtotal+2)%>"><%=Cint(subtotal+2)%> $</div>
                </div>
            </div>
        </div>
    </form>
<!-- #include file="layouts/footer.asp" -->
</body>
</html>
