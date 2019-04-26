//
//  SingleTon.m
//  SinglePattern
//
//  Created by Mr.Zhang on 2019/4/26.
//  Copyright © 2019 Mr.Zhang. All rights reserved.
//

#import "SingleTon.h"

@interface SingleTon()<NSCopying,NSMutableCopying>

@end

@implementation SingleTon

static SingleTon *_instance = NULL;

+ (instancetype)SharedInstance{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL] init];
    });
    return _instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    return [self SharedInstance];
}

- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    return self;
}

- (nonnull id)mutableCopyWithZone:(nullable NSZone *)zone {
    return self;
}

@end
