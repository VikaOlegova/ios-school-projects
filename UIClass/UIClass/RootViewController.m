//
//  RootViewController.m
//  UIClass
//
//  Created by Вика on 14/10/2019.
//  Copyright © 2019 Vika Olegova. All rights reserved.
//

#import "RootViewController.h"
#import "ViewController.h"

@interface RootViewController ()

@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) ViewController *viewController;

@end

@implementation RootViewController

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _button = [UIButton new];
        [_button setTitle:@"Hello!" forState:UIControlStateNormal];
        [_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal] ;
        _button.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_button];
        
        _viewController = [ViewController new];
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.view.backgroundColor = [UIColor purpleColor];
    
    self.button.frame = CGRectMake(290.0, 150.0, 100.0, 40.0);
    
    [self.button addTarget:self action:@selector(tapButton) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:self.button];
}

-(void)tapButton
{
    [self.navigationController pushViewController:self.viewController animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

@end
