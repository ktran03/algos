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
#import "KVTRedBlackTree.h"
#import "KVTRBNode.h"

@implementation KTAppDelegate




- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application

    KVTRBNode *root = NULL;
    KVTRedBlackTree *treeInstance = [KVTRedBlackTree new];
    root = [treeInstance addNumber:@50 rootNode:root];
    root = [treeInstance addNumber:@100 rootNode:root];
    root = [treeInstance addNumber:@1 rootNode:root];
    root = [treeInstance addNumber:@25 rootNode:root];
    root = [treeInstance addNumber:@75 rootNode:root];
    root = [treeInstance addNumber:@5 rootNode:root];
    [treeInstance printTree:root depth:0];
    [treeInstance breadthFirst:root];
}
    

    
@end
