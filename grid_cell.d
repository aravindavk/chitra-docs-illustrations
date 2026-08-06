/+ dub.sdl:
 dependency "chitra" path="../chitra-d"
 +/

import std.stdio;
import chitra;

void main()
{
    auto ctx = new Chitra(400, 200);
    with (ctx)
    {
        background(255);  // White background
        border(1);

        grid(3, 2, gap: 20);

        lineDash(4);
        stroke("#00B9F0");
        gridOutlines;

        fill("gold");
        auto box = gridCell(2);
        rect(box);  // Same as rect(box.x, box.y, box.width, box.height);

        saveAs("output/grid-cell.png", resolution: 72);
    }
}

