/+ dub.sdl:
 dependency "chitra" path="../chitra-d"
 +/

import std.stdio;
import std.file : readText;

import chitra;

void main()
{
    auto ctx = new Chitra(1200, 500);
    with (ctx)
    {
        background(255);  // White background
        border(1);
        noStroke;

        //   COLS ROWS GAP
        grid(4,   1,   gap: 50);
        //       X  Y   W      H
        gridSize(0, 50, width, height - 100);

        font("Inter", 12);

        textAlign(LEFT);
        text(readText("lorem_ipsum.txt"), gridCell(1));

        textAlign(CENTER);
        text(readText("lorem_ipsum.txt"), gridCell(2));

        textAlign(RIGHT);
        text(readText("lorem_ipsum.txt"), gridCell(3));

        textAlign(JUSTIFY);
        text(readText("lorem_ipsum.txt"), gridCell(4));

        // Headings
        font("Inter", 20);
        textAlign(CENTER);
        text("LEFT", shift(gridCell(1), dy: -40));
        text("CENTER", shift(gridCell(2), dy: -40));
        text("RIGHT", shift(gridCell(3), dy: -40));
        text("JUSTIFY", shift(gridCell(4), dy: -40));

        saveAs("output/text-align.png", resolution: 72);
    }
}

