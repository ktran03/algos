//
//  KTAppDelegate.m
//  algos
//
//  Created by khanh tran on 2014-04-30.
//  Copyright (c) 2014 ktran03. All rights reserved.
//

#import "KTAppDelegate.h"
#import "KTMergeSort.h"
#import "KTQuickSort.h"
#import "KTSelectionSort.h"
#import "KTInsertionSort.h"
#import "KTBubbleSort.h"
#import "KTReverseString.h"
#import "KTNthFibonocci.h"
#import "KTNthFibonocciRecursive.h"
#import "KTPrintTimeTable.h"
#import "KTHashTable.h"


@implementation KTAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    

    KTHashTable *hashTable = [KTHashTable new];
    [hashTable insertValue:@"hello" forKey:@"hello-key"];
    
    
//    NSMutableArray *arrayToSort = [[NSMutableArray alloc] initWithArray:@[@7,@49,@2]];
//    NSLog(@"Original Sequence\n%@", arrayToSort);
//    
//    KTQuickSort *quickSortInstance = [KTQuickSort new];
//    [quickSortInstance quickSort:arrayToSort lowerBound:0 upperBound:[arrayToSort count]-1];
//    
//    NSLog(@"%@", arrayToSort);
    

//    KTBubbleSort *bubbleSortInstance = [KTBubbleSort new];
//    [bubbleSortInstance bubbleSort:arrayToSort];
//
//    KTSelectionSort *selectionSortInstance = [KTSelectionSort new];
//    [selectionSortInstance selectionSort:arrayToSort];
//    
//    KTInsertionSort *insertionSortInstance = [KTInsertionSort new];
//    [insertionSortInstance insertionSort:arrayToSort];

//    KTMergeSort *mergeSortInstance = [KTMergeSort new];
//    [mergeSortInstance mergeSort:arrayToSort left:0 right:([arrayToSort count])];
//    NSLog(@"%@", arrayToSort);
    
//    NSString *string = @"Reverse me?";
//    KTReverseString *reverseStringInstance = [KTReverseString new];
//    [reverseStringInstance reverseString:[string mutableCopy]];
//    
//    KTNthFibonocci *nthFibInstance = [KTNthFibonocci new];
//    [nthFibInstance findNthFibonocci:10];
//    
//    KTNthFibonocciRecursive *nthFibRecuInstance = [KTNthFibonocciRecursive new];
//    [nthFibRecuInstance fibRecursize:10];
//    
//    KTPrintTimeTable *printTimeTableInstance = [KTPrintTimeTable new];
//    [printTimeTableInstance logTimeTable:12];
    
}

@end
