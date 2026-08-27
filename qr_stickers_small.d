/+ dub.sdl:
 dependency "chitra" path="../chitra-d"
 +/

import std.stdio;
import chitra;

void main()
{
    auto m = 2.1; // Multiplier
    string txt = "https://github.com/aravindavk/chitra-d/wiki";
    auto ctx = new Chitra(210 * m, 297 * m);
    with (ctx)
    {
        background("white");
        border(1);
        fill("white");
        stroke("black");

        grid(4, 6);
        gridSize(15 * m, 13.5 * m, width - 30 * m, height - 27 * m);
        foreach(i; 0 .. 4 * 6)
        {
            // Each grid cell size is 45mm, use QR size as 40mm
            auto box = gridCell(i+1).inset(dx: 2.5 * m, dy: 2.5 * m);
            qrImage(txt, box);
        }

        stroke(100);
        gridOutlines;

        saveAs("output/qr-print-small.png");
    }
}
