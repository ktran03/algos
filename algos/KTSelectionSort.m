//
//  KTSelectionSort.m
//  algos
//
//  Created by khanh tran on 2014-05-06.
//  Copyright (c) 2014 ktran03. All rights reserved.
//

#import "KTSelectionSort.h"

@implementation KTSelectionSort

-(void)selectionSort:(NSMutableArray*)arr{
    __block NSUInteger minIndex;
    [arr enumerateObjectsUsingBlock:^(NSNumber *num, NSUInteger index, BOOL *stop) {
        minIndex = index;
        for (NSUInteger i=index+1; i<[arr count]; i++) {
            if ([(NSNumber*)[arr objectAtIndex:i] intValue] > [(NSNumber*)[arr objectAtIndex:minIndex] intValue] ){
                minIndex = i;
            }
        }
        [arr exchangeObjectAtIndex:index withObjectAtIndex:minIndex];
    }];
    NSLog(@"selection sort\n%@", arr);
}

@end
