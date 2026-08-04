/+ dub.sdl:
 dependency "chitra" path="../chitra-d"
 +/

import std.stdio;
import chitra;

void main()
{
    auto ctx = new Chitra(300, 340);
    with (ctx)
    {
        background(255);  // White background
        noStroke;

        font("Inter", 50);
        fill("black");
        text("Focus", 50, 40);

        textBackground("red");
        fill("white");
        fontSize(70);
        text("ONE", 50, 110);

        noTextBackground;
        fontSize(55);
        fill("black");
        text("Thing", 50, 210);

        saveAs("output/highlighted-text.png", resolution: 72);
    }
}
