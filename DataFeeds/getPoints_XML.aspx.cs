using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Xml;



public partial class getPoints_XML : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection objConn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["BikeClearinghouse_ConnectionString"].ConnectionString);
        objConn.Open();
        SqlCommand objCmd = new SqlCommand("get_Location_List_XML", objConn);
        objCmd.CommandType = CommandType.StoredProcedure;
        XmlReader rdrXMLLocations = null;
        rdrXMLLocations = objCmd.ExecuteXmlReader();

        Response.Expires = 0;
        Response.ContentType = "text/xml";
        XmlDocument oDocument = new XmlDocument();
        System.Text.StringBuilder sb = new System.Text.StringBuilder();
        using (rdrXMLLocations)
        {
            while (!rdrXMLLocations.EOF)
            {
                rdrXMLLocations.MoveToContent();
                sb.Append(rdrXMLLocations.ReadOuterXml());
            }
            rdrXMLLocations.Close();
        }
        if (!string.IsNullOrEmpty(sb.ToString()))
        {
            oDocument.LoadXml(sb.ToString());
        }
        oDocument.Save(Response.Output);
        Response.OutputStream.Flush();
        Response.OutputStream.Close();


    }
}