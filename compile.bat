@echo off
chcp 65001>nul
set TYPST_FONT_PATHS=%cd%\fonts
echo 编译中……
typst compile --root=%cd% --font-path=fonts template/thesis.typ %cd%/thesis.pdf
echo 命令运行完毕，按任意键退出
pause>nul
