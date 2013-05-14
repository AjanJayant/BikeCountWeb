<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="headContent" ContentPlaceHolderID="headContent" runat="server">
    <link href="Styles/Style.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="DefaultContent" ContentPlaceHolderID="mainContent" runat="server">
    <h1>Welcome to the Bike Inventory site!</h1>
                    
    <br />

    <h3>What is the Bicycle Data Clearinghouse Project?</h3>
    <p>
        This project seeks to compile, organize, make accessible, and create a data standard for bicycle count 
        data collected in Los Angeles County. The project will collect existing data and create an interface for 
        collecting future data, in 1 centralized location.  This centralized location is a data clearinghouse (
        interactive mapping website) built by UCLA, where anyone can access existing data, and where 
        municipalities can add new data that is collected.  This project will also create a training manual that 
        clearly explains how to conduct bicycle volume counts. Other elements of the project include conducting 
        counts and surveys at Union Station and document tools for estimate vehicle mile traveled and greenhouse 
        gas emissions reduction, resulting from bicycle volume data. 
    </p>

    <h3>Who is sponsoring this project?</h3>
    <p>
        The Los Angeles County Metropolitan Transportation Authority and the Southern California Association of 
        Governments are sponsoring the study. These organizations received funding for this project from a 
        California Department of Transportation’s Community Planning grant. If you have specific questions about 
        any of these sponsoring groups, please contact Alan Thompson or Lynne Goldsmith. 
    </p>

    <h3>Why participate?</h3>
    <p>
        Many municipalities are interested in collecting bicycle volume data but are not aware of how to go about 
        doing so. In response, this project will provide a training manual to do so. Secondly, the data that do 
        exist are not in any standardized format. This makes it difficult to compare counts from different 
        locations. Because this project is providing a data standard, planners, modelers and researchers can make 
        fair comparisons between locations and years. Travel occurs independently of jurisdictional boundaries. 
        Therefore, it is important to bring data together which represent all jurisdictions. Lastly, more funding 
        agencies, such as Metro, are going to be requiring before and after treatment count data be collected. 
    </p>

    <h3>What will be done with existing count data that is collected?</h3>
    <p>
        Members of the project team will take existing data and convert it into the data standard. After the data 
        is in the standard format, shapefiles will be created and these data will be posted to the mapping 
        interface. 
    </p>
    <div class="clear"></div>
</asp:Content>
