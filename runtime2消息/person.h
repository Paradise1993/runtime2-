//
//  person.h
//  runtime2消息
//
//  Created by 李颜成 on 16/3/28.
//  Copyright © 2016年 falcon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface person : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger age;

- (void) say;

- (void) buy:(NSString *) obj;

- (void)sayChinese;
@end
