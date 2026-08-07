/+ dub.sdl:
dependency "chitra" path="../../chitra-d"
+/
import std.format;

import chitra;

bool isPrime(ulong n)
{
    if (n <= 1) return false;

    if (n <= 3) return true;

    if (n % 2 == 0 || n % 3 == 0) return false;

    for (ulong i = 5; i * i <= n; i += 6)
    {
        if (n % i == 0 || n % (i + 2) == 0)
            return false;
    }

    return true;
}

void main()
{
    auto ctx = new Chitra(1080);

    with (ctx)
    {
        background(255);
        border(1);

        // 10x10 grid and set grid size by leaving the margin
        grid(10, 10, gap: 20);
        gridSize(30, 70, width - 90, height - 80);

        // Title
        noStroke;
        fill("black");
        textAlign(CENTER);
        font("American Typewriter", 26);
        text("Prime Numbers between 1 - 100", 0, 20, width, 100);

        textAlign(RIGHT);
        font("IBM Plex Mono", 25);
        foreach(i; 0 .. 100)
        {
            auto txt = format("%d", i + 1);
            if (isPrime(i + 1))
                txt = format("<u>%d</u>", i + 1);

            text(txt, gridCell(i + 1));
        }

        saveAs("output/gallery/prime-numbers.png", resolution: 72);
    }
}
