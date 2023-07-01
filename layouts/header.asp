
      <nav class="linkk">
        <div>
            <div class="barr">
            </div>
            <a href="index.asp" class="home">
                <ul>
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                        class="bi bi-playstation" viewBox="0 0 16 16">
                        <path
                            d="M15.858 11.451c-.313.395-1.079.676-1.079.676l-5.696 2.046v-1.509l4.192-1.493c.476-.17.549-.412.162-.538-.386-.127-1.085-.09-1.56.08l-2.794.984v-1.566l.161-.054s.807-.286 1.942-.412c1.135-.125 2.525.017 3.616.43 1.23.39 1.368.962 1.056 1.356ZM9.625 8.883v-3.86c0-.453-.083-.87-.508-.988-.326-.105-.528.198-.528.65v9.664l-2.606-.827V2c1.108.206 2.722.692 3.59.985 2.207.757 2.955 1.7 2.955 3.825 0 2.071-1.278 2.856-2.903 2.072Zm-8.424 3.625C-.061 12.15-.271 11.41.304 10.984c.532-.394 1.436-.69 1.436-.69l3.737-1.33v1.515l-2.69.963c-.474.17-.547.411-.161.538.386.126 1.085.09 1.56-.08l1.29-.469v1.356l-.257.043a8.454 8.454 0 0 1-4.018-.323Z" />
                    </svg>
                </ul>
                <div class="a">PS Weed</div>
            </a>
        </div>
        <div class="b">Enjoy Ur life B4 U Die ..</div>
        <div class="rightt">
        <%if(isnull(Session("phoneacc")) or TRIM(Session("phoneacc"))="") then%>
            <div class="log">
                <a href="login.asp">Login</a>
                <a>/</a>
                <a href="signup.asp">Sign Up</a>
            </div>  
        <%end if%>
            <a class="cart" href="Product.asp">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart"
                    viewBox="0 0 16 16">
                    <path
                        d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
                </svg>
            </a>

            <%if( NOT isnull(Session("phoneacc")) and TRIM(Session("phoneacc"))<>"") then%>
            <div class="profile">
            <% if not isnull(session("role")) and session("role")=0 then %>
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                    class="bi bi-person-circle" viewBox="0 0 16 16">
                    <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                    <path fill-rule="evenodd"
                        d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
                </svg>
                <div class="lik">
                    <p><a href="pass.asp">Update Password</a></p>
                    <p><a href="Listorder.html">My Oder</a></p>
                    <div class="nhr"></div>
                    <p><a href="logout.asp">Log Out</a></p>
                </div>
            <% else %>
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                    class="bi bi-person-circle" viewBox="0 0 16 16">
                    <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                    <path fill-rule="evenodd"
                        d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
                    </svg>
                    <div class="lik">
                        <p><a href="pass.asp">Update Password</a></p>
                        <p><a href="allitem.asp">All Item</a></p>
                        <p><a href="listcus.html">List Account</a></p>
                        <div class="nhr"></div>
                        <p><a href="logout.asp">Log Out</a></p>
                    </div>
            </div>
        <%end if
        end if%>
        </div>
    </nav>