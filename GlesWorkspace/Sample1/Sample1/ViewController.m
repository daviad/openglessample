//
//  ViewController.m
//  Sample1
//
//  Created by  dingxiuwei on 2017/5/25.
//  Copyright © 2017年  dingxiuwei. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    FirstViewController *fc = [FirstViewController new];
    [self addChildViewController:fc];
    [self.view addSubview:fc.view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
