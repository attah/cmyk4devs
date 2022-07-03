import nimsvg
import std/strutils
import std/colors

buildSvgFile("cmyk.svg"):
  let red = 0x55
  let green = 0x77
  let blue = 0x99
  let white = max(max(red, green), blue)
  let cprime = 0xff-red
  let mprime = 0xff-green
  let yprime = 0xff-blue
  let black = min(min(cprime, mprime), yprime)
  let cyan = cprime-black
  let magenta = mprime-black
  let yellow = yprime-black

  let color = rgb(red, green, blue)

  svg(width=455, height=575, style="background-color:white"):
    rect(x=20, y=20, width=60, height=60, fill=($color))
    text(x=100, y=50, `font-family`="monospace", `text-anchor`="start"):
        t $color

    line(x1=100, y1=100, x2=100, y2=400, stroke="black", `stroke-width`=2)
    line(x1=355, y1=100, x2=355, y2=400, stroke="black", `stroke-width`=2)

    line(x1=355, y1=150, x2=355-red, y2=150, stroke="#ff0000", `stroke-width`=4)
    line(x1=355, y1=250, x2=355-green, y2=250, stroke="#00ff00", `stroke-width`=4)
    line(x1=355, y1=350, x2=355-blue, y2=350, stroke="#0000ff", `stroke-width`=4)

    line(x1=100, y1=150, x2=100+cprime, y2=150, stroke="#00ffff", `stroke-width`=4)
    line(x1=100, y1=250, x2=100+mprime, y2=250, stroke="#ff00ff", `stroke-width`=4)
    line(x1=100, y1=350, x2=100+yprime, y2=350, stroke="#ffff00", `stroke-width`=4)

    line(x1=100+0xff-0x99, y1=100, x2=100+0xff-0x99, y2=400, stroke="black", `stroke-width`=1, `stroke-dasharray`=5)

    text(x=50, y=140, `font-family`="monospace", `text-anchor`="middle"):
        t "C': 0x"&cprime.toHex(2)
    text(x=50, y=160, `font-family`="monospace", `text-anchor`="middle"):
        t "#00ffff"
    text(x=50, y=240, `font-family`="monospace", `text-anchor`="middle"):
        t "M': 0x"&mprime.toHex(2)
    text(x=50, y=260, `font-family`="monospace", `text-anchor`="middle"):
        t "#ff00ff"
    text(x=50, y=340, `font-family`="monospace", `text-anchor`="middle"):
        t "Y': 0x"&yprime.toHex(2)
    text(x=50, y=360, `font-family`="monospace", `text-anchor`="middle"):
        t "#ffff00"


    text(x=405, y=140, `font-family`="monospace", `text-anchor`="middle"):
        t "R: 0x"&red.toHex(2)
    text(x=405, y=160, `font-family`="monospace", `text-anchor`="middle"):
        t "#ff0000"
    text(x=405, y=240, `font-family`="monospace", `text-anchor`="middle"):
        t "G: 0x"&green.toHex(2)
    text(x=405, y=260, `font-family`="monospace", `text-anchor`="middle"):
        t "#00ff00"
    text(x=405, y=340, `font-family`="monospace", `text-anchor`="middle"):
        t "B: 0x"&blue.toHex(2)
    text(x=405, y=360, `font-family`="monospace", `text-anchor`="middle"):
        t "#0000ff"

    text(x=100+black, y=100, `font-family`="monospace", `text-anchor`="end"):
        t "K: 0x"&black.tohex(2)&" &#x2192;"

    text(x=100+0xff-white, y=100, `font-family`="monospace", `text-anchor`="start"):
        t "&#x2190; W: 0x"&white.tohex(2)

    let linespacing = 30

    text(x=455/6*1, y=400+linespacing, `font-family`="monospace", `text-anchor`="middle"):
        t "R: 0xff-C' = 0x"&red.toHex(2)
    text(x=455/6*3, y=400+linespacing, `font-family`="monospace", `text-anchor`="middle"):
        t "G: 0xff-M' = 0x"&green.toHex(2)
    text(x=455/6*5, y=400+linespacing, `font-family`="monospace", `text-anchor`="middle"):
        t "B: 0xff-Y' = 0x"&blue.toHex(2)

    text(x=455/2, y=400+2*linespacing, `font-family`="monospace", `text-anchor`="middle"):
        t "W: max(R, G, B) = 0xff-K = 0x"&white.toHex(2)

    text(x=455/6*1, y=400+3*linespacing, `font-family`="monospace", `text-anchor`="middle"):
        t "C': 0xff-R = 0x"&cprime.toHex(2)
    text(x=455/6*3, y=400+3*linespacing, `font-family`="monospace", `text-anchor`="middle"):
        t "M': 0xff-G = 0x"&mprime.toHex(2)
    text(x=455/6*5, y=400+3*linespacing, `font-family`="monospace", `text-anchor`="middle"):
        t "Y': 0xff-B = 0x"&yprime.toHex(2)

    text(x=455/2, y=400+4*linespacing, `font-family`="monospace", `text-anchor`="middle"):
        t "K: min(C', M', Y') = 0xff-W = 0x"&black.toHex(2)

    text(x=455/6*1, y=400+5*linespacing, `font-family`="monospace", `text-anchor`="middle"):
        t "C: C'-K = W-R"
    text(x=455/6*1, y=400+5*linespacing+17, `font-family`="monospace", `text-anchor`="middle"):
        t "= 0x"&cyan.toHex(2)
    text(x=455/6*3, y=400+5*linespacing, `font-family`="monospace", `text-anchor`="middle"):
        t "M: M'-K = W-G"
    text(x=455/6*3, y=400+5*linespacing+17, `font-family`="monospace", `text-anchor`="middle"):
        t "= 0x"&magenta.toHex(2)
    text(x=455/6*5, y=400+5*linespacing, `font-family`="monospace", `text-anchor`="middle"):
        t "Y: Y'-K = W-B"
    text(x=455/6*5, y=400+5*linespacing+17, `font-family`="monospace", `text-anchor`="middle"):
        t "= 0x"&yellow.toHex(2)
