void showGridLines(Chitra)(Chitra ctx, int cols, int rows, string name = "default")
{
    // Show grid outlines
    ctx.noFill;
    ctx.stroke("#ffc6ff");
    foreach(i; 0 .. cols * rows)
        ctx.rect(ctx.gridCell(name, i+1));
}
