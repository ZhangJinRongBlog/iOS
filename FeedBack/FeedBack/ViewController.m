//
//  ViewController.m
//  DesignModal
//
//  Created by Mr.Zhang on 2019/4/15.
//  Copyright © 2019 Mr.Zhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)lightAction:(UIButton *)sender {
    
    UIImpactFeedbackGenerator *feedBack = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight];
    [feedBack impactOccurred];
    
}

- (IBAction)mediumAction:(UIButton *)sender {
 
    UIImpactFeedbackGenerator *feedBack = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium];
    [feedBack impactOccurred];
    
}

- (IBAction)heavyAction:(UIButton *)sender {
    
    UIImpactFeedbackGenerator *feedBack = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleHeavy];
    [feedBack impactOccurred];
    
}
//
- (IBAction)successAction:(UIButton *)sender {
    
    UINotificationFeedbackGenerator *feedBack = [[UINotificationFeedbackGenerator alloc] init];
    [feedBack notificationOccurred:UINotificationFeedbackTypeSuccess];
    
}

- (IBAction)warningAction:(UIButton *)sender {
    
    UINotificationFeedbackGenerator *feedBack = [[UINotificationFeedbackGenerator alloc] init];
    [feedBack notificationOccurred:UINotificationFeedbackTypeWarning];
    
}

- (IBAction)errorAction:(UIButton *)sender {
    
    UINotificationFeedbackGenerator *feedBack = [[UINotificationFeedbackGenerator alloc] init];
    [feedBack notificationOccurred:UINotificationFeedbackTypeError];
    
}

- (IBAction)selectionChangeAction:(UIButton *)sender {
    
    UISelectionFeedbackGenerator *feedBack = [[UISelectionFeedbackGenerator alloc] init];
    [feedBack selectionChanged];
    
}

@end
