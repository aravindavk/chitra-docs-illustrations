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

        grid(2, 2, gap: 20);
        auto box2 = gridCell(2);

        grid("sub", 7, 1);
        gridSize("sub", box2.x, box2.y, box2.width, box2.height);

        lineDash(4);

        // Default grid outline
        stroke("#00B9F0");
        gridOutlines;

        // Sub grid outline
        stroke("black");
        gridOutlines("sub");

        auto colors = [
            "#9400D3",   // Violet
            "#4B0082",   // Indigo
            "#0000FF",   // Blue
            "#00FF00",   // Green
            "#FFFF00",   // Yellow
            "#FF7F00",   // Orange
            "#FF0000"    // Red
            ];

        noStroke;
        foreach(i; 0 .. 7)
        {
            fill(colors[i]);
            rect(gridCell("sub", i + 1).inset(4, 4));
        }

        saveAs("output/named-grid.png", resolution: 72);
    }
}

