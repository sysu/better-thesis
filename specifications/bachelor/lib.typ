#import "/specifications/bachelor/cover.typ": cover
#import "/specifications/bachelor/titlepage.typ": titlepage
#import "/specifications/bachelor/declaration.typ": declaration
#import "/specifications/bachelor/abstract.typ": abstract, abstract-page
#import "/specifications/bachelor/abstract-en.typ": abstract-en, abstract-en-page

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
    cover: true,
    titlepage: true,
    declaration: true,
    abstract: true,
    abstract-en: true,
  ),

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

  // 毕业论文应按以下顺序装订和存档：
  // 封面->扉页->学术诚信声明->摘要->目录->正文->参考文献（->附录）->致谢。
  [
    #if pages.cover {
      pagebreak(weak: true, to: if twoside { "odd" })
      cover(info: thesis-info)
    }

    #if pages.titlepage {
      pagebreak(weak: true, to: if twoside { "odd" })
      titlepage(info: thesis-info)
    }

    #if pages.declaration {
      pagebreak(weak: true, to: if twoside { "odd" })
      declaration()
    }

    #if pages.abstract {
      pagebreak(weak: true, to: if twoside { "odd" })
      abstract-page()
    }
    #if pages.abstract-en {
      pagebreak(weak: true, to: if twoside { "odd" })
      abstract-en-page()
    }

    #pagebreak()
    #content
  ]
}

// 以下为校对用测试 preview 页面
#show: doc.with(thesis-info: (:))

= 第一章
