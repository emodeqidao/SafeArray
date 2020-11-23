//
//  ArrayWithGCD.h
//  SafeArray
//
//  Created by xixi_wen on 2020/11/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ArrayWithGCD : NSObject

- (void)addItem:(id)item;

- (void)removeItem:(id)item;

- (id)getLastItemSync;


@end

NS_ASSUME_NONNULL_END
