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

        grid(2, 2, gap: 20);
        showGridLines(ctx, 2, 2);

        auto box2 = gridCell(2);

        grid("sub", 7, 1);
        gridSize("sub", box2.x, box2.y, box2.width, box2.height);
        showGridLines(ctx, 7, 1, name: "sub");

        auto colors = [
            "#9400D3",   // Violet
            "#4B0082",   // Indigo
            "#0000FF",   // Blue
            "#00FF00",   // Green
            "#FFFF00",   // Yellow
            "#FF7F00",   // Orange
            "#FF0000"    // Red
            ];

        foreach(i; 0 .. 7)
        {
            fill(colors[i]);
            rect(gridCell("sub", i + 1));
        }

        saveAs("output/named-grid.png", resolution: 72);
    }
}

