//
//  KVTBinaryNode.m
//  algos
//
//  Created by khanh tran on 2014-05-13.
//  Copyright (c) 2014 ktran03. All rights reserved.
//

#import "KVTBinaryNode.h"

@implementation KVTBinaryNode

-(id) init
{
    [self setLeft:nil];
    [self setRight:nil];
    return self;
}

-(id) initWithValue:(NSNumber*)value
{
    [self setLeft:nil];
    [self setRight:nil];
    [self setValue:value];
    
    return self;
}

@end
