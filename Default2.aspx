<%@ Page Language="C#" %>

<html>
<head id="Head1" runat="server"><title>Employee Wizard</title></head>
<body>
    <form id="Form1" runat="server">
        <asp:Wizard runat="server" ID="MyWizard" Font-Names="verdana" BackColor="lightcyan" ForeColor="navy" Style="border: outset 1px black" HeaderText="Add a New Employee" ActiveStepIndex="0">
            <StepStyle BackColor="gainsboro" BorderWidth="1" BorderStyle="Outset" />
            <SideBarTemplate>
                <div style="height: 300px">
                    <img src="/source/images/wizard.jpg" width="100%" />
                    <asp:DataList runat="Server" ID="SideBarList">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="SideBarButton" />
                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </SideBarTemplate>
            <WizardSteps>
                <asp:WizardStep ID="Wizardstep1" runat="server" StepType="auto" Title="Enter Employee Name">
                    <div style="height: 200px">
                        <table>
                            <tr>
                                <td>First Name</td>
                                <td>
                                    <asp:TextBox runat="server" ID="FirstName" />
                                    <asp:RequiredFieldValidator runat="server" ID="FirstNameValidator" Text="*" ErrorMessage="Must indicate a first name" SetFocusOnError="true" ControlToValidate="FirstName" />
                                </td>
                            </tr>
                            <tr>
                                <td>Last Name</td>
                                <td>
                                    <asp:TextBox runat="server" ID="LastName" />
                                    <asp:RequiredFieldValidator runat="server" ID="LastNameValidator" Text="*" ErrorMessage="Must indicate a last name" SetFocusOnError="true" ControlToValidate="LastName" />
                                </td>
                            </tr>
                            <tr>
                                <td height="100"></td>
                            </tr>
                        </table>
                        <asp:ValidationSummary runat="server" DisplayMode="List" ID="Summary" />
                    </div>
                </asp:WizardStep>
                <asp:WizardStep ID="Wizardstep2" runat="server" StepType="auto" Title="Personal Information">
                    <div style="height: 200px">
                        <table>
                            <tr>
                                <td>Hire date</td>
                                <td>
                                    <asp:TextBox runat="server" ID="HireDate" /></td>
                            </tr>
                            <tr>
                                <td>Title</td>
                                <td>
                                    <asp:TextBox runat="server" ID="TheTitle" /></td>
                            </tr>
                            <tr>
                                <td height="100px"></td>
                            </tr>
                        </table>
                    </div>
                </asp:WizardStep>
                <asp:WizardStep ID="Wizardstep3" runat="server" StepType="auto" Title="Optional Information">
                    <div style="height: 200px">
                        <table>
                            <tr>
                                <td valign="top">Notes</td>
                                <td>
                                    <asp:TextBox runat="server" ID="Notes" Rows="10" Columns="25" TextMode="MultiLine" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </asp:WizardStep>
                <asp:WizardStep ID="Wizardstep4" runat="server" StepType="auto" Title="Finalizing...">
                    <div style="height: 200px">
                        <asp:Label runat="server" ID="ReadyMsg" />
                    </div>
                </asp:WizardStep>
                <asp:WizardStep ID="Wizardstep5" runat="server" StepType="complete">
                    <div style="height: 200px">
                        <asp:Label runat="server" ID="FinalMsg" />
                    </div>
                </asp:WizardStep>
            </WizardSteps>
            <NavigationButtonStyle BorderWidth="1" Width="80" BorderStyle="Solid" BackColor="lightgray" />
            <HeaderStyle HorizontalAlign="Right" Font-Bold="true" Font-Size="120%" />
            <SideBarStyle BackColor="snow" BorderWidth="1" Font-Names="Arial" />
        </asp:Wizard>
    </form>
</body>
</html>
