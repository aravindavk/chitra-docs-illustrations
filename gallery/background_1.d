#!/usr/bin/env dub
/+ dub.sdl:
 dependency "chitra" path="../../chitra-d"
+/

import chitra;

void main()
{
    auto ctx = new Chitra(1280, 960);

    with (ctx)
    {
        noStroke;

        background("#3e8ed0");

        fill("#6ea8da");

        circle(300, 150, 700);

        saveAs("output/gallery/background-1.png");
    }
}
