//
//  KVTBinaryTree.m
//  algos
//
//  Created by khanh tran on 2014-05-13.
//  Copyright (c) 2014 ktran03. All rights reserved.
//

#import "KVTBinaryTree.h"
#import "KVTBinaryNode.h"

@implementation KVTBinaryTree

-(KVTBinaryTree*)initWithValue:(NSNumber*)val{
    self = [super init];
    if (self) {
        self.root = [KVTBinaryNode new];
        self.root.value = val;
        self.root.left = NULL;
        self.root.right = NULL;
    }
    return self;
}

#pragma mark - Insertion

@end
