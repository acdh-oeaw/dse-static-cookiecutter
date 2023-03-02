var tsInput = document.querySelector("input[type='search']");
tsInput.addEventListener("input", updateHeaderUrl);

function listenToPagination() {
  setTimeout(() => {
    var tsPagination = document.querySelectorAll(".ais-Pagination-link");
    [].forEach.call(tsPagination, function (opt) {
      opt.removeEventListener("click", updateHeaderUrl);
      opt.addEventListener("click", updateHeaderUrl);
    });
  }, 100);
}
setTimeout(() => {
  listenToPagination();
}, 100);

function updateHeaderUrl() {
  setTimeout(() => {

    var urlToUpdate = document.querySelectorAll(".ais-Hits-item h5 a");
    var tsInputVal = tsInput.value;

    urlToUpdate.forEach((el) => {
      var urlToUpdateHref = el.getAttribute("href");
      if (urlToUpdateHref.includes("&mark=")) {
        var newUrl = urlToUpdateHref.replace(
          /&mark=\.+$/,
          `&mark=${tsInputVal}`
        );
        el.setAttribute("href", newUrl);
      } else {
        var newUrl = `${urlToUpdateHref}&mark=${tsInputVal}`;
        el.setAttribute("href", newUrl);
      }
    });

    // listenToCheckbox();
    listenToPagination();
  }, 500);
}
