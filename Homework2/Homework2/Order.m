//
//  Order.m
//  Homework2
//
//  Created by Вика on 29/09/2019.
//  Copyright © 2019 Vika Olegova. All rights reserved.
//

#import "Order.h"

@implementation Order

- (instancetype)init
{
    self = [super init];
    if (self) {
        _orderID = [NSUUID new];
    }
    return self;
}

@end
