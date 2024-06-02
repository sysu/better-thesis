#import "/specifications/bachelor/cover.typ": cover
#import "/specifications/bachelor/titlepage.typ": titlepage
#import "/specifications/bachelor/declaration.typ": declaration
#import "/specifications/bachelor/abstract.typ": abstract, abstract-page
#import "/specifications/bachelor/abstract-en.typ": abstract-en, abstract-en-page

#import "/utils/style.typ": 字号, 字体,
#import "/utils/indent.typ": fake-par

#import "@preview/numblex:0.1.1": numblex

// 中山大学本科生毕业论文（设计）写作与印制规范
// 参考规范: https://spa.sysu.edu.cn/zh-hans/article/1744
#let doc(
  // 毕业论文基本信息
  thesis-info: (
    // 论文标题，将展示在封面、扉页与页眉上
    // 多行标题请使用数组传入 `("thesis title", "with part next line")`，或使用换行符：`"thesis title\nwith part next line"`
    title: ("基于 Typst 的", "中山大学学位论文模板"),
    title-en: "A Typst Template for SYSU thesis",

    // 论文作者信息：学号、姓名、院系、专业、指导老师
    author: (
      sno: "1xxxxxxx",
      name: "张三",
      grade: "2024",
      department: "某学院",
      major: "某专业",
    ),

    // 指导老师信息，以`("name", "title")` 数组方式传入
    supervisor: ("李四", "教授"),

    // 提交日期，默认为论文 PDF 生成日期
    submit-date: datetime.today(),
  ),

  // 控制页面是否渲染
  pages: (
    // 封面可能由学院统一打印提供，因此可以不渲染
    cover: true,
  ),

  // 论文内文各大部分的标题用“一、二…… （或1、2……）”， 次级标题为“（一）、（二）……（或
  // 1.1、2.1……）”，三级标题用“1、2……（或1.1.1、2.1.1……）”，四级标题用“（1）、（2）……
  //（或1.1.1.1、2.1.1.1……）”，不再使用五级以下标题。两类标题不要混编。
  numbering: "一",

  // 双面模式，会加入空白页，便于打印
  twoside: false,

  // 论文正文信息，包括绪论、主体、结论
  content
) = {
  // 文档默认参数处理
  // 论文信息默认参数。函数传入参数会完全覆盖参数值，因此需要提供默认参数补充。
  // 彩蛋：如果论文参数不传递作者参数，那么论文就会被署名论文模板作者
  let default-author = (
    sno: "13xxxx87",
    name: "Sunny Huang",
    grade: "2013",
    department: "数据科学与计算机学院",
    major: "软件工程",
  )
  thesis-info.author = thesis-info.at("author", default: default-author)

  let default-thesis-info = (
    title: ("中山大学本科生毕业论文（设计）", "写作与印制规范"),
    title-en: ("The Specification of Writting and Printing", "for SYSU thesis"),
    supervisor: ("李四", "教授"),
    submit-date: datetime.today(),
  )
  thesis-info = default-thesis-info + thesis-info

  // 文档元数据处理
  if type(thesis-info.title) == str {
    thesis-info.title = thesis-info.title.split("\n")
  }
  if type(thesis-info.title-en) == str {
    thesis-info.title-en = thesis-info.title-en.split("\n")
  }

  set document(
    title: thesis-info.title.join(""),
    author: thesis-info.author.name,
    // keywords: thesis-info.abstract.keywords,
  )

  // 纸张大小：A4。页边距：上边距25 mm，下边距20 mm，左右边距均为30 mm。
  set page(paper: "a4", margin: (top: 25mm, bottom: 20mm, x: 30mm))

  // 行距：1.5倍行距
  // 行距理解为 word 默认行距（1em * 120%）的1.5倍，由于目前尚未实现 [line-height 模
  // 型]，故换算成行间距（leading）
  //
  // [line-height 模型]: https://github.com/typst/typst/issues/4224
  set par(leading: 1em * 120% * 1.5 - 1em)

  // 目录内容 宋体小四号
  // 正文内容 宋体小四号
  // 致谢、附录内容	宋体小四号
  set text(lang: "zh", font: 字体.宋体, size: 字号.小四)

  // 论文内文各大部分的标题用“一、二…… （或1、2……）”， 次级标题为“（一）、（二）……（或
  // 1.1、2.1……）”，三级标题用“1、2……（或1.1.1、2.1.1……）”，四级标题用“（1）、（2）……
  //（或1.1.1.1、2.1.1.1……）”，不再使用五级以下标题。两类标题不要混编。
  set heading(depth: 4, numbering: if numbering == "一" {
    numblex(numberings: ("一", "（一）","1", "（1）"))
  } else { "1.1.1.1 "})
  show heading: set text(weight: "regular")

  // 章和节标题段前段后各空0.5行
  // 行理解为当前行距，故在 "1.5倍行距" 的基准上再算一半，也即 "0.75倍行距"
  show heading.where(level: 1): set block(above: 1em * 120% * 0.75, below: 1em * 120% * 0.75)
  show heading.where(level: 2): set block(above: 1em * 120% * 0.75, below: 1em * 120% * 0.75)

  // 目录标题 黑体三号居中
  // 正文各章标题 黑体三号居中
  // 参考文献标题 黑体三号居中
  // 致谢、附录标题	黑体三号居中
  show heading.where(level: 1): set text(font: 字体.黑体, size: 字号.三号)
  show heading.where(level: 1): set align(center)

  // 正文各节一级标题 黑体四号左对齐
  show heading.where(level: 2): set text(font: 字体.黑体, size: 字号.四号)

  // 正文各节二级及以下标题 宋体小四号加粗左对齐空两格
  show heading.where(level: 3): set text(font: 字体.宋体, size: 字号.小四, weight: "bold")
  show heading.where(level: 4): set text(font: 字体.宋体, size: 字号.小四, weight: "bold")
  show heading.where(level: 3): it => pad(left: 2em, it)
  show heading.where(level: 4): it => pad(left: 2em, it)

  // 毕业论文应按以下顺序装订和存档：
  // 封面->扉页->学术诚信声明->摘要->目录->正文->参考文献（->附录）->致谢。
  if pages.cover {
    cover(info: thesis-info)
    pagebreak(weak: true, to: if twoside { "odd" })
  }

  titlepage(info: thesis-info)
  pagebreak(weak: true, to: if twoside { "odd" })

  declaration()
  pagebreak(weak: true, to: if twoside { "odd" })

  // 摘要开始至绪论之前以大写罗马数字（Ⅰ，Ⅱ，Ⅲ…）单独编连续码
  set page(numbering: "I")
  counter(page).update(1)

  abstract-page()
  pagebreak(weak: true, to: if twoside { "odd" })
  abstract-en-page()
  pagebreak(weak: true, to: if twoside { "odd" })

  outline()
  pagebreak(weak: true, to: if twoside { "odd" })

  // 正文段落按照中文惯例缩进两格
  {
    // 通过插入假段落修复[章节第一段不缩进问题](https://github.com/typst/typst/issues/311)
    show heading: it => {
      it
      fake-par
    }
    set par(first-line-indent: 2em)

    // 绪论开始至论文结尾，以阿拉伯数字（1，2，3…）编连续码
    set page(numbering: "1")
    counter(page).update(1)
    content
  }
  pagebreak(weak: true, to: if twoside { "odd" })
}

// 以下为校对用测试 preview 页面
#show: doc.with(thesis-info: (:))

// 正文各部分的标题应简明扼要，不使用标点符号。
= 第一章
== 节标题
=== 小节标题
==== 四级标题
写一下测试的内容
