#import "/utils/style.typ": 字体, 字号
// #import "@preview/cuti:0.3.0": show-cn-fakebold
// #show: show-cn-fakebold

#let contents-page(twoside: false) = {
  show outline.entry: it => {
    if text.lang == "zh" {
      if it.element.numbering == "附录A" {
        strong(link(
          it.element.location(),
          it.indented(none, it.inner()),
        ))
      } else if it.element.numbering != none and it.element.level == 1 {
        strong(link(
          it.element.location(),
          it.indented("第" + it.prefix() + "章", it.inner()),
        ))
      } else if it.element.level == 1 {
        strong(it)
      } else {
        it
      }
    }

    if text.lang == "en" {
      if it.element.numbering == "附录A" {
        set text(weight: "bold")
        strong(link(
          it.element.location(),
          it.indented(none, it.inner()),
        ))
      } else if it.element.numbering != none and it.element.level == 1 {
        strong(link(
          it.element.location(),
          it.indented("Chapter " + it.prefix(), it.inner()),
        ))
      } else if it.element.level == 1 {
        strong(it)
      } else {
        it
      }
    }
  }

  outline()
  pagebreak(weak: true, to: if twoside { "odd" })

  set text(lang: "en")
  outline()
  pagebreak(weak: true, to: if twoside { "odd" })
  set text(lang: "zh")
}

