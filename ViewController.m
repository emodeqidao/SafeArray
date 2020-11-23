//
//  ViewController.m
//  SafeArray
//
//  Created by xixi_wen on 2020/11/23.
//

#import "ViewController.h"
#import "ArrayWithLock.h"
#import "ArrayWithGCD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"222");
//    [self testArrayLock];
    [self testArrayGCD];
}

- (void)testArrayLock {
    dispatch_queue_t queue = dispatch_get_global_queue(QOS_CLASS_UTILITY, 0);
    ArrayWithLock *array = [[ArrayWithLock alloc] init];
    for (int i = 0; i < 100; i++) {
        [array addItem:[NSString stringWithFormat:@"item%d", i]];
    }
    
    for (int i = 0; i < 100; i++) {
        dispatch_async(queue, ^{
            [NSThread sleepForTimeInterval:1.f];
            NSLog(@"获取最后一个 %d", i);
            id item = [array getLastItem];
            if (item) {
                
                [array removeItem:item];
            }
        });
    }
}

- (void)testArrayGCD {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    ArrayWithGCD *array = [[ArrayWithGCD alloc] init];
    for (int i = 0; i < 100; i++) {
        [array addItem:[NSString stringWithFormat:@"item%d", i]];
    }
    
    for (int i = 0; i < 100; i++) {
        dispatch_async(queue, ^{
            [NSThread sleepForTimeInterval:1.f];
            NSLog(@"获取最后一个 %d", i);
            id item = [array getLastItemSync];
            if (item) {
                
                [array removeItem:item];
            }
        });
    }
}

@end
