//
//  ViewController.m
//  自定义弹出框
//
//  Created by 遇见远洋 on 16/7/18.
//  Copyright © 2016年 遇见远洋. All rights reserved.
//

#import "ViewController.h"
#import "UserInfoAlertView.h"

@interface ViewController ()
@property (strong,nonatomic) UserInfoAlertView * grayView;/**<自定义的view*/

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    UIButton * showBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 20, 100, 50)];
    [self.view addSubview:showBtn];
    showBtn.backgroundColor = [UIColor greenColor];
    [showBtn setTitle:@"开始" forState:UIControlStateNormal];
    [showBtn addTarget:self action:@selector(showAlertView:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton * hideBtn = [[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 100 ,20 ,100, 50)];
    [hideBtn setTitle:@"隐藏" forState:UIControlStateNormal];

    [self.view addSubview:hideBtn];
    hideBtn.backgroundColor = [UIColor redColor];
    [hideBtn addTarget:self action:@selector(hideAlertView:) forControlEvents:UIControlEventTouchUpInside];
    
    UserInfoAlertView * view = [[UserInfoAlertView alloc]initWithFrame:CGRectMake(0, 0, 300, 300)];
    view.layer.cornerRadius = 15;
    view.layer.masksToBounds = YES;
    view.backgroundColor = [UIColor whiteColor];
    self.grayView = view;
    self.grayView.center = CGPointMake(self.view.center.x, [UIScreen mainScreen].bounds.size.height +100);
}

- (void)showAlertView:(UIButton *)showBtn {
    [self.view addSubview:self.grayView];

    [UIView animateWithDuration:1.0 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [self.grayView.layer addAnimation:[self rotateAnimationWithDuration:1.0 frameValue:0 toValue:M_PI * 2] forKey:nil];

        self.grayView.center = CGPointMake(self.view.center.x, self.view.center.y);

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [self.grayView.layer removeAllAnimations];
        });
    } completion:^(BOOL finished) {
    }];
}

- (void)hideAlertView:(UIButton *)hideBtn {
    [UIView animateWithDuration:0.35 animations:^{
        self.grayView.center = CGPointMake(self.view.center.x, [UIScreen mainScreen].bounds.size.height +100);
        
       CABasicAnimation * rotate  = [self rotateAnimationWithDuration:1.0 frameValue:0 toValue:M_PI * 2];
        [self.grayView.layer addAnimation:rotate forKey:nil];
    } completion:^(BOOL finished) {
        [self.grayView removeFromSuperview];
    }];
}

- (CABasicAnimation *)rotateAnimationWithDuration:(CFTimeInterval)duration frameValue:(CGFloat)frameValue toValue:(CGFloat)toValue {
    
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = duration;
//    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = INT_MAX;
    return rotationAnimation;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

}

@end
