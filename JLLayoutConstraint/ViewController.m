//
//  ViewController.m
//  ConstraintTest
//
//  Created by 吕同生 on 17/4/14.
//  Copyright © 2017年 JimmyLTS. All rights reserved.
//

#import "ViewController.h"
#import "JLLayoutContraint.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    [view jl_makeConstraints:^(JLConstraintMaker *maker) {
        [maker.left equalTo:50];
        [maker.centerX jl_equalTo:self.view];
        [maker.height equalTo:100];
        [maker.centerY jl_equalTo:self.view];
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
