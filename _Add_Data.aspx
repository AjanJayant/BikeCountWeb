<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="_Add_Data.aspx.cs" Inherits="Add_Data" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
    <link href="Styles/WizardControl.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" Runat="Server">
   <%-- <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BikeClearinghouse_ConnectionString %>" SelectCommand="SELECT * FROM [location_dev]"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" DataSourceID="SqlDataSource1" runat="server"></asp:GridView>--%>

    
   <asp:Wizard ID="wzd" runat="Server" Width="100%" DisplaySideBar="false">
    <HeaderTemplate>
        <table style="width: 100%" cellpadding="0" cellspacing="0">
            <tr>
                <td class="wizardTitle">
                    <%= wzd.ActiveStep.Title%>
                </td>
                <td>
                    <table style="width: 100%; border-collapse: collapse;">
                        <tr>
                            <td style="text-align: right">
                                <span class="wizardProgress">Steps:</span>
                            </td>
                            <asp:Repeater ID="SideBarList" runat="server">
                                <ItemTemplate>
                                    <td class="stepBreak">&nbsp;</td>
                                    <td class="<%# GetClassForWizardStep(Container.DataItem) %>" title="<%# DataBinder.Eval(Container, "DataItem.Name")%>">
                                        <%# wzd.WizardSteps.IndexOf(Container.DataItem as WizardStep) + 1 %>
                                    </td>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </HeaderTemplate>
    <SideBarTemplate>
    </SideBarTemplate>
    <WizardSteps> 
            <asp:WizardStep ID="WizardStep1" runat="server" Title="Step 1: Pick Your Location">
                
                <table>
                    <tr>
                        <td>hi!</td>
                    </tr>


                </table>
            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep2" runat="server" Title="Step 2: About This Location"></asp:WizardStep>
    </WizardSteps>
       <SideBarTemplate>
            <asp:DataList ID="SideBarList" runat="server" HorizontalAlign="Justify" RepeatDirection="Horizontal">
                <ItemTemplate>
                    <asp:LinkButton ID="SideBarButton" runat="server" BorderWidth="0px" 
                        Font-Names="Verdana" ForeColor="White"></asp:LinkButton>
                </ItemTemplate>
                <SelectedItemStyle Font-Bold="True" />
            </asp:DataList>
            </tr>

            <tr>
</SideBarTemplate>
</asp:Wizard>


</asp:Content>


