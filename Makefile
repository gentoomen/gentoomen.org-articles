all: build/00000000.pdf

build/%.pdf: articles/%/article.tex 
	mkdir -p build
	pdflatex -output-directory=build ../$<
	rm build/*.log build/*.aux
	mv build/article.pdf $@

clean:
	rm -rv build
