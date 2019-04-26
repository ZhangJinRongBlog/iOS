//
//  ViewController.m
//  MVVM
//
//  Created by Mr.Zhang on 2019/4/25.
//  Copyright © 2019 Mr.Zhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"MVVM";
    
    CGFloat height = CGRectGetHeight([UIScreen mainScreen].bounds) - CGRectGetHeight([UIApplication sharedApplication].statusBarFrame) - 44;
    CGFloat width = CGRectGetWidth([UIScreen mainScreen].bounds);
    self.tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, width, height) style:UITableViewStyleGrouped];
        tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.estimatedRowHeight = 0;
        tableView.estimatedSectionFooterHeight = 0;
        tableView.estimatedSectionHeaderHeight = 0;
        tableView.sectionFooterHeight = CGFLOAT_MIN;
        tableView.sectionHeaderHeight = CGFLOAT_MIN;
//        [tableView registerClass:[<#class#> class] forCellReuseIdentifier:<#ReuseIdentifier#>];
        tableView;
    });
    [self.view addSubview:self.tableView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
