//
//  LHLoadingTipView.m
//  LHLoadingView
//
//  Created by TonyAng on 16/4/1.
//  Copyright © 2016年 TonyAng. All rights reserved.
//

#import "YTLoadingView.h"

#define AnimationTime   0.3

#define kDotSize                (CGSizeMake(0.4 * self.frame.size.width, 0.4 * self.frame.size.height))

#define LeftTopPosition         (CGPointMake(0, 0))
#define LeftTBottomPosition     (CGPointMake(0, 0.6 * self.frame.size.height))
#define RightBottomPosition     (CGPointMake(0.6 * self.frame.size.width, 0.6 * self.frame.size.height))
#define RightTopPosition        (CGPointMake(0.6 * self.frame.size.width, 0))

#define kDotColor               [UIColor colorWithRed:200/255.0 green:206/255.0 blue:221/255.0 alpha:1.0]

@interface YTLoadingView()

@property (strong, nonatomic) UILabel *dotLabel0,*dotLabel1,*dotLabel2;

@property (strong, nonatomic) NSArray *dotViews;
@property (assign, nonatomic) NSInteger dotIndex;
@property (strong, nonatomic) NSTimer *timer;
@end

@implementation YTLoadingView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.hidden = YES;
        [self initView];
    }
    return self;
}

-(void)awakeFromNib{
    self.hidden = YES;
    [self initView];
}

- (void)initView {
    self.backgroundColor = [UIColor clearColor];
    self.clipsToBounds = YES;
    self.userInteractionEnabled = NO;
    
    _dotLabel0 = [[UILabel alloc] initWithFrame:(CGRect){RightBottomPosition, kDotSize}];
    _dotLabel0.text = @"你";
    _dotLabel0.textAlignment = NSTextAlignmentCenter;
    _dotLabel0.textColor = [UIColor colorWithRed:arc4random()%256/256.0 green:arc4random()%256/256.0 blue:arc4random()%256/256.0 alpha:1.0];
    _dotLabel0.backgroundColor = kDotColor;
    [self addSubview:_dotLabel0];
    
    _dotLabel1 = [[UILabel alloc]initWithFrame:(CGRect){LeftTBottomPosition, kDotSize}];
    _dotLabel1.text = @"我";
    _dotLabel1.textAlignment = NSTextAlignmentCenter;
    _dotLabel1.textColor = [UIColor colorWithRed:arc4random()%256/256.0 green:arc4random()%256/256.0 blue:arc4random()%256/256.0 alpha:1.0];
    _dotLabel1.backgroundColor = kDotColor;
    [self addSubview:_dotLabel1];
    
    _dotLabel2 = [[UILabel alloc]initWithFrame:(CGRect){LeftTopPosition, kDotSize}];
    _dotLabel2.text = @"他";
    _dotLabel2.textAlignment = NSTextAlignmentCenter;
    _dotLabel2.textColor = [UIColor colorWithRed:arc4random()%256/256.0 green:arc4random()%256/256.0 blue:arc4random()%256/256.0 alpha:1.0];
    _dotLabel2.backgroundColor = kDotColor;
    [self addSubview:_dotLabel2];
    
    _dotViews = @[_dotLabel0, _dotLabel1, _dotLabel2];
    _dotIndex = 0;
}

-(void)showView:(BOOL)show {
    if (show) {
        self.hidden = NO;
        if (!_timer) {
            _timer = [NSTimer timerWithTimeInterval:AnimationTime target:self selector:@selector(beginAnimation) userInfo:nil repeats:YES];
            [[NSRunLoop mainRunLoop]addTimer:_timer forMode:NSRunLoopCommonModes];
        }
    } else {
        [_timer invalidate];
        _timer = nil;
        self.hidden = YES;
    }
}

-(void)beginAnimation {
    [UIView animateWithDuration:AnimationTime delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        UIView *dotView = _dotViews[_dotIndex];
        [self moveDotViewToNextPosition:dotView];
        
        _dotIndex ++;
        _dotIndex = _dotIndex > 2 ? 0 : _dotIndex;
        
    } completion:nil];
}

-(void)moveDotViewToNextPosition:(UIView*)dotView {
    if (CGPointEqualToPoint(dotView.frame.origin, LeftTopPosition)) {
        dotView.frame = (CGRect){LeftTBottomPosition, dotView.frame.size};
    }
    else if (CGPointEqualToPoint(dotView.frame.origin, LeftTBottomPosition)) {
        dotView.frame = (CGRect){RightBottomPosition, dotView.frame.size};
    }
    else if (CGPointEqualToPoint(dotView.frame.origin, RightBottomPosition)) {
        dotView.frame = (CGRect){RightTopPosition, dotView.frame.size};
    }
    else if (CGPointEqualToPoint(dotView.frame.origin, RightTopPosition)) {
        dotView.frame = (CGRect){LeftTopPosition, dotView.frame.size};
    }
}
@end
