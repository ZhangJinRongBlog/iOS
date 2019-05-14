//
//  ViewController.m
//  KVOTest
//
//  Created by Mr.Zhang on 2019/5/8.
//  Copyright © 2019 Mr.Zhang. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

static void *kPersonName = &kPersonName;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Person *person = [Person new];
    person.name = @"名字";
    person.age = 18;
    // NSKeyValueObservingOptionInitial 表示初始化的时候会调用一次
    [person addObserver:self forKeyPath:@"age" options:(NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:kPersonName];
    person.age = 25;
    Person *anotherPerson = [Person new];
    
      [anotherPerson addObserver:self forKeyPath:@"name" options:(NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:kPersonName];
    
    
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    NSLog(@"%@",change);
    
    id oldObj = change[NSKeyValueChangeOldKey];
    id newObj = change[NSKeyValueChangeNewKey];
    NSLog(@"oldObj = %@",oldObj);
    NSLog(@"newObj = %@",newObj);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
