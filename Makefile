all: 00000000

00000000: articles/00000000/article.tex 
	mkdir -p build/$@
	pdflatex -output-directory=build ../$<
	mv build/article.pdf build/$@/$@.pdf
	rm build/*.log build/*.aux
	latex2html -dir build/$@ -split 0 -info "" $<

clean:
	rm -rv build
