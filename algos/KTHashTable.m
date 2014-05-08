//
//  KTHashTable.m
//  algos
//
//  Created by khanh tran on 2014-05-07.
//  Copyright (c) 2014 ktran03. All rights reserved.
//

#import "KTHashTable.h"
#import "KTHashTableContainerItem.h"

@interface KTHashTable ()
@property(strong,nonatomic)NSMutableArray *containerItems;
@property(assign)NSUInteger tableCapacity;
@end

@implementation KTHashTable

-(id)init{
    self = [super init];
    if (self) {
        self.tableCapacity = 100;
        self.containerItems = [[NSMutableArray alloc] initWithCapacity:self.tableCapacity];
        for (int i=0; i<self.tableCapacity; i++) {
            [self.containerItems addObject:[KTHashTableContainerItem new]];
        }
    }
    return self;
}

-(void)insertValue:(id)value forKey:(NSString*)key{
    int index = [self hashFunction:key];
    KTHashTableContainerItem *item = self.containerItems[index];
    if (!item.key || !item.value) {
        item.key = key;
        item.value = value;
    }
    else{
        KTHashTableContainerItem *newItem = [KTHashTableContainerItem new];
        newItem.nextItemContainer = item;
        newItem.value = value;
        newItem.key = key;
        [self.containerItems removeObject:newItem];
        [self.containerItems insertObject:newItem atIndex:index];
    }
}

- (int)hashFunction:(NSString *)key
{
    unsigned int hash = 2;
    for (int i=0; i<[key length]; i++) {
        hash = hash * 101 + [key characterAtIndex:i];
    }
    
    return hash % self.tableCapacity;
}


@end
