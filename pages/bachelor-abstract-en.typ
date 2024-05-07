#import "../utils/style.typ": 字号, 字体
#import "../utils/invisible-heading.typ": invisible-heading

// 本科生英文摘要页
#let bachelor-abstract-en(
  // documentclass 传入的参数
  anonymous: false,
  twoside: false,
  fonts: (:),
  info: (:),
  // 其他参数
  keywords: (),
  outline-title: "ABSTRACT",
  outlined: false,
  body,
) = {
  pagebreak(weak: true, to: if twoside { "odd" })

  [
    #set text(font: fonts.宋体, size: 字号.小四)

    // 标记一个不可见的标题用于目录生成
    #invisible-heading(level: 1, outlined: outlined, outline-title)

    #align(center)[
      #set text(size: 字号.小二, font: fonts.黑体, weight: "bold")
      [ABSTRACT]
      #v(1em)
    ]

    #body

    #v(1em)

    #text(font: 字体.宋体, weight: "bold")[Keywords:] #(("",) + keywords.intersperse(", ")).sum()
  ]
}
