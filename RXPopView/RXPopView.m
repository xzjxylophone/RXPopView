//
//  RXPopView.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 15/12/22.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXPopView.h"
@interface RXPopView ()

@property (nonatomic, strong, readwrite) UIView *backgroundView;


@end
@implementation RXPopView



#pragma mark - Constructor And Destructor
- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        self.trianglePoint = CGPointMake(0, 0);
        self.topTrianglePoint = self.trianglePoint;
        self.leftTrianglePoint = self.trianglePoint;
        self.bottomTrianglePoint = self.trianglePoint;
        self.rightTrianglePoint = self.trianglePoint;
        self.borderWidth = 0;
        self.fillColor = [UIColor greenColor];
        self.cornerRadius = 0;
        self.borderColor = [UIColor grayColor];
        self.e_RXPopViewStyle = kE_RXPopViewStyle_TopCenter;
        self.edgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        self.backgroundView = [UIView new];
        
        [self addSubview:self.backgroundView];
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.borderColor setStroke];
    [self.fillColor setFill];
    
    CGFloat halfBorderWidth = self.borderWidth / 2.0f;
    CGFloat leftOffset = self.trianglePoint.x;
    CGFloat bottomOffset = self.trianglePoint.y;
    CGFloat rightOffset = self.trianglePoint.x;
    CGFloat topOffset = self.trianglePoint.y;
    
    CGFloat halfWidth = width / 2.0f;
    CGFloat halfHeight = height / 2.0f;
    
    NSArray *topAry = nil;
    NSArray *leftAry = nil;
    NSArray *bottomAry = nil;
    NSArray *rightAry = nil;
    
    BOOL haveTop = NO;
    BOOL haveBottom = NO;
    CGFloat startTopBottom = 0;
    CGFloat offsetTopBottom = 0;
    
    BOOL haveLeft = NO;
    BOOL haveRight = NO;
    CGFloat startLeftRight = 0;
    CGFloat offsetLeftRight = 0;
    
    switch (self.e_RXPopViewStyle) {
        case kE_RXPopViewStyle_TopCenter:
        {
            topOffset = self.trianglePoint.y;
            leftOffset = 0;
            bottomOffset = 0;
            rightOffset = 0;
            haveTop = YES;
            startTopBottom = halfWidth;
            offsetTopBottom = self.trianglePoint.x;
        }
            break;
        case kE_RXPopViewStyle_BottomCenter:
        {
            topOffset = 0;
            leftOffset = 0;
            bottomOffset = self.trianglePoint.y;
            rightOffset = 0;
            haveBottom = YES;
            startTopBottom = halfWidth;
            offsetTopBottom = self.trianglePoint.x;
        }
            break;
        case kE_RXPopViewStyle_LeftCenter:
        {
            topOffset = 0;
            leftOffset = self.trianglePoint.x;
            bottomOffset = 0;
            rightOffset = 0;
            haveLeft = YES;
            startLeftRight = halfHeight;
            offsetLeftRight = self.trianglePoint.y;
        }
            break;
        case kE_RXPopViewStyle_RightCenter:
        {
            topOffset = 0;
            leftOffset = 0;
            bottomOffset = 0;
            rightOffset = self.trianglePoint.x;
            haveRight = YES;
            startLeftRight = halfHeight;
            offsetLeftRight = self.trianglePoint.y;
        }
            break;
        default:
        {
            topOffset = 0;
            leftOffset = 0;
            bottomOffset = 0;
            rightOffset = 0;
            
            haveTop = (self.e_RXPopViewStyle & kE_RXPopViewStyle_Top) == kE_RXPopViewStyle_Top;
            haveBottom = (self.e_RXPopViewStyle & kE_RXPopViewStyle_Bottom) == kE_RXPopViewStyle_Bottom;
            if (haveTop) {
                topOffset = self.topTrianglePoint.y;
                startTopBottom = self.edgeInsets.top;
                offsetTopBottom = self.topTrianglePoint.x;
            }
            if (haveBottom) {
                bottomOffset = self.bottomTrianglePoint.y;
                startTopBottom = self.edgeInsets.bottom;
                offsetTopBottom = self.bottomTrianglePoint.x;
            }
            
            haveLeft = (self.e_RXPopViewStyle & kE_RXPopViewStyle_Left) == kE_RXPopViewStyle_Left;
            haveRight = (self.e_RXPopViewStyle & kE_RXPopViewStyle_Right) == kE_RXPopViewStyle_Right;
            if (haveLeft) {
                leftOffset = self.leftTrianglePoint.x;
                startLeftRight = self.edgeInsets.left;
                offsetLeftRight = self.leftTrianglePoint.y;
            }
            if (haveRight) {
                rightOffset = self.rightTrianglePoint.x;
                startLeftRight = self.edgeInsets.right;
                offsetLeftRight = self.rightTrianglePoint.y;
            }
        }
            break;
    }
    
    
    if (haveTop) {
        CGPoint tmp1 = CGPointMake(startTopBottom + offsetTopBottom, halfBorderWidth + topOffset);
        CGPoint tmp2 = CGPointMake(startTopBottom, 0);
        CGPoint tmp3 = CGPointMake(startTopBottom - offsetTopBottom, tmp1.y);
        topAry = @[[NSValue valueWithCGPoint:tmp1], [NSValue valueWithCGPoint:tmp2], [NSValue valueWithCGPoint:tmp3]];
    }
    if (haveBottom) {
        CGPoint tmp1 = CGPointMake(startTopBottom - offsetTopBottom, height - halfBorderWidth - bottomOffset);
        CGPoint tmp2 = CGPointMake(startTopBottom, height);
        CGPoint tmp3 = CGPointMake(startTopBottom + offsetTopBottom, tmp1.y);
        bottomAry = @[[NSValue valueWithCGPoint:tmp1], [NSValue valueWithCGPoint:tmp2], [NSValue valueWithCGPoint:tmp3]];
    }
    if (haveLeft) {
        CGPoint tmp1 = CGPointMake(halfBorderWidth + leftOffset, startLeftRight - offsetLeftRight);
        CGPoint tmp2 = CGPointMake(0, startLeftRight);
        CGPoint tmp3 = CGPointMake(tmp1.x, startLeftRight + offsetLeftRight);
        leftAry = @[[NSValue valueWithCGPoint:tmp1], [NSValue valueWithCGPoint:tmp2], [NSValue valueWithCGPoint:tmp3]];
    }
    if (haveRight) {
        CGPoint tmp1 = CGPointMake(width - halfBorderWidth - rightOffset, startLeftRight + offsetLeftRight);
        CGPoint tmp2 = CGPointMake(width, startLeftRight);
        CGPoint tmp3 = CGPointMake(tmp1.x, startLeftRight - offsetLeftRight);
        rightAry = @[[NSValue valueWithCGPoint:tmp1], [NSValue valueWithCGPoint:tmp2], [NSValue valueWithCGPoint:tmp3]];
    }
    
    
    
    CGFloat cornerRadius = self.cornerRadius;
    CGPoint left1 = CGPointMake(leftOffset + halfBorderWidth, cornerRadius + topOffset  );
    CGPoint left2 = CGPointMake(left1.x, height - cornerRadius - bottomOffset);
    
    
    CGPoint right1 = CGPointMake(width - rightOffset - halfBorderWidth, left1.y);
//    CGPoint right2 = CGPointMake(right1.x, left2.y);
    
    
    CGPoint bottom1 = CGPointMake(leftOffset + cornerRadius, height - bottomOffset - halfBorderWidth);
    CGPoint bottom2 = CGPointMake(width - rightOffset - cornerRadius, bottom1.y);
    
    
    CGPoint top1 = CGPointMake(bottom1.x, topOffset + halfBorderWidth);
//    CGPoint top2 = CGPointMake(bottom2.x, top1.y);
    
    
    
    CGContextMoveToPoint(context, left1.x, left1.y);
    
    for (NSValue *value in leftAry) {
        CGPoint tmp = [value CGPointValue];
        CGContextAddLineToPoint(context, tmp.x, tmp.y);
    }
    
    CGContextAddLineToPoint(context, left2.x, left2.y);
    
    
    CGPoint leftBottom = CGPointMake(leftOffset + cornerRadius + halfBorderWidth, height - cornerRadius - bottomOffset - halfBorderWidth);
    CGContextAddArc(context, leftBottom.x, leftBottom.y, cornerRadius, M_PI, M_PI_2, 1);
    
    for (NSValue *value in bottomAry) {
        CGPoint tmp = [value CGPointValue];
        CGContextAddLineToPoint(context, tmp.x, tmp.y);
    }
    
    CGContextAddLineToPoint(context, bottom2.x, bottom2.y);
    
    CGPoint rightBottom = CGPointMake(width - cornerRadius - rightOffset, leftBottom.y);
    CGContextAddArc(context, rightBottom.x, rightBottom.y, cornerRadius, M_PI_2, 0, 1);
    
    for (NSValue *value in rightAry) {
        CGPoint tmp = [value CGPointValue];
        CGContextAddLineToPoint(context, tmp.x, tmp.y);
    }
    
    CGContextAddLineToPoint(context, right1.x, right1.y);
    
    CGPoint rightTop = CGPointMake(rightBottom.x - halfBorderWidth, cornerRadius + topOffset + halfBorderWidth);
    CGContextAddArc(context, rightTop.x, rightTop.y, cornerRadius, 0, 1.5 * M_PI, 1);
    
    
    for (NSValue *value in topAry) {
        CGPoint tmp = [value CGPointValue];
        CGContextAddLineToPoint(context, tmp.x, tmp.y);
    }
    
    CGContextAddLineToPoint(context, top1.x, top1.y);
    
    CGPoint leftTop = CGPointMake(leftBottom.x, rightTop.y);
    CGContextAddArc(context, leftTop.x, leftTop.y, cornerRadius, 1.5 * M_PI, M_PI, 1);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);
    
    
    self.backgroundView.frame = CGRectMake(leftOffset, topOffset, width - leftOffset - rightOffset, height - topOffset - bottomOffset);
    
    
}

@end
