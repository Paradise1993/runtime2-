//
//  main.m
//  runtime2消息
//
//  Created by 李颜成 on 16/3/28.
//  Copyright © 2016年 falcon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "person.h"
#import <objc/runtime.h>
#import "Dog.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        person *person1 = [person new];
        

        
        Method m1 = class_getInstanceMethod([person1 class], @selector(say));
        Method m2 = class_getInstanceMethod(NSClassFromString(@"Dog"), @selector(dogSay));
        
        method_exchangeImplementations(m1, m2);
        
        [person1 say];
        
        
        return 0;
        
//        [person1 performSelector:@selector(say)];
        objc_msgSend(person1,@selector(say));
        objc_msgSend(person1,@selector(buy:),@"香肠");
        objc_msgSend(person1, @selector(run));
        
        unsigned int count;
        objc_property_t *propertyList =class_copyPropertyList([person1 class], &count);
        for (int i=0; i<count; i++) {
            objc_property_t property = propertyList[i];
            
            // 获取属性名
            const char * pName = property_getName(property);
            NSLog(@"%s",property_getName(property));
        }
        
        NSDictionary *dict = @{@"a":@"hello"};
        
        unsigned int count2;
        Ivar *ivars = class_copyIvarList([person1 class], &count2);
        for (int i =0 ; i<count2; i++) {
            Ivar ivar = ivars[i];
            const char *iName = ivar_getName(ivar);
            NSLog(@"ivarName=%s",iName);
        }
        
        unsigned int count3;
        Method *methods = class_copyMethodList([person1 class], &count3);
        for (int i=0; i<count3; i++) {
            Method m = methods[i];
            SEL met = method_getName(m);
            NSLog(@"method = %@",NSStringFromSelector(met));
        }
        
//        method_ex
        
        
        
        
        //相当于给对象发了一个消息 执行方法
    }
    return 0;
}
