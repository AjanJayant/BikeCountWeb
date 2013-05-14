<%@ Page Title="Map" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeFile="Map.aspx.cs" Inherits="Map" %>

<asp:Content ID="headContent" ContentPlaceHolderID="headContent" runat="server">
    <link href="Styles/Style.css" rel="stylesheet" type="text/css" />
    <link href="Styles/GoogleMapModify.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="DefaultContent" ContentPlaceHolderID="mainContent" runat="server">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    
    <!--Move to external CSS stylesheet when finalized-->
    <style type="text/css">
        html {
            height: 100%;
        }

        body {
            height: 100%;
            margin: 0;
            padding: 0;
            overflow-y: hidden;
        }

        #map-canvas {
            height: 100%;
            overflow-y: hidden;
        }

        #leftpanel {
            float: left;
            left: 0px;
            width: 300px;
            height: 100%;
            border-right: 2px solid black;
            padding: 10px 10px 0px 10px;
            margin-bottom: 0px;
            overflow: auto;
        }

        #bottompanel {
            position: relative;
            top: 0px;
            height: 300px;
            overflow: auto;
        }
    </style>
    <script type="text/javascript" src="Scripts/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>

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
            var map = new google.maps.Map(document.getElementById("map-canvas"),
                mapOptions);



            //Streetview
            var fenway = new google.maps.LatLng(0, 0);
            var panoramaOptions = {
                position: fenway,
                pov: {
                    heading: 34,
                    pitch: 10
                },
                addressControlOptions: {
                    position: google.maps.ControlPosition.BOTTOM
                },
                linksControl: false,
                panControl: false,
                zoomControlOptions: {
                    style: google.maps.ZoomControlStyle.SMALL
                },
                enableCloseButton: false,
                visible: true
            };

            var panorama = new google.maps.StreetViewPanorama(document.getElementById('streetview'), panoramaOptions);
            map.setStreetView(panorama);

            // Create Toggle for Google Bike Layer
            var controlDiv_bike_google = document.createElement('DIV');
            $(controlDiv_bike_google).addClass('gmap-control-container')
                         .addClass('gmnoprint');

            var controlUI_bike_google = document.createElement('DIV');
            $(controlUI_bike_google).addClass('gmap-control');
            $(controlUI_bike_google).text('Bike Data (Google)');
            $(controlDiv_bike_google).append(controlUI_bike_google);

            //var legend_bike_google = '<img src="Images/bike_google_legend.png" />'; 
            var legend_bike_google = '<ul>'
            + '<li><span style="background-color: #10400c">&nbsp;&nbsp;</span><span style="color: #10400c"> Trails</span></li>'
            + '<li><span style="background-color: #216c2b">&nbsp;&nbsp;</span><span style="color: #216c2b"> Dedicated Lanes</span></li>'
            + '<li><span style="background-color: #455c42">&nbsp;&nbsp;</span><span style="color: #455c42"> Bicycle Friendly Roads</span></li>'
            + '</ul>';

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
                    '<br/><b>Maximum Hourly Time: </b>' +
                    '<br/><br/><a href="details.aspx?locationID=' + locationid + '&location=' + street1 + '">Details</a>';

                google.maps.event.addListener(marker, "click", function () {
                    infowindow.setContent(html);
                    infowindow.open(map, marker);
                    fenway = point;
                    var panoramaOptions = {
                        position: fenway,
                        pov: {
                            heading: 34,
                            pitch: 10
                        },
                        /*addressControlOptions: {
                            position: google.maps.ControlPosition.BOTTOM
                        },*/
                        addressControl: false,
                        linksControl: true,
                        panControl: false,
                        zoomControlOptions: {
                            style: google.maps.ZoomControlStyle.SMALL
                        },
                        enableCloseButton: false,
                        visible: true
                    };
                    panorama = new google.maps.StreetViewPanorama(document.getElementById('streetview'), panoramaOptions);
                    map.setStreetView(panorama);

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
                            map: map,
                            zoom: false
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
                            map: map,
                            zoom: false
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

            /* var bikeLayer = new google.maps.BicyclingLayer();
             bikeLayer.setMap(map);*/



        } //End initialize function
        //google.maps.event.addDomListener(window, 'load', initialize);


        function createStreetMap(strMapCanvasID, yourLatLng) {
            var panorama;

            //once the document is loaded, see if google has a streetview image within 50 meters of the given location, and load that panorama
            var sv = new google.maps.StreetViewService();

            sv.getPanoramaByLocation(yourLatLng, 50, function (data, status) {
                if (status == 'OK') {
                    //google has a streetview image for this location, so attach it to the streetview div
                    var panoramaOptions = {
                        pano: data.location.pano,
                        addressControl: false,
                        navigationControl: true,
                        navigationControlOptions: {
                            style: google.maps.NavigationControlStyle.SMALL
                        }
                    };
                    var panorama = new google.maps.StreetViewPanorama(document.getElementById(strMapCanvasID), panoramaOptions);


                    // lets try and hide the pegman control from the normal map, if we're displaying a seperate streetview map
                    objCreatedMap.setOptions({
                        streetViewControl: false
                    });
                }
                else {
                    //no google streetview image for this location, so hide the streetview div
                    $('#' + strMapCanvasID).parent().hide();
                }
            });
        }
    </script>

    <div id="leftpanel">
        <!--Queenie move to CSS file once finalized-->
        <div id="streetview" style="position: absolute; width: 300px; height: 200px;"></div>
        <div id="bottomPanel" style="position: absolute; width: 300px; height: 200px; top: 301px;">
            Click on the
            <img src="Images/green.png" />
            icon to get information about the location.  You may need to zoom in.  The corresponding Google Streetview for the selected location will be shown above.
            <br />
            <br />
            The following layers can be toggled on and off above the map:<br />
            - LA County Cities<br />
            - LA Metro Bike Layer<br />
            - Google Bike Layer
            <br />
            (only available below a certain zoom level)<br />

        </div>

    </div>
    <div id="map-canvas" />




</asp:Content>

