//
//  KTInsertionSort.m
//  algos
//
//  Created by khanh tran on 2014-05-06.
//  Copyright (c) 2014 ktran03. All rights reserved.
//

#import "KTInsertionSort.h"

@implementation KTInsertionSort

-(void)insertionSort:(NSMutableArray*)arr{
    NSUInteger j;
    for (NSUInteger i=0; i<[arr count]; i++) {
        j=i;
        while (j>0 && ([[arr objectAtIndex:j] intValue] > [[arr objectAtIndex:j-1] intValue])) {
            [arr exchangeObjectAtIndex:j withObjectAtIndex:j-1];
            j--;
        }
    }
    NSLog(@"insertion sort\n%@", arr);
}
@end
