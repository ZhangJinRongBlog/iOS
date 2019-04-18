//
//  ViewController.m
//  BellVibrateDemo
//
//  Created by Mr.Zhang on 2019/4/18.
//  Copyright © 2019 Mr.Zhang. All rights reserved.
//

#import "ViewController.h"
#import "BellVibrateManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
    
}

- (IBAction)startAction:(id)sender {
    
    [[BellVibrateManager sharedInstance] muteCheck:^(BOOL mute) {
       
        if(mute == true){
           
//            [[BellVibrateManager sharedInstance] startVibrate];
            [[BellVibrateManager sharedInstance] startRepeatPlayVibrate];
            
        }
        else {
//            [[BellVibrateManager sharedInstance] startBell];
            [[BellVibrateManager sharedInstance] startRepeatBell];
        }
        
    }];
    
}


- (IBAction)cancelAction:(id)sender {
    
    [[BellVibrateManager sharedInstance] endVirateAndBell];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
