//
//  BIDCollegeLevelViewController.m
//  NavigateTables
//
//  Created by EventHorizon on 23/04/2013.
//  Copyright (c) 2013 EventHorizon. All rights reserved.
//

#import "BIDCollegeLevelViewController.h"
#import "BIDCollegeLevelDetailViewController.h"

static NSString *CellIdentifier = @"Cell";

@implementation BIDCollegeLevelViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Points by institution";
        
        self.colleges = @[@"UCC",@"TCD",@"UCD",@"NUIG",@"DIT",@"CIT",@"DCU"];
        
        
        /*reverse next two lines to retrieve original*/
        
        //self.detailController = [[BIDCollegeLevelViewController alloc] initWithNibName:@"CollegeView" bundle:nil];
        
        self.detailController = [[BIDCollegeLevelDetailViewController alloc] initWithNibName:@"CollegeDetailView" bundle:nil];
        
    }
    
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"CAO_medium_info.gif"]];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
    
}


#pragma mark - Table View Data Source Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.colleges count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    cell.textLabel.text = self.colleges[indexPath.row];
    
    return cell;
}


#pragma mark - Table View Delegate Methods

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /* trying to put course name in info button.*/
    //NSString *name = self.courses[indexPath];
    
    
    NSString *name = @"Hey do you see the disclosure button?";
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:name
                                                    message: @"Touch to drill down instead."
                                                   delegate:nil cancelButtonTitle:@"Won't happen again"
                                          otherButtonTitles:nil];
    [alert show];
    
}


-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    self.detailController.title = @"Disclosure Button Pressed";
    NSString *selectedCollege = self.colleges[indexPath.row];
    //NSString *detailMessage = [[NSString alloc] initWithFormat:@"This is details for %@.",selectedCourse];
    /*test*/
    //NSString *detailUpperLeft = @"Course:";
    
    // self.detailController.message = detailMessage;
    // self.detailController.courseList = detailUpperLeft;
    self.detailController.title = selectedCollege;
    [self.navigationController pushViewController:self.detailController animated:YES];
    
}


@end
