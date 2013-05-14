<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Add_Data_Complete.aspx.cs" Inherits="Add_Data_Complete" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
    <script src="Scripts/jquery-1.9.1.min.js"></script>

    <script src="Scripts/jquery.handsontable.full.js"></script>
        <link href="Scripts/jquery.handsontable.full.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" Runat="Server">
    Thank you for submitting your count data....
<%--                                                     <script>
                                                         $(document).ready(function () {
                                                         var data = [
                                                           ["", "Maserati", "Mazda", "Mercedes", "Mini", "Mitsubishi"],
                                                           ["2009", 0, 2941, 4303, 354, 5814],
                                                           ["2010", 5, 2905, 2867, 412, 5284],
                                                           ["2011", 4, 2517, 4822, 552, 6127],
                                                           ["2012", 2, 2422, 5399, 776, 4151]
                                                         ];

                                                         $('#example').handsontable({
                                                             data: data,
                                                             minRows: 5,
                                                             minCols: 6,
                                                             minSpareRows: 1,
                                                             autoWrapRow: true,
                                                             colHeaders: true,
                                                             contextMenu: true
                                                         });
                                                         });
                                    </script>
                    <div id="example"></div>--%>
</asp:Content>

