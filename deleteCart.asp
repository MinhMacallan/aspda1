<!--#include file="connect.asp"-->
<%
    Dim IDProduct
    IDProduct = Request.QueryString("IDProduct")
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
                        currentCarts.remove(IDProduct)
                        
                    End if                        
                    Set Session("mycarts") = currentCarts                                                      
                End if
            End If
            Result.Close()
            connDB.Close()
           Response.redirect("Product.asp")            
    End if
%>