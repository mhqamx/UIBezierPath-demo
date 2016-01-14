//
//  MXMainViewController.m
//  UIBezierPath-demo
//
//  Created by 马霄 on 1/14/16.
//  Copyright © 2016 马 霄. All rights reserved.
//

#import "MXMainViewController.h"
#import "MXBezierPathView.h"
@interface MXMainViewController ()
/** 加载过渡layer */
@property (nonatomic, strong) CAShapeLayer *loadingLayer;
/** 延时 */
@property (nonatomic, strong) NSTimer *timer;
/** 动画类数组 */
@property (nonatomic, strong) NSArray *animationTypes;
/** 目录 */
@property (nonatomic, assign) NSUInteger   index;
/** 贝塞尔路径 */
@property (nonatomic, strong) MXBezierPathView *pathView;

@end

@implementation MXMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    // 如果要测试UIBezierPath 打开注释
    [self bezierPathTest];
    
}

- (void)bezierPathTest {
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    MXBezierPathView *bezierView = [[MXBezierPathView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, height - 140 - 64)];
    [self.view addSubview:bezierView];
    
    bezierView.layer.borderColor = [UIColor redColor].CGColor;
    bezierView.layer.borderWidth = 1;
    bezierView.backgroundColor = [UIColor orangeColor];
    
    bezierView.type = kDefaultPath;
    self.index = 0;
    
    self.animationTypes = @[@(kDefaultPath),
                            @(kRectPath),
                            @(kCirclePath),
                            @(kOvalPath),
                            @(kRoundedRectPath),
                            @(kArcPath),
                            @(kSecondBezierPath),
                            @(kThirdBrzierPath)];

    self.timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                  target:self
                                                selector:@selector(updateType)
                                                userInfo:nil
                                                 repeats:YES];
    
    self.view.layer.borderColor = [UIColor greenColor].CGColor;
    self.view.layer.borderWidth = 1;
    self.pathView = bezierView;
}

/** 更新曲线状态 */
- (void)updateType {
    if (self.index + 1 < self.animationTypes.count) {
        self.index++;
    } else {
        self.index = 0;
    }
    
    self.pathView.type = [[self.animationTypes objectAtIndex:self.index] intValue];
    [self.pathView setNeedsDisplay];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
