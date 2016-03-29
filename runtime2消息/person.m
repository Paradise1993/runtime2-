//
//  person.m
//  runtime2消息
//
//  Created by 李颜成 on 16/3/28.
//  Copyright © 2016年 falcon. All rights reserved.
//

#import "person.h"
#import <objc/runtime.h>

@interface person (){
    NSString *_father;
}

@property (nonatomic, copy) NSString *sex;

@property (nonatomic, assign) CGFloat money;

@end

@implementation person



//只会在当前对象第一次调用的时候调用一次
+ (void)load{
    NSLog(@"load");
    
   
}

//只会在当前类第一次调用的时候调用一次
+ (void)initialize{
    NSLog(@"initialize");
}

-(void)say{
    NSLog(@"hello");
}

- (void)sayChinese{
    NSLog(@"你好");
}

-(void)buy:(NSString *)obj{
    NSLog(@"buy:%@",obj);
}

- (void)run{
    NSLog(@"running");
}
@end
