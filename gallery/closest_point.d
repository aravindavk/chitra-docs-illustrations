/+ dub.sdl:
 dependency "chitra" path="../../chitra-d"
 +/

import std.stdio;
import std.format;
import std.random;
import std.algorithm.searching : minIndex, maxIndex;

import chitra;

void main()
{
    auto ctx = new Chitra();

    auto refPoint = Point(300, 200);

    with (ctx)
    {
        background("#eeeeee");

        newTextStyle("blue").color("blue");
        newTextStyle("green").color("green");
        newTextStyle("red").color("red");

        noStroke;
        font("CMU Serif", 16);
        text(format("<u><i>Point(%s, %s)</i></u> is marked as <i><blue>blue</blue></i>, closest point to that is marked as <i><green>green</green></i> and farthest point is marked <i><red>red</red></i> below.", refPoint.x, refPoint.y), 50, 10, width - 100, 70);

        Point[] dots;
        // 42 random Points
        foreach(i; 0 .. 42)
            dots ~= Point(uniform(50, cast(int) width - 50), uniform(70, cast(int) height - 50));

        strokeWeight(10);
        foreach(dot; dots)
            point(dot);

        double[] distList;
        foreach(dot; dots)
            distList ~= dist(refPoint, dot);

        stroke("blue");
        point(refPoint);

        auto closestPt = dots[distList.minIndex];
        auto farPt = dots[distList.maxIndex];

        stroke("green");
        point(closestPt);

        stroke("red");
        point(farPt);

        saveAs("output/gallery/closest-point.png");
    }
}
