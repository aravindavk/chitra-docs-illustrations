#!/usr/bin/env dub
/+ dub.sdl:
dependency "chitra" path="../../chitra-d"
+/

import std.array : split;
import std.algorithm.searching : canFind;

import chitra;

void main()
{
    auto ctx = new Chitra(800, 600);

    with (ctx)
    {
        background("#9BCD30");
        border(1);

        stroke(0);
        grid(7, 4, gap: 20);

        font("American Typewriter", 50);
        textAlign(CENTER);
        auto letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split("");
        auto vowels = "AEIOU";
        foreach(i; 0 .. 26)
        {
            fill("black");
            if (vowels.canFind(letters[i]))
                fill("blue");

            text(letters[i], gridCell(i + 1).shift(dy: 20));
        }

        saveAs("output/gallery/vowels.png", resolution: 72);
    }
}
