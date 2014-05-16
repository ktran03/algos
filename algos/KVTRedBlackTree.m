//
//  KVTRedBlackTree.m
//  algos
//
//  Created by khanh tran on 2014-05-14.
//  Copyright (c) 2014 ktran03. All rights reserved.
//

#import "KVTRedBlackTree.h"

/**
 *
 1. A node is either red or black.
 2. The root is black.
 3. All leaves (NIL) are black.
 4. Every red node must have two black child nodes.
 5. Every path from a given node to any of its descendant leaves contains the same number of black nodes.
 */

@implementation KVTRedBlackTree

#pragma marks - tree traversal methods
/**
 *  Breadth first traversal
 *
 *  @param root node
 */
-(void)breadthFirst:(KVTRBNode*)root{
    NSMutableArray *queue = [NSMutableArray new];
    [queue addObject:root];
    
    while ([queue count] > 0) {
        
        KVTRBNode *node = [queue firstObject];
        [queue removeObjectAtIndex:0];
        
        [self visitNode:node];
        
        if (node.left) {
            [queue addObject:node.left];
        }
        if (node.right) {
            [queue addObject:node.right];
        }
    }
}

/**
 *  Depth first traversal, pre order. (top, left, right)
 *
 *  @param node node
 */
-(void)depthFirstPreOrderRecursive:(KVTRBNode*)node{
    if (!node) {
        return;
    }
    [self visitNode:node];
    [self depthFirstPreOrderRecursive:node.left];
    [self depthFirstPreOrderRecursive:node.right];
}

-(void)visitNode:(KVTRBNode*)node{
    NSLog(@"%@", node.value);
}

#pragma marks - tree print methods
/**
 *  Print tree
 *
 */
-(void)printTree:(KVTRBNode*)node depth:(NSUInteger)depth{
    // If the left child exists, print its tree
    if (node.left){
        [self printTree:node.left depth:depth+1];
    }
    // Print the root in order
    [self printBranch:node depth:depth];
    // If the right child exists, print its tree
    if (node.right){
        [self printTree:node.right depth:depth+1];
    }
}

/**
 *  Print branch
 *
 */
-(void)printBranch:(KVTRBNode*)node depth:(NSUInteger)depth{
    // Declarations
    int i = 0;
    
    // Prints out a long branch
    NSMutableString *str = [NSMutableString new];
    for(i = 0; i < depth; i++){
        [str appendString:@"-"];
    }
    // After the branch is printed, display the info
    NSLog(@"%@<%@[%@]\n", str, node.value, node.color);
}

/**
 *  Recursive method to get pointer to root
 *
 *
 *  @return root node
 */
-(KVTRBNode*)findRoot:(KVTRBNode*)current{
    if (current.parent){
        return [self findRoot:current.parent];
    }
    else{
        return current;
    }
}

/**
 *  Extern use, add number given root of tree
 *
 *  @param value number
 *  @param root  root
 *
 *  @return node
 */
-(KVTRBNode*)addNumber:(NSNumber*)value rootNode:(KVTRBNode*)root{
    return [self addNumber:value currentNode:root parentNode:nil];
}

/**
 *  Recursive method to add a number to the rbtree. Calls itself until reaching a base case, where currentNode is nil (none).
 *
 *
 *  @return root node
 */
-(KVTRBNode*)addNumber:(NSNumber*)value currentNode:(KVTRBNode*)currentNode parentNode:(KVTRBNode*)parentNode{
    
    // Recursion base case
    if (!currentNode) {
        currentNode = [KVTRBNode new];
        currentNode.parent = parentNode;
        currentNode.left = NULL;
        currentNode.right = NULL;
        currentNode.value = value;
        currentNode.color = @"red";
        
        if (currentNode.parent && (currentNode.value < parentNode.value)) {
            parentNode.right = currentNode;
        }
        else if(currentNode.parent){
            parentNode.left = currentNode;
        }
        
        [self insertCase1:currentNode];
        return [self findRoot:currentNode];
    }
    
    else if (currentNode.value == value){
        //dupe
        return currentNode;
    }
    
    else if (currentNode.value < value){
        [self addNumber:value currentNode:currentNode.left parentNode:currentNode];
        return currentNode;
    }
    
    else if (currentNode.value > value){
        [self addNumber:value currentNode:currentNode.right parentNode:currentNode];
        return currentNode;
    }
    
    return NULL;
}

#pragma marks - tree balancing methods

/**
 *  Current node is root, paint black satisfies property 2
 *
 *  @param currentNode node
 */
-(void)insertCase1:(KVTRBNode*)currentNode{
    KVTRBNode *parent = currentNode.parent;
    if (!parent) {
        currentNode.color = @"black";
        return;
    }
    else{
        [self insertCase2:currentNode];
        return;
    }
}

/**
 *  Current node parent is black (property 4 not invalidated, thus tree is valid, return it),
 *  if not move on to next case
 *  @param currentNode node
 */
-(void)insertCase2:(KVTRBNode*)currentNode{
    //case 2 if parent is black
    KVTRBNode *parent = currentNode.parent;
    if ([parent.color isEqualToString:@"black"]) {
        return;
    }
    else{
        [self insertCase3:currentNode];
    }
    return;
}

/**
 *  If both parent an uncle are red, then repaint them black, then repaint grandparent red
 *  but grandpa could possibly violate property 2 or 4. So entire procedure recursively performed
 *  on grandpa to fix this. Else go to case 4.
 *  @param currentNode node
 */
-(void)insertCase3:(KVTRBNode*)currentNode{
    KVTRBNode *parent = currentNode.parent;
    KVTRBNode *grandParent = currentNode.parent.parent;
    KVTRBNode *uncle = [self uncle:currentNode];
    if (uncle && [uncle.color isEqualToString:@"red"] && [parent.color isEqualToString:@"red"]){
        // Recolor the uncle, the parent, and the grandparent
        uncle.color = @"black";
        parent.color = @"black";
        grandParent.color = @"red";
        [self insertCase1:grandParent];
    }
    else{
        [self insertCase4:currentNode];
    }
}

/**
 *  If currentNode is right child of Parent, and Parent is left child of Grandparent,
 *  then do a left rotation on Parent, which switches places of currentNode & Parent.
 *
 *  @param currentNode node
 */
-(void)insertCase4:(KVTRBNode*)currentNode{
    KVTRBNode *parent = currentNode.parent;
    KVTRBNode *grandParent = currentNode.parent.parent;
    
    if (grandParent.left == currentNode.parent && currentNode == currentNode.parent.right) {
        [self leftRotation:parent];
        [self insertCase5:currentNode];
    }
    else if (grandParent.right == parent && currentNode == parent.left){
        [self rightRotation:parent];
        [self insertCase5:currentNode];
    }
    else{
        [self insertCase5:parent];
    }
}

/**
 *  Case for Parent red, Uncle is black, currentNode is left child of it's parent. Different rotations for currentNode being left or right of parent.
 *
 *  @param currentNode node
 */
-(void)insertCase5:(KVTRBNode*)currentNode{
    KVTRBNode *parent = currentNode.parent;
    
    if (currentNode == parent.left) {
        [self rightRotation:parent];
        currentNode.color = @"black";
        currentNode.right.color = @"red";
    }
    else{
        [self leftRotation:parent];
        currentNode.color = @"black";
        currentNode.left.color = @"red";
    }
}

#pragma marks - Rotation methods

/**
 *  Left rotation
 *
 *  @param currentNode node
 */
-(void)leftRotation:(KVTRBNode*)currentNode{
    KVTRBNode *parent = currentNode.parent;
    KVTRBNode *currentNodeCopy = currentNode;
    KVTRBNode *currentNodeRight = currentNode.right;
    KVTRBNode *currentNodeLeft = currentNodeRight.left;

    if (parent) {
        parent.left = currentNodeRight;
    }
    currentNodeRight.parent = parent;
    currentNodeRight.left = currentNodeCopy;
    currentNodeCopy.parent = currentNodeRight;

    currentNodeCopy.right = currentNodeLeft;

    if (currentNodeLeft) {
        currentNodeLeft.parent = currentNodeCopy;
    }
}

/**
 *  Right rotation
 *
 *  @param currentNode node
 */
-(void)rightRotation:(KVTRBNode*)currentNode{
    KVTRBNode *parent = currentNode.parent;
    KVTRBNode *currentCopy = currentNode;
    KVTRBNode *currentLeft = currentNode.left;
    KVTRBNode *currentRight = currentLeft.right;

    if (parent) {
        parent.right = currentLeft;
    }
    currentLeft.parent = parent;
    currentLeft.right = currentCopy;
    currentCopy.parent = currentLeft;

    currentCopy.left = currentRight;

    if (currentRight) {
        currentRight.parent = currentCopy;
    }

}

#pragma marks - Helper methods

/**
 *  Get pointer to grandParent
 *
 *
 *  @return grandparent
 */
-(KVTRBNode*)grandParent:(KVTRBNode*)currentNode{
    if (currentNode.parent) {
        return currentNode.parent.parent;
    }
    return NULL;
}

/**
 *  Get pointer to uncle
 *
 *
 *  @return uncle
 */
-(KVTRBNode*)uncle:(KVTRBNode*)currentNode{
    KVTRBNode *grandParent = [self grandParent:currentNode];
    if (!grandParent) {
        return NULL;
    }
    if (currentNode.parent == grandParent.left) {
        return grandParent.right;
    }
    else{
        return grandParent.left;
    }
}


@end
