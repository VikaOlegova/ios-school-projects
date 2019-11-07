//
//  WaiterDelegate.h
//  Homework2
//
//  Created by Вика on 29/09/2019.
//  Copyright © 2019 Vika Olegova. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Waiter;
@class Order;

NS_ASSUME_NONNULL_BEGIN

@protocol WaiterDelegate <NSObject>

- (void)waiter:(Waiter *)waiter didBringOrder:(Order *)order;

@end

NS_ASSUME_NONNULL_END
