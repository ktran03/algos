//
//  KVTRedBlackTree.h
//  algos
//
//  Created by khanh tran on 2014-05-14.
//  Copyright (c) 2014 ktran03. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KVTRBNode.h"

@interface KVTRedBlackTree : NSObject

-(KVTRBNode*)addNumber:(NSNumber*)value rootNode:(KVTRBNode*)root;

-(void)printTree:(KVTRBNode*)node depth:(NSUInteger)depth;
-(KVTRBNode*)addNumber:(NSNumber*)value currentNode:(KVTRBNode*)currentNode parentNode:(KVTRBNode*)parentNode;
-(void)breadthFirst:(KVTRBNode*)root;
-(void)depthFirstPreOrderRecursive:(KVTRBNode*)node;
-(void)depthFirstInOrderRecursive:(KVTRBNode*)node;
-(void)depthFirstPostOrderRecursive:(KVTRBNode*)node;

@end
