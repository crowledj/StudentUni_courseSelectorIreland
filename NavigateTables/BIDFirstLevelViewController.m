//
//  BIDFirstLevelViewController.m
//  NavigateTables
//
//  Created by EventHorizon on 14/04/2013.
//  Copyright (c) 2013 EventHorizon. All rights reserved.
//

#import "BIDFirstLevelViewController.h"
#import "BIDSecondLevelViewController.h"
#import "BIDCollegeLevelViewController.h"
#import "BIDCollegeLevel67ViewController.h"


static NSString *CellIdentifier = @"Cell";



@implementation BIDFirstLevelViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    
    
    // new code attempting changes for multi table view
    if (self) {
        // Custom initialization
        self.title = @"CAO Points Guide 2013/2014";
        
        self.controller = @[
            [[BIDCollegeLevelViewController alloc] init],
            [[BIDCollegeLevel67ViewController alloc] init]
        ];
    }
     // end new code attempting changes for multi table view
    
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"CAO_medium_info.gif"]];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"David Crowley.jpg"]];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.controller count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    BIDSecondLevelViewController *controller = self.controller[indexPath.row];
    cell.textLabel.text = controller.title;
    cell.imageView.image = controller.rowImage;
    
    return cell;
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    BIDSecondLevelViewController *controller = self.controller[indexPath.row];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
