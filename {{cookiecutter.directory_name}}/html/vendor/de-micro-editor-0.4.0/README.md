# Digital Edition Micro-Editor

## Introduction

The package offers building blocks for manipulating text annotation options of Digital Editions. It comes with binary on/off features to highlight text with css classes.
Furthermore, a built-in OSD image viewer offers better representation of facsimiles. The Micro-Editor comes with some more options like: choosing font family and font size as well as full-screen mode and image switch `(on/off)`.

## Projects currently using the package

- [AMP](https://amp.acdh.oeaw.ac.at)
- [Freud HKA](https://freud.acdh-dev.oeaw.ac.at)
- [HANSLICK](https://hanslick.acdh.oeaw.ac.at)
- [SCHNITZLER BRIEFE](https://schnitzler-briefe.acdh.oeaw.ac.at)

## Installation

```JavaScript
npm install de-micro-editor
```

In JS:

```JavaScript
const { LoadEditor } = require("de-micro-editor");
```

or

```JavaScript
import { LoadEditor } from "de-micro-editor";
```

In HTML:

```HTML
<script src="https://unpkg.com/de-micro-editor@0.4.0/dist/de-editor.min.js"></script>
<link href="https://unpkg.com/de-micro-editor@0.4.0/src/css/style.css" rel="stylesheet" type="text/css"/>
```

## HTML / JS / CSS Example

[Show Example](https://acdh-oeaw.github.io/de-micro-editor/index.html)

## Custom Elements (HTML)

The package renders 7 different custom elements and creates event listeners to trigger defined functions. Each custom element takes an attribute `opt` which connects the element with a specific configurations parameter variant (see configuration description below). The window-resize element also takes an attribute `pos` which specifies a specific window to resize. The edition-pagination element uses attributes like `pos`, `facs` and `data-type` to access window, element ids like images and data-type for further specification. The last two attributes are optional.

```HTML
<annotation-slider opt="break"></annotation-slider>

<font-family opt="select-font"></font-family>

<font-size opt="select-fontsize"></font-size>

<full-size opt="edition-fullsize"></full-size>

<image-switch opt="edition-switch"></image-switch>

<window-resize opt="resizing" pos="1"></window-resize>

<edition-pagination
    opt="edition-pagination"
    pos="1"
    facs="id"
    data-type="envelope">
</edition-pagination>
```

## HTML Classes

### Feature AOT

For each variant (= custom element) the following classes must be added to your HTML site:

- aot.variants[0].html_class:
  default = `html-class-[opt]` where `[opt]` must match the opt attribute of the custom element.
  (Add this class to all html elements to to be highlighted or manipulated.)

- aot.variants[0].chg_citation: default = `citation-url`
  (Add this class to your custom citation link.)

### Feature FOS

- fos.variants[0].paragraph:
  default = `p` (Use this html element for text where the font size should be changed)

- fos.variants[0].p_class:
  default = `yes-index` (Add this class to previous html elements. Only if html element and class are defined the font size will of containing text will be changed)

- fos.variants[0].sizes:
  default = {
  {
  default: "default",
  font_size_14: "14",
  font_size_18: "18",
  font_size_22: "22",
  font_size_26: "26"
  }
  (It is recommended to keep the default key and value. All other keys and values can be adapted to your needs)

### Feature FF

- ff.variants[0].paragraph:
  default = `p` (Use this html element for text where the font size should be changed)

- ff.variants[0].p_class:
  default = `yes-index` (Add this class to previous html elements. Only if html element and class are defined the font size will of containing text will be changed)

- fos.variants[0].fonts:
  default = {
  {
  default: "default",
  font1: "Times-New-Roman",
  font2: "Courier-New",
  font3: "Arial-serif"
  }
  (It is recommended to keep the default key and value. All other keys and values can be adapted to your needs.)

### Feature IS

- is.variants[0].hide:
  default = {
  hidden: true,
  class_to_hide: "hide-container1",
  class_to_show: "show-container1",
  class_parent: "hide-show-wrapper",
  resize: "resize-hide"
  }

- `class_to_hide`: add value to your html site for a container to be hidden when this feature is selected.
- `class_to_show`: add value to your html site for a container to be shown when this feature is selected.
- `class_parent`: add value to your html site for a wrapper element for the two previous classes elements

## CSS Classes

### Feature AOT

For each variant (= custom element) the following classes must be added to your HTML site:

- aot.variants[0].css_class:
  default = `css-class-[opt]` where `[opt]` must match the opt attribute of the custom element.
  (Add this class to your css file and assign css style properties.)

- aot.variants[0].color:
  default = `color-[opt]` where `[opt]` must match the opt attribute of the custom element.
  (Add this class to your css file and assign css style properties.)

- aot.span_element.css_class (optional):
  default = `badge-item`
  Add this class to your css stylesheet if you want to change the appearance. Default stylesheet available in style.css (see 'src/css' directory of package)

- aot.rendered_element.label_class (optional):
  default = `switch`
  Add this class to your css stylesheet if you want to change the appearance. Default stylesheet available in style.css (see 'src/css' directory of package)

- aot.rendered_element.slider_class (optional):
  default = `i-slider round`
  Add this class to your css stylesheet if you want to change the appearance. Default stylesheet available in style.css (see 'src/css' directory of package)

### Feature FOS

- fos.variants[0].sizes: (optional)
  default = {
  {
  default: "default",
  font_size_14: "14", (css property with minus instead of underline)
  font_size_18: "18",
  font_size_22: "22",
  font_size_26: "26"
  }
  (Add font-size-\* to your stylesheet and define a custom font size.)

### Feature FF

- fos.variants[0].fonts: (optional)
  default = {
  {
  default: "default",
  font1: "Times-New-Roman",
  font2: "Courier-New",
  font3: "Arial-serif"
  }
  (Add font\* to your stylesheet and define a custom font size.)

### Feature IS

- is.variants[0].hide.column_small:
  default = {
  class: "col-md-6",
  percent: "50%"
  }
- is.variants[0].hide.column_small:
  default = {
  class: "col-md-12",
  percent: "100%"
  }

If Bootstrap is implemented no further settings are necessary. Otherwise define `class` for column sizes in your css stylesheet.

## Initialize Load Editor

```
var editor = new LoadEditor({...});
```

## Configuration Options (optional)

### class aot

Options for element annotation-slider. If a configuration is present it loads parameters and stores it as session cookies. Default: null.

### Example of class aot:

All string values are custom values, feel free to choose any string. The "variants array" can hold multiple objects.

In case no parameters are provided default parameters are used. The only requirement is a predefined "opt" attribute value as part of the custom element. `[opt]` = opt attribute of custom element

```JavaScript
aot: {
    title: "Text Annotations",
    variants: [
        {
            opt: "[opt]",
            // class of html slider element
            opt_slider: "[opt]-slider",
            // visible title of the custom element
            title: "Text Features",
            // class to add a specific highlighting color
            color: "color-[opt]",
            // class to access elements to be highlighted or manipulated
            html_class: "html-class-[opt]",
            // class added or removed depending on slider state
            css_class: "css-class-[opt]",
            // if true elements will be hidden by default and visible of state is active
            hide: {
                hidden: false,
                class: "html-class-[opt]"
            },
            // class for custom citation link
            chg_citation: "citation-url",
            // object to identify element as single or all (if true the custom element controls all variants)
            features: {
                all: false,
                class: "single-feature" or "all-features" if set to true
            }
        },
    ],
    // additional css class for visualizing text
    span_element: {
        css_class: "badge-item"
    },
    // class to define state of the custom element
    active_class: "active",
    // css class for HTML switch to turn on/off options
    rendered_element: {
        label_class: "switch",
        slider_class: "i-slider round"
    }
},
```

### class ff

```JavaScript
ff: {
    name: "Change font family",
    variants:  [
        {
            // must match opt attribute of custom element
            opt: "select-font",
            // visible feature title
            title: "Font family",
            // default url parameter key
            urlparam: "font",
            // default citation url link
            chg_citation: "citation-url",
            // default fonts
            fonts: {
                default: "default",
                font1: "Times-New-Roman",
                font2: "Courier-New",
                font3: "Arial-serif"
            },
            // default tag-name for text
            paragraph: "p",
            // default class of paragaph tag
            p_class: "yes-index",
            // not required but can be used to create addition styles
            css_class: ""
        }
    ],
    // class for active state
    active_class: "active",
    // default class for select dropdown
    // stylesheet provided by bootstrap
    html_class: "custom-select"
},
```

### class fs

```JavaScript
fs: {
    name: "Create full size mode",
    variants:  [
        {
            // must match opt attribute of custom element
            opt: "[opt]",
            // default title
            title: "Full screen on/off",
            // default url parameter
            urlparam: "fullscreen",
            // default citation url class
            chg_citation: "citation-url",
            hide: {
                hidden: true,
                // class of html elements to be hidden when fullscree is active
                class_to_hide: "hide-container"

            }
        }
    ],
    // class for active state
    active_class: "active",
    rendered_element: {
        // class for css stylesheet
        a_class: "nav-link btn btn-round",
        // svg for fullscreen button
        svg: "<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-fullscreen' viewBox='0 0 16 16'><path d='M1.5 1a.5.5 0 0 0-.5.5v4a.5.5 0 0 1-1 0v-4A1.5 1.5 0 0 1 1.5 0h4a.5.5 0 0 1 0 1h-4zM10 .5a.5.5 0 0 1 .5-.5h4A1.5 1.5 0 0 1 16 1.5v4a.5.5 0 0 1-1 0v-4a.5.5 0 0 0-.5-.5h-4a.5.5 0 0 1-.5-.5zM.5 10a.5.5 0 0 1 .5.5v4a.5.5 0 0 0 .5.5h4a.5.5 0 0 1 0 1h-4A1.5 1.5 0 0 1 0 14.5v-4a.5.5 0 0 1 .5-.5zm15 0a.5.5 0 0 1 .5.5v4a1.5 1.5 0 0 1-1.5 1.5h-4a.5.5 0 0 1 0-1h4a.5.5 0 0 0 .5-.5v-4a.5.5 0 0 1 .5-.5z'/></svg>"
    }
},
```

### class fos

```JavaScript
fos: {
    name: "Change font size",
    variants:  [
        {
            // must match opt attribute value of custom element
            opt: "[opt]",
            // visible feature title
            title: "Font size",
            // url parameter name
            urlparam: "fontsize",
            // custom class for citation link
            chg_citation: "citation-url",
            // default font sizes
            sizes: {
                default: "default",
                font_size_14: "14",
                font_size_18: "18",
                font_size_22: "22",
                font_size_26: "26"
            },
            // default tag-name containing text
            paragraph: "p",
            // default class in combination with paragraph that contains text
            p_class: "yes-index",
            // default addition to css class. Will be combined with font size value
            css_class: "font-size-"
        }
    ],
    // default class for state
    active_class: "active",
    // default class for select dropdown
    // stylesheet provided by bootstrap
    html_class: "custom-select"
},
```

### class is

```JavaScript
is: {
    name: "enable/disable image viewer",
    variants:  [
        {
            // must match opt attribute of custom element
            opt: "edition-switch",
            // default feature title
            title: "Facsimile on/off",
            // default url parameter key
            urlparam: "image",
            // default citation link class
            chg_citation: "citation-url",
            // default class for hiding html elements
            fade: "fade",
            // default column class and stylesheet property value
            // if state is on / active
            column_small: {
                class: "col-md-6",
                percent: "50%"
            },
            // default column class and stylesheet property value
            // if state is off
            column_full: {
                class: "col-md-12",
                percent: "100%"
            },
            // default classes to show/hide/resize html elements and html wrapper
            hide: {
                hidden: true,
                class_to_hide: "hide-container1",
                class_to_show: "show-container1",
                class_parent: "hide-show-wrapper",
                resize: "resize-hide"
            },
            // default height of image container
            image_size: "1000px"
        }
    ],
    // default class of state
    active_class: "active",
    // default class and svg for rendered element
    rendered_element: {
        a_class: "nav-link btn btn-round",
        svg: "<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-image' viewBox='0 0 16 16'><path d='M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z'/><path d='M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-12zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1h12z'/></svg>"
    }
},
```

### class il

```JavaScript
il: {
    name: "load images in OSD viewer",
    opt: "image-loader",
    title: "Faksimiles",
    urlparam: "page",
    chg_citation: "citation-url",
    pag_link: ".pagination .nav-tabs .nav-item .nav-link",
    pag_tab: ".pagination-tab.tab-pane",
    img_size: "1000px",
    url: "https://id.acdh.oeaw.ac.at/auden-musulin-papers/",
    url_param: ".jpg?format=iiif",
    osd_target: "container",
    img_source: "container2",
    img_types: ["envelope", "sheet"],
    active_class: "active",
    inactive_class: "fade",
    bootstrap_class: "show",
},
```

### class ep

```JavaScript
ep: {
    name: "Page Pagination",
    opt: "edition-pagination",
    title: "Page Pagination",
    urlparam: "page",
    chg_citation: "citation-url",
    pag_link: ".pagination .nav-tabs .nav-item .nav-link",
    pag_tab: ".pagination-tab.tab-pane",
    img_size: "1000px",
    active_class: "active",
    inactive_class: "fade",
    bootstrap_class: "show",
    url: "https://id.acdh.oeaw.ac.at/auden-musulin-papers/",
    url_param: ".jpg?format=iiif",
    osd_target: "container",
    img_source: "container2"
},
```
