//
//  JLConstraintMaker.m
//  ConstraintTest
//
//  Created by 吕同生 on 17/4/14.
//  Copyright © 2017年 JimmyLTS. All rights reserved.
//

#import "JLConstraintMaker.h"

typedef NS_ENUM(NSUInteger, JLLayoutAttribute) {
    JLLayoutAttributeEdges = 0,
    JLLayoutAttributeSize,
    JLLayoutAttributeCenter,
};

#pragma mark -
#pragma mark - JLConstraint
@implementation JLConstraint
{
    NSMutableArray *_constraints;
}

- (instancetype)initWithView:(UIView *)view {
    self = [super init];
    if (self) {
        _constraints = [[NSMutableArray alloc] init];
        self.firstItem = view;
    }
    return self;
}

- (void)install {
    [self.firstItem.superview addConstraints:_constraints];
}

- (JLConstraint *)equalTo:(CGFloat)value {
    for (NSNumber *obj in self.layoutAttributes) {
        NSLayoutAttribute attr = (NSLayoutAttribute)obj.integerValue;
        
        if (NSLayoutAttributeWidth == attr || NSLayoutAttributeHeight == attr) { // 宽高 -> size
            
            NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.firstItem
                                                                          attribute:attr
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:nil
                                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                                         multiplier:1
                                                                           constant:value];
            [_constraints addObject:constraint];
            
        } else {
            
            NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.firstItem
                                                                          attribute:attr
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.firstItem.superview
                                                                          attribute:attr
                                                                         multiplier:1
                                                                           constant:value];
            [_constraints addObject:constraint];
        }
    }
    return self;
}

- (JLConstraint *)jl_equalTo:(UIView *)view {
    for (NSNumber *obj in self.layoutAttributes) {
        NSLayoutAttribute attr = (NSLayoutAttribute)obj.integerValue;
        NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.firstItem
                                                                      attribute:attr
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:view
                                                                      attribute:attr
                                                                     multiplier:1
                                                                       constant:0];
        [_constraints addObject:constraint];
    }
    return self;
}

@end

#pragma mark -
#pragma mark - JLConstraintMaker
@interface JLConstraintMaker ()

@property (nonatomic, weak) UIView *view;

@property (nonatomic, strong) NSMutableArray<JLConstraint *> *constraints;

@end

@implementation JLConstraintMaker

- (id)initWithView:(UIView *)view {
    if (self = [super init]) {
        self.view = view;
        self.constraints = [NSMutableArray new];
    }
    return self;
}

- (NSArray *)install {
    NSArray *constraints = [self.constraints copy];
    
    for (JLConstraint *constraint in constraints) {
        [constraint install];
    }
    
    return constraints;
}

- (JLConstraint *)addConstraintWithLayoutAttribute:(NSLayoutAttribute)layoutAttribute {
    return [self constraint:nil addConstraintWithLayoutAttribute:layoutAttribute];
}

- (JLConstraint *)jl_addConstraintWithLayoutAttribute:(JLLayoutAttribute)layoutAttribute {
    JLConstraint *jl_constraint = [[JLConstraint alloc] initWithView:self.view];
    jl_constraint.layoutAttributes = [self jl_layoutAttribute:layoutAttribute];
    [self.constraints addObject:jl_constraint];
    return jl_constraint;
}

- (NSMutableArray *)jl_layoutAttribute:(JLLayoutAttribute)layoutAttribute {
    switch (layoutAttribute) {
        case JLLayoutAttributeEdges:
            return [NSMutableArray arrayWithObjects:
                    @(NSLayoutAttributeLeft),
                    @(NSLayoutAttributeTop),
                    @(NSLayoutAttributeBottom),
                    @(NSLayoutAttributeRight), nil];
        case JLLayoutAttributeSize:
            return [NSMutableArray arrayWithObjects:
                    @(NSLayoutAttributeWidth),
                    @(NSLayoutAttributeHeight), nil];
        case JLLayoutAttributeCenter:
            return [NSMutableArray arrayWithObjects:
                    @(NSLayoutAttributeCenterX),
                    @(NSLayoutAttributeCenterY), nil];
        default: break;
    }
}

- (JLConstraint *)constraint:(JLConstraint *)constraint addConstraintWithLayoutAttribute:(NSLayoutAttribute)layoutAttribute {
    JLConstraint *jl_constraint = [[JLConstraint alloc] initWithView:self.view];
    jl_constraint.layoutAttributes = [NSMutableArray arrayWithObjects:@(layoutAttribute), nil];
    [self.constraints addObject:jl_constraint];
    return jl_constraint;
}

- (JLConstraint *)left {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeLeft];
}

- (JLConstraint *)right {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeRight];
}

- (JLConstraint *)top {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeTop];
}

- (JLConstraint *)bottom {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeBottom];
}

- (JLConstraint *)centerX {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeCenterX];
}

- (JLConstraint *)centerY {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeCenterY];
}

- (JLConstraint *)height {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeHeight];
}

- (JLConstraint *)width {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeWidth];
}

- (JLConstraint *)center {
    return [self jl_addConstraintWithLayoutAttribute:JLLayoutAttributeCenter];
}

- (JLConstraint *)size {
    return [self jl_addConstraintWithLayoutAttribute:JLLayoutAttributeSize];
}

- (JLConstraint *)edge {
    return [self jl_addConstraintWithLayoutAttribute:JLLayoutAttributeEdges];
}

@end
