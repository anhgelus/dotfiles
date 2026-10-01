#let doc(authors: (), page_title: [], toc: true, heading_pagebreak: true, doc) = {
  // style
  set text(
    font: "Inter",
    size: 10pt,
  )
  set par(
    leading: 1em,
    //first-line-indent: (amount: 1em, all: true),
    spacing: 2em,
  )
  set heading(numbering: "1.")

  set page(
    header: align(
      right + horizon,
      // Retrieve the document
      // element's title property.
      context {
        emph[
          #document.title - #authors.first().name
        ]
      }
    ),
    numbering: "1",
    margin: (x: 3.5cm),
  )

  show heading: set par(leading: 0.75em)
  show heading: set text(font: "PT Astra Serif")
  show heading.where(level: 1): set block(below: 1em)
  show heading.where(level: 1): set text(size: 1.25em)
  show heading.where(level: 2): set block(above: 3em, below: 1em)
  show heading.where(level: 2): set text(size: 1.15em)
  show heading.where(level: 3): set block(above: 2em, below: 1em)
  show heading.where(level: 3): set text(size: 1.1em)

  show title: set text(size: 1.35em, font: "PT Astra Serif")
  show title: set align(center)
  show title: set block(above: 5em, below: 1em)
  show title: set par(leading: 0.5em)
  show outline: it => {
    it
    pagebreak()
  }

  show enum: set par(leading: 0.9em)
  show list: set par(leading: 0.9em)

  show raw: set text(font: "FiraCode Nerd Font Mono")
  show raw.where(block: false): set text(weight: 500, size: 1.1em)
  set document(title: page_title)
  let ncols = calc.min(authors.len(), 3)

  title()

  block(below: 5em, context {
    grid(
      columns: (1fr,) * ncols,
      gutter: 2em,
      align: center,
      ..authors.map(author => {
        let body = author.name
        if author.at("affiliation", default: "") != "" {
          body += "\n" + author.affiliation
        }
        if author.at("email", default: "") != "" {
          body += "\n" + link("mailto:" + author.email)
        }
        par(body, leading: 0.75em)
      })
    )
  })

  if toc {
    outline(title: "Table des matières")
  }

  show heading.where(level: 1): it => {
    if heading_pagebreak {
      pagebreak(weak: true)
    }
    it
  }

  doc
}
