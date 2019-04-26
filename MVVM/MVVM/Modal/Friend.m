//
//  Friend.m
//  MVVM
//
//  Created by Mr.Zhang on 2019/4/25.
//  Copyright © 2019 Mr.Zhang. All rights reserved.
//

#import "Friend.h"

@implementation Friend

- (instancetype)initWithDictionary:(NSDictionary *)dictionary{
    
    self = [super init];
    
    if(self){
     
        _name = dictionary[@"name"];
        _pictureURL = dictionary[@"pictureUrl"];
    }
    
    return self;
}

@end
