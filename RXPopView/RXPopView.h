//
//  RXPopView.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 15/12/22.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import <UIKit/UIKit.h>




typedef enum E_RXPopViewStyle{
    kE_RXPopViewStyle_TopCenter        =       1,
    kE_RXPopViewStyle_LeftCenter,
    kE_RXPopViewStyle_BottomCenter,
    kE_RXPopViewStyle_RightCenter,
    kE_RXPopViewStyle_Top              =       1 << 3,
    kE_RXPopViewStyle_Left             =       1 << 4,
    kE_RXPopViewStyle_Bottom           =       1 << 5,
    kE_RXPopViewStyle_Right            =       1 << 6,
}E_RXPopViewStyle;




@interface RXPopView : UIView
// default {0,0}
@property (nonatomic, assign) CGPoint trianglePoint;
// default 0
@property (nonatomic, assign) CGFloat borderWidth;
// default 0
@property (nonatomic, assign) CGFloat cornerRadius;
// default grayColor
@property (nonatomic, strong) UIColor *borderColor;
// default greenColor
@property (nonatomic, strong) UIColor *fillColor;
// default is kE_RXPopViewStyle_TopCenter
@property (nonatomic, assign) E_RXPopViewStyle e_RXPopViewStyle;
// default {0,0,0,0}, 非center才有效
@property (nonatomic, assign) UIEdgeInsets edgeInsets;
// default {0,0}, 非center才有效
@property (nonatomic, assign) CGPoint topTrianglePoint;
@property (nonatomic, assign) CGPoint leftTrianglePoint;
@property (nonatomic, assign) CGPoint bottomTrianglePoint;
@property (nonatomic, assign) CGPoint rightTrianglePoint;



@property (nonatomic, readonly) UIView *backgroundView;



@end



















