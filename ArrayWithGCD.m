//
//  ArrayWithGCD.m
//  SafeArray
//
//  Created by xixi_wen on 2020/11/23.
//

#import "ArrayWithGCD.h"

@interface ArrayWithGCD ()
@property (nonatomic, strong) NSMutableArray *array;
@property (nonatomic, strong) dispatch_queue_t readWithQueue;
@end

@implementation ArrayWithGCD

- (instancetype)init {
    self = [super init];
    if (self) {
        _array = [NSMutableArray array];
        _readWithQueue = dispatch_queue_create("com.xixi", DISPATCH_QUEUE_CONCURRENT);
    }
    return self;
}

- (void)addItem:(id)item
{
    dispatch_barrier_async(self.readWithQueue, ^{
        [self.array addObject:item];
    });
}

- (void)removeItem:(id)item
{
    dispatch_barrier_async(self.readWithQueue, ^{
        [self.array removeObject:item];
    });
    
}

- (id)getLastItemSync
{
    __block id item = nil;
    dispatch_sync(self.readWithQueue, ^{
        NSUInteger size = self.array.count;
        if (size > 0) {
            item = self.array[size - 1];
        }
    });
    return item;
}


@end
