using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Add_Data : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        wzd.PreRender += new EventHandler(wzd_PreRender);
    }

    protected void wzd_PreRender(object sender, EventArgs e)
    {
        Repeater SideBarList = wzd.FindControl("HeaderContainer").FindControl("SideBarList") as Repeater;

        SideBarList.DataSource = wzd.WizardSteps;
        SideBarList.DataBind();

    }

    public string GetClassForWizardStep(object wizardStep)
    {
        WizardStep step = wizardStep as WizardStep;

        if (step == null)
        {
            return "";
        }

        int stepIndex = wzd.WizardSteps.IndexOf(step);

        if (stepIndex < wzd.ActiveStepIndex)
        {
            return "stepCompleted";
        }
        else if (stepIndex > wzd.ActiveStepIndex)
        {
            return "stepNotCompleted";
        }
        else
        {
            return "stepCurrent";
        }
    }
}

