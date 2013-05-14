<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Details.aspx.cs" Inherits="Details" %>


<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" Runat="Server">
    <h1>Details </h1>
        Location ID:<asp:Label ID="lblHouse" runat="server"          
        Font-Bold="True"  
        Font-Size="Large"><%= Request.QueryString["locationID"] %></asp:Label><br /><br />
        Street:<asp:Label ID="Label1" runat="server"          
        Font-Bold="True"  
        Font-Size="Large"><%= Request.QueryString["location"] %></asp:Label>

<br />
        <br />
        <a href="">Download KML</a><br />
        <a href="">Download Count Data</a>

</asp:Content>
