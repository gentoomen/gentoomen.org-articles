ARTICLES := 00000000
L2HFLAGS := -split 0 -info "" -no_navigation
.PHONY   := clean

# Build the articles first so that we can refer to them in the index generation
all: $(ARTICLES) index

index: index.php $(ARTICLES)
	mkdir -p build
	php index.php > build/index.html

00000000: $(wildcard articles/00000000/*)
	mkdir -p build/$@
	# PDF
	pdflatex -output-directory=build/$@/ articles/$@/article.tex
	rm build/$@/*.log build/$@/*.aux
	# HTML
	latex2html $(L2HFLAGS) -dir build/$@ articles/$@/article.tex
	rm build/$@/index.html build/$@/labels.pl build/$@/WARNINGS

clean:
	rm -rv build
