import nimsvg

buildSvgFile("cmyk.svg"):
  svg(width=455, height=550):
    rect(x=20, y=20, width=60, height=60, fill="#998877")
    text(x=100, y=50, `font-family`="monospace", `text-anchor`="start"):
        t "#998877"

    line(x1=100, y1=100, x2=100, y2=400, stroke="black", `stroke-width`=2)
    line(x1=355, y1=100, x2=355, y2=400, stroke="black", `stroke-width`=2)

    line(x1=355, y1=150, x2=355-0x99, y2=150, stroke="#ff0000", `stroke-width`=4)
    line(x1=355, y1=250, x2=355-0x88, y2=250, stroke="#00ff00", `stroke-width`=4)
    line(x1=355, y1=350, x2=355-0x77, y2=350, stroke="#0000ff", `stroke-width`=4)

    line(x1=100, y1=150, x2=100+255-0x99, y2=150, stroke="#00ffff", `stroke-width`=4)
    line(x1=100, y1=250, x2=100+255-0x88, y2=250, stroke="#ff00ff", `stroke-width`=4)
    line(x1=100, y1=350, x2=100+255-0x77, y2=350, stroke="#ffff00", `stroke-width`=4)

    line(x1=100+255-0x99, y1=100, x2=100+255-0x99, y2=400, stroke="black", `stroke-width`=1, `stroke-dasharray`=5)

    text(x=80, y=150, `font-family`="monospace", `text-anchor`="end"):
        t "C: #00ffff"
    text(x=80, y=250, `font-family`="monospace", `text-anchor`="end"):
        t "M: #ff00ff"
    text(x=80, y=350, `font-family`="monospace", `text-anchor`="end"):
        t "Y: #ffff00"

    text(x=375, y=150, `font-family`="monospace", `text-anchor`="start"):
        t "R: #ff0000"
    text(x=375, y=250, `font-family`="monospace", `text-anchor`="start"):
        t "G: #00ff00"
    text(x=375, y=350, `font-family`="monospace", `text-anchor`="start"):
        t "B: #0000ff"

    text(x=100+255-0x99, y=100, `font-family`="monospace", `text-anchor`="end"):
        t "K: 0x66 &#x2192;"

    text(x=100+255-0x99, y=100, `font-family`="monospace", `text-anchor`="start"):
        t "&#x2190; W: 0x99"

    text(x=455/6*1, y=425, `font-family`="monospace", `text-anchor`="middle"):
        t "R: 255-C' = 0x99"
    text(x=455/6*3, y=425, `font-family`="monospace", `text-anchor`="middle"):
        t "G: 255-M' = 0x88"
    text(x=455/6*5, y=425, `font-family`="monospace", `text-anchor`="middle"):
        t "B: 255-Y' = 0x77"
    text(x=455/2, y=450, `font-family`="monospace", `text-anchor`="middle"):
        t "W: max(R, G, B) = 255-K = 0x99"

    text(x=455/6*1, y=475, `font-family`="monospace", `text-anchor`="middle"):
        t "C': 255-R = 0x66"
    text(x=455/6*3, y=475, `font-family`="monospace", `text-anchor`="middle"):
        t "M': 255-G = 0x77"
    text(x=455/6*5, y=475, `font-family`="monospace", `text-anchor`="middle"):
        t "Y': 255-B = 0x88"

    text(x=455/6*1, y=500, `font-family`="monospace", `text-anchor`="middle"):
        t "C: C'-K = 0"
    text(x=455/6*3, y=500, `font-family`="monospace", `text-anchor`="middle"):
        t "M: M'-K = 0x11"
    text(x=455/6*5, y=500, `font-family`="monospace", `text-anchor`="middle"):
        t "Y: Y'-K = 0x22"
    text(x=455/2, y=525, `font-family`="monospace", `text-anchor`="middle"):
        t "K: min(C', M', Y') = 255-W = 0x66"
