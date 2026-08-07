/+ dub.sdl:
 dependency "chitra" path="../../chitra-d"
 +/

import std.stdio;
import chitra;

string code = q"[```d
// Create a Paper with size 700x700 and
// draw a blue rectangle. Save it as hello.png

import chitra;

void main()
{
    auto ctx = new Chitra(700);
    with (ctx)
    {
        fill("blue");
        //   X    Y    W    H
        rect(100, 200, 500, 100);
        saveAs("hello.png", resolution: 72);
    }
}

```
]";

void main()
{
    auto title = "chitra - D";
    auto titleBarHeight = 42;
    auto terminalBg = "#002b36";
    auto terminalTitleBg = "#13161e";
    auto titleColor = "gray";
    auto closeBtnColor = "#ff5f57";
    auto minimizeBtnColor = "#febc2e";
    auto restoreBtnColor = "#28c840";
    auto terminalX = 50.0;
    auto terminalY = 50.0;
    auto terminalWidth = 600.0;
    auto terminalHeight = 410.0;
    auto contentGapX = 20.0;
    auto contentGapY = 20.0;
    auto contentX = terminalX + contentGapX;
    auto contentY = terminalY + titleBarHeight + contentGapY;
    auto contentWidth = terminalWidth - 2 * contentGapX;
    auto contentHeight = terminalHeight - titleBarHeight - 2 * contentGapY;

    auto ctx = new Chitra;
    with (ctx)
    {
        // Find the text size with the exact same setting of the final text
        syntaxHighlight(true, theme: SOLARIZED_DARK);
        lineHeight(0.9);
        fontSize(14);
        auto s = textSize(code, contentWidth);

        noStroke;

        terminalHeight = s.height + 2 * contentGapY;
        contentHeight = terminalHeight - titleBarHeight - 2 * contentGapY;

        fill(terminalBg);
        rect(terminalX, terminalY, terminalWidth, terminalHeight, r: 10);

        fill(terminalTitleBg);
        rect(terminalX, terminalY, terminalWidth, titleBarHeight, rtl: 10, rtr: 10);

        fill(closeBtnColor);
        circle(terminalX + 30, terminalY + 20, 16);

        fill(minimizeBtnColor);
        circle(terminalX + 30 + 16 + 10, terminalY + 20, 16);

        fill(restoreBtnColor);
        circle(terminalX + 30 + 16 + 10 + 16 + 10, terminalY + 20, 16);

        textAlign(CENTER);
        font("American Typewriter", 12);
        fill(titleColor);
        text(title, terminalX, terminalY + 10, terminalWidth, titleBarHeight);

        // Reset color to Black
        fill(0);
        textAlign(LEFT);

        fontSize(14);
        text(code, contentX, contentY, contentWidth, contentHeight);

        saveAs("output/gallery/terminal.png", resolution: 72);
    }
}

