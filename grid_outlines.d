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

        // First Grid
        grid(3, 2, gap: 20);
        //       X  Y  W          H
        gridSize(0, 0, width / 2, height);

        // Second Grid
        grid("g2", 3, 2, gap: 20);
        //       NAME  X          Y  W          H
        gridSize("g2", width / 2, 0, width / 2, height);

        // Grid Outline Color
        stroke("#00B9F0");

        // Solid outline for the first grid
        gridOutlines;

        // Dashed outline for the second grid
        lineDash(4);
        gridOutlines("g2");

        saveAs("output/grid-outlines.png", resolution: 72);
    }
}

