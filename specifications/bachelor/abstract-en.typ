// 利用 state 捕获摘要参数，并通过 context 传递给渲染函数
#import "/utils/style.typ": 字号, 字体
#import "/utils/invisible-heading.typ": invisible-heading

#let abstract-en-keywords = state("keywords-en", (
  "Sun Yat-sen University",
  "thesis",
  "specification",
))
#let abstract-en-content = state("abstract-en", [
英文摘要及关键词内容应与中文摘要及关键词内容相同。中英文摘要及其关键词各置一页内。
The English abstract and its keywords should be the same as the Chinese one. Both Chinese and English should be in seperated pages.
])
#let abstract-en(
  keywords: (),
  body,
) = {
  context abstract-en-keywords.update(keywords)
  context abstract-en-content.update(body)
}

// 英文摘要页
#let abstract-en-page(
  twoside: false,
  outline-title: "ABSTRACT",
  outlined: false,
) = {
  pagebreak(weak: true, to: if twoside { "odd" })

  [
    #set text(size: 字号.小四)

    // 标记一个不可见的标题用于目录生成
    #invisible-heading(level: 1, outlined: outlined, outline-title)

    #align(center)[
      #set text(size: 字号.三号, weight: "bold")
      [ABSTRACT]
      #v(1em)
    ]

    #context abstract-en-content.final()

    #v(1em)

    *Keywords:* #context abstract-en-keywords.final().join(", ")
  ]
}
