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

#let callout(icon, title, title_content, colors, content) = {
  emptyblock(colors)[
    #text(size: 1.15em)[#icon~ #strong(title)]

    #content
  ]
}

#let warning(body) = {
  callout(
    emoji.warning, 
    "Attention", 
    title,
    (oklch(25%, 35%, 52.55deg), oklch(68.9%, 44%, 52.55deg, 15%)),
    body,
  )
}

#let solution(body) = {
  callout(emoji.checkmark.box, "Solution",
    (rgb("#2AA63D"), rgb("#DBFCE7"), rgb("#7AF0A8")), 
    body)
}

#let defn(body) = {
  callout(
    $Delta$,
    "Définition", 
    title,
    (oklch(20%, 20%, 247deg), oklch(75%, 25%, 247deg, 40%)),
    body,
  )
}

#let props(body) = {
  callout(
    $Pi$,
    "Proposition", 
    title,
    (oklch(20%, 20%, 247deg), oklch(85%, 10%, 247deg, 50%)),
    body,
  )
}

#let thm(body) = {
  callout(
    $Tau$,
    "Théorème", 
    title,
    (oklch(20%, 20%, 220deg), oklch(80%, 25%, 220deg, 40%)),
    body,
  )
}
