//
//  ViewController.m
//  YTLoadingViewDemo
//
//  Created by TonyAng on 16/4/1.
//  Copyright © 2016年 TonyAng. All rights reserved.
//

#import "ViewController.h"
#import "YTLoadingView.h"
@interface ViewController ()
@property (nonatomic, strong) YTLoadingView *loadingView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"YTLoadingView";
    _loadingView = [[YTLoadingView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    _loadingView.center = self.view.center;
    [self.view addSubview:_loadingView];
    [self createNavigationItem];
}

-(void)createNavigationItem{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"显示" style:UIBarButtonItemStylePlain target:self action:@selector(show:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"隐藏" style:UIBarButtonItemStylePlain target:self action:@selector(hiden:)];
    
}

- (void)show:(id)sender
{
    [_loadingView showView:YES];
}

- (void)hiden:(id)sender
{
    [_loadingView showView:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
