//
//  KTPrintTimeTable.m
//  algos
//
//  Created by khanh tran on 2014-05-06.
//  Copyright (c) 2014 ktran03. All rights reserved.
//

#import "KTPrintTimeTable.h"

@implementation KTPrintTimeTable

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
