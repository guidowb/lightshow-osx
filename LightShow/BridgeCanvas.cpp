//
//  BridgeCanvas.cpp
//  LightShow
//
//  Created by Guido Westenberg on 11/15/20.
//

#include "BridgeCanvas.hpp"
#include "LightShow.h"

#include <ctime>

#define CANVAS_SIZE 1050

class BridgeCanvas : public Canvas {
private:
    RGBA pixels[CANVAS_SIZE];
    uint32_t timestamp;

public:
    virtual uint16_t getSize() { return CANVAS_SIZE; }
    virtual void setPixel(uint16_t pixel, RGBA color) {
        pixels[pixel] += color;
    }
    virtual uint32_t globalTime() { return timestamp; }
    virtual uint32_t epochTime() { return (uint32_t) std::time(nullptr); }
    RGBA getPixel(uint16_t pixel) { return pixels[pixel]; }
    void setTime(uint32_t timestamp) { this->timestamp = timestamp; }
    void erase() { for (uint16_t i = 0; i < CANVAS_SIZE; i++) pixels[i] = RGBA(0, 0, 0); }
};

static BridgeCanvas canvas;

void render(void *renderer, const uint32_t timestamp) {
    canvas.setTime(timestamp);
    canvas.erase();
    render((Renderer *) renderer, &canvas);
}

void *compile2(const char *sourceName, const char *pattern) {
    return compile(sourceName, pattern);
}

uint16_t getSize() {
    return CANVAS_SIZE;
}

uint32_t getPixel(uint16_t index) {
    return canvas.getPixel(index);
}
