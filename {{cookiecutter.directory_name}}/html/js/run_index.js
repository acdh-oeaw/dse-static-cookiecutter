var editor = new LoadEditor({
    lang: {
      title: "Multi Language Support",
      variants: [
        {
          opt: "de",
          title: "German",
          class: "multi-lang nav-link pointer",
          map: {
            "index-en.html": "index.html",
            "index.html": "index.html",
          },
        },
        {
          opt: "en",
          title: "English",
          class: "multi-lang nav-link pointer",
          map: {
            "index.html": "index-en.html",
            "index-en.html": "index-en.html",
          },
        },
      ],
      active_class: "lang_active",
    },
    wr: false,
    up: true,
  });
  