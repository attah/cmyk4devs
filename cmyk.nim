import nimsvg
import std/strutils
import std/colors
import std/math

buildSvgFile("cmyk.svg"):
  let width = 500
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

  svg(width=width, height=560, style="background-color:white"):
    let margin = floorDiv((width-255), 2)
    let halfMargin = floorDiv(margin, 2)
    let otherSide = margin + 255

    rect(x=halfMargin-30, y=20, width=60, height=60, fill=($color))
    text(x=floorDiv(width, 2), y=50, `font-size`=12, `font-family`="monospace", `text-anchor`="middle"):
        t $color&" ⇒ 0x"&cyan.toHex(2)&magenta.toHex(2)&yellow.toHex(2)&black.toHex(2)

    line(x1=margin, y1=100, x2=margin, y2=400, stroke="black", `stroke-width`=2)
    line(x1=otherSide, y1=100, x2=otherSide, y2=400, stroke="black", `stroke-width`=2)

    line(x1=otherSide, y1=150, x2=otherSide-red, y2=150, stroke="#ff0000", `stroke-width`=4)
    line(x1=otherSide, y1=250, x2=otherSide-green, y2=250, stroke="#00ff00", `stroke-width`=4)
    line(x1=otherSide, y1=350, x2=otherSide-blue, y2=350, stroke="#0000ff", `stroke-width`=4)

    line(x1=margin, y1=150, x2=margin+cprime, y2=150, stroke="#00ffff", `stroke-width`=4)
    line(x1=margin, y1=250, x2=margin+mprime, y2=250, stroke="#ff00ff", `stroke-width`=4)
    line(x1=margin, y1=350, x2=margin+yprime, y2=350, stroke="#ffff00", `stroke-width`=4)

    line(x1=margin+0xff-0x99, y1=100, x2=margin+0xff-0x99, y2=400, stroke="black", `stroke-width`=1, `stroke-dasharray`=5)

    text(x=halfMargin, y=140, `font-size`=12, `font-family`="monospace", `text-anchor`="middle"):
        t "C': 0x"&cprime.toHex(2)
    text(x=halfMargin, y=160, `font-size`=12, `font-family`="monospace", `text-anchor`="middle"):
        t "#00ffff"
    text(x=halfMargin, y=240, `font-size`=12, `font-family`="monospace", `text-anchor`="middle"):
        t "M': 0x"&mprime.toHex(2)
    text(x=halfMargin, y=260, `font-size`=12, `font-family`="monospace", `text-anchor`="middle"):
        t "#ff00ff"
    text(x=halfMargin, y=340, `font-size`=12, `font-family`="monospace", `text-anchor`="middle"):
        t "Y': 0x"&yprime.toHex(2)
    text(x=halfMargin, y=360, `font-size`=12, `font-family`="monospace", `text-anchor`="middle"):
        t "#ffff00"

    text(x=otherSide+halfMargin, y=140, `font-size`=12, `font-family`="monospace", `text-anchor`="middle"):
        t "R: 0x"&red.toHex(2)
    text(x=otherSide+halfMargin, y=160, `font-size`=12, `font-family`="monospace", `text-anchor`="middle"):
        t "#ff0000"
    text(x=otherSide+halfMargin, y=240, `font-size`=12, `font-family`="monospace", `text-anchor`="middle"):
        t "G: 0x"&green.toHex(2)
    text(x=otherSide+halfMargin, y=260, `font-size`=12, `font-family`="monospace", `text-anchor`="middle"):
        t "#00ff00"
    text(x=otherSide+halfMargin, y=340, `font-size`=12, `font-family`="monospace", `text-anchor`="middle"):
        t "B: 0x"&blue.toHex(2)
    text(x=otherSide+halfMargin, y=360, `font-size`=12, `font-family`="monospace", `text-anchor`="middle"):
        t "#0000ff"

    text(x=margin+black, y=100, `font-size`=12, `font-family`="monospace", `text-anchor`="end"):
        t "K: 0x"&black.tohex(2)&" &#x2192;"

    text(x=margin+0xff-white, y=100, `font-size`=12, `font-family`="monospace", `text-anchor`="start"):
        t "&#x2190; K&#773;: 0x"&white.tohex(2)

    let linespacing = 30

    text(x=width/6*1, y=400+linespacing, `font-size`=12, `font-family`="monospace", `text-anchor`="middle"):
        t "R: 0xff-C' = 0x"&red.toHex(2)
    text(x=width/6*3, y=400+linespacing, `font-size`=12, `font-family`="monospace", `text-anchor`="middle"):
        t "G: 0xff-M' = 0x"&green.toHex(2)
    text(x=width/6*5, y=400+linespacing, `font-size`=12, `font-family`="monospace", `text-anchor`="middle"):
        t "B: 0xff-Y' = 0x"&blue.toHex(2)

    text(x=width/2, y=400+2*linespacing, `font-size`=12, `font-family`="monospace", `text-anchor`="middle"):
        t "K&#773;: max(R, G, B) = 0xff-K = 0x"&white.toHex(2)

    text(x=width/6*1, y=400+3*linespacing, `font-size`=12, `font-family`="monospace", `text-anchor`="middle"):
        t "C': 0xff-R = 0x"&cprime.toHex(2)
    text(x=width/6*3, y=400+3*linespacing, `font-size`=12, `font-family`="monospace", `text-anchor`="middle"):
        t "M': 0xff-G = 0x"&mprime.toHex(2)
    text(x=width/6*5, y=400+3*linespacing, `font-size`=12, `font-family`="monospace", `text-anchor`="middle"):
        t "Y': 0xff-B = 0x"&yprime.toHex(2)

    text(x=width/2, y=400+4*linespacing, `font-size`=12, `font-family`="monospace", `text-anchor`="middle"):
        t "K: min(C', M', Y') = 0xff-K&#773; = 0x"&black.toHex(2)

    text(x=width/6*1, y=400+5*linespacing, `font-size`=12, `font-family`="monospace", `text-anchor`="middle"):
        t "C: C'-K = K&#773;-R = 0x"&cyan.toHex(2)
    text(x=width/6*3, y=400+5*linespacing, `font-size`=12, `font-family`="monospace", `text-anchor`="middle"):
        t "M: M'-K = K&#773;-G = 0x"&magenta.toHex(2)
    text(x=width/6*5, y=400+5*linespacing, `font-size`=12, `font-family`="monospace", `text-anchor`="middle"):
        t "Y: Y'-K = K&#773;-B = 0x"&yellow.toHex(2)
