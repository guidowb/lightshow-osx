//
//  Bridging.h
//  LightShow
//
//  Created by Guido Westenberg on 11/15/20.
//

#ifndef Bridging_h
#define Bridging_h

int getSize();
unsigned int getPixel(int index);
void *compile2(const char *sourceName, const char *pattern);
void render(void *renderer, long timestamp);
void setMillis(long millis);

#endif /* Bridging_h */
