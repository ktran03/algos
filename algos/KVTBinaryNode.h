//
//  KVTBinaryNode.h
//  algos
//
//  Created by khanh tran on 2014-05-13.
//  Copyright (c) 2014 ktran03. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KVTBinaryNode : NSObject

@property(strong,nonatomic)id item;
@property(strong,nonatomic)KVTBinaryNode *parent;
@property(strong,nonatomic)KVTBinaryNode *left;
@property(strong,nonatomic)KVTBinaryNode *right;

@end
