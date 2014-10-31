//
//  DetailViewController.m
//  CodeChallenge2
//
//  Created by Jonathan Chou on 10/30/14.
//  Copyright (c) 2014 Jonathan Chou. All rights reserved.
//

#import "DetailViewController.h"
#import "WebViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameLabel.text = [NSString stringWithFormat: @"City Name: %@",self.city.name];
    self.stateLabel.text = [NSString stringWithFormat: @"State/Country Name: %@",self.city.state];
    self.imageView.image = self.city.image;
    
    // Do any additional setup after loading the view.
}
- (IBAction)onButtonPressedLoadWiki:(UIGestureRecognizer *)gesture
{
    WebViewController *webVC = [[WebViewController alloc] init];
    NSURL *url = [NSURL URLWithString:self.city.urlOfWiki];
    NSURLRequest *request = [NSURLRequest requestWithURL: url];
    webVC.request = request;
    //how to pass information on
    [self presentModalViewController:webVC animated:YES];
    
}

@end
