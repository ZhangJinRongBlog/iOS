//
//  ViewController.m
//  InternationalLanuage
//
//  Created by Mr.Zhang on 2019/5/10.
//  Copyright © 2019 Mr.Zhang. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@property (nonatomic,strong) UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 100)];
    self.label.text = NSLocalizedString(@"Key", @"测试");
    self.label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.label];
    
}


@end
