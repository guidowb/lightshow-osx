//
//  BridgeCanvas.hpp
//  LightShow
//
//  Created by Guido Westenberg on 11/15/20.
//

#ifndef BridgeCanvas_hpp
#define BridgeCanvas_hpp

#include <stdio.h>

extern "C" {
    int getSize();
    unsigned int getPixel(int index);
    void render(char *pattern);
};

#endif /* BridgeCanvas_hpp */
