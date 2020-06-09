//
//  TimerProxy.h
//  Masonry
//
//  Created by Friday on 2020/6/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TimerProxy : NSProxy

- (instancetype)initWithTarget:(id)target;

@end

NS_ASSUME_NONNULL_END
