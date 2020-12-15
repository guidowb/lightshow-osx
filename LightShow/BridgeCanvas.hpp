//
//  BridgeCanvas.hpp
//  LightShow
//
//  Created by Guido Westenberg on 11/15/20.
//

#ifndef BridgeCanvas_hpp
#define BridgeCanvas_hpp

#include <stdlib.h>
#include <stdio.h>

extern "C" {
    uint16_t getSize();
    uint32_t getPixel(uint16_t index);
    void *compile2(const char *sourceName, const char *pattern);
    void render(void *renderer, uint32_t timestamp);
    void setMillis(uint32_t millis);
};

#endif /* BridgeCanvas_hpp */
