//
//  KTNthFibonocci.m
//  algos
//
//  Created by khanh tran on 2014-05-06.
//  Copyright (c) 2014 ktran03. All rights reserved.
//

#import "KTNthFibonocci.h"

@implementation KTNthFibonocci

-(void)findNthFibonocci:(NSUInteger)nth{
    NSUInteger previousFib = 0;
    NSUInteger middleFib = 1;
    NSUInteger nextFib = 1;
    
    for (NSUInteger i=0; i<nth; i++) {
        NSUInteger tempNextFib = nextFib;
        nextFib += middleFib;
        NSUInteger tempMiddleFib = middleFib;
        middleFib = tempNextFib;
        previousFib = tempMiddleFib;
    }
    
    NSLog(@"%luth fibonocci = %lu", (unsigned long)nth, (unsigned long)previousFib);
}


@end
