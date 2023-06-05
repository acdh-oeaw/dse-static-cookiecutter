const lngs = {
  en: { nativeName: 'English' },
  de: { nativeName: 'Deutsch' },
  it: { nativeName: 'Italiano' }
};

const rerender = () => {
  $('body').localize();
}

$(function () {
  // use plugins and options as needed, for options, detail see
  // https://www.i18next.com
  i18next
    .use(i18nextHttpBackend)
    .use(i18nextBrowserLanguageDetector)
    // init i18next
    // for all options read: https://www.i18next.com/overview/configuration-options
    .init({
      debug: true,
      fallbackLng: 'en'
    }, (err, t) => {
      if (err) return console.error(err);
      jqueryI18next.init(i18next, $, { useOptionsAttr: true });
      Object.keys(lngs).map((lng) => {
        const opt = new Option(lngs[lng].nativeName, lng);
        if (lng === i18next.resolvedLanguage) {
          opt.setAttribute("selected", "selected");
        }
        $('#languageSwitcher').append(opt);
      });
      $('#languageSwitcher').change((a, b, c) => {
        const chosenLng = $(this).find("option:selected").attr('value');
        i18next.changeLanguage(chosenLng, () => {
          rerender();
        });
      });

      rerender();
    });
});