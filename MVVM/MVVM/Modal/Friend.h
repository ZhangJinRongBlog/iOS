//
//  Friend.h
//  MVVM
//
//  Created by Mr.Zhang on 2019/4/25.
//  Copyright © 2019 Mr.Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Friend : NSObject

@property (nonatomic,strong) NSString *name;

@property (nonatomic,strong) NSString *pictureURL;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
