//
//  KVTRBNode.h
//  algos
//
//  Created by khanh tran on 2014-05-14.
//  Copyright (c) 2014 ktran03. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KVTRBNode : NSObject

@property(strong,nonatomic)KVTRBNode *parent;
@property(strong,nonatomic)KVTRBNode *left;
@property(strong,nonatomic)KVTRBNode *right;

@property(strong,nonatomic)NSNumber *value;
@property(strong,nonatomic)NSString *color;


@end
