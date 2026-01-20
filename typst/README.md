# typst scripts

The version of these scripts will always be `1.0.0`, because using anything else looks like to be too complicated for
anything.

## `template`

This package requires:
- `Inter` as the sans-serif font;
- `PT Astra Serif` as the serif font;
- `FiraCode Nerd Font Mono` as the monospace font.

I may add an option to modify this.

It is the template that I use everywhere.
It can be freely used.

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

## `callout`

This package contains my callouts.

List of callouts:
- `warning`
- `defn` (definition)
- `props` (proposition)
- `thm` (théorème, which is theorem in French)

Import it and load it with:
```typ
// import the script from the local repo
// if you have modified the repo name, replace `@local` with their name
#import "@local/callout:1.0.0": *
```

You can use any callouts with
```typ
#defn[
  Let $f$ a function where:
  $ forall x in RR, f(x) = x^2 $
]
```
