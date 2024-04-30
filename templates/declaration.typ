#import "../functions/style.typ": *
#import "../custom.typ": *

#heading(numbering: none, outlined: false, "学术诚信声明")
#par(justify: true, first-line-indent: 2em, leading: 行距)[
  本人郑重声明：所呈交的毕业论文（设计），是本人在导师的指导下，独立进行研究工作所取得的成果。除文中已经注明引用的内容外，本论文（设计）不包含任何其他个人或集体已经发表或撰写过的作品成果。对本论文（设计）的研究做出重要贡献的个人和集体，均已在文中以明确方式标明。本论文（设计）的知识产权归属于培养单位。本人完全意识到本声明的法律结果由本人承担。
]


#v(3em)
#align(right + top,
  box(
    grid(
      columns: (auto, auto),
      gutter: 2em,
      "作者签名：", "",
      "日" + h(2em) + "期：", h(2.5em) + text("年") + h(2em) + text("月") + h(2em) + text("日")
    )
  )
)