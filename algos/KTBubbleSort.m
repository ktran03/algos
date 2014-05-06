//
//  KTBubbleSort.m
//  algos
//
//  Created by khanh tran on 2014-05-06.
//  Copyright (c) 2014 ktran03. All rights reserved.
//

#import "KTBubbleSort.h"

@implementation KTBubbleSort

-(void)bubbleSort:(NSMutableArray*)arr{
    for (NSUInteger k=arr.count; k>0; k--) {
        for (NSUInteger i=0; i<k-1; i++) {
            if ([[arr objectAtIndex:i] intValue] > [[arr objectAtIndex:i+1] intValue]) {
                [arr exchangeObjectAtIndex:i withObjectAtIndex:i+1];
            }
        }
    }
    NSLog(@"bubble sort\n%@", arr);
}


@end
