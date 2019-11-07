//
//  KitchenDelegate.h
//  Homework2
//
//  Created by Вика on 29/09/2019.
//  Copyright © 2019 Vika Olegova. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Kitchen;
@class Order;

NS_ASSUME_NONNULL_BEGIN

@protocol KitchenDelegate <NSObject>

- (void)kitchen:(Kitchen *)kitchen didCookOrder:(Order *)order;

@end

NS_ASSUME_NONNULL_END
