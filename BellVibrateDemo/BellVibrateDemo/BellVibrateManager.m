//
//  BellVibrateManager.m
//  BellVibrateDemo
//
//  Created by Mr.Zhang on 2019/4/18.
//  Copyright © 2019 Mr.Zhang. All rights reserved.
//
/*
 PS: 经实测 假如有人打电话给您的时候不会关闭 需要判断通话状态
 */
#import "BellVibrateManager.h"
#include <AudioToolbox/AudioToolbox.h>

typedef void(^Mute)(BOOL mute);

@interface BellVibrateManager()<NSCopying,NSMutableCopying>

@property (nonatomic,copy) Mute mute;

@property (nonatomic,assign) NSTimeInterval soundDuration;

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation BellVibrateManager

#pragma mark init
static BellVibrateManager *_instance;
+ (instancetype)sharedInstance{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL] init];
    });
    return _instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    return [self sharedInstance];
}

- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    return self;
}

- (nonnull id)mutableCopyWithZone:(nullable NSZone *)zone {
    return self;
}

#pragma mark feature
- (void)muteCheck:(void(^)(BOOL mute))mute{
    
    self.soundDuration = 0;
    self.mute = mute;
    
    CFBundleRef mainBundleRef = CFBundleGetMainBundle();
    
    CFURLRef urlRef = CFBundleCopyResourceURL(mainBundleRef, CFSTR("detection"), CFSTR("aiff"), NULL);
    
    SystemSoundID soundID = 0;
    AudioServicesCreateSystemSoundID(urlRef, &soundID);
    AudioServicesAddSystemSoundCompletion(soundID, NULL, NULL, mutedSoundSystemCallBack, (__bridge void * _Nullable)(self));
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(incrementSoundDuration:) userInfo:nil repeats:true];
    AudioServicesPlaySystemSound(soundID);
}

- (void)incrementSoundDuration:(NSTimer *)sender{
    self.soundDuration += 0.001;
}

- (void)playCompletion{
    
    if(self.soundDuration < 0.01){
        self.mute(true);
    } else {
        self.mute(false);
    }
    
    if(self.timer.isValid){
        [self.timer invalidate];
        self.timer = nil;
    }
    
}

static void  mutedSoundSystemCallBack(SystemSoundID soundID, void* __nullable mySelf){
 
    AudioServicesRemoveSystemSoundCompletion(soundID);
    
    [[BellVibrateManager sharedInstance] playCompletion];
}

static SystemSoundID _systemSoundID = 0;

- (void)startBell{
    
    CFBundleRef maindBundleRef = CFBundleGetMainBundle();
    CFURLRef urlRef = CFBundleCopyResourceURL(maindBundleRef, CFSTR("sound"), CFSTR("caf"), NULL);
    
    AudioServicesCreateSystemSoundID(urlRef, &_systemSoundID);
    AudioServicesPlaySystemSound(_systemSoundID);
    
    
}

- (void)startVibrate{
    
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

- (void)startRepeatBell{
    
    CFBundleRef mainBundleRef = CFBundleGetMainBundle();
    
    CFURLRef urlRef = CFBundleCopyResourceURL(mainBundleRef, CFSTR("sound"), CFSTR("caf"), NULL);
    
    AudioServicesCreateSystemSoundID(urlRef, &_systemSoundID);
    AudioServicesAddSystemSoundCompletion(_systemSoundID, NULL, NULL, bellSoundSystemCallBack, (__bridge void * _Nullable)(self));
    AudioServicesPlaySystemSound(_systemSoundID);
    
}

- (void)startRepeatPlayVibrate{
    AudioServicesAddSystemSoundCompletion(kSystemSoundID_Vibrate, NULL, NULL, vibrateSoundSystemCallBack, NULL);
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

- (void)endVirateAndBell{
    
    if(_systemSoundID != 0){
        AudioServicesRemoveSystemSoundCompletion(_systemSoundID);
        AudioServicesDisposeSystemSoundID(_systemSoundID);
    }
    AudioServicesRemoveSystemSoundCompletion(kSystemSoundID_Vibrate);
    AudioServicesDisposeSystemSoundID(kSystemSoundID_Vibrate);
}

static void bellSoundSystemCallBack(SystemSoundID soundID, void* __nullable mySelf){
    
    AudioServicesRemoveSystemSoundCompletion(soundID);
    [[BellVibrateManager sharedInstance] startRepeatBell];
}

static void vibrateSoundSystemCallBack(SystemSoundID soundID, void* __nullable mySelf){
    //不能那个写上这句否则不会重复执行没有效果
//    AudioServicesRemoveSystemSoundCompletion(soundID);
    //可以修改震动频率
    [[BellVibrateManager sharedInstance] performSelector:@selector(triggerVibrate) withObject:nil afterDelay:1];;
}

- (void)triggerVibrate{
//  这样做无法随时取消震动
//    AudioServicesRemoveSystemSoundCompletion(kSystemSoundID_Vibrate);
//    AudioServicesAddSystemSoundCompletion(kSystemSoundID_Vibrate, NULL, NULL, vibrateSoundSystemCallBack, NULL);
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

@end
