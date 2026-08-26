/+ dub.sdl:
 dependency "chitra" path="../chitra-d"
 +/

import std.stdio;
import chitra;

void main()
{
    auto ctx = new Chitra(600, 40);

    with (ctx)
    {
        background(255);
        noStroke;
        font("American Typewriter", 10);

        auto x = 0.0;
        frameRate(10);
        foreach(i; 0 .. 60)
        {
            // Cover the top region with the background color and write text
            fill(255);
            rect(0, 0, width, 20);
            fill(0);
            text("{{ currentFrame }} / {{ totalFrames }}", 10, 2);

            fill("green");
            rect(x, 20, 20);

            endFrame;
            x += 10;
        }

        // For debugging: To inspect any frames PNG
        // keepTemporaryFrames(true);

        saveAs("output/expanding-rect.gif");
    }
}
