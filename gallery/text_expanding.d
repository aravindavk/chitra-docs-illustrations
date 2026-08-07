/+ dub.sdl:
 dependency "chitra" path="../../chitra-d"
 +/

import std.stdio;
import std.conv : to;
import std.algorithm : map;
import std.uni : byGrapheme;
import std.array;

import chitra;

void main()
{
    auto ctx = new Chitra(1250, 160);
    with (ctx)
    {
        background(255);  // White background
        border(1);
        noStroke;

        font("Inter", 50);
        fill("sapphireblue");
        auto txt = "DRAW WITH CHITRA";

        auto x = 50.0;
        auto y = 30.0;
        auto sc = 0.25; // Initial Scale

        foreach(letter; txt.byGrapheme.map!(g => g[].to!string).array)
        {
            // Find size before applying the scale
            auto s = textSize(letter);

            // Apply scale within saved state
            saveState();
            scale(sc, 1);
            text(letter, x / sc, y);
            restoreState;

            x += s.width * sc - 7 * sc;
            sc += 0.25;
        }

        saveAs("output/gallery/text-expanding.png", resolution: 72);
    }
}

