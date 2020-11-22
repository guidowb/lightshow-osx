//
//  BridgeCanvas.cpp
//  LightShow
//
//  Created by Guido Westenberg on 11/15/20.
//

#include "BridgeCanvas.hpp"
#include "LightShow.h"

#include <stdio.h>
#include <string.h>

#define CANVAS_SIZE 1050

class BridgeCanvas : public Canvas {
private:
    RGBA pixels[CANVAS_SIZE];

public:
    virtual int getSize() { return CANVAS_SIZE; }
    virtual void setPixel(int pixel, RGBA color) { pixels[pixel] = color; }
    virtual int getTimestamp() { return 0; }
    RGBA getPixel(int pixel) { return pixels[pixel]; }
};

static BridgeCanvas canvas;

void render(const char *sourceName, const char *pattern) {
    render(sourceName, pattern, &canvas);
}

int getSize() {
    return CANVAS_SIZE;
}

unsigned int getPixel(int index) {
    RGBA pixel = canvas.getPixel(index);
    return pixel;
}

