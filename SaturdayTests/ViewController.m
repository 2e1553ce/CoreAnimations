//
//  ViewController.m
//  SaturdayTests
//
//  Created by iOS-School-1 on 03.06.17.
//  Copyright © 2017 iOS-School-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *customView;
@property (nonatomic, strong) UIButton *firstButton;
@property (nonatomic, strong) UIButton *secondButton;

@end

@implementation ViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self addInterface];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Interface

- (void)addInterface {
    
    CGRect bounds = CGRectMake(CGRectGetWidth(self.view.bounds) / 2.f - 25.f, CGRectGetHeight(self.view.bounds) / 2.f - 25.f, 50.f, 50.f);
    // Custom View
    self.customView = [[UIView alloc] initWithFrame:bounds];
    self.customView.backgroundColor = UIColor.cyanColor;
    
    // Custom first button
    bounds = CGRectMake(CGRectGetWidth(self.view.bounds) / 2.f - 100.f, CGRectGetHeight(self.view.bounds) / 2.f + 35.f, 90.f, 20.f);
    self.firstButton = [[UIButton alloc] initWithFrame:bounds];
    [_firstButton addTarget:self
                     action:@selector(firstButtonAction:)
           forControlEvents:UIControlEventTouchUpInside];
    _firstButton.backgroundColor = UIColor.grayColor;
    [_firstButton setTitle:@"first" forState:UIControlStateNormal];
    
    // Custom second button
    bounds = CGRectMake(CGRectGetWidth(self.view.bounds) / 2.f + 10.f, CGRectGetHeight(self.view.bounds) / 2.f + 35.f, 90.f, 20.f);
    self.secondButton = [[UIButton alloc] initWithFrame:bounds];
    [_secondButton addTarget:self
                      action:@selector(secondButtonAction:)
            forControlEvents:UIControlEventTouchUpInside];
    _secondButton.backgroundColor = UIColor.lightGrayColor;
    [_secondButton setTitle:@"second" forState:UIControlStateNormal];
    
    [self.view addSubview:_customView];
    [self.view addSubview:_firstButton];
    [self.view addSubview:_secondButton];
}

#pragma mark - Actions

- (void)firstButtonAction:(UIButton *)sender {
    /*
    [UIView animateWithDuration:3.f animations:^{
        _customView.alpha = 0.5f;
        //calayer
        _customView.transform = CGAffineTransformMakeRotation(M_PI/4);
     
    }];*/
    NSLog(@"");
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position.x";
    animation.values = @[ @0, @10, @-10, @10, @0 ];
    animation.keyTimes = @[ @0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1 ];
    animation.duration = 0.4;
    animation.repeatCount = HUGE_VALF;
    
    animation.additive = YES;
    
    [_customView.layer addAnimation:animation forKey:@"shake"];
}

- (void)secondButtonAction:(UIButton *)sender {
    /*
    [UIView animateWithDuration:1.f animations:^{
        _customView.alpha = 1.f;
        _customView.transform = CGAffineTransformMakeRotation(M_PI);
        CGPoint center = CGPointMake(200, 300);
        _customView.center = center;
    }]; */
    CGRect boundingRect = CGRectMake(-150, -150, 300, 300);
    
    CAKeyframeAnimation *orbit = [CAKeyframeAnimation animation];
    orbit.keyPath = @"position";
    orbit.path = CFAutorelease(CGPathCreateWithEllipseInRect(boundingRect, NULL));
    orbit.duration = 4;
    orbit.additive = YES;
    orbit.repeatCount = HUGE_VALF;
    orbit.calculationMode = kCAAnimationPaced;
    orbit.rotationMode = kCAAnimationRotateAuto;
    
    [_customView.layer addAnimation:orbit forKey:@"orbit"];
}

// layoutifneeded
// update constraint if masonry used
// bizie
@end
