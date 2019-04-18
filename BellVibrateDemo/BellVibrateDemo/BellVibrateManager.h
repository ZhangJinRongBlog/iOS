//
//  BellVibrateManager.h
//  BellVibrateDemo
//
//  Created by Mr.Zhang on 2019/4/18.
//  Copyright © 2019 Mr.Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface BellVibrateManager : NSObject

+ (instancetype)sharedInstance;

- (void)muteCheck:(void(^)(BOOL mute))mute;
/*
 * start one time  bell
 */
- (void)startBell;
/*
 * start one time vibrate
 */
- (void)startVibrate;

- (void)startRepeatBell;

- (void)startRepeatPlayVibrate;

- (void)endVirateAndBell;

@end
