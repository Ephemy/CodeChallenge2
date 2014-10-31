//
//  ViewController.m
//  CodeChallenge2
//
//  Created by Jonathan Chou on 10/30/14.
//  Copyright (c) 2014 Jonathan Chou. All rights reserved.
//

#import "RootViewController.h"
#import "City.h"
#import "WebViewController.h"
#import "DetailViewController.h"
@interface RootViewController () <UITableViewDataSource, UITableViewDelegate, CityDelegate>
@property NSMutableArray *cityData;
@property BOOL editToggle;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.editToggle = YES;
    self.cityData = [@[] mutableCopy];
    City *sanFran = [[City alloc] init];
    sanFran.name = @"San Francisco";
    sanFran.state = @"California";
    sanFran.urlOfWiki = @"http://en.wikipedia.org/wiki/San_Francisco";
    sanFran.image = [UIImage imageNamed:@"sanfran"];
    City *manHat = [[City alloc] init];
    manHat.name = @"Manhattan";
    manHat.state = @"New York";
    manHat.urlOfWiki = @"http://en.wikipedia.org/wiki/Manhattan";
    manHat.image = [UIImage imageNamed:@"manhattan"];
    City *tokYo = [[City alloc] init];
    tokYo.name = @"Tokyo";
    tokYo.state = @"Japan";
    tokYo.urlOfWiki = @"http://en.wikipedia.org/wiki/Tokyo";
    tokYo.image = [UIImage imageNamed:@"tokyo"];
    City *taiPei = [[City alloc] init];
    taiPei.name = @"Taipei";
    taiPei.urlOfWiki = @"http://en.wikipedia.org/wiki/Taipei";
    taiPei.state = @"Taiwan";
    taiPei.image = [UIImage imageNamed:@"taipei"];
    [self.cityData addObjectsFromArray:@[sanFran, manHat, tokYo, taiPei]];
    sanFran.delegate = self;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.cityData.count;

}

- (void)returnURLOfCityDescription{
    
    WebViewController *webVC = [[WebViewController alloc] init];
    City *city = [self.cityData objectAtIndex:0];
    NSURL *url = [NSURL URLWithString:city.urlOfWiki];
    NSURLRequest *request = [NSURLRequest requestWithURL: url];
    webVC.request = request;
    //how to pass information on
    [self presentModalViewController:webVC animated:YES];


}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    City *city = self.cityData[indexPath.row];
    cell.textLabel.text = city.name;
    cell.detailTextLabel.text = city.state;
    [cell layoutSubviews];
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath { //implement the delegate method
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [tableView deleteRowsAtIndexPaths:@[self.cityData[indexPath.row]] withRowAnimation:UITableViewRowAnimationFade];
        [self.cityData removeObjectAtIndex:indexPath.row];
        [self.tableView reloadData];
    }
}

- (IBAction)editButtonPressed:(UIBarButtonItem *)barButton {
    if(self.editToggle)
    {
    barButton.title = @"Done";
    self.editToggle = NO;
        [self.tableView setEditing:YES];
        
    }
    else
    {
        barButton.title = @"Edit";
        self.editToggle = YES;
        [self.tableView setEditing:NO];
    }
}
- (IBAction)onButtonPressedWebView:(UIBarButtonItem *)sender {
    City *city = self.cityData[0];
    [city urlButtonPressed];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DetailViewController *detailVC = segue.destinationViewController;
    NSInteger rowNumber = [self.tableView indexPathForSelectedRow].row;
    City *theCity = [self.cityData objectAtIndex:rowNumber];
    detailVC.city = theCity;
}

@end
