//
//  Kitchen.m
//  Homework2
//
//  Created by Вика on 29/09/2019.
//  Copyright © 2019 Vika Olegova. All rights reserved.
//

#import "Kitchen.h"
#import "Order.h"
#import "KitchenDelegate.h"

@implementation Kitchen

- (void)cookOrder:(Order *)order
{
    NSLog(@"Kitchen is cooking the order %@.", order.orderID);
    
    [self.delegate kitchen:self didCookOrder:order];
}

@end
