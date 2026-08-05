/+ dub.sdl:
 dependency "chitra" path="../chitra-d"
 +/

import std.stdio;
import chitra;
import utils;

void main()
{
    auto ctx = new Chitra(400);
    with (ctx)
    {
        background(255);  // White background
        border(1);

        grid(3, 2);

        showGridLines(ctx, 3, 2);

        saveAs("output/grid.png", resolution: 72);
    }
}

