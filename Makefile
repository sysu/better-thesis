TYPST_FLAGS += --root .
TYPST_FLAGS += --font-path fonts

thesis:
	typst compile ${TYPST_FLAGS} thesis.typ thesis.pdf

watch:
	typst watch ${TYPST_FLAGS} thesis.typ thesis.pdf
