<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Download_Data.aspx.cs" Inherits="Download_Data" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" Runat="Server">
    <h1>Download Data</h1>

       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BikeClearinghouse_ConnectionString %>" SelectCommand="SELECT location_id, street1 FROM [location_dev] order by street1"></asp:SqlDataSource>
    You can download data for one or more locations.  The data will include a KML file and interval counts in CSV format.
    <h2>Please select your locations to download:</h2>
   <asp:ListBox
          id="location_id"
          runat="server"
          DataTextField="street1"
          DataSourceID="SqlDataSource1"
            SelectionMode="Multiple"
       Rows="20">
      </asp:ListBox><br /><br />
    <h2>Other filters (e.g. date/time)...:</h2>
    <input id="Submit1" type="submit" value="submit" />
   <%-- <asp:GridView ID="GridView1" DataSourceID="SqlDataSource1" runat="server"></asp:GridView>--%>
</asp:Content>

