# typst scripts

The version of these scripts will always be `1.0.0`, because using anything else looks like to be too complicated for
anything.

## `template.typ`

This template requires:
- `Inter` as the sans-serif font;
- `PT Astra Serif` as the serif font;
- `FiraCode Nerd Font Mono` as the monospace font.

These can be freely used.
I may add an option to modify this.

Import it and load it with:
```typ
// import the script from the local repo
// if you have modified the repo name, replace `@local` with their name
#import "@local/template:1.0.0": *

// initialize template
#show: doc.with(
  authors: (
    (name: "Your Name", affiliation: "Your affiliation", email: "Your email"),
  ),
  page_title: "Page title :D",
)
```
