//
//  ViewController.m
//  Homework2
//
//  Created by Вика on 28/09/2019.
//  Copyright © 2019 Vika Olegova. All rights reserved.
//

#import "ViewController.h"
#import "Guest.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    Guest *guest = [Guest new];
    [guest makeOrder];
}


@end
