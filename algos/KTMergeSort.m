//
//  KTMergeSort.m
//  algos
//
//  Created by khanh tran on 2014-05-06.
//  Copyright (c) 2014 ktran03. All rights reserved.
//

#import "KTMergeSort.h"

@implementation KTMergeSort


-(void)mergeSort:(NSMutableArray*)arr left:(NSUInteger)left right:(NSUInteger)right{
    
    if (right-left<=1) {
        return;
    }
    
    NSUInteger leftStart = left;
    NSUInteger leftEnd = (left+right)/2;
    NSUInteger rightStart = leftEnd;
    NSUInteger rightEnd = right;
    
    [self mergeSort:arr left:leftStart right:leftEnd];
    [self mergeSort:arr left:rightStart right:rightEnd];
    
    [self mergeSortMerge:arr leftStart:leftStart leftEnd:leftEnd rightStart:rightStart rightEnd:rightEnd];
    
}

-(void)mergeSortMerge:(NSMutableArray*)arr leftStart:(NSUInteger)leftStart leftEnd:(NSUInteger)leftEnd rightStart:(NSUInteger)rightStart rightEnd:(NSUInteger)rightEnd{
    
    
    NSUInteger leftLength = leftEnd - leftStart;
    NSUInteger rightLength = rightEnd - rightStart;
    
    NSMutableArray *leftHalf = [[arr objectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(leftStart, leftLength)]] mutableCopy];
    NSMutableArray *rightHalf = [[arr objectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(rightStart, rightLength)]] mutableCopy];
    
    NSUInteger i=leftStart;
    NSUInteger l=0;
    NSUInteger r=0;
    
    for ( ; (l<leftLength && r<rightLength) ;i++) {
        
        id leftValue = [leftHalf objectAtIndex:l];
        id rightValue = [rightHalf objectAtIndex:r];
        
        if (rightValue < leftValue) {   //swap
            [arr replaceObjectAtIndex:i withObject:rightValue];
            r++;
        }
        else   {
            [arr replaceObjectAtIndex:i withObject:leftValue];
            l++;
        }
    }
    
    for ( ; l<leftLength; i++, l++) {
        id remainingVal = [leftHalf objectAtIndex:l];
        [arr replaceObjectAtIndex:i withObject:remainingVal];
    }
    for ( ; r<rightLength; i++, r++) {
        id remainingVal = [rightHalf objectAtIndex:r];
        [arr replaceObjectAtIndex:i withObject:remainingVal];
    }
    
}

@end
