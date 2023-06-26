<!-- #include file="connect.asp" -->
<!DOCTYPE html>
<html lang="en">
<%
    function Ceil(Number)
        Ceil = Int(Number)
        if Ceil<>Number Then
            Ceil = Ceil + 1
        end if
    end function

    function checkPage(cond, ret) 
        if cond=true then
            Response.write ret
        else
            Response.write ""
        end if
    end function
        page = Request.QueryString("page")
    limit = 3

    if (trim(page) = "") or (isnull(page)) then
        page = 1
    end if

    offset = (Clng(page) * Clng(limit)) - Clng(limit)

    strSQL = "SELECT COUNT(productname) AS count FROM products"
    connDB.Open()
    Set CountResult = connDB.execute(strSQL)

    totalRows = CLng(CountResult("count"))

    Set CountResult = Nothing
    pages = Ceil(totalRows/limit)
    Dim range
    If (pages<=5) Then
        range = pages
    Else
        range = 5
    End if
%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="https://static.thenounproject.com/png/2050059-200.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="footer.css">
    <link rel="stylesheet" href="index.css">
    <link rel="stylesheet" href="header.css">
    <title>Home</title>
</head>
<body>
<!-- #include file="layouts/header.asp" -->
    <div class="adv">
        <img class="m1"
            src="https://gmedia.playstation.com/is/image/SIEPDC/hogwarts-legacy-logo-01-17mar22$en?$1200px--t$"
            alt="product">
        <img class="m2" src="https://i.pinimg.com/originals/88/e4/41/88e4413b4bba4635e1168c4b62f44c1c.png">
        <div class="advv">
            <p>Embark on a journey through familiar and new locations as you explore and discover magical beasts,
                customise your character and craft potions, master spell casting, upgrade talents and become the wizard
                you want to be.</p>
            <p>Experience Hogwarts in the 1800s. Your character is a student who holds the key to an ancient secret that
                threatens to tear the wizarding world apart. Discover the feeling of living at Hogwarts as you make
                allies, battle Dark Wizards and ultimately decide the fate of the wizarding world. </p>
        </div>
    </div>
    &nbsp;
    <div class="con">
        <button class="tit" type="button">Genre Filter</button>
        <div class="search">
            <input type="text" list="search" placeholder="search . . . " reuired>
            <datalist id="search">
                <option>Hogwarts Legacy</option>
                <option>Call of Duty®</option>
                <option>God of War™</option>
                <option>Dead Land 2</option>
                <option>Resident Evil 4</option>
            </datalist>
            <label for="search">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search"
                    viewBox="0 0 16 16">
                    <path
                        d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                </svg>
            </label>
        </div>
        <div class="trap">
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                <% if (pages>1) then
                        if(Clng(page)>=2) then
                %>

                    <li class="page-item disabled">
                        <a class="page-link" href="index.asp?page=<%=Clng(page)-1%>" >Previous</a>
                    </li>
                <%    
                        end if 
                        for i= 1 to range
                %>
                    <li class="page-item <%=checkPage(Clng(i)=Clng(page),"active")%>">
                        <a class="page-link" href="index.asp?page=<%=i%>"><%=i%></a>
                    </li>
                <%
                        next
                        if (Clng(page)<pages) then

                %>
                    <li class="page-item"><a class="page-link" href="index.asp?page=<%=Clng(page)+1%>" style="color:rgb(255, 178, 85)">Next</a></li>
                <%
                    end if    
                end if
                %>
                </ul>
            </nav>
        </div>
    </div>
    &nbsp;
    <div class="main">
        <div class="loc">
            <ul class="fil">
                <h3>Genre</h3>
                <p>
                    <input type="checkbox" id="genre1" name="genre">
                    <label for="genre1">Action</label>
                </p>
                <p>
                    <input type="checkbox" id="genre2" name="genre">
                    <label for="genre2">Adventure</label>
                </p>
                <p>
                    <input type="checkbox" id="genre3" name="genre">
                    <label for="genre3">Shooter</label>
                </p>
                <p>
                    <input type="checkbox" id="genre4" name="genre">
                    <label for="genre4">Horror</label>
                </p>
                <p>
                    <input type="checkbox" id="genre5" name="genre">
                    <label for="genre5">RBG</label>
                </p>
                <p>
                    <input type="checkbox" id="genre6" name="genre">
                    <label for="genre6">Family</label>
                </p>
                <p>
                    <input type="checkbox" id="genre7" name="genre">
                    <label for="genre7">Puzzle</label>
                </p>
                <p>
                    <input type="checkbox" id="genre8" name="genre">
                    <label for="genre8">Racing</label>
                </p>
                <p>
                    <input type="checkbox" id="genre9" name="genre">
                    <label for="genre9">Simulation</label>
                </p>
            </ul>
            &nbsp;
            <ul class="fil">
                <h3>Price</h3>
                <p>
                    <input type="radio" id="price1" name="price">
                    <label for="price1">0 - 25 $</label>
                </p>
                <p>
                    <input type="radio" id="price2" name="price">
                    <label for="price2">25 - 50 $</label>
                </p>
                <p>
                    <input type="radio" id="price3" name="price">
                    <label for="price3">50 - 75 $</label>
                </p>
                <p>
                    <input type="radio" id="price4" name="price">
                    <label for="price4">75 - 100 $</label>
                </p>
            </ul>
            <div class="vibe">

            </div>
        </div>
        <div class="line"></div>
        <div class="sp">
        <%
        sql = "select * from products"
        Dim cmdPrep
        set cmdPrep = Server.CreateObject("ADODB.Command")
        'connDB.Open()
        cmdPrep.ActiveConnection = connDB
        cmdPrep.CommandType=1
        cmdPrep.Prepared=true
        cmdPrep.CommandText = sql
        Dim result
        set result = cmdPrep.execute()
        While not result.EOF 
        %>
            <div class="item">
                <a href="Item.html">
                    <div class="picitem">
                        <img src="https://gmedia.playstation.com/is/image/SIEPDC/hogwarts-packshot-thumb-01-en-12jan21.jpg?$1200px$"
                            alt="product">
                    </div>
                    <div class="center">
                        <div class="inf">
                        <h1><%=result("productname")%></h1>
                            <%=result("describe")%>
                        </div>
                        <div class="pri"><%=result("price")%> $</div>
                    </div>
                </a>
                <div class="addcart">
                    <button type="submit" class="butadd">Add To Cart</button>                  
                    <div class="fa">
                        <input type="checkbox" id="love1">
                        <label for="love1">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-heart-fill" viewBox="0 0 16 16">
                                <path fill-rule="evenodd"
                                    d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                            </svg>
                        </label>
                    </div>
                </div>
            </div>
            <%
            result.MoveNext()
            WEnd%>
            <div class="item">
                <a href="#">
                    <div class="picitem">
                        <img src="https://gmedia.playstation.com/is/image/SIEPDC/wild-hearts-pack-01-en-03oct22?$1200px$"
                            alt="product">
                    </div>
                    <div class="center">
                        <div class="inf"></div>
                        <div class="pri"></div>
                    </div>
                </a>
                <div class="addcart">
                    <button type="submit" class="butadd">Add To Cart</button>
                    <div class="fa">
                        <input type="checkbox" id="love2">
                        <label for="love2">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-heart-fill" viewBox="0 0 16 16">
                                <path fill-rule="evenodd"
                                    d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                            </svg>
                        </label>
                    </div>
                </div>
            </div>

            <div class="item">
                <a href="#">
                    <div class="picitem">
                        <img src="https://gmedia.playstation.com/is/image/SIEPDC/horizon-call-of-the-mountain-keyart-01-en-05jan22?$1200px$"
                            alt="product">
                    </div>
                    <div class="center">
                        <div class="inf"></div>
                        <div class="pri"></div>
                    </div>
                </a>
                <div class="addcart">
                    <button type="submit" class="butadd">Add To Cart</button>
                    <div class="fa">
                        <input type="checkbox" id="love3">
                        <label for="love3">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-heart-fill" viewBox="0 0 16 16">
                                <path fill-rule="evenodd"
                                    d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                            </svg>
                        </label>
                    </div>
                </div>
            </div>

            <div class="item">
                <a href="#">
                    <div class="picitem">
                        <img src="https://gmedia.playstation.com/is/image/SIEPDC/fifa-23-standard-edition-pack-01-ps4-ps5-en-01aug22?$1200px$"
                            alt="product">
                    </div>
                    <div class="center">
                        <div class="inf"></div>
                        <div class="pri"></div>
                    </div>
                </a>
                <div class="addcart">
                    <button type="submit" class="butadd">Add To Cart</button>
                    <div class="fa">
                        <input type="checkbox" id="love4">
                        <label for="love4">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-heart-fill" viewBox="0 0 16 16">
                                <path fill-rule="evenodd"
                                    d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                            </svg>
                        </label>
                    </div>
                </div>
            </div>

            <div class="item">
                <a href="#">
                    <div class="picitem">
                        <img src="https://gmedia.playstation.com/is/image/SIEPDC/horizon-forbidden-west-store-art-01-01apr21$en?$1200px$"
                            alt="product">
                    </div>
                    <div class="center">
                        <div class="inf"></div>
                        <div class="pri"></div>
                    </div>
                </a>
                <div class="addcart">
                    <button type="submit" class="butadd">Add To Cart</button>
                    <div class="fa">
                        <input type="checkbox" id="love5">
                        <label for="love5">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-heart-fill" viewBox="0 0 16 16">
                                <path fill-rule="evenodd"
                                    d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                            </svg>
                        </label>
                    </div>
                </div>
            </div>

            <div class="item">
                <a href="#">
                    <div class="picitem">
                        <img src="https://gmedia.playstation.com/is/image/SIEPDC/elden-ring-store-art-01-ps5-03sep21$en?$1200px$"
                            alt="product">
                    </div>
                    <div class="center">
                        <div class="inf"></div>
                        <div class="pri"></div>
                    </div>
                </a>
                <div class="addcart">
                    <button type="submit" class="butadd">Add To Cart</button>
                    <div class="fa">
                        <input type="checkbox" id="love6">
                        <label for="love6">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-heart-fill" viewBox="0 0 16 16">
                                <path fill-rule="evenodd"
                                    d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                            </svg>
                        </label>
                    </div>
                </div>
            </div>

            <div class="item">
                <a href="#">
                    <div class="picitem">
                        <img src="https://gmedia.playstation.com/is/image/SIEPDC/god-of-war-ragnarok-listing-thumb-01-09sep21$en?$1200px$"
                            alt="product">
                    </div>
                    <div class="center">
                        <div class="inf"></div>
                        <div class="pri"></div>
                    </div>
                </a>
                <div class="addcart">
                    <button type="submit" class="butadd">Add To Cart</button>
                    <div class="fa">
                        <input type="checkbox" id="love7">
                        <label for="love7">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-heart-fill" viewBox="0 0 16 16">
                                <path fill-rule="evenodd"
                                    d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                            </svg>
                        </label>
                    </div>
                </div>
            </div>

            <div class="item">
                <a href="#">
                    <div class="picitem">
                        <img src="https://gmedia.playstation.com/is/image/SIEPDC/the-last-of-us-part-i-keyart-01-en-18may22?$1200px$"
                            alt="product">
                    </div>
                    <div class="center">
                        <div class="inf"></div>
                        <div class="pri"></div>
                    </div>
                </a>
                <div class="addcart">
                    <button type="submit" class="butadd">Add To Cart</button>
                    <div class="fa">
                        <input type="checkbox" id="love8">
                        <label for="love8">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-heart-fill" viewBox="0 0 16 16">
                                <path fill-rule="evenodd"
                                    d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                            </svg>
                        </label>
                    </div>
                </div>
            </div>

            <div class="item">
                <a href="#">
                    <div class="picitem">
                        <img src="https://gmedia.playstation.com/is/image/SIEPDC/call-of-duty-modern-warfare-2-pack-01-ps4-ps5-en-26may22$en?$1200px$"
                            alt="product">
                    </div>
                    <div class="center">
                        <div class="inf"></div>
                        <div class="pri"></div>
                    </div>
                </a>
                <div class="addcart">
                    <button type="submit" class="butadd">Add To Cart</button>
                    <div class="fa">
                        <input type="checkbox" id="love9">
                        <label for="love9">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-heart-fill" viewBox="0 0 16 16">
                                <path fill-rule="evenodd"
                                    d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                            </svg>
                        </label>
                    </div>
                </div>
            </div>

            <div class="item">
                <a href="#">
                    <div class="picitem">
                        <img src="https://gmedia.playstation.com/is/image/SIEPDC/dead-space-pack-01-en-29sep22?$1200px$"
                            alt="product">
                    </div>
                    <div class="center">
                        <div class="inf"></div>
                        <div class="pri"></div>
                    </div>
                </a>
                <div class="addcart">
                    <button type="submit" class="butadd">Add To Cart</button>
                    <div class="fa">
                        <input type="checkbox" id="love10">
                        <label for="love10">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-heart-fill" viewBox="0 0 16 16">
                                <path fill-rule="evenodd"
                                    d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                            </svg>
                        </label>
                    </div>
                </div>
            </div>

            <div class="item">
                <a href="#">
                    <div class="picitem">
                        <img src="https://gmedia.playstation.com/is/image/SIEPDC/gran-turismo-7-packshot-01-en-09sep21?$1200px$"
                            alt="product">
                    </div>
                    <div class="center">
                        <div class="inf"></div>
                        <div class="pri"></div>
                    </div>
                </a>
                <div class="addcart">
                    <button type="submit" class="butadd">Add To Cart</button>
                    <div class="fa">
                        <input type="checkbox" id="love11">
                        <label for="love11">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-heart-fill" viewBox="0 0 16 16">
                                <path fill-rule="evenodd"
                                    d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                            </svg>
                        </label>
                    </div>
                </div>
            </div>

            <div class="item">
                <a href="#">
                    <div class="picitem">
                        <img src="https://gmedia.playstation.com/is/image/SIEPDC/assassins-creed-mirage-store-artwork-01-en-19oct22?$1200px$"
                            alt="product">
                    </div>
                    <div class="center">
                        <div class="inf"></div>
                        <div class="pri"></div>
                    </div>
                </a>
                <div class="addcart">
                    <button type="submit" class="butadd">Add To Cart</button>
                    <div class="fa">
                        <input type="checkbox" id="love12">
                        <label for="love12">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-heart-fill" viewBox="0 0 16 16">
                                <path fill-rule="evenodd"
                                    d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                            </svg>
                        </label>
                    </div>
                </div>
            </div>

            <div class="item">
                <a href="#">
                    <div class="picitem">
                        <img src="https://gmedia.playstation.com/is/image/SIEPDC/diablo-iv-pack-01-en-12dec22?$1200px$"
                            alt="product">
                    </div>
                    <div class="center">
                        <div class="inf"></div>
                        <div class="pri"></div>
                    </div>
                </a>
                <div class="addcart">
                    <button type="submit" class="butadd">Add To Cart</button>
                    <div class="fa">
                        <input type="checkbox" id="love13">
                        <label for="love13">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-heart-fill" viewBox="0 0 16 16">
                                <path fill-rule="evenodd"
                                    d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                            </svg>
                        </label>
                    </div>
                </div>
            </div>

            <div class="item">
                <a href="#">
                    <div class="picitem">
                        <img src="https://gmedia.playstation.com/is/image/SIEPDC/suicide-squad-KtJL-storeart-01-en-9dec21?$1200px$"
                            alt="product">
                    </div>
                    <div class="center">
                        <div class="inf"></div>
                        <div class="pri"></div>
                    </div>
                </a>
                <div class="addcart">
                    <button type="submit" class="butadd">Add To Cart</button>
                    <div class="fa">
                        <input type="checkbox" id="love14">
                        <label for="love14">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-heart-fill" viewBox="0 0 16 16">
                                <path fill-rule="evenodd"
                                    d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                            </svg>
                        </label>
                    </div>
                </div>
            </div>

            <div class="item">
                <a href="#">
                    <div class="picitem">
                        <img src="https://gmedia.playstation.com/is/image/SIEPDC/silent-hill-2-pack-01-en-14nov22?$1200px$"
                            alt="product">
                    </div>
                    <div class="center">
                        <div class="inf"></div>
                        <div class="pri"></div>
                    </div>
                </a>
                <div class="addcart">
                    <button type="submit" class="butadd">Add To Cart</button>
                    <div class="fa">
                        <input type="checkbox" id="love15">
                        <label for="love15">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-heart-fill" viewBox="0 0 16 16">
                                <path fill-rule="evenodd"
                                    d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
                            </svg>
                        </label>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="bt">
        <nav aria-label="Page navigation example">
            <ul class="pagination">
                <li class="page-item disabled">
                    <a class="page-link" href="#" tabindex="-1">Previous</a>
                </li>
                <li class="page-item disabled">
                    <a class="page-link" href="#" tabindex="-1">1</a>
                </li>
                <li class="page-item"><a class="page-link" style="color:rgb(255, 178, 85); " href="#">2</a></li>
                <li class="page-item"><a class="page-link" style="color:rgb(255, 178, 85); " href="#">3</a></li>
                <li class="page-item"><a class="page-link" style="color:rgb(255, 178, 85); " href="#">4</a></li>
                <li class="page-item"><a class="page-link" style="color:rgb(255, 178, 85); " href="#">...</a></li>
                <li class="page-item"><a class="page-link" style="color:rgb(255, 178, 85); " href="#">Next</a></li>
            </ul>
        </nav>
    </div>
    <div class="adv">
        <img class="m1"
            src="https://gmedia.playstation.com/is/image/SIEPDC/dead-island-2-logo-01-en-18apr23?$1200px--t$"
            alt="product">
        <div class="advv">
            <p>Dead Island is back, and with it comes a host of enhancements to its winning combination of creative
                first-person zombie slaying, pitch-black humour and open-world exploration.</p>
            <p>The game's brutal melee combat gives you access to an expansive array of inventive zombie-slaying
                weaponry that lets you slice, smash and tear through the hordes before they get the chance to do the
                same to you. Can you survive HELL-A? </p>
        </div>
        <img class="m2"
            src="https://gmedia.playstation.com/is/image/SIEPDC/dead-island-2-hero-desktop-01-en-18apr23?$2400px$">
    </div>
    <div class="adv">
        <img class="m1"
            src="https://gmedia.playstation.com/is/image/SIEPDC/god-of-war-ragnarok-no-shadow-logo-01-03nov22$en?$1200px--t$"
            alt="product">
        <div class="advv">
            <p>
                From Santa Monica Studio comes the sequel to the critically acclaimed God of War (2018).
                Fimbulwinter is
                well underway. Kratos and Atreus must journey to each of the Nine Realms in search of answers as
                Asgardian forces prepare for a prophesied battle that will end the world. Along the way they will
                explore stunning, mythical landscapes, and face fearsome enemies in the form of Norse gods and
                monsters.
                The threat of Ragnarök grows ever closer. Kratos and Atreus must choose between their own safety and
                the
                safety of the realms.</p>
            <p>Embark on an epic and heartfelt journey as Kratos and Atreus struggle with holding on and letting go,
                available now on PS4 & PS5</p>
        </div>
        <img class="m2" src="https://i.pinimg.com/originals/97/7b/d0/977bd09847dea46cd510a9ae26bd233c.png">
    </div>
    <div class="station">
        <h1>Explore PlayStation®5</h1>
        <p>Incredible games, non-stop entertainment. There's never been a better time to enjoy PS5</p>
    </div>
    <br>
    <div class="sony">
        <img src="https://gmedia.playstation.com/is/image/SIEPDC/marvel-logo-brick-03-ps5-18jun20?$1600px$">
        &nbsp;
        <br><br>
        <p>© 2022 MARVEL</p>
        <p>©2022 Sony Interactive Entertainment LLC.Developed by Insomniac Games, Inc.</p>
    </div>
    <!-- #include file="layouts/footer.asp" -->
</body>

</html>