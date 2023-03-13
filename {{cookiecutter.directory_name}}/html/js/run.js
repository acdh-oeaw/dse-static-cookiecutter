var editor = new LoadEditor({
    aot: {
      title: "Text Annotations",
      variants: [
        {
          opt: "ef",
          opt_slider: "entities-features-slider",
          title: "All",
          color: "red",
          html_class: "undefined",
          css_class: "undefined",
          chg_citation: "citation-url",
          hide: {
            hidden: false,
            class: "undefined",
          },
          features: {
            all: true,
            class: "features-1",
          },
        },
        {
          opt: "prs",
          color: "blue",
          title: "Persons",
          html_class: "persons",
          css_class: "pers",
          hide: {
            hidden: false,
            class: "persons .entity",
          },
          chg_citation: "citation-url",
          features: {
            all: false,
            class: "features-1",
          },
        },
        {
          opt: "plc",
          color: "green",
          title: "Places",
          html_class: "places",
          css_class: "plc",
          hide: {
            hidden: false,
            class: "places .entity",
          },
          chg_citation: "citation-url",
          features: {
            all: false,
            class: "features-1",
          },
        },
        {
          opt: "org",
          color: "yellow",
          title: "Organizations",
          html_class: "orgs",
          css_class: "org",
          hide: {
            hidden: false,
            class: "orgs .entity",
          },
          chg_citation: "citation-url",
          features: {
            all: false,
            class: "features-1",
          },
        },
        {
          opt: "wrk",
          color: "lila",
          title: "Works",
          html_class: "works",
          css_class: "wrk",
          chg_citation: "citation-url",
          hide: {
            hidden: false,
            class: "wrk .entity",
          },
          features: {
            all: false,
            class: "features-1",
          },
        }
      ],
      span_element: {
        css_class: "badge-item",
      },
      active_class: "activated",
      rendered_element: {
        label_class: "switch",
        slider_class: "i-slider round",
      },
    },
    ff: {
      name: "Change font family",
      variants: [
        {
          opt: "ff",
          title: "Font Family",
          urlparam: "ff",
          chg_citation: "citation-url",
          fonts: {
            default: "default",
            font1: "Times-New-Roman",
            font2: "Courier-New",
            font3: "Arial-serif",
          },
          paragraph: ".yes-index",
          p_class: "",
          css_class: "",
        },
      ],
      active_class: "active",
      html_class: "form-select",
    },
    fs: {
      name: "Create full size mode",
      variants: [
        {
          opt: "fls",
          title: "Full screen on/off",
          urlparam: "fullscreen",
          chg_citation: "citation-url",
          hide: "hide-reading",
          to_hide: "fade",
        },
      ],
      active_class: "active",
      render_class: "nav-link btn btn-round",
      render_svg:
        "<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-fullscreen' viewBox='0 0 16 16'><path d='M1.5 1a.5.5 0 0 0-.5.5v4a.5.5 0 0 1-1 0v-4A1.5 1.5 0 0 1 1.5 0h4a.5.5 0 0 1 0 1h-4zM10 .5a.5.5 0 0 1 .5-.5h4A1.5 1.5 0 0 1 16 1.5v4a.5.5 0 0 1-1 0v-4a.5.5 0 0 0-.5-.5h-4a.5.5 0 0 1-.5-.5zM.5 10a.5.5 0 0 1 .5.5v4a.5.5 0 0 0 .5.5h4a.5.5 0 0 1 0 1h-4A1.5 1.5 0 0 1 0 14.5v-4a.5.5 0 0 1 .5-.5zm15 0a.5.5 0 0 1 .5.5v4a1.5 1.5 0 0 1-1.5 1.5h-4a.5.5 0 0 1 0-1h4a.5.5 0 0 0 .5-.5v-4a.5.5 0 0 1 .5-.5z'/></svg>",
    },
    fos: {
      name: "Change font size",
      variants: [
        {
          opt: "fs",
          title: "Font Size",
          urlparam: "fs",
          chg_citation: "citation-url",
          sizes: {
            default: "default",
            font_size_14: "14",
            font_size_18: "18",
            font_size_22: "22",
            font_size_26: "26",
          },
          paragraph: ".yes-index",
          p_class: "",
          css_class: "font-size-",
        },
      ],
      active_class: "active",
      html_class: "form-select",
    },
    is: {
      name: "Facsimiles On/Off",
      variants: [
        {
          opt: "es",
          title: "Facsimiles On/Off",
          urlparam: "img",
          chg_citation: "citation-url",
          fade: "fade",
          column_small: {
            class: "col-md-6",
            percent: "50",
          },
          column_full: {
            class: "col-md-12",
            percent: "100",
          },
          hide: {
            hidden: true,
            class_to_hide: "facsimiles",
            class_to_show: "text",
            class_parent: "transcript",
            resize: "resize-hide",
          },
          image_size: "400px",
        },
      ],
      active_class: "active",
      rendered_element: {
        a_class: "nav-link btn btn-round",
        svg: "<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-image' viewBox='0 0 16 16'><path d='M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z'/><path d='M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-12zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1h12z'/></svg>",
      },
    },
    wr: false,
    up: true,
  });
  