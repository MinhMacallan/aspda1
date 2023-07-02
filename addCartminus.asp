<!--#include file="connect.asp"-->
<%
    Dim IDProduct
    IDProduct = Request.QueryString("IDProduct") 'dat ten bien theo nut them gio hang
    If (NOT IsNull(IDProduct) and IDProduct <> "") Then
        Dim cmdPrep, Result
        Set cmdPrep = Server.CreateObject("ADODB.Command")
            connDB.Open()
            cmdPrep.ActiveConnection = connDB
            cmdPrep.CommandType = 1
            cmdPrep.CommandText = "SELECT * FROM Item WHERE ID=?"
            cmdPrep.Parameters(0)=IDProduct
            Set Result = cmdPrep.execute 

            If not Result.EOF then
                Dim currentCarts, mycarts
                If (NOT IsEmpty(Session("mycarts"))) Then
                    Set currentCarts = Session("mycarts")                                                    
                    if currentCarts.Exists(IDProduct) = true then
                        Dim value
                        value = Clng(currentCarts.Item(IDProduct))-1
                        currentCarts.Item(IDProduct) = value
                    End if
                    if value = 0 then
                        response.redirect("deleteCart.asp?IDProduct=" & IDProduct)
                    end if                        
                    Set Session("mycarts") = currentCarts                                  
                Else
                    Dim quantity
                    quantity = 1                    
                    Set mycarts = Server.CreateObject("Scripting.Dictionary")
                    mycarts.Add IDProduct, quantity
                    Set Session("mycarts") = mycarts
                    Set mycarts = Nothing
                    Response.Write("Session created!")
                End if
                Session("Success") = "The Product has bean added to your cart."
            Else
            End If
            Result.Close()
            connDB.Close()

           Response.redirect("Product.asp")            
    End if
%>