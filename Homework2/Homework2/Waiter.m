//
//  Waiter.m
//  Homework2
//
//  Created by Вика on 29/09/2019.
//  Copyright © 2019 Vika Olegova. All rights reserved.
//

#import "Waiter.h"
#import "Order.h"
#import "Kitchen.h"
#import "WaiterDelegate.h"

@implementation Waiter

- (void)acceptOrder:(NSString *)orderDescription
{
    NSLog(@"Waiter accepted the order \"%@\" from the guest.", orderDescription);
    
    Order *order = [Order new];
    order.orderDescription = orderDescription;
    NSLog(@"Order %@ (%@) was created.", order.orderID, order.orderDescription);
    
    Kitchen *kitchen = [Kitchen new];
    kitchen.delegate = self;
    [kitchen cookOrder:order];
}

- (void)receiveThanks
{
    NSLog(@"Waiter received thanks from the guest.");
}

- (void)receiveTip
{
    NSLog(@"Waiter received a tip from the guest.");
}

#pragma mark - <KitchenDelegate>

- (void)kitchen:(Kitchen *)kitchen didCookOrder:(Order *)order
{
    NSLog(@"Order %@ is ready!", order.orderID);
    
    [self.delegate waiter:self didBringOrder:order];
}

@end
