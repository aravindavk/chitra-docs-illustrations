/+ dub.sdl:
 dependency "chitra" path="../chitra-d"
 +/

import std.stdio;
import chitra;

void main()
{
    auto ctx = new Chitra(400);
    with (ctx)
    {
        background(255);  // White background
        border(1);

        grid(3, 2, gap: 20);

        //       X    Y    W    H
        gridSize(130, 130, 240, 240);

        lineDash(4);
        stroke("#00B9F0");
        gridOutlines;

        saveAs("output/grid-position.png", resolution: 72);
    }
}

