//
//  ProtocolImplementer.m
//  UIClass
//
//  Created by Вика on 14/10/2019.
//  Copyright © 2019 Vika Olegova. All rights reserved.
//

#import "ProtocolImplementer.h"

@implementation ProtocolImplementer

-(void)navigationController:(UINavigationController *)navigationController
      didShowViewController:(UIViewController *)viewController
                   animated:(BOOL)animated
{
    if (animated)
    {
        NSLog(@"%@", NSStringFromClass([viewController class]));
    }
}

@end
