using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

public partial class Add_Data2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    /*protected void Wizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
    {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.Append("<b>Personal Info - </b> <br />");
        stringBuilder.Append("First Name : ");
        stringBuilder.Append(FirstNameTextBox.Text);
        stringBuilder.Append("<br />Last Name : ");
        stringBuilder.Append(LastNameTextBox.Text);
        stringBuilder.Append("<br />DOB : ");
        stringBuilder.Append(DOBTextBox.Text);
        stringBuilder.Append("<br />Website URL : ");
        stringBuilder.Append(WebsiteURLTextBox.Text);
        stringBuilder.Append("<br /><b>Contact Info</b> <br />");
        stringBuilder.Append("City : ");
        stringBuilder.Append(CityTextBox.Text);
        stringBuilder.Append("<br />State : ");
        stringBuilder.Append(StateTextBox.Text);
        stringBuilder.Append("<br />Country : ");
        stringBuilder.Append(CountryTextBox.Text);
        stringBuilder.Append("<br />Zip : ");
        stringBuilder.Append(ZipTextBox.Text);
        Label1.Visible = true;
        Label1.Text = stringBuilder.ToString();
    }*/

    /*public void Next_Interval_Click(Object sender, EventArgs e)
    {
        int currentIntervalNumber = Int32.Parse(intervalNumber.Text);
        if (currentIntervalNumber < 4)
        {
            ++currentIntervalNumber;
            intervalNumber.Text = currentIntervalNumber.ToString();
        }
    }*/

    /*public void Next_Location_Click(Object sender, EventArgs e)
    {
        int currentLocationNumber = Int32.Parse(locationNumber.Text);
        if (currentLocationNumber < 4)
        {
            ++currentLocationNumber;
            locationNumber.Text = currentLocationNumber.ToString();
        }
        intervalNumber.Text = "1";
    }*/
    public void Next_Location_Click(Object sender, EventArgs e)
    {
        Wizard1.ActiveStepIndex--;
        Wizard1.ActiveStepIndex--;
        Wizard1.ActiveStepIndex--;
        Wizard1.MoveTo(Wizard1.ActiveStep);
    }

    public void Next_Period_Click(Object sender, EventArgs e)
    {
        Wizard1.ActiveStepIndex--;
        Wizard1.MoveTo(Wizard1.ActiveStep);
    }

    protected void Wizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
    {
        Response.Redirect("Add_Data_Complete.aspx");
    }
   
}