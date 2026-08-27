/+ dub.sdl:
 dependency "chitra" path="../chitra-d"
 +/

import std.stdio;
import chitra;

void main()
{
    string txt = "https://github.com/aravindavk/chitra-d/wiki";
    auto ctx = new Chitra("a4");
    with (ctx)
    {
        background("white");
        fill("white");
        stroke("black");

        grid(4, 6);
        gridSize(15.mm, 13.5.mm, width - 30.mm, height - 27.mm);
        foreach(i; 0 .. 4 * 6)
        {
            // Each grid cell size is 45mm, use QR size as 40mm
            auto box = gridCell(i+1).inset(dx: 2.5.mm, dy: 2.5.mm);
            qrImage(txt, box);
        }

        stroke(100);
        gridOutlines;

        saveAs("output/qr-print.pdf");
    }
}
