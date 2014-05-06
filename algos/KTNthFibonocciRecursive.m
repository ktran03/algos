//
//  KTNthFibonocciRecursive.m
//  algos
//
//  Created by khanh tran on 2014-05-06.
//  Copyright (c) 2014 ktran03. All rights reserved.
//

#import "KTNthFibonocciRecursive.h"

@implementation KTNthFibonocciRecursive

-(NSUInteger)fibRecursize:(NSUInteger)nth{
    return nth <= 1 ? nth : ([self fibRecursize:nth-1] + [self fibRecursize:nth-2]);
}

@end
