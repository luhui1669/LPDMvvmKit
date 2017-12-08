//
//  LPDHomeViewController.m
//  LPDMvvmKit
//
//  Created by foxsofter on 15/12/16.
//  Copyright © 2015年 eleme. All rights reserved.
//

#import "LPDHomeViewController.h"
#import "LPDHomeViewModel.h"

@interface LPDHomeViewController ()

@property (nonatomic, strong) UIButton *pushViewControllerButton;
@property (nonatomic, strong) UIButton *popViewControllerButton;
@property (nonatomic, strong) UIButton *popToRootViewControllerButton;
@property (nonatomic, strong) UIButton *popToViewControllerButton;
@property (nonatomic, strong) UIButton *presentViewControllerButton;
@property (nonatomic, strong) UIButton *dismissViewControllerButton;
@property (nonatomic, strong) UIButton *setViewControllersButton;

@end

@implementation LPDHomeViewController

#pragma mark - life cycle

- (instancetype)initWithViewModel:(id<LPDViewModelProtocol>)viewModel {
  self = [super initWithViewModel:viewModel];
  if (self) {
    LPDHomeViewModel *selfViewModel = viewModel;
    if (selfViewModel.tabBarItemImage) {
      self.tabBarItem =
        [[UITabBarItem alloc] initWithTitle:selfViewModel.tabBarItemTitle
                                      image:[UIImage imageNamed:selfViewModel.tabBarItemImage] tag:0];
    }
  }
  return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    NSInteger count = self.navigationController.viewControllers.count;
    NSLog(@"子view----%ld",(long)count);
}

- (void)viewDidLoad {
  [super viewDidLoad];
  UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
  [self.view addSubview:scrollView];
  
  CGPoint center = self.view.center;
  CGFloat y = 10;
  _pushViewControllerButton = [UIButton buttonWithType:UIButtonTypeCustom];
  [_pushViewControllerButton setTitle:@"pushViewController" forState:UIControlStateNormal];
  [_pushViewControllerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  _pushViewControllerButton.backgroundColor = [UIColor lightGrayColor];
  _pushViewControllerButton.frame = CGRectMake(0, y, 250, 35);
  _pushViewControllerButton.centerX = center.x;
  [scrollView addSubview:_pushViewControllerButton];
  [_pushViewControllerButton addTarget:self
                                action:@selector(pushViewController:)
                      forControlEvents:UIControlEventTouchUpInside];

  _popViewControllerButton = [UIButton buttonWithType:UIButtonTypeCustom];
  [_popViewControllerButton setTitle:@"popViewController" forState:UIControlStateNormal];
  [_popViewControllerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  _popViewControllerButton.backgroundColor = [UIColor lightGrayColor];
  _popViewControllerButton.frame = CGRectMake(0, y += 45, 250, 35);
  _popViewControllerButton.centerX = center.x;
  [scrollView addSubview:_popViewControllerButton];
  [_popViewControllerButton addTarget:self
                               action:@selector(popViewController:)
                     forControlEvents:UIControlEventTouchUpInside];

  _popToRootViewControllerButton = [UIButton buttonWithType:UIButtonTypeCustom];
  [_popToRootViewControllerButton setTitle:@"popToRootViewController" forState:UIControlStateNormal];
  [_popToRootViewControllerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  _popToRootViewControllerButton.backgroundColor = [UIColor lightGrayColor];
  _popToRootViewControllerButton.frame = CGRectMake(0, y += 45, 250, 35);
  _popToRootViewControllerButton.centerX = center.x;;
  [scrollView addSubview:_popToRootViewControllerButton];
  [_popToRootViewControllerButton addTarget:self
                                     action:@selector(popToRootViewController:)
                           forControlEvents:UIControlEventTouchUpInside];
    
    _popToViewControllerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_popToViewControllerButton setTitle:@"popToViewController" forState:UIControlStateNormal];
    [_popToViewControllerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _popToViewControllerButton.backgroundColor = [UIColor lightGrayColor];
    _popToViewControllerButton.frame = CGRectMake(0, y += 45, 250, 35);
    _popToViewControllerButton.centerX = center.x;;
    [scrollView addSubview:_popToViewControllerButton];
    [_popToViewControllerButton addTarget:self
                                       action:@selector(popToViewController:)
                             forControlEvents:UIControlEventTouchUpInside];

  _presentViewControllerButton = [UIButton buttonWithType:UIButtonTypeCustom];
  [_presentViewControllerButton setTitle:@"presentViewController" forState:UIControlStateNormal];
  [_presentViewControllerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  _presentViewControllerButton.backgroundColor = [UIColor lightGrayColor];
  _presentViewControllerButton.frame = CGRectMake(0, y += 45, 250, 35);
  _presentViewControllerButton.centerX = center.x;
  [scrollView addSubview:_presentViewControllerButton];
  [_presentViewControllerButton addTarget:self
                                   action:@selector(presentViewController:)
                         forControlEvents:UIControlEventTouchUpInside];

  _dismissViewControllerButton = [UIButton buttonWithType:UIButtonTypeCustom];
  [_dismissViewControllerButton setTitle:@"dismissViewController" forState:UIControlStateNormal];
  [_dismissViewControllerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  _dismissViewControllerButton.backgroundColor = [UIColor lightGrayColor];
  _dismissViewControllerButton.frame = CGRectMake(0, y += 45, 250, 35);
  _dismissViewControllerButton.centerX = center.x;
  [scrollView addSubview:_dismissViewControllerButton];
  [_dismissViewControllerButton addTarget:self
                                   action:@selector(dismissViewController:)
                         forControlEvents:UIControlEventTouchUpInside];
    
    _setViewControllersButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_setViewControllersButton setTitle:@"setViewControllers" forState:UIControlStateNormal];
    [_setViewControllersButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _setViewControllersButton.backgroundColor = [UIColor lightGrayColor];
    _setViewControllersButton.frame = CGRectMake(0, y += 45, 250, 35);
    _setViewControllersButton.centerX = center.x;
    [scrollView addSubview:_setViewControllersButton];
    [_setViewControllersButton addTarget:self
                                     action:@selector(setViewControllers:)
                           forControlEvents:UIControlEventTouchUpInside];


  UIButton *pushViewModelButton = [UIButton buttonWithType:UIButtonTypeCustom];
  [pushViewModelButton setTitle:@"pushViewModel" forState:UIControlStateNormal];
  [pushViewModelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  pushViewModelButton.backgroundColor = [UIColor grayColor];
  pushViewModelButton.frame = CGRectMake(0, y += 45, 250, 35);
  pushViewModelButton.centerX = center.x;
  [scrollView addSubview:pushViewModelButton];
  [pushViewModelButton addTarget:self.viewModel action:@selector(pushViewModel) forControlEvents:UIControlEventTouchUpInside];

  UIButton *popViewModelButton = [UIButton buttonWithType:UIButtonTypeCustom];
  [popViewModelButton setTitle:@"popViewModel" forState:UIControlStateNormal];
  [popViewModelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  popViewModelButton.backgroundColor = [UIColor grayColor];
  popViewModelButton.frame = CGRectMake(0, y += 45, 250, 35);
  popViewModelButton.centerX = center.x;
  [scrollView addSubview:popViewModelButton];
  [popViewModelButton addTarget:self.viewModel action:@selector(popViewModel) forControlEvents:UIControlEventTouchUpInside];

  UIButton *popToViewModelButton = [UIButton buttonWithType:UIButtonTypeCustom];
  [popToViewModelButton setTitle:@"popToViewModel" forState:UIControlStateNormal];
  [popToViewModelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  popToViewModelButton.backgroundColor = [UIColor grayColor];
  popToViewModelButton.frame = CGRectMake(0, y += 45, 250, 35);
  popToViewModelButton.centerX = center.x;
  [scrollView addSubview:popToViewModelButton];
  [popToViewModelButton addTarget:self.viewModel action:@selector(popToViewModel) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *popToRootViewModelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [popToRootViewModelButton setTitle:@"popToRootViewModel" forState:UIControlStateNormal];
    [popToRootViewModelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    popToRootViewModelButton.backgroundColor = [UIColor grayColor];
    popToRootViewModelButton.frame = CGRectMake(0, y += 45, 250, 35);
    popToRootViewModelButton.centerX = center.x;
    [scrollView addSubview:popToRootViewModelButton];
    [popToRootViewModelButton addTarget:self.viewModel action:@selector(popToRootViewModel) forControlEvents:UIControlEventTouchUpInside];

  UIButton *presentViewModelButton = [UIButton buttonWithType:UIButtonTypeCustom];
  [presentViewModelButton setTitle:@"presentViewModel" forState:UIControlStateNormal];
  [presentViewModelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  presentViewModelButton.backgroundColor = [UIColor grayColor];
  presentViewModelButton.frame = CGRectMake(0, y += 45, 250, 35);
  presentViewModelButton.centerX = center.x;
  [scrollView addSubview:presentViewModelButton];
  [presentViewModelButton addTarget:self.viewModel action:@selector(presentViewModel) forControlEvents:UIControlEventTouchUpInside];

  UIButton *dismissViewModelButton = [UIButton buttonWithType:UIButtonTypeCustom];
  [dismissViewModelButton setTitle:@"dismissViewModel" forState:UIControlStateNormal];
  [dismissViewModelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  dismissViewModelButton.backgroundColor = [UIColor grayColor];
  dismissViewModelButton.frame = CGRectMake(0, y += 45, 250, 35);
  dismissViewModelButton.centerX = center.x;
  [scrollView addSubview:dismissViewModelButton];
  [dismissViewModelButton addTarget:self.viewModel action:@selector(dismissViewModel) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *setViewModelsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [setViewModelsButton setTitle:@"setViewModels" forState:UIControlStateNormal];
    [setViewModelsButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    setViewModelsButton.backgroundColor = [UIColor grayColor];
    setViewModelsButton.frame = CGRectMake(0, y += 45, 250, 35);
    setViewModelsButton.centerX = center.x;
    [scrollView addSubview:setViewModelsButton];
    [setViewModelsButton addTarget:self.viewModel action:@selector(setViewModels) forControlEvents:UIControlEventTouchUpInside];

  
  scrollView.contentSize= CGSizeMake(UIScreen.width, y + 45);
  scrollView.userInteractionEnabled = YES;
  scrollView.exclusiveTouch = YES;
  scrollView.canCancelContentTouches = YES;
  scrollView.delaysContentTouches = YES;
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

#pragma mark - actions

- (void)pushViewController:(UIButton *)sender {
  LPDHomeViewModel *vm = [[LPDHomeViewModel alloc] init];
  LPDHomeViewController *vc = [[LPDHomeViewController alloc] initWithViewModel:vm];
  [self.navigationController pushViewController:vc animated:YES];
}

- (void)popViewController:(UIButton *)sender {
  [self.navigationController popViewControllerAnimated:YES];
}

- (void)popToRootViewController:(UIButton *)sender {
  [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)popToViewController:(UIButton *)sender {
    NSInteger count = self.navigationController.viewControllers.count;
    NSInteger num = 0;
    if (count > 1) {
        num = 1;
        LPDHomeViewController *vc = self.navigationController.viewControllers[num];
        [self.navigationController popToViewController:vc animated:YES];
    } else {
        return;
    }
}

- (void)presentViewController:(UIButton *)sender {
  LPDHomeViewModel *vm = [[LPDHomeViewModel alloc] init];
  LPDNavigationViewModel *nvm = [[LPDNavigationViewModel alloc] initWithRootViewModel:vm];
  [self.navigationController presentNavigationController:[[LPDNavigationController alloc] initWithViewModel:nvm]
                                    animated:YES
                                  completion:^{

                                  }];
}

- (void)dismissViewController:(UIButton *)sender {
  [self.navigationController dismissNavigationControllerAnimated:YES
                                          completion:^{

                                          }];
}

- (void)setViewControllers:(UIButton *)sender {
    NSArray *vcs = [[NSMutableArray alloc] init];
    
//    LPDHomeViewModel *vm1 = [[LPDHomeViewModel alloc] init];
//    LPDHomeViewController *vc1 = [[LPDHomeViewController alloc] initWithViewModel:vm1];
    UIViewController *vc1 = [[UIViewController alloc] init];
    vc1.view.backgroundColor = [UIColor redColor];
    LPDHomeViewModel *vm2 = [[LPDHomeViewModel alloc] init];
    LPDHomeViewController *vc2 = [[LPDHomeViewController alloc] initWithViewModel:vm2];
    vc2.view.backgroundColor = [UIColor yellowColor];
    LPDHomeViewModel *vm3 = [[LPDHomeViewModel alloc] init];
    LPDHomeViewController *vc3 = [[LPDHomeViewController alloc] initWithViewModel:vm3];
    vc3.view.backgroundColor = [UIColor blueColor];
    vcs = @[vc1,vc2,vc3];
    [self.navigationController setViewControllers:vcs animated:YES];
}

- (void)dealloc {

}

@end
