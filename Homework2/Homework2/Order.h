//
//  Order.h
//  Homework2
//
//  Created by Вика on 29/09/2019.
//  Copyright © 2019 Vika Olegova. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Order : NSObject

@property (nonatomic, strong, readonly) NSUUID *orderID;
@property (nonatomic, copy) NSString *orderDescription;

@end

NS_ASSUME_NONNULL_END
