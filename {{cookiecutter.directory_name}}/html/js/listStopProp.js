var nav = document.querySelectorAll('#aot-navBarNavDropdown .dropdown-menu .nav-item');
[].forEach.call(nav, (opt) => {
    opt.addEventListener("click", (e) => {
        e.stopPropagation();
    });
});