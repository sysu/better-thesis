// 中山大学本科生毕业论文（设计）写作与印制规范
// 参考规范: https://spa.sysu.edu.cn/zh-hans/article/1744
#let doc(
  // 毕业论文基本信息
  thesis_info: (
    // 论文标题，将展示在封面、扉页与页眉上
    // 多行标题请使用数组传入 `("thesis title", "with part next line")`，或使用换行符：`"thesis title\nwith part next line"`
    title: ("基于 Typst 的", "中山大学学位论文模板"),

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
  content
) = {
  // 文档默认参数处理
  // 论文信息默认参数。函数传入参数会完全覆盖参数值，因此需要提供默认参数补充。
  let default_thesis_info = (
    title: ("中山大学本科生毕业论文（设计）", "写作与印制规范"),
    author: (
      sno: "1xxxxxxx",
      name: "张三",
      grade: "2024",
      department: "某学院",
      major: "某专业",
    ),
    supervisor: ("李四", "教授"),
    submit-date: datetime.today(),
  )
  thesis_info = default_thesis_info + thesis_info

  // 文档元数据处理
  if type(thesis_info.title) == str {
    thesis_info.title = thesis_info.title.split("\n")
  }

  set document(
    title: thesis_info.title.join(""),
    author: thesis_info.author.name,
    // keywords: thesis_info.abstract.keywords,
  )

  // 依序渲染页面
  [

    #content
  ]
}

// 以下为校对用测试 preview 页面
#show: doc

= 第一章
