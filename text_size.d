/+ dub.sdl:
 dependency "chitra" path="../chitra-d"
 +/

import std.stdio;
import chitra;

void main()
{
    auto ctx = new Chitra(200);
    with (ctx)
    {
        background(255);  // White background
        border(1);

        noStroke;
        auto s = textSize("A");
        //   TEXT X                          Y
        text("A", (ctx.width - s.width) / 2, (ctx.height - s.height) / 2);       

        saveAs("output/text-size.png", resolution: 72);
    }
}

