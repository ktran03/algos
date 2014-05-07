//
//  KTQuickSort.m
//  algos
//
//  Created by khanh tran on 2014-05-06.
//  Copyright (c) 2014 ktran03. All rights reserved.
//

#import "KTQuickSort.h"

@implementation KTQuickSort

-(void)quickSort:(NSMutableArray*)values lowerBound:(NSUInteger)lowerBound upperBound:(NSUInteger)upperBound
{
    NSUInteger i;
    
    if( upperBound > lowerBound )
    {
        i = [self partition:values lowerBound:lowerBound upperBound:upperBound];
        [self quickSort:values lowerBound:lowerBound upperBound:i-1];
        [self quickSort:values lowerBound:i+1 upperBound:upperBound];
    }
	
}

-(NSUInteger)partition:(NSMutableArray*)values lowerBound:(NSUInteger)lowerBound upperBound:(NSUInteger)upperBound
{
    NSUInteger left = lowerBound;
    NSUInteger right = upperBound;
    NSUInteger pivotItem = [values[lowerBound] intValue];
    
    while (left < right) {
        
        while([values[left] intValue] <= pivotItem){
            left++;
        }
        while ([values[right] intValue] > pivotItem) {
            right --;
        }
        
        if (left < right) {
            [values exchangeObjectAtIndex:left withObjectAtIndex:right];
        }
    }
    
    values[lowerBound] = values[right];
    values[right] = [NSNumber numberWithInteger:pivotItem];
    
    return right;
}

@end
