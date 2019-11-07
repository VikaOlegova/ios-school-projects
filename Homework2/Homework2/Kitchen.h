//
//  Kitchen.h
//  Homework2
//
//  Created by Вика on 29/09/2019.
//  Copyright © 2019 Vika Olegova. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol KitchenDelegate;
@class Order;

NS_ASSUME_NONNULL_BEGIN

@interface Kitchen : NSObject

@property (nonatomic, nullable, weak) id<KitchenDelegate> delegate;

- (void)cookOrder:(Order *)order;

@end

NS_ASSUME_NONNULL_END
