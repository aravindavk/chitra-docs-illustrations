/+ dub.sdl:
 dependency "chitra" path="../chitra-d"
 +/

import std.stdio;
import chitra;

void main()
{
    string txt = "https://github.com/aravindavk/chitra-d/wiki";
    auto ctx = new Chitra(400);
    with (ctx)
    {
        fill("white");
        stroke("blue");
        //      TEXT                                           X    Y    W
        qrImage("https://github.com/aravindavk/chitra-d/wiki", 100, 100, 200);

        saveAs("output/qr-example.png");
    }
}
