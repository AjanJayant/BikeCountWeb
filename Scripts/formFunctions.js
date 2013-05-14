function WaterMark(text, defaultText, event) {
    if (text.value.length == 0 && event.type == "blur") {
        text.style.color = "gray";
        text.value = defaultText;
    }
    if (text.value == defaultText && event.type == "focus") {
        text.style.color = "black";
        text.value = "";
    }
}

function showAutomated(choice) {
    var automatedObjects = document.getElementsByClassName("automated");
    var automatedObjectsSize = automatedObjects.length;
    for (var i = 0; i < automatedObjectsSize; i++) {
        if (choice == 'automated')
            automatedObjects[i].style.display = 'block';
        else
            automatedObjects[i].style.display = 'none';
    }
}

function getViewportWidth() {
    var viewPortWidth;

    // the more standards compliant browsers (mozilla/netscape/opera/IE7) use window.innerWidth and window.innerHeight
    if (typeof window.innerWidth != "undefined") {
        viewPortWidth = window.innerWidth;
    }

    // IE6 in standards compliant mode (i.e. with a valid doctype as the first line in the document)
    else if (typeof document.documentElement != "undefined"
    && typeof document.documentElement.clientWidth !=
    "undefined" && document.documentElement.clientWidth != 0) {
        viewPortWidth = document.documentElement.clientWidth;
    }

    // older versions of IE
    else {
        viewPortWidth = document.getElementsByTagName("body")[0].clientWidth;
    }
    return viewPortWidth;
}

function getViewportHeight() {
    var viewPortHeight;

    // the more standards compliant browsers (mozilla/netscape/opera/IE7) use window.innerWidth and window.innerHeight
    if (typeof window.innerHeight != "undefined") {
        viewPortHeight = window.innerHeight;
    }

    // IE6 in standards compliant mode (i.e. with a valid doctype as the first line in the document)
    else if (typeof document.documentElement != "undefined"
    && typeof document.documentElement.clientHeight !=
    "undefined" && document.documentElement.clientHeight != 0) {
        viewPortHeight = document.documentElement.clientHeight;
    }

    // older versions of IE
    else {
        viewPortHeight = document.getElementsByTagName("body")[0].clientHeight;
    }
    return viewPortHeight;
}

function setHeight()
{
    var mainHeight = document.getElementById('main');
    var viewPortHeight = getViewportHeight();
    mainHeight.style.height = viewPortHeight - 71 + "px";
}

function showWhat(choice) {
    var intersection = document.getElementById('intersection');
    var midblock = document.getElementById('midblock');
    if (choice == 'intersection') {
        intersection.style.display = 'block';
        midblock.style.display = 'none';
    }
    else if (choice == 'midblock') {
        midblock.style.display = 'block';
        intersection.style.display = 'none';
    }
}

/*
--this is sample code to add stuff to an existing table only using javascript.

function displayResult() {
var table = document.getElementById("myTable");
var row = table.insertRow(0);
var cell1 = row.insertCell(0);
var cell2 = row.insertCell(1);
cell1.innerHTML = "New";
cell2.innerHTML = "New";
}
*/