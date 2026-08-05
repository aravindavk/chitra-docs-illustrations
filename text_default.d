/+ dub.sdl:
 dependency "chitra" path="../chitra-d"
 +/

import std.stdio;
import chitra;

void main()
{
    auto ctx = new Chitra(250, 130);
    with (ctx)
    {
        background(255);  // White background
        border(1);

        noStroke;

        text("Hello World!", 50, 50);

        saveAs("output/text-default.png", resolution: 72);
    }
}

