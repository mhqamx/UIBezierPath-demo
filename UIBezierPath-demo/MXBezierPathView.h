//
//  MXBezierPathView.h
//  UIBezierPath-demo
//
//  Created by 马霄 on 1/14/16.
//  Copyright © 2016 马 霄. All rights reserved.
//  自定义BezierView

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, MXBezierPathType) {
    kDefaultPath = 1, // 三角形
    kRectPath = 2,    // 矩形
    kCirclePath = 3,  // 圆
    kOvalPath = 4,    // 椭圆
    kRoundedRectPath = 5,// 带圆角的矩形
    kArcPath = 6,       // 弧
    kSecondBezierPath = 7,// 二次贝塞尔曲线
    kThirdBrzierPath = 8 // 三次贝塞尔曲线
};

@interface MXBezierPathView : UIView

/** 曲线类型 */
@property (nonatomic, assign) MXBezierPathType type;


@end
