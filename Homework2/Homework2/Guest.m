//
//  Guest.m
//  Homework2
//
//  Created by Вика on 29/09/2019.
//  Copyright © 2019 Vika Olegova. All rights reserved.
//

#import "Guest.h"
#import "Order.h"
#import "Waiter.h"

@implementation Guest

- (void)makeOrder
{
    NSLog(@"Guest made his order.");
    
    Waiter *waiter = [Waiter new];
    waiter.delegate = self;
    [waiter acceptOrder:@"One vanilla latte"];
}

#pragma mark - <WaiterDelegate>

- (void)waiter:(Waiter *)waiter didBringOrder:(Order *)order
{
    NSLog(@"Waiter brought the order %@ to the guest.", order.orderID);
    [waiter receiveThanks];
    [waiter receiveTip];
}

@end
