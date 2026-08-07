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
    auto firstColor = "red";
    auto secondColor = "blue";

    auto ctx = new Chitra(900, 400);
    with (ctx)
    {
        background(255);  // White background
        border(1);
        noStroke;

        font("American Typewriter", 100);
        auto txt = "Hello World!";

        auto x = 50.0;
        auto y = 30.0;

        // Vertical two colors (For each letters)
        foreach(letter; txt.byGrapheme.map!(g => g[].to!string).array)
        {
            auto s = textSize(letter);

            // First half
            fill(firstColor);
            text(letter, x, y);

            auto halfW = s.width / 2.0;

            // Within saved state and group, Use
            // the Blend mode intersection between the
            // text and the rectangle. The width of the
            // rectangle is half of the letter width
            // and height same as letter's height.
            fill(secondColor);
            saveState(group: true);
            text(letter, x, y);
            blendMode(IN);
            rect(x + halfW, y, halfW, s.height);
            restoreState;

            x += s.width;
        }

        // Horizontal two colors
        x = 50;
        y = 170;

        auto s = textSize(txt);
        auto halfH = s.height / 2.0;
        fill(firstColor);
        text(txt, x, y);

        fill(secondColor);
        saveState(group: true);
        text(txt, x, y);
        blendMode(IN);
        rect(x, y + halfH, s.width, s.height);
        restoreState;

        saveAs("output/gallery/text-two-colors.png", resolution: 72);
    }
}

