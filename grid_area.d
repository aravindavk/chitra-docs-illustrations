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

        grid(4, 4, gap: 20);
        showGridLines(ctx, 4, 4);

        fill("gold");
        auto box = gridArea(7, 12);
        rect(box);  // Same as rect(box.x, box.y, box.width, box.height);

        saveAs("output/grid-area.png", resolution: 72);
    }
}

