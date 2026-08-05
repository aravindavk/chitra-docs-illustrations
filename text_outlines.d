/+ dub.sdl:
 dependency "chitra" path="../chitra-d"
 +/

import std.stdio;
import chitra;

void main()
{
    auto ctx = new Chitra(400, 160);
    with (ctx)
    {
        background(255);  // White background
        border(1);
        noFill;

        stroke("blue");
        font("Inter", 40);
        text("Hello World!", 50, 50);

        saveAs("output/text-outline.png", resolution: 72);
    }
}

