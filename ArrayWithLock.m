//
//  ArrayWithLock.m
//  SafeArray
//
//  Created by xixi_wen on 2020/11/23.
//

#import "ArrayWithLock.h"

@interface ArrayWithLock ()
@property (nonatomic, strong) NSMutableArray *array;
@property (nonatomic, strong) NSLock *lock;
@end


@implementation ArrayWithLock

- (instancetype)init
{
    self = [super init];
    if (self) {
        _array = [NSMutableArray array];
        _lock = [[NSLock alloc] init];
    }
    return self;
}

- (void)addItem:(id)item
{
    [self.lock lock];
    [_array addObject:item];
    [self.lock unlock];
}

- (void)removeItem:(id)item
{
    [self.lock lock];
    [_array removeObject:item];
    [self.lock unlock];
}

- (id)getLastItem
{
    [self.lock lock];
    id item = nil;
    NSInteger count = _array.count;
    if (count > 0) {
        item = _array[count - 1];
    }
    [self.lock unlock];
    return item;
}

- (id)getAllItem
{
    return _array;
}
@end
