// 利用 state 捕获摘要参数，并通过 context 传递给渲染函数
#import "/utils/style.typ": 字号, 字体
#import "/utils/indent.typ": fake-par

#import "@preview/numblex:0.1.1": numblex

#let appendix-content = state("appendix", [
= 默认附录
此处为默认的附录文档，提供一些样例方便测试验证。
])

#let appendix(
  body
) = {
  context appendix-content.update(body)
}

#let appendix-part() = {
  // 致谢、附录内容	宋体小四号
  set text(font: 字体.宋体, size: 字号.小四)

  // 致谢、附录标题 黑体三号居中
  show heading.where(level: 1): set text(font: 字体.黑体, size: 字号.三号)

  // 论文附录依次用大写字母“附录A、附录B、附录C……”表示，附录内的分级序号可采用“附A1、
  // 附A1.1、附A1.1.1”等表示，图、表、公式均依此类推为“图A1、表A1、式A1”等。
  set heading(numbering: numblex(numberings: ("附录A", "附A1", "附A1.1 ", "附A1.1.1")))

  // 重置 heading 计数
  counter(heading).update(0)

  // 通过插入假段落修复[章节第一段不缩进问题](https://github.com/typst/typst/issues/311)
  show heading.where(level: 1): it => {
    it
    fake-par
  }

  context appendix-content.final()
}
