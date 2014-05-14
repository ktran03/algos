//
//  KVTBinaryNode.h
//  algos
//
//  Created by khanh tran on 2014-05-13.
//  Copyright (c) 2014 ktran03. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KVTBinaryNode : NSObject

@property(strong,nonatomic)NSNumber *value;

// Node's left and right children
@property(strong,nonatomic)KVTBinaryNode *left;
@property(strong,nonatomic)KVTBinaryNode *right;

@end
