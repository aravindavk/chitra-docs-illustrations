/+ dub.sdl:
 dependency "chitra" path="../chitra-d"
 +/

import std.stdio;
import chitra;

void main()
{
    auto ctx = new Chitra(300);
    with (ctx)
    {
        background(255);  // White background
        border(1);

        noStroke;

        font("Gubbi", 24);
        text("ಚಿತ್ರ ಕ್ಕೆ ಕನ್ನಡದಲ್ಲಿ ಬರೆಯೋದಕ್ಕೆ ಬರುತ್ತದೆ.", 50, 50, 200, 200);

        saveAs("output/text-unicode-kannada.png", resolution: 72);
    }
}

