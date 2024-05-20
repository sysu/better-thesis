# Changelog

All notable changes to this project will be documented in this file.

## [0.1.1-alpha.4] - 2024-05-20

### ⚙️ Miscellaneous Tasks

- *(gitlab-ci)* 尝试修复合并后错误触发流水作业
- *(gitlab-ci)* 仅在 tag 推送到 default branch，并且在页面上指定 tag 标签时执行流水线
- *(gitlab-ci)* 修复变量错误
- *(gitlab-ci)* 修复 tag 标签检查发版流程触发逻辑
- *(template)* 修改发版 MR 模板
- *(release)* Prepare for v0.1.1-alpha.4
- *(gitlab-ci)* Automate everything!
- *(gitlab-ci)* 提取默认镜像配置
- *(gitlab-ci)* 恢复手动触发打标签
- *(gitlab-ci)* 更新打版命令
- *(GitLab-ci)* 分离每一步命令以检查命令执行原因
- *(git-cliff)* Release-note 排除自动化提交的记录
- *(gitlab-ci)* 修复版本 bump up 命令与推送问题
- *(gitlab-ci)* 修复语法错误
- *(gitlab-ci)* Fix cache issue
- *(gitlab-ci)* 修复打版提交推送不成功的问题
- *(gitlab-ci)* 尝试修复 release-commit 无法推送到分支的问题
- *(gitlab-ci)* 重新合并经过验证的命令
- *(GitLab-ci)* 更换安全git-lfs 的命令
- *(gitlab-ci)* 更换安装 lfs 的命令
- *(gitlab-ci)* 再次更换安装 lfs 的命令
- *(GitLab-ci)* 切换回默认分支进行验证

### Build

- *(typst)* 修复错误的版本号格式

## [0.1.1-alpha.4] - 2024-05-17

### ⚙️ Miscellaneous Tasks

- *(gitlab-ci)* 修复 tag 标签检查发版流程触发逻辑
- *(template)* 修改发版 MR 模板

## [0.1.1-alpha.3] - 2024-05-17

### ⚙️ Miscellaneous Tasks

- *(gitlab-ci)* 修复CI脚本复用问题

## [0.1.1-alpha.2] - 2024-05-17

### 📚 Documentation

- *(template)* 添加发布版本的 Merge Request 模板

### ⚙️ Miscellaneous Tasks

- *(gitlab)* Fix syntax error in .gitlab/ci.yml
- *(cliff)* Add cliff config
- *(gitlab-ci)* 注释自动发布版本流程
- *(gitlab-ci)* Pull the checks for each merge request
- *(gitlab-ci)* Check when merged to the default branch
- Change gitlab-ci's trigger rules
- *(gitlab-ci)* 一键发布新版本
- *(gitlab-ci)* Fix syntax error rasied by wrong use of colon
- *(merging)* 'ci-refactor-build-flow' into 'main'
- *(gitlab-ci)* 修复 git-cliff 命令错误
- *(merging)* 'ci-refactor-build-flow' into 'main'
- *(gitlab-ci)* 修复添加缓存文件的问题
- *(merging)* 'ci-refactor-build-flow' into 'main'
- *(gitlab-ci)* 修复添加缓存文件的问题
- *(gitlab-ci)* 删去在 CI 中提交代码的操作
- *(CHANGELOG)* Init
- *(template)* 修改 CHANGELOG.md 需要的参数

## [0.1.1-alpha.1] - 2024-05-17

### 📚 Documentation

- *(github stars)* Github badge changed to the stars one
- *(README)* 修正跳转到仓库的 badges 并增加反馈交流渠道
- *(README)* Refer the repository from upstream to gitlab

### ⚙️ Miscellaneous Tasks

- *(github)* Remove build flow for gitee pages
- *(github)* Remove cron schedule
- *(gitlab)* Add a construct flow for gitlab
- *(gitlab)* Only deploy when it's tagged
- *(gitlab)* Fix the wrong install of typst-cli
- *(gitlab)* Fix the typo in build command
- *(gitlab)* Make a release when a commit is tagged and merged to the default branch

## [0.1.0] - 2024-05-15

### *

- Init
- Fix crlf of ps and bat
- Fix crlf of ps and bat
- Add ug cover and integrity declaration
- Arabic numbering
- Fix counters

### 🚀 Features

- [**breaking**] Add bachelor-title-page
- *(heading)* Adjust headings' style, indent for SYSU

### 🐛 Bug Fixes

- *(submit-date)* Change size from 字体.四号 to 字体.小四
- *(cover)* Change display style fo supervisor
- *(fakebold)* Import @preview/cuti and use fakebold to fix missing bold weight on 黑体 fonts
- *(bachelor-decl-page)* Use fakebold to fix bold issue on 黑体 font
- *(style)* The not-working bold issue in 黑体 font is solved
- *(bachelor-abstract)* Change size and font according to the document
- *(loc)* Change locs' titles' font from 宋体 to 黑体
- *(thesis)* Replace nju-emblem.svg with sysu_logo.svg
- *(typst.universe)* Correct the wrong import

### 🚜 Refactor

- *(bachelor-cover)* Remove parameters about anonymous
- *(bachelor-cover)* Remove the useless datetime-display parameter
- *(bachelor-decl-page)* Replace templates/declaration.typ with pages/bachelor-decl-page
- *(template)* Re-arrange the order of imports and remove useless import in template/thesis.typ
- *(style)* Change page hader fonts from 楷体 to 宋体

### 📚 Documentation

- *(lib.typ)* Change lib document description to SYSU
- *(cover)* Add TODO of fixing bold issue of "黑体“ fonts
- *(thesis)* Change the title params for SYSU
- *(README)* 更新代码仓库地址
- *(utils/bibliography)* Change `/* */` comment to the only legal `//` comment
- *(fonts)* Change reference to docs
- Update repository link and the thesis title

### 🎨 Styling

- *(trailing)* 移除所有文件中的行末空白
- *(color)* Define the standard color for SYSU logo
- *(bachelor-cover)* Add trailing comma for params

### ⚙️ Miscellaneous Tasks

- Fix action
- *(typst)* 增加用于 typst.universe 的配置文件
- *(gitignore)* Ignore pdf & develop workspace config
- *(template)* 调整模板的导入为开发设置
- *(typst)* Change build source
- *(fonts)* Track **/*.otf file as LFS
- *(typst)* Bump up to v0.1.0 for release
- *(README)* Modify the build script

### LICENSE

- Add MIT license

### Makefile

- Fix tabs
- Add watch

### README

- Improve user guide
- Add nightly typst info
- Add macos
- Update QA and QQ group
- Add QQ group link
- Publish preview PDF every 6 hours
- Add gitee link
- Add github link
- Update zip download link

### Abstract

- Fix keywords pos and style
- Capitalize en title

### Build

- Fix build
- *(typst)* 修改描述与定义版本为未稳定状态
- *(typst)* Add keyword "thesis" to typst.toml
- *(typst.universe)* Add thumbnail for typst universe
- *(package)* Rename as morden-sysu-thesis

### Functions

- Rename mod to rem

### Github

- Publish preview pdf every day
- Sync to gitee
- Sync preview pdf to gitee pages
- Use custom repo mirroring action

### Script

- Do not use ghproxy
- Update windows bat script
- Fix rustup installation
- Fix rustup install
- Use tuna mirror for rustup

### Scripts

- Use ghproxy for installing
- Use ghproxy for installing

### Template

- Add footnote
- Fix booktab ref
- Port pkuthss aec9080 and a179ca0
- Use tablex
- Fix supplement
- Add cover without emblem
- Fix list of figures

<!-- generated by git-cliff -->
