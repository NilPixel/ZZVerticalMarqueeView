//
//  TimerProxy.m
//  Masonry
//
//  Created by Friday on 2020/6/9.
//

#import "TimerProxy.h"

@interface TimerProxy ()

@property (nonatomic, weak) id target;

@end

@implementation TimerProxy

- (instancetype)initWithTarget:(id)target {
    self.target = target;
    return self;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    return [self.target methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    SEL sel = [invocation selector];
    if ([self.target respondsToSelector:sel]) {
        [invocation invokeWithTarget:self.target];
    }
}

@end
