//
//  Guest.h
//  Homework2
//
//  Created by Вика on 29/09/2019.
//  Copyright © 2019 Vika Olegova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WaiterDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface Guest : NSObject <WaiterDelegate>

- (void)makeOrder; 

@end

NS_ASSUME_NONNULL_END
