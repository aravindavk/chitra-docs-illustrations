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
        font("American Typewriter", 10);

        auto x = 0.0;
        frameRate(10);
        foreach(i; 0 .. 60)
        {
            background(255);
            noStroke;
            fill(0);
            text("{{ currentFrame }} / {{ totalFrames }}", 10, 2);

            fill("green");
            rect(x, 20, 20);

            endFrame(clear: true);
            x += 10;
        }

        // For debugging: To inspect any frames PNG
        // keepTemporaryFrames(true);

        saveAs("output/moving-rect.gif");
        saveAs("output/moving-rect-no-loop.gif", loopAnimation: false);
    }
}
