var lastScrollTop = 0;
var width = screen.width;

document.addEventListener("scroll", minNav);

function minNav() {
    var a = document.getElementsByClassName("custom-logo-link")[0];
    var img = document.getElementsByClassName("img-fluid")[0];
    var scroll = document.documentElement.scrollTop;
    if ((scroll - 20) > lastScrollTop && width > 768) {
        img.style.width = "50px";
        a.style.margin = "0";        
    } else {
        img.style.width = "100px";
        a.style.margin = "0 0 -2em 0";  
    }
}