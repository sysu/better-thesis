// 传入论文信息、控制信息预处理

#let with-info-dafault(info: (:)) = {
  // 论文信息参数处理。要求必须传递，且符合规格的参数
  assert(type(info) == dictionary)
  assert(type(info.title) == array or type(info.title) == str)
  assert(type(info.title-en) == array or type(info.title-en) == str)

  // 论文信息默认参数。函数传入参数会完全覆盖参数值，因此需要提供默认参数补充。
  // 彩蛋：如果论文参数不传递作者参数，那么论文就会被署名论文模板作者
  let default-author = (
    sno: "13xxxx87",
    name: "Sunny Huang",
    grade: "2013",
    department: "数据科学与计算机学院",
    major: "软件工程",
  )
  info.author = info.at("author", default: default-author)

  let default-thesis-info = (
    title: ("中山大学本科生毕业论文（设计）", "写作与印制规范"),
    title-en: ("The Specification of Writting and Printing", "for SYSU thesis"),
    supervisor: ("李四", "教授"),
    submit-date: datetime.today(),
  )
  info = default-thesis-info + info

  if type(info.title) == str {
    info.title = info.title.split("\n")
  }
  if type(info.title-en) == str {
    info.title-en = info.title-en.split("\n")
  }

  return info
}

// 论文渲染控制参数处理。设置可选页面的默认设置项
#let with-pages-default(pages: (:)) = {
  let default-pages = (
    cover: true,
    appendix: false,
  )
  pages = default-pages + pages

  return pages
}
