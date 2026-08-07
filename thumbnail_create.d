/+ dub.sdl:
 dependency "chitra" path="../chitra-d"
 +/

import std.stdio;
import std.format : format;
import std.path : baseName;

import chitra;

int main(string[] args)
{
    if (args.length != 2)
    {
        writeln("Input PNG image not provided\n");
        writeln("Usage:\n\ndub thumbnail_create.d <filename.png>\n");
        return 1;
    }

    auto maxWidth = 400.0;
    auto ctx = new Chitra();
    with (ctx)
    {
        auto s = imageSize(args[1]);
        auto scl = maxWidth / s.width;
        auto newImgH = s.height * scl;

        // Set the canvas size to new size
        // based on the input image size
        size(maxWidth, newImgH);
        scale(scl);
        image(args[1], 0, 0);

        saveAs(format("output/thumbs/%s", baseName(args[1])), resolution: 72);
        writeln(format("Thumbnail image saved to 'output/thumbs/%s'", baseName(args[1])));
    }

    return 0;
}

