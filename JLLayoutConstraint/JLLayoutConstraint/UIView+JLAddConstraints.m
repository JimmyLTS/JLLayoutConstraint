//
//  UIView+JLAddConstraints.m
//  ConstraintTest
//
//  Created by 吕同生 on 17/4/14.
//  Copyright © 2017年 JimmyLTS. All rights reserved.
//

#import "UIView+JLAddConstraints.h"
#import "JLConstraintMaker.h"

@implementation UIView (JLAddConstraints)

- (NSArray *)jl_makeConstraints:(void (^)(JLConstraintMaker *))constraintsBlock {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    JLConstraintMaker *constraintMaker = [[JLConstraintMaker alloc] initWithView:self];
    constraintsBlock(constraintMaker);
    return [constraintMaker install];
}

@end
