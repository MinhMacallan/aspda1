<!--#include file="connect.asp"-->
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/detailorder.css">
    <title>The Oder</title>

</head>

<body>
    <!--#include file="layouts/header.asp"-->
    <div  id="pay">
        <div class="mainpro">
            <div class="proleft">
                <h4> The Oder </h4>
                <%
                    sql="select * from DetailPay where IDPay=? " 
                    Dim cmdPrep 
                    set cmdPrep=Server.CreateObject("ADODB.Command") 
                    connDB.Open()
                    cmdPrep.ActiveConnection = connDB
                    cmdPrep.CommandType = 1
                    cmdPrep.Prepared = true
                    cmdPrep.CommandText = sql
                    cmdPrep.Parameters(0) = Cint(request.queryString("id"))
                    Dim result
                    set result = cmdPrep.execute()
                    While not result.EOF
                            Dim sql
                            sql = "select * from Item where ID= ?"
                            Dim cmdPrep1
                            set cmdPrep1 = Server.CreateObject("ADODB.Command")
                            cmdPrep1.ActiveConnection = connDB
                            cmdPrep1.CommandType=1
                            cmdPrep1.Prepared=true
                            cmdPrep1.CommandText = sql
                            cmdPrep1.Parameters(0)=result("IDItem")
                            Dim result1
                            set result1 = cmdPrep1.execute()
                            while not result1.EOF                       
                    %>
                    <div class="spp">
                    <img src="<%=result1("Picm")%>" alt="product">
                    <div class="infsp">
                        <div class="nsp">
                            <div class="n"> <%=result1("Nameitem")%> </div>
                            <div class="pp"><%=result1("Price") * result("Amount")%> $</div>
                        </div>
                        <div class="quan">
                            <div class="tity">
                                Quantity
                                <input list="Quantity" value="<%=result("Amount")%>">
                            </div>
                        </div>
                    </div>
                    </div>
                <%
                    result1.MoveNext()
                    Wend
                    result.MoveNext()
                    Wend

                %>
            </div>
            <%
                    sql="select * from Pay where IDPay=? " 
                    Dim cmdPrep2 
                    set cmdPrep2=Server.CreateObject("ADODB.Command") 
                    cmdPrep2.ActiveConnection = connDB
                    cmdPrep2.CommandType = 1
                    cmdPrep2.Prepared = true
                    cmdPrep2.CommandText = sql
                    cmdPrep2.Parameters(0) = Cint(request.queryString("id"))
                    Dim result2
                    set result2 = cmdPrep2.execute()
                    While not result2.EOF
            %>
            <div class="proright">
                <h3>Information</h3>
                <div class="sub">
                    Oder's
                    <div class="pric"><%=result2("Name")%></div>
                </div>
                <div class="sub">
                    Total
                    <div class="pric"><%=result2("Totalpay")%> $</div>
                </div>
                <div class="sub">
                    Location
                    <div class="pric"><%=result2("Addr")%></div>
                </div>
                <div class="sub">
                    Phone number
                    <div class="pric"><%=result2("Phone")%></div>
                </div>
                <div class="sub">
                    Note
                    <div class="pric"><%=result2("Takenote")%></div>
                </div>
                <hr>
                <div class="sub">
                    Oder's ID
                    <div class="pric"><%=result2("IDPay")%></div>
                </div>
                <div class="sub">
                    Day created
                    <div class="pric"><%=result2("Datepay")%></div>
                </div>
                <hr>
                <% if Cint(result2("Status")) = 0  then %>
                    <div class="total">
                        Status
                        <div class="tal1">Processing</div>
                    </div>
                    <% else if Cint(result2("Status")) = 1 then %>
                        <div class="total">
                            Status
                            <div class="tal2">Complete</div>
                        </div>
                        <% else %>
                            <div class="total">
                                Status
                                <div class="tal3">Canceled</div>
                            </div>
                
                <% end if
                   End if  %>
                <hr>
                <% if Session("role")= 1 then %>
                <a href="Custorder.asp">
                <button>Back</button>
                </a>
                <% else %>
                <a href="Listorder.asp">
                <button>Back</button>
                </a>
                <% end if %>
                <br>
                <% if Session("role")= 1 and result2("Status") = 0 then %>
                <a href="status.asp?Status=1&ID=<%=result2("IDPay")%>">
                    <button type="submit">Set order complete</button>
                </a>
                <br>
                <a href="status.asp?Status=2&ID=<%=result2("IDPay")%>">
                    <button type="submit">Cancel order</button>
                </a>
                <% end if%>
            </div>
            <%
                result2.MoveNext()
                Wend
                ConnDB.close()
            %>
        </div>
    </div>
    <!--#include file="layouts/footer.asp"-->
</body>

</html>