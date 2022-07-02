all: cmyk cmyk.svg

cmyk: cmyk.nim
	nim c cmyk.nim

cmyk.svg: cmyk
	./cmyk

clean:
	rm cmyk
