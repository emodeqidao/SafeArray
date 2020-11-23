//
//  ArrayWithLock.h
//  SafeArray
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ArrayWithLock : NSObject

- (void)addItem:(id)item;

- (void)removeItem:(id)item;

- (id)getLastItem;

- (id)getAllItem;

@end

NS_ASSUME_NONNULL_END
