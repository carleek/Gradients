//
//  GradientLabel.m
//  Gradients
//
//  Created by Joshua Bryson on 6/23/14.
//  Copyright (c) 2014 Quickwork Apps LLC. All rights reserved.
//

#import "GradientLabel.h"

@implementation GradientLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // 1 Craete a context and save the state.
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);

    // 2 Choose the gradient colors and color space, then define the gradient.
    NSArray *colors = @[(__bridge id)[UIColor colorWithWhite:0.25 alpha:0.1].CGColor, (__bridge id)[UIColor colorWithWhite:0.25 alpha:0.8].CGColor];
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();

    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)colors, NULL);
    
    // 3 Set the gradient start and end points and options
    CGPoint startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
    CGPoint endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
    CGGradientDrawingOptions options = kCGGradientDrawsAfterEndLocation | kCGGradientDrawsBeforeStartLocation;
    
    // 4 Draw the gradient in the context
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, options);
    
    // 5 release CG References and restore the state
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    
    CGContextRestoreGState(context);
    CGContextRelease(context);
    
    // 6 Call the super drawRect to draw the regular UILabel stuff
    [super drawRect: rect];

}


@end
