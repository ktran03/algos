//
//  KTAppDelegate.m
//  algos
//
//  Created by khanh tran on 2014-04-30.
//  Copyright (c) 2014 ktran03. All rights reserved.
//

#import "KTAppDelegate.h"

@implementation KTAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    
    NSUInteger capacity = 20;
    NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:capacity];
    for (NSUInteger i=0; i<capacity; i++) {
       [arr addObject:[NSNumber numberWithInt:rand() % capacity]];
    }

    NSLog(@"Original Sequence\n%@", arr);
    [self selectionSort:arr];
    [self insertionSort:arr];
    [self bubbleSort:arr];
    
    
    NSString *string = @"Reverse me?";
    [self reverseString:[string mutableCopy]];
    
    [self findNthFibonocci:28];
    
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

@end
