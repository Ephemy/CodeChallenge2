//
//  WebViewController.m
//  CodeChallenge2
//
//  Created by Jonathan Chou on 10/30/14.
//  Copyright (c) 2014 Jonathan Chou. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController () <UIWebViewDelegate>
@property  IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIButton *dismissButton;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"test %@",self.request);
    self.webView.delegate = self;
    self.webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    [self.view addSubview: self.webView];
    [self.webView loadRequest:self.request];
    [self.webView addSubview:self.dismissButton];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self
               action:@selector(closeAd)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"DISMISS VIEW" forState:UIControlStateNormal];
    button.frame = CGRectMake(0.0, 210.0, 160.0, 40.0);
    [self.view addSubview:button];
    
//    self.webView
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) closeAd{
    [self dismissModalViewControllerAnimated:YES];

}
@end
