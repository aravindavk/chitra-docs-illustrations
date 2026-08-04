/+ dub.sdl:
 dependency "chitra" path="../chitra-d"
 +/

import std.stdio;
import chitra;

void main()
{
    auto ctx = new Chitra(280, 130);
    with (ctx)
    {
        background(255);  // White background
        border(1);
        noStroke;
        
        font("American Typewriter", 20);
        // Same as above
        // font("American Typewriter");
        // fontSize(20);
        fill("blue");
        text("Hello World!", 50, 50);

        saveAs("output/customize-text.png", resolution: 72);
    }
}

