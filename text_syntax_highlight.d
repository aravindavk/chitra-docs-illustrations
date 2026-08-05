/+ dub.sdl:
 dependency "chitra" path="../chitra-d"
 +/

import std.stdio;
import std.file : readText;

import chitra;

string content = q"[
Hello Code

```d
import std.stdio;

void main()
{
    writeln("Hello World");
}
```

Text after the code.
]";

void main()
{
    auto ctx = new Chitra(600, 500);
    with (ctx)
    {
        background(255);  // White background
        border(1);
        noStroke;

        syntaxHighlight(true, theme: EMACS);
        text(content, 50, 50, 500, 400);

        saveAs("output/text-syntax-highlight.png", resolution: 72);
    }
}

