//
//  KTReverseString.m
//  algos
//
//  Created by khanh tran on 2014-05-06.
//  Copyright (c) 2014 ktran03. All rights reserved.
//

#import "KTReverseString.h"

@implementation KTReverseString

-(void)reverseString:(NSMutableString*)str{
    NSMutableString *reversedString = [[NSMutableString alloc] initWithCapacity:[str length]];
    for (NSUInteger i=[str length]; i>0; i--) {
        [reversedString appendString:[str substringWithRange:NSMakeRange(i-1, 1)]];
    }
    NSLog(@"%@", reversedString);
}

@end
