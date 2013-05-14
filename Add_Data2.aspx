<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Add_Data2.aspx.cs" Inherits="Add_Data2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="Server">
    <link href="Styles/Add_Data.css" rel="stylesheet" type="text/css" />
    <link href="Styles/GoogleMapModify.css" rel="stylesheet" />
    <link href="Styles/Style.css" rel="stylesheet" />
    <script type="text/javascript" src="Scripts/formFunctions.js"></script>
 

    <%--<link href="Scripts/jquery.cluetip.css" rel="stylesheet" />--%>
    <%--<link href="Scripts/jquery.qtip.min.css" rel="stylesheet" />--%>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="Server">
    <div>
        <asp:Wizard ID="Wizard1" runat="server" BackColor="#EFF3FB"
            BorderColor="#B5C7DE" BorderWidth="1px" Font-Names="Arial"
            OnFinishButtonClick="Wizard1_FinishButtonClick" DisplaySideBar="true" Width="100%">
            <%-- <StepStyle ForeColor="#333333" Width="100%" />
            <HeaderTemplate>
                <i>HeaderTemplate</i> - <b><%=Wizard1.ActiveStep.Title %></b>
                <br />
                <br />
            </HeaderTemplate>--%>

            <%--<StartNavigationTemplate>
            <i>StartNavigationTemplate</i><br />
            <asp:Button ID="NextButton" runat="server" Text="NEXT" CommandName="MoveNext" />
            </StartNavigationTemplate>
           
            <StepNavigationTemplate>
            <i>StepNavigationTemplate</i><br />
            <asp:Button ID="PreviousButton" runat="server" Text="PREVIOUS" CommandName="MovePrevious" />
            <asp:Button ID="StartNextButton" runat="server" Text="NEXT" CommandName="MoveNext" />           
            </StepNavigationTemplate>
           
            <FinishNavigationTemplate>
            <i>FinishNavigationTemplate</i><br />
            <asp:Button ID="PreviousButton" runat="server" Text="PREVIOUS" CommandName="MovePrevious" />
            <asp:Button ID="FinishButton" runat="server" Text="FINISH" CommandName="MoveComplete" />      
            </FinishNavigationTemplate>--%>

            <WizardSteps>
                <asp:WizardStep ID="WizardStep0" runat="server" Title="Overview">
                    <div style="height: 600px">
                        <img id="overviewImage" src="Images/data_upload_overview-01_resize2.png" />
                    </div>
                </asp:WizardStep>

                <asp:WizardStep ID="WizardStep1" runat="server" Title="Step 1">
                        
                   <%-- <script type="text/javascript" src="Scripts/jquery.cluetip.min.js"></script>--%>
                    <%--<script type="text/javascript" src="Scripts/jquery.qtip.min.js"></script>--%>
                    <script src="Scripts/jquery-1.9.1.min.js"></script>
                   <%-- <script type="text/javascript" src="Scripts/jquery.handsontable.full.js"></script>
                       <link href="Scripts/jquery.handsontable.full.css" rel="stylesheet" media="screen" />--%>

                    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
                    <%--<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD_7mMRICG0s8iG6khVDjtUC8R8-msB9l4&sensor=false"></script>--%>
                    <script type="text/javascript" src="Scripts/markerclusterer.js"></script>
                    <script type="text/javascript" src="Scripts/geoxml3.js"></script>
                    


                    <script type="text/javascript">
                        $(document).ready(function () {
         
                            google.maps.event.addDomListener(window, 'load', initialize);

                        


                               

                        });
                        function initialize() {
                           
                            var cluster = [];
                            var mapOptions = {
                                center: new google.maps.LatLng(34.042419, -118.24585),
                                zoom: 8,
                                mapTypeId: google.maps.MapTypeId.ROADMAP
                            };
                            var new_marker = null;
                            var add_location_flag = false;
                            var map = new google.maps.Map(document.getElementById("map-canvas"),
                                mapOptions);


                     


                            // Create Toggle for Google Bike Layer
                            var controlDiv_bike_google = document.createElement('DIV');
                            $(controlDiv_bike_google).addClass('gmap-control-container')
                                         .addClass('gmnoprint');

                            var controlUI_bike_google = document.createElement('DIV');
                            $(controlUI_bike_google).addClass('gmap-control');
                            $(controlUI_bike_google).text('Bike Data (Google)');
                            $(controlDiv_bike_google).append(controlUI_bike_google);

                            var legend_bike_google = '<img src="Images/bike_google_legend.png" />';

                            var controlLegend_bike_google = document.createElement('DIV');
                            $(controlLegend_bike_google).addClass('gmap-control-legend');
                            $(controlLegend_bike_google).html(legend_bike_google);
                            $(controlLegend_bike_google).hide();
                            $(controlDiv_bike_google).append(controlLegend_bike_google);

                            // Set hover toggle event
                            $(controlUI_bike_google)
                                .mouseenter(function () {
                                    $(controlLegend_bike_google).show();
                                })
                                .mouseleave(function () {
                                    $(controlLegend_bike_google).hide();
                                });



                            // Create Toggle for Metro Bike Layer
                            var controlDiv_bike_metro = document.createElement('DIV');
                            $(controlDiv_bike_metro).addClass('gmap-control-container')
                                         .addClass('gmnoprint');

                            var controlUI_bike_metro = document.createElement('DIV');
                            $(controlUI_bike_metro).addClass('gmap-control');
                            $(controlUI_bike_metro).text('Bike Data (Metro)');
                            $(controlDiv_bike_metro).append(controlUI_bike_metro);

                            var legend_bike_metro = '<ul>'
                           + '<li><span style="background-color: #ff0000">&nbsp;&nbsp;</span><span style="color: #ff0000"> Class 1 - Bike Paths</span></li>'
                           + '<li><span style="background-color: #ff7d18">&nbsp;&nbsp;</span><span style="color: #ff7d18"> Class 2 - Bike Lanes</span></li>'
                           + '<li><span style="background-color: #f57ab6">&nbsp;&nbsp;</span><span style="color: #f57ab6"> Class 3 - Bike Routes</span></li>'
                           + '</ul>';

                            var controlLegend_bike_metro = document.createElement('DIV');
                            $(controlLegend_bike_metro).addClass('gmap-control-legend');
                            $(controlLegend_bike_metro).html(legend_bike_metro);
                            $(controlLegend_bike_metro).hide();
                            $(controlDiv_bike_metro).append(controlLegend_bike_metro);

                            // Set hover toggle event
                            $(controlUI_bike_metro)
                                .mouseenter(function () {
                                    $(controlLegend_bike_metro).show();
                                })
                                .mouseleave(function () {
                                    $(controlLegend_bike_metro).hide();
                                });


                            // Create Toggle for City Layer
                            var controlDiv_City = document.createElement('DIV');
                            $(controlDiv_City).addClass('gmap-control-container')
                                         .addClass('gmnoprint');

                            var controlUI_City = document.createElement('DIV');
                            $(controlUI_City).addClass('gmap-control');
                            $(controlUI_City).text('LA County Cities');
                            $(controlDiv_City).append(controlUI_City);

                           

                            // var mcOptions = { gridSize: 80, maxZoom: 15 };
                            // markerclusterer documentation: http://google-maps-utility-library-v3.googlecode.com/svn/trunk/markerclustererplus/docs/reference.html */
                            var infowindow = new google.maps.InfoWindow();
                            downloadUrl("DataFeeds/getPoints_XML.aspx", function (data) {

                                var xml = data.responseXML;
                                var markers = xml.documentElement.getElementsByTagName("marker");

                                for (var i = 0; i < markers.length; i++) {
                                    var locationid = markers[i].getAttribute("pk_location_id");
                                    var street1 = markers[i].getAttribute("street1");
                                    var point = new google.maps.LatLng(
                                        parseFloat(markers[i].getAttribute("latitude")),
                                        parseFloat(markers[i].getAttribute("longitude")));
                                    var marker = createMarker(point, locationid, street1);
                                    cluster.push(marker);
                                }
                                var mc = new MarkerClusterer(map, cluster);
                            });

                            // Create the marker with popup information
                            function createMarker(point, locationid, street1) {

                                var marker = new google.maps.Marker({
                                    map: map,
                                    position: point,
                                    title: street1,
                                    icon: "Images/green.png"
                                });

                                var html;
                                html = '<b>Location ID: </b>' + locationid +
                                    '<br/><b>Street 1: </b>' + street1 +
                                    '<br/><b>Maximum Hourly Volume Observed: </b>' +
                                    '<br/><b>Maximum Hourly Date: </b>' +
                                    '<br/><b>Maximum Hourly Time: </b>';

                                google.maps.event.addListener(marker, "click", function () {
                                    infowindow.setContent(html);
                                    infowindow.open(map, marker);
                                });

                                google.maps.event.addListener(marker, "rightclick", function (event) {
                                    //new_marker.setMap(null);
                                    $('#selected_locationid').val(locationid);
                                    $('#selected_locationdesc').html("Location: "+street1);
                                    add_location_flag = false;                                    
                                    $("#new_lat").val("");
                                    $("#new_long").val("");
                                    $('#new_location').hide();
                                    

                                });

                                return marker;
                            }


                            function downloadUrl(url, callback) {
                                var request = window.ActiveXObject ?
                                    new ActiveXObject('Microsoft.XMLHTTP') :
                                    new XMLHttpRequest;

                                request.onreadystatechange = function () {
                                    if (request.readyState == 4) {
                                        request.onreadystatechange = doNothing;
                                        callback(request, request.status);
                                    }
                                };

                                request.open('GET', url, true);
                                request.send(null);
                            }

                            function doNothing() { }

                            //Control for City Layer
                            var parseLACities = false;
                            var show_cities = false;

                            google.maps.event.addDomListener(controlUI_City, 'click', function () {
                                if (show_cities == false) {
                                    if (parseLACities == false) {
                                        parseLACities = new geoXML3.parser({
                                            map: map
                                        });
                                        parseLACities.parse('DataFeeds/LACountyCities_General.xml');
                                    } else {
                                        parseLACities.showDocument();
                                    }
                                    $(controlUI_City).addClass('gmap-control-active');
                                    show_cities = true;
                                } else {
                                    $(controlUI_City).removeClass('gmap-control-active');
                                    parseLACities.hideDocument();
                                    show_cities = false;
                                }
                            });


                            //Control for Metro Bike Layer
                            var myParser = false;
                            var show_metrobike = false;

                            google.maps.event.addDomListener(controlUI_bike_metro, 'click', function () {
                                if (show_metrobike == false) {
                                    //Need to load first instance of KML layer
                                    if (myParser == false) {
                                        myParser = new geoXML3.parser({
                                            map: map
                                        });
                                        myParser.parse('DataFeeds/metro_bikeways.xml');
                                        //KML layer already loaded.  Just need to display.
                                    } else {
                                        myParser.showDocument();
                                    }
                                    //Code that applies to both new instance and loaded instance of KML. Toggle active/inactive button color
                                    $(controlUI_bike_metro).addClass('gmap-control-active');
                                    show_metrobike = true;
                                } else {
                                    $(controlUI_bike_metro).removeClass('gmap-control-active');
                                    myParser.hideDocument();
                                    show_metrobike = false;
                                }
                            });


                            //Control for Google Bike Layer
                            var bikeLayer = new google.maps.BicyclingLayer();
                            google.maps.event.addDomListener(controlUI_bike_google, 'click', function () {
                                if (typeof bikeLayer.getMap() == 'undefined' || bikeLayer.getMap() === null) {
                                    $(controlUI_bike_google).addClass('gmap-control-active');
                                    bikeLayer.setMap(map);
                                } else {
                                    bikeLayer.setMap(null);
                                    $(controlUI_bike_google).removeClass('gmap-control-active');
                                }
                            });

                            map.controls[google.maps.ControlPosition.TOP_RIGHT].push(controlDiv_bike_google);
                            map.controls[google.maps.ControlPosition.TOP_RIGHT].push(controlDiv_bike_metro);
                            map.controls[google.maps.ControlPosition.TOP_RIGHT].push(controlDiv_City);



                            google.maps.event.addListener(map, "rightclick", function (event) {
                                
                                if (add_location_flag) {
                                    if (new_marker) {
                                        new_marker.setMap(null);
                                    }

                                    new_marker = new google.maps.Marker({
                                        position: event.latLng,
                                        map: map
                                    });
                                    $("#new_lat").val(event.latLng.lat());
                                    $("#new_long").val(event.latLng.lng());

                                }
                            });

                            //Clear selected marker location and show Add new location section
                            $("#clear_selected").click(function () {
                                $('#selected_locationid').val("");
                                $('#selected_locationdesc').html("");
                                $('#new_location').show();
                            });


                            $("#add_location").click(function () {
                                
                                if ($(this).val() == "Add Location") {
                                    add_location_flag = true;
                                    $("#selected_locationid").val("")
                                    $("#selected_locationdesc").html("")
                                    $(this).val("Delete New Location");
                                    $("#new_location_form").toggle();
                                }
                                else {
                                    add_location_flag = false;
                                    new_marker.setMap(null);
                                    $("#new_lat").val("");
                                    $("#new_long").val("");
                                    $(this).val("Add Location");
                                    $("#new_location_form").toggle();
                                }
                            });



                        } //End initialize function
                    </script>
                    <div style="height: 600px">

                        <table cellpadding="2" cellspacing="2" width="100%">
                            <tr>
                                <td><span class="wizardHeading">Pick your location from the map (right-click on marker)</span> </td>
                                <td></td>
                            </tr>
                            <tr valign="top">
                                <td style="width: 700px">
                                    <div id="map-canvas" style="width: 700px; height: 500px;"></div>

                                </td>
                                <td>
                                    Add data to an EXISTING location by right-clicking the <img src="Images/green.png" /> icon.  You may need to zoom in until you see the icon. <br />
                                    
                                    <span style="text-align: left">You've added the following location:<br />
                                        Location ID: <input id="selected_locationid" type="text" disabled="disabled" size="10" />
                                        <input id="clear_selected" type="button" value="Clear" />
                                        <div id="selected_locationdesc"></div>
                                        <br />
                                        <br />
                                        <br />
                                        <span id="new_location">
                                            To add data to a NEW location, please click on the "Add Location" button.<br />
                                            <%--<span class="wizardHeading">Location not on map?</span> --%><input id="add_location" type="button" value="Add Location" /><br />
                                        
                                        <div id="new_location_form" style="display: none;">
                                            <b>Add New Location:</b><br />
                                            Right-click on the map to choose your location.  Then, fill in details about your new location.<br />
                                            Latitude: <input id="new_lat" type="text" disabled="disabled" /> 
                                            Longitude: <input id="new_long" type="text" disabled="disabled" /><br /><br />
                                                                <div>
	                    <div class="inlineBlock"> 
		    	            Is this a mid-block or intersection location? 
		                        <select id="Type" onchange="showWhat(this.options[this.selectedIndex].value);">
				                    <option value="midblock">mid-block</option>
				                    <option value="intersection">intersection</option>
		                        </select>                              
		                </div>
                    </div>

                    <br />

                    <div id="midblock">
		                Street 1: <asp:TextBox id="Street1m" runat="server"></asp:TextBox> <br /><br />
	                        between <br /><br />
	                    Street 2: <asp:TextBox id="Street2m" runat="server"></asp:TextBox> <br /><br />
	                    Street 3: <asp:TextBox id="Street3m" runat="server"></asp:TextBox>			
		            </div>
		        
		            <div id="intersection">
		                Street 1: <asp:TextBox id="Street1i" runat="server"></asp:TextBox> <br /><br />
	                        at <br /><br />
	                    Street 2: <asp:TextBox id="Street2i" runat="server"></asp:TextBox> <br /><br />
	                </div>



                                        </div>
                                        </span>

                                    </span>
                                    <br /><br />
                                      <b>You have added count data to the following locations:</b>
                                </td>
                            </tr>

                        </table>
                  
                         </div>
                   
                </asp:WizardStep>
                <asp:WizardStep ID="WizardStep2" runat="server" Title="Step 2">

                        <!-- start checkboxTree configuration -->
<%--    <script type="text/javascript" src="library/jquery-1.4.4.js"></script>
    <script type="text/javascript" src="Scripts/checkboxtree/library/jquery-ui-1.8.12.custom/js/jquery-ui-1.8.12.custom.min.js"></script>
    <link rel="stylesheet" type="text/css"
          href="Scripts/checkboxtree/library/jquery-ui-1.8.12.custom/css/smoothness/jquery-ui-1.8.12.custom.css"/>

    <script type="text/javascript" src="Scripts/checkboxtree/jquery.checkboxtree.js"></script>
    <link rel="stylesheet" type="text/css" href="Scripts/checkboxtree/jquery.checkboxtree.css"/>
    <!-- end checkboxTree configuration -->
                        <script type="text/javascript">
                            //<!--
                            $(document).ready(function () {
                                $('.jquery').each(function () {
                                    eval($(this).html());
                                });
                            });

                            $('#biketypetree').checkboxTree({
                                initializeUnchecked: 'collapsed',
                                onCheck: {
                                    ancestors: 'check',
                                    descendants: 'uncheck',
                                    others: 'uncheck'
                                },
                                onUncheck: {
                                    descendants: 'uncheck'
                                }
                            });
                            //-->
    </script>--%>

                    <div style="height: 600px">
                        <table cellpadding="2" cellspacing="2" width="500px">
                            <tr>
                                <td>

                <h3>About This Location</h3>
        
	            <b>Required Information</b>
	    
	            <br /><br />	    
	            
                                     <div class="centerDivThree centerElement"> 
                    <div class="questionThree">
                        Select the bikeway type at this location: <br />
		                <%--<span class="grayed_out">(If no bikeway exists, please select 'None')</span> --%>
                        

                    </div>
                    <div class="formThree">
                        
                        
<style>
ul.tree, ul.tree ul {
    position: relative;
    list-style: none;
    margin: 0 0 0 20px;
    padding: 0;
}
ul.tree input {
    position: absolute;
    margin-left: -20px;
}
ul.tree ul {
    display: none;
}
ul.tree input:checked ~ ul {
    display: block;
}
ul.tree label:hover {
    text-decoration: underline;
}
</style>
<ul class="tree">
  <li>
    <input type="checkbox" id="bikepath"><label for="bikepath">Bike Path</label> 
      <a href="#" class="help">
        <img src="Images/help.png" />
            <span><strong>Bike Path:</strong><img src="Images/bikepath_small.jpg" /> <br />A paved right-of-way for bicycle travel completely separated from a street, typically providing for two-way travel.</span>
      </a>
  </li>
    
  <li>
   <input type="checkbox" id="bikelane"><label for="bikelane">Bike Lane</label>
                <a href="#" class="help">
        <img src="Images/help.png" />
            <span><strong>Bike Lane:</strong><img src="Images/bikelane_small.jpg" /> <br />A striped lane for one-way bicycle hantravel on a street.</span>
      </a>

    <ul>
      <li>
       <input type="checkbox" id="coloredbikelane">
       <label for="coloredbikelane">Colored Bike Lane</label>

      <a href="#" class="help">
        <img src="Images/help.png" />
            <span><strong>Colored Bike Lane:</strong><img src="Images/coloredbikelane_small.png" /> <br />The interior of the bike lane is painted some color, typically green.</span>
      </a>
      </li>
      <li>
       <input type="checkbox" id="paintedbuffer">
       <label for="paintedbuffer">Painted Buffer</label>
      <a href="#" class="help">
        <img src="Images/help.png" />
            <span><strong>Painted Buffer:</strong><img src="Images/bufferedbikelane_small.jpg" /> <br />A painted area parallel to a bike lane that provides for separation between bicycle travel and either parked cars or the adjacent travel lane.</span>
      </a>

      </li>
      <li>
       <input type="checkbox" id="physicalbuffer">
       <label for="physicalbuffer">Physical Buffer</label>
           <a href="#" class="help">
        <img src="Images/help.png" />
            <span><strong>Physical Buffer:</strong><br />A physical separation such as a curb, planters, or parked cars parallel to a bike lane, providing for separation between bicycle travel and motor vehicle travel.</span>
      </a>
      </li>
    </ul>
  </li>
  <li>
   <input type="checkbox" id="bikeroute"><label for="bikeroute">Bike Route</label>
       <a href="#" class="help">
        <img src="Images/help.png" />
            <span><strong>Bike Route:</strong><img src="Images/bikeroute_small.jpg" /> <br />A signed route on which bicycles and vehicles share the lane.</span>
      </a>

    <ul>
      <li>
       <input type="checkbox" id="sharrows_1">
       <label for="sharrows_1">Sharrows</label>
       <a href="#" class="help">
        <img src="Images/help.png" />
            <span><strong>Sharrows:</strong><img src="Images/sharrow_small.png" /> <br />Shared-use arrows. A stencil placed in the roadway resembling a bicycle and an arrow, used to alert motorists to expect bicycle travel and to indicate the preferred lane positioning for bicyclists.</span>
      </a>
      </li>
    </ul>
  </li>
  <li>
   <input type="checkbox" id="bikeblvd"><label for="bikeblvd">Bike Blvd</label>
       <a href="#" class="help">
        <img src="Images/help.png" />
            <span><strong>Bike Blvd:</strong><img src="Images/bikeblvd_small.jpg" /> <br />Also referred to as bicycle-friendly streets or neighborhood greenways, these are traffic-calmed streets intended as through routes for bicycles, with through travel for vehicles discouraged. Diverters, roundabouts, bikes-only signals, and other treatments often appear. .</span>
      </a>

    <ul>
      <li>
       <input type="checkbox" id="sharrows_2">
       <label for="sharrows_2">Sharrows</label>
       <a href="#" class="help">
        <img src="Images/help.png" />
            <span><strong>Sharrows:</strong><img src="Images/sharrow_small.png" /> <br />Shared-use arrows. A stencil placed in the roadway resembling a bicycle and an arrow, used to alert motorists to expect bicycle travel and to indicate the preferred lane positioning for bicyclists.</span>
      </a>
      </li>
    </ul>
  </li>
    <li>
        <input type="checkbox" id="none"><label for="none">None</label>

    </li>
</ul>
<!--[if lte IE 7]>
<script>
var tree = document.getElementsByTagName('ul')[0];
tree.attachEvent('onclick', function() {
    var src = event.srcElement;

    if(src.nodeName.toLowerCase() === 'label')
    	var box = document.getElementById(src.htmlFor);
    else if(src.nodeName.toLowerCase() === 'input')
    	var box = src;
    else return;

    for(var current = src.nextSibling;
    	current && current.nodeName.toLowerCase() !== 'ul';
    	current = current.nextSibling);

    if(current)
    	current.style.display = box.checked ? 'block' : 'none';
});
</script>
<![endif]-->



                       
                    </div>                
                </div>    

                                     <br /><hr class="smallDivider" /><br />      
                <div class="centerDivThree centerElement">  
                       <div> <b>Other Built Environment Variables:</b><br /><br />
                        Information about the built environment where the count occurred helps to explain the count volumes.  If it is readily available, please fill it in.  This information is not required.                  </div>
                    <div class="questionThree">
                        <br /><br />
                        Please upload a current picture of this location:<br /><br />
	                    What is the functional classification of this road? <br /><br />
                        What is the posted speed limit (in mph)? <br /><br /><br />
                        What is the direction of vehicular travel on this street? <br />
                        <span class="grayed_out">(Select as many as applicable)</span>
                    </div>
                    <div class="formThree"><br /><br />
                         <asp:Button CssClass="other_button" ID="btnUpload" runat="server" Text="Upload" /> <br /> 
                        <select id="RoadClass">
			                <option value="interstate">Interstate</option>
			                <option value="principalArterial">Principal Arterial</option>
			                <option value="majorArterial">Major Arterial</option>
			                <option value="majorCollector">Major Collector</option>
			                <option value="minorCollector">Minor Collector</option>
			                <option value="local">Local</option>
			                <option value="trail">Trail</option>
			                <option value="generalActivity">General Activity</option>
		                </select> <br />

                        <asp:TextBox CssClass="textbox" id="SpeedLimit" runat="server" Text="25" ForeColor="Gray"
                            onblur="WaterMark(this, '25', event);" onfocus="WaterMark(this, '25', event);">
                        </asp:TextBox> <br /><br />

                        <select name="Direction" multiple="multiple" size="4">
				            <option value="north">N</option>
				            <option value="south">S</option>
				            <option value="east">E</option>
				            <option value="west">W</option>
				            <option value="northwest">NW</option>
				            <option value="northeast">NE</option>
				            <option value="southwest">SW</option>
				            <option value="southeast">SE</option>
			            </select>
                    </div>
                </div>
                            
                <br /><hr class="smallDivider" /><br />         
                            
                <div class="centerDivThree centerElement"> 
                    <div class="questionThree">
                        What is the land use along this road? <br />
                        <span class="grayed_out">(Select the best fit)</span> <br /><br />
                        Please select if any of the listed land use types apply to this location (hold down CTRL to select multiple)
                    </div>
                    <div class="formThree">
                        <select id="LandUse">
				            <option value="residential">Residential</option>
				            <option value="residentialCommercial">Residential/Commercial</option>
				            <option value="neighborhoodRetail">Neighborhood Retail</option>
				            <option value="cbd">CBD</option>
				            <option value="industrial">Industrial</option>
				            <option value="rural">Rural</option>
			            </select> <br />

                        <select id="LandUseType" multiple="multiple" size="4">
				            <option value="employmentCenter">Employment Center</option>
				            <option value="transitStation">Transit Station</option>
				            <option value="transitStop">Transit Stop</option>
				            <option value="school">School</option>
				            <option value="seniorCenter">Senior Center</option>
				            <option value="amusementPark">Amusement Park</option>
				            <option value="publicPark">Public Park</option>
				            <option value="civicCenter">Civic Center</option>
				            <option value="university">University</option>
				            <option value="hospitalMedicalCenter">Hospital/Medical Center</option>
			            </select>
                    </div>                           
                </div>
                        

                <ajaxToolkit:ModalPopupExtender ID="mpe" runat="server" TargetControlID="btnUpload" PopupControlID="panelUpload" 
                        CancelControlID="btnCancelUpload" OkControlID="btnSubmitUpload" EnableViewState="true" BackgroundCssClass="modalBackground" /> 

                <asp:Panel ID="panelUpload" runat="server" Width="400px" Height="300px" CssClass="modalPopup">
                    <h3>Upload an Image</h3>

            		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>

            		<asp:Button CssClass="other_button" ID="btnCancelUpload" runat="server" Text="Cancel" />
                    <asp:Button CssClass="other_button" ID="btnSubmitUpload" runat="server" Text="Submit" />
                </asp:Panel>

               



                                </td>
                                <td></td>
                            </tr>
                        </table>
                    </div>
                </asp:WizardStep>
                <asp:WizardStep ID="WizardStep3" runat="server" Title="Step 3">
                    <div style="height: 600px">
                        <table cellpadding="2" cellspacing="2" width="500px">
                            <tr>
                                <td>
                                    
<h3>When/What was Counted?</h3>	

                <br />

	            <div class="centerText">
	                If you counted at this location for multiple time periods, you will fill out this form once for each period (e.g. 7AM - 9AM).
	                Please use this form for one continuous period of time.
	            </div>
	    
	            <br /><br />
	    
                <div class="centerDivFourOne centerElement">
	                <div class="questionFour">
                       
                        When was this count conducted? <br /><br />
                        What time did the count begin? <br /><br />
                        What time did the count end?
                    </div>
                    <div class="formFour">
                       <%-- <asp:TextBox class="textbox" id="CountOccID" runat="server" /> <br />--%>
                        
                        <span>
	                        <select id="Count_Date_Month">
			                    <option value="01">01</option>
			                    <option value="02">02</option>
			                    <option value="03">03</option>
			                    <option value="04">04</option>
			                    <option value="05">05</option>
			                    <option value="06">06</option>
			                    <option value="07">07</option>
			                    <option value="08">08</option>
			                    <option value="09">09</option>
			                    <option value="10">10</option>
			                    <option value="11">11</option>
			                    <option value="12">12</option>
		                    </select>
		                    <select id="Count_Date_Day">
			                    <option value="01">01</option>
			                    <option value="02">02</option>
			                    <option value="03">03</option>
			                    <option value="04">04</option>
			                    <option value="05">05</option>
			                    <option value="06">06</option>
			                    <option value="07">07</option>
			                    <option value="08">08</option>
			                    <option value="09">09</option>
			                    <option value="10">10</option>
			                    <option value="11">11</option>
			                    <option value="12">12</option>
			                    <option value="13">13</option>
			                    <option value="14">14</option>
			                    <option value="15">15</option>
			                    <option value="16">16</option>
			                    <option value="17">17</option>
			                    <option value="18">18</option>
			                    <option value="19">19</option>
			                    <option value="20">20</option>
			                    <option value="21">21</option>
			                    <option value="22">22</option>
			                    <option value="23">23</option>
			                    <option value="24">24</option>
			                    <option value="25">25</option>
			                    <option value="26">26</option>
			                    <option value="27">27</option>
			                    <option value="28">28</option>
			                    <option value="29">29</option>
			                    <option value="30">30</option>
			                    <option value="31">31</option>
		                    </select>
		                    <asp:TextBox id="Count_Date_Year" runat="server" width="46" Text="2013" ForeColor="#8888888"
		                            onblur="WaterMark(this, 2013, event);" onfocus="WaterMark(this, 2013, event);">
		                    </asp:TextBox>
                        </span>
                                
                        <br />

                        <span>
                            <select id="Count_Begin_Hour">
			                    <option value="01">01</option>
			                    <option value="02">02</option>
			                    <option value="02">03</option>
			                    <option value="01">04</option>
			                    <option value="02">05</option>
			                    <option value="01">06</option>
			                    <option value="02">07</option>
			                    <option value="01">08</option>
			                    <option value="02">09</option>
			                    <option value="01">10</option>
			                    <option value="02">11</option>
			                    <option value="01">12</option>
		                    </select>
		                    <select id="Count_Begin_Minute">
			                    <option value="00">00</option>
			                    <option value="05">05</option>
			                    <option value="10">10</option>
			                    <option value="15">15</option>
			                    <option value="20">20</option>
			                    <option value="25">25</option>
			                    <option value="30">30</option>
			                    <option value="35">35</option>
			                    <option value="40">40</option>
			                    <option value="45">45</option>
			                    <option value="50">50</option>
			                    <option value="55">55</option>
		                    </select>
		                    <select id="Count_Begin_AMPM">
			                    <option value="AM">AM</option>
			                    <option value="PM">PM</option>
			                </select>
			            </span>	        

                        <br />

                        <span>
	                        <select id="Count_End_Hour">
			                    <option value="01">01</option>
			                    <option value="02">02</option>
			                    <option value="02">03</option>
			                    <option value="01">04</option>
			                    <option value="02">05</option>
			                    <option value="01">06</option>
			                    <option value="02">07</option>
			                    <option value="01">08</option>
			                    <option value="02">09</option>
			                    <option value="01">10</option>
			                    <option value="02">11</option>
			                    <option value="01">12</option>
		                    </select>
		                    <select id="Count_End_Minute">
			                    <option value="00">00</option>
			                    <option value="05">05</option>
			                    <option value="10">10</option>
			                    <option value="15">15</option>
			                    <option value="20">20</option>
			                    <option value="25">25</option>
			                    <option value="30">30</option>
			                    <option value="35">35</option>
			                    <option value="40">40</option>
			                    <option value="45">45</option>
			                    <option value="50">50</option>
			                    <option value="55">55</option>
		                    </select>
		                    <select id="Count_End_AMPM">
			                    <option value="AM">AM</option>
			                    <option value="PM">PM</option>
			                </select>
			            </span>	    		                    
                    </div>
                </div>                  

                <br /><hr class="smallDivider" /><br /> 

                <div class="centerDivFourOne centerElement">

                    <div class="questionFour">
                        <br />
                        What was counted here? <br /><br />
                         <br /><br />
                    </div>

                    <div class="formFour">
                        <input type="radio" id="Count_What1" name="Count_What1" value="bikes">Bikes<br/>
                        <input type="radio" id="Count_What1" name="Count_What1" value="peds">Peds<br />
                        <input type="radio" id="Count_What1" name="Count_What1" value="both">Both<br /><br />
     <%--                   <select id="Count_What1" multiple="multiple" size="3">
				            <option value="bikes">Bikes</option>
				            <option value="peds">Peds</option>
				            <option value="both">Both</option>
				        </select>--%>
                    </div><br />
                    <div class="questionFour">
                        
                        Were bicyclists riding on the sidewalk counted? <br />
  
                    </div>
                    <div class="formFour">
                        <select id="Count_Bike_Sidewalk">
			                <option value="no">No</option>
			                <option value="yes">Yes</option>
		                </select> <br />
                    </div>
                    <div class="questionFour">
                        How was the count conducted? <br /><br />
                        
                        <div class="automated">
                            If an automated counter was used, please indicate the <br />
                                type of counter technology used. Otherwise, select 'None'.
                        </div>                    
                    </div>
                    <div class="formFour">
                        <select id="Count_How" onchange="showAutomated(this.options[this.selectedIndex].value);">
				            <option value="manual_in_house">Manual - In House</option>
				            <option value="manual_consultant">Manual - Consultant</option>
				            <option value="automated">Automated</option>
		                </select> <br />

                        <div class="automated">
                            <select name="Count_Technology">
				                <option value="pneumatic_tube">Pneumatic Tube</option>
					            <option value="piezoelectric_strip">Piezoelectric Strip</option>
					            <option value="pressure_acoustic_pads">Pressure or Acoustic Pads</option>
					            <option value="loop_detector">Loop Detector</option>
					            <option value="active_infrared">Active Infrared</option>
					            <option value="passive_infrared">Passive Infrared</option>
					            <option value="laser_scanning">Laser Scanning</option>
					            <option value="radio">Radio</option>
					            <option value="video_manual_analysis">Video - manual analysis</option>
					            <option value="video_automated_analysis">Video - automated analysis</option>
				            </select>
                        </div>
                    </div>
                </div>

                <br /><hr class="smallDivider" /><br /> 

                <div class="centerDivFourOne centerElement">
                    <div class="questionFour">
                        Was it raining at this time? <br /><br />
                        Is there any other reason why this period may be unusual? 
                            If so, please explain. 
                    </div>
                    <div class="formFour">
                        <select id="Raining">
			                <option value="no">No</option>
			                <option value="yes">Yes</option>
		                </select> <br />

                        <asp:TextBox id="Unusual" 
	                        TextMode="MultiLine" Rows="5" Columns="25" 
	                        Font-Names="Arial" Font-Size="Small" runat="server" /> 
                    </div>
		        </div>
                		            
              <%--  <br /><hr /><br />
	            
	            

                <div class="centerDivFourTwo centerElement">
                    

                    <div>                            
                        <asp:table id="locTable2" runat="server" CellPadding="3" CellSpacing="3" Gridlines="both" HorizontalAlign="Center">
                            <asp:TableHeaderRow ID="TableHeaderRow3" runat="server">
                                <asp:TableHeaderCell ID="TableHeaderCell3" runat="server">Locations</asp:TableHeaderCell>
                            </asp:TableHeaderRow>
                        </asp:table>                                            
                    </div>
                </div>--%>
                                </td>
                               
                            </tr>
                        </table>
                    </div>
                </asp:WizardStep>
                <asp:WizardStep ID="WizardStep4" runat="server" Title="Step 4">
                    <div style="height: 600px">
                        <table cellpadding="2" cellspacing="2" width="500px">
                            <tr>
                                <td>
                                     <h3>Count Interval Volumes</h3>	 
                                    
                                  


	   
	           <%-- <div class="centerElement" id="intervalLocation">                        
	                    <asp:Label id="intervalNumber" runat="server" Text="1"></asp:Label> of 4 intervals <br /> 
	                    <asp:Label id="locationNumber" runat="server" Text="1"></asp:Label> of 4 locations
	            </div>	  --%>                 
	    
	            <div class="centerDivFive centerElement">
                    <%--<div class="questionFiveOne">
                        ID:
                    </div>
                    <div class="formFiveOne">
                        <asp:TextBox CssClass="textbox" id="CountVolumeID" runat="server"></asp:TextBox>
                    </div>--%>

                    <div class="clear"></div>

                    <div class="questionFiveOne">
                        Date: 
                       <%-- Interval:--%>
                    </div>
                    <div class="formFiveOne">                        
                        <asp:TextBox CssClass="textbox" id="Count_Date" runat="server"></asp:TextBox> <br />
                        <%--<asp:TextBox CssClass="textbox" id="nterval" runat="server"></asp:TextBox>--%>
                    </div>
                    <div class="questionFiveTwo">
                        Location: <br /><br />
                        Period:
                    </div>
                    <div class="formFiveTwo">        
                        <asp:TextBox CssClass="textbox" id="Location" runat="server"></asp:TextBox> <br />
                        <asp:TextBox CssClass="textbox" id="Period" runat="server"></asp:TextBox>
                    </div>
                </div>

                <br /><hr class="smallDivider" /><br />
                                     <div>Please enter the count volume for the location and period indicated above.  Use a new line for each interval.<br /><br /></div>
                                    Bike Counts
                 <iframe src ="index2.html" width="100%" scrolling="no" ></iframe>

                <div class="centerDivFive centerElement">
                   <%-- <div class="questionFiveOne">
                        Bike Volumes Left to Right: <br /><br />
                        Female: <br /><br />
                        Wrong-Way Riding: <br /><br />
                        Child Bike:
                    </div>
                    <div class="formFiveOne">
                        <asp:TextBox CssClass="textbox" id="Bike_LR" runat="server"></asp:TextBox> <br />
                        <asp:TextBox CssClass="textbox" id="Bike_Female" runat="server"></asp:TextBox> <br />
                        <asp:TextBox CssClass="textbox" id="Bike_WrongWay" runat="server"></asp:TextBox> <br />
                        <asp:TextBox CssClass="textbox" id="Bike_Child" runat="server"></asp:TextBox>
                    </div>
                    <div>
                    <div class="questionFiveTwo">
                            Bike Volumes Right to Left: <br /><br />
                            Sidewalk: <br /><br />
                            No Helmet: <br /><br />
                    </div>                        
                    <div class="formFiveTwo">
                        <asp:TextBox CssClass="textbox" id="Bike_RL" runat="server"></asp:TextBox> <br />
                        <asp:TextBox CssClass="textbox" id="Bike_Sidewalk" runat="server"></asp:TextBox> <br />
                        <asp:TextBox CssClass="textbox" id="Bike_NoHelm" runat="server"></asp:TextBox> <br />
                    </div>
                    </div>--%>
                    <div class="questionFiveTwo">
                            <asp:TextBox id="OtherVarName" runat="server" width="150" Text="Add your own category" 
                                ForeColor="#8888888" onblur="WaterMark(this, 'Add your own category', event);" 
	        	                onfocus="WaterMark(this, 'Add your own category', event);"></asp:TextBox> <br /><br />
                            <asp:TextBox id="OtherVarName2" runat="server" width="150" Text="Add your own category" 
                                ForeColor="#8888888" onblur="WaterMark(this, 'Add your own category', event);" 
	        	                onfocus="WaterMark(this, 'Add your own category', event);"></asp:TextBox>
                    </div>	
                    <div class="formFiveTwo">
                        <asp:TextBox CssClass="otherVarOne" id="OtherVarCount" runat="server"></asp:TextBox> <br />
                        <asp:TextBox CssClass="otherVarTwo" id="OtherVarCount2" runat="server"></asp:TextBox>
                    </div>
                </div>

                <br /><hr class="smallDivider" /><br />

                                    <div id="pedcount_toggle">Pedestrian Counts</div>
                <div id="pedcount"><iframe src ="PedCount.html" width="100%" scrolling="no" ></iframe></div>
               <%-- <div class="centerDivFive centerElement">
                    <div class="questionFiveOne">
                        Pedestrian Volumes Left to Right: <br /><br />
                        Wheelchair: 
                    </div>
                    <div class="formFiveOne">
                        <asp:TextBox CssClass="textbox" id="Ped_LR" runat="server"></asp:TextBox> <br />
                        <asp:TextBox CssClass="textbox" id="Ped_Wheelchair" runat="server"></asp:TextBox>
                    </div>
                    <div class="questionFiveTwo">
                        Pedestrian Volumes Right to Left: <br /><br />
                        Child:
                    </div>
                    <div class="formFiveTwo">
                        <asp:TextBox CssClass="textbox" id="Ped_RL" runat="server"></asp:TextBox> <br />
                        <asp:TextBox CssClass="textbox" id="Ped_Child" runat="server"></asp:TextBox>
                    </div>

                </div>--%>
       
	        	        
<%--	            <div id="left_side">
                    <asp:Button CssClass="myButton" runat="server" id="next_interval" Text="Next Interval" OnClick="Next_Interval_Click"></asp:Button>
                </div>
                <div id="right_side">
          	        <asp:Button CssClass="myButton" runat="server" id="next_location" Text="Next Location" OnClick="Next_Location_Click"></asp:Button>
		        </div>	--%>        
<div id="left_side">
    <asp:Button CssClass="myButton" runat="server" id="next_period" Text="Next Period" OnClick="Next_Period_Click"></asp:Button> 
    <asp:Button CssClass="myButton" runat="server" id="next_location" Text="Next Location" OnClick="Next_Location_Click"></asp:Button>
</div>

	            <div style="clear: both;"></div>	    

                                </td>

                            </tr>
                        </table>
                    </div>
                </asp:WizardStep>
            </WizardSteps>
            <SideBarButtonStyle BackColor="#507CD1" Font-Names="Verdana"
                ForeColor="White" />
            <%--<NavigationButtonStyle BackColor="Orange" BorderColor="#507CD1"
                BorderStyle="Solid" BorderWidth="2px" Font-Names="Verdana" Font-Size="2em"
                ForeColor="white" />--%>
            <NavigationButtonStyle CssClass="myButton" />
            <SideBarStyle BackColor="White" Font-Size="1.4em" VerticalAlign="Top" Width="80px" CssClass="wizardSideBar" />
            <HeaderStyle BackColor="#284E98" BorderColor="#EFF3FB" BorderStyle="Solid"
                BorderWidth="2px" Font-Bold="True" Font-Size="0.9em" ForeColor="White"
                HorizontalAlign="Center" />
            <SideBarTemplate>
                <asp:DataList ID="SideBarList" runat="server">
                    <ItemTemplate>
                        <asp:LinkButton ID="SideBarButton" runat="server" Enabled="false" />
                    </ItemTemplate>
                    <SelectedItemTemplate>
                        <asp:LinkButton ID="SideBarButton" runat="server" Enabled="false" CssClass="currentStep" />
                    </SelectedItemTemplate>
                </asp:DataList>
            </SideBarTemplate>

        </asp:Wizard>
    </div>
    <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
    
</asp:Content>


