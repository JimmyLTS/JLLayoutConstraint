//
//  UIView+JLAddConstraints.h
//  ConstraintTest
//
//  Created by 吕同生 on 17/4/14.
//  Copyright © 2017年 JimmyLTS. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JLConstraintMaker;

@interface UIView (JLAddConstraints)

- (NSArray *)jl_makeConstraints:(void(^)(JLConstraintMaker *maker))constraintsBlock;

@end
