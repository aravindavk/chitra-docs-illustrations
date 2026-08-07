#!/usr/bin/env dub
/+ dub.sdl:
dependency "chitra" path="../../chitra-d"
+/

import chitra;

void drawCar(Chitra ctx, double r, double g, double b, double a = 1.0)
{
    with (ctx)
    {
        // Top
        fill(0.7);
        rect(100, 0, 200, 100);

        circle(50, 0, 100);
        circle(250, 0, 100);

        fill(r, g, b, a);
        // Body
        rect(50, 70, 300, 100);
        circle(0, 70, 100);
        circle(300, 70, 100);

        fill(0.5);
        // Left wheel
        circle(50, 120, 100);
        circle(250, 120, 100);
    }
}

void main()
{
    auto ctx = new Chitra(1500, 400);

    with (ctx)
    {
        // Use the Color and Alpha scale 0.0 - 1.0
        colorScale(1);

        // Set Origin(x, y) of Ovals/Circles to Corner
        ovalMode(CORNER);

        background(1);
        border(1);

        noStroke;

        // Ground
        fill("brown", 0.5);
        rect(0, 270, width, height - 270);

        // First car
        translate(50, 50);
        drawCar(ctx, 0.5, 0, 0);

        // Second car
        translate(500, 0);
        drawCar(ctx, 0, 0, 1);

        // Third car
        translate(500, 0);
        drawCar(ctx, 0, 0, 0.5);

        saveAs("output/gallery/cars2.png", resolution: 72);
    }
}
