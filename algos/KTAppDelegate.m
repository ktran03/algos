//
//  KTAppDelegate.m
//  algos
//
//  Created by khanh tran on 2014-04-30.
//  Copyright (c) 2014 ktran03. All rights reserved.
//

#import "KTAppDelegate.h"

@implementation KTAppDelegate{

}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    
    NSMutableArray *arrayToSort = [[NSMutableArray alloc] initWithArray:@[@7,@49,@2,@100,@14,@522]];
    NSLog(@"Original Sequence\n%@", arrayToSort);
    
    [self mergeSort:arrayToSort left:0 right:([arrayToSort count])];
    NSLog(@"%@", arrayToSort);
//
//    [self selectionSort:arrayToSort];
//    [self insertionSort:arrayToSort];
//    [self bubbleSort:arrayToSort];
//    
//    NSString *string = @"Reverse me?";
//    [self reverseString:[string mutableCopy]];
//    
//    [self findNthFibonocci:28];
//    NSLog(@"%lu", (unsigned long)[self fibRecursize:28]);
//    
//    [self logTimeTable:12];
    
}

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
    
    NSMutableArray *leftHalf = [[NSMutableArray alloc] initWithCapacity:leftLength];
    NSMutableArray *rightHalf = [[NSMutableArray alloc] initWithCapacity:rightLength];
    
    NSUInteger i=0;
    NSUInteger l=0;
    NSUInteger r=0;
    
    for (i=leftStart; i<leftEnd; i++, l++) {
        [leftHalf insertObject:[arr objectAtIndex:i] atIndex:l];
    }
    
    for (i=rightStart; i<rightEnd; i++, r++) {
        [rightHalf insertObject:[arr objectAtIndex:i] atIndex:r];
    }
    
    for (i=leftStart, l=0, r=0; (l<leftLength && r<rightLength) ;i++) {
        
        if ([[leftHalf objectAtIndex:l] intValue] < [[rightHalf objectAtIndex:r] intValue]) {
            [arr replaceObjectAtIndex:i withObject:[leftHalf objectAtIndex:l]];
            l++;
        }
        else   {
            [arr replaceObjectAtIndex:i withObject:[rightHalf objectAtIndex:r]];
            r++;
        }
    }
    
    for ( ; l<leftLength; i++, l++) {
        [arr replaceObjectAtIndex:i withObject:[leftHalf objectAtIndex:l]];
    }
    for ( ; r<rightLength; i++, r++) {
        [arr replaceObjectAtIndex:i withObject:[rightHalf objectAtIndex:r]];
    }
    
}

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

-(void)reverseString:(NSMutableString*)str{
    NSMutableString *reversedString = [[NSMutableString alloc] initWithCapacity:[str length]];
    for (NSUInteger i=[str length]; i>0; i--) {
        [reversedString appendString:[str substringWithRange:NSMakeRange(i-1, 1)]];
    }
    NSLog(@"%@", reversedString);
}

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

-(NSUInteger)fibRecursize:(NSUInteger)nth{
    return nth <= 1 ? nth : ([self fibRecursize:nth-1] + [self fibRecursize:nth-2]);
}

-(void)logTimeTable:(NSUInteger)val{
    
    for (int i=0; i<=val; i++) {
        NSMutableString *line = [[NSMutableString alloc] init];
        for (int e=0; e<=val; e++) {
            [line appendString:[NSString stringWithFormat:@"%d ", (e+i)]];
        }
        NSLog(@"%@", line);
    }
}

@end
