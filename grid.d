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

        grid(3, 2);

        lineDash(4);
        stroke("#00B9F0");
        gridOutlines;

        saveAs("output/grid.png", resolution: 72);
    }
}

