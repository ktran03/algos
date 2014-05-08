//
//  KTHashTableContainerItem.h
//  algos
//
//  Created by khanh tran on 2014-05-07.
//  Copyright (c) 2014 ktran03. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KTHashTableContainerItem : NSObject

@property(strong,nonatomic)NSString *key;
@property(strong,nonatomic)id value;
@property(strong,nonatomic)KTHashTableContainerItem *nextItemContainer;

@end
