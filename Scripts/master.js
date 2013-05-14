function getViewportHeight() {
    var viewPortHeight;

    // the more standards compliant browsers (mozilla/netscape/opera/IE7) use window.innerWidth and window.innerHeight
    if (typeof window.innerWidth != "undefined") {
        viewPortHeight = window.innerHeight;
    }

        // IE6 in standards compliant mode (i.e. with a valid doctype as the first line in the document)
    else if (typeof document.documentElement != "undefined"
    && typeof document.documentElement.clientWidth !=
    "undefined" && document.documentElement.clientWidth != 0) {
        viewPortHeight = document.documentElement.clientHeight;
    }

        // older versions of IE
    else {
        viewPortHeight = document.getElementsByTagName("body")[0].clientHeight;
    }

    return viewPortHeight;
}

function setMainHeight() {
    var loginDisplay = document.getElementById("loginDisplay").offsetHeight;;
    var header = document.getElementById("header").offsetHeight;
    var main = document.getElementById("main");
    main.style.minHeight = (getViewportHeight() - 66) + "px";
}