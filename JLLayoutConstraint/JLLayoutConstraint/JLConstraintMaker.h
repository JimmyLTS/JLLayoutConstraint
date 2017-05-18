//
//  JLConstraintMaker.h
//  ConstraintTest
//
//  Created by 吕同生 on 17/4/14.
//  Copyright © 2017年 JimmyLTS. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark -
#pragma mark - JLConstraint
@interface JLConstraint : NSObject

@property (nonatomic, strong) NSMutableArray *layoutAttributes;

@property (nonatomic, weak) UIView *firstItem;

- (instancetype)initWithView:(UIView *)view;

- (void)install;

- (JLConstraint *)equalTo:(CGFloat)value;

- (JLConstraint *)jl_equalTo:(UIView *)view;

@end

#pragma mark -
#pragma mark - JLConstraintMaker
@interface JLConstraintMaker : NSObject

@property (nonatomic, strong, readonly) JLConstraint *left;

@property (nonatomic, strong, readonly) JLConstraint *right;

@property (nonatomic, strong, readonly) JLConstraint *top;

@property (nonatomic, strong, readonly) JLConstraint *bottom;

@property (nonatomic, strong, readonly) JLConstraint *height;

@property (nonatomic, strong, readonly) JLConstraint *width;

@property (nonatomic, strong, readonly) JLConstraint *size;

@property (nonatomic, strong, readonly) JLConstraint *center;

@property (nonatomic, strong, readonly) JLConstraint *centerY;

@property (nonatomic, strong, readonly) JLConstraint *centerX;

@property (nonatomic, strong, readonly) JLConstraint *edge;

- (id)initWithView:(UIView *)view;

- (NSArray *)install;

@end
