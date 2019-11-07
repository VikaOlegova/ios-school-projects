//
//  Waiter.h
//  Homework2
//
//  Created by Вика on 29/09/2019.
//  Copyright © 2019 Vika Olegova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KitchenDelegate.h"
@protocol WaiterDelegate;

NS_ASSUME_NONNULL_BEGIN

@interface Waiter : NSObject <KitchenDelegate>

@property (nonatomic, nullable, weak) id<WaiterDelegate> delegate;

- (void)acceptOrder:(NSString *)orderDescription;
- (void)receiveThanks;
- (void)receiveTip;

@end

NS_ASSUME_NONNULL_END
