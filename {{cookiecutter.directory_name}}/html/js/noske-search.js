import { NoskeSearch } from "../vendor/acdh-noske-search/index.js";
const search = new NoskeSearch({
  container: "noske-search",
  autocomplete: false,
  wordlistattr: ["word", "landingPageURI"],
});

search.minQueryLength = 2;
search.search({
  debug: false,
  client: {
    base: "https://corpus-search.acdh.oeaw.ac.at/",
    corpname: "{{ cookiecutter.directory_name }}", // make sure the corpus name is correct
    attrs: "word,lemma,pos,landingPageURI",
    structs: "sen",
    refs: "doc.id,doc.title",
  },
  hits: {
    id: "hitsbox",
    css: {
      div: "grid grid-cols-5 gap-4",
    },
  },
  pagination: {
    id: "noske-pagination",
  },
  searchInput: {
    id: "noske-input",
    placeholder: "Suche nach Wörter, Phrase oder CQL-Query (Regex erlaubt)",
    button: "Suchen",
    css: {
      div: "d-flex align-items-center gap-2 pt-3 container",
      input: "form-control flex-grow-1",
      select: "form-select w-auto",
      button: "btn btn btn-primary w-auto",
    },
  },
  config: {
    tableView: true,
    customUrlTransform: function (lines) {
      let kwic_attr = lines.kwic_attr?.split("/");
      let backlink = kwic_attr[kwic_attr.length - 1];
      return backlink;
    },
  },
  stats: {
    id: "noske-stats",
  },
});
