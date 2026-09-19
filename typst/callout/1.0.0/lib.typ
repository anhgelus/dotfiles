#let emptyblock((fontcolor, bgcolor), content) = {
  set par(
    leading: 0.75em,
    first-line-indent: 0em,
    spacing: 1.3em,
  )
  set text(fill: fontcolor)
  block(
    width: 100%,
    inset: 1.5em,
    radius: 0.5em,
    breakable: false,
    fill: bgcolor,
    content
  )
}

#let title(content) = text(size: 1.15em, strong(content))

#let callout(icon, title_content, colors, content) = {
  emptyblock(colors)[
    #text(size: 1.15em)[#icon~ #strong(title_content)]

    #content
  ]
}

#let warning(title: "Attention", body) = {
  callout(
    emoji.warning,
    title,
    (oklch(25%, 35%, 52.55deg), oklch(68.9%, 44%, 52.55deg, 15%)),
    body,
  )
}

#let solution(title: "Solution", body) = {
  callout(
    emoji.checkmark.box,
    title,
    (rgb("#2AA63D"), rgb("#DBFCE7"), rgb("#7AF0A8")),
    body,
  )
}

#let defn(title: "Définition", body) = {
  callout(
    $Delta$,
    title,
    (oklch(20%, 20%, 247deg), oklch(75%, 25%, 247deg, 40%)),
    body,
  )
}

#let props(title: "Proposition", body) = {
  callout(
    $Pi$,
    title,
    (oklch(20%, 20%, 247deg), oklch(85%, 10%, 247deg, 50%)),
    body,
  )
}

#let thm(title: "Théorème", body) = {
  callout(
    $Tau$,
    title,
    (oklch(20%, 20%, 220deg), oklch(80%, 25%, 220deg, 40%)),
    body,
  )
}

#let proof(title_content: "Preuve", body) = {
  set par(
    leading: 0.5em,
    first-line-indent: 0em,
    spacing: 1.2em,
  )
  set text(size: 0.9em, fill: luma(70))
  block(
    stroke: (left: 1pt + black),
    inset: 1em,
  )[
    #title(title_content)

    #body
  ]
}

#let note(title: "Note", icon: emoji.pencil, body) = {
  callout(
    icon,
    title,
    (oklch(20%, 20%, 247deg), oklch(85%, 10%, 247deg, 50%)),
    body,
  )
}
