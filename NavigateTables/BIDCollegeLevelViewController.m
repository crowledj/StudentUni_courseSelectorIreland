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
        self.title = @"Level 8 Points by institution";
        
        NSAttributedString *text = @"Hello";
        //[text setColor:[UIColor grayColor]];
        
        self.colleges = @[@"UNIVERSITY COLLEGE CORK",@"TCD",@"UCD",@"NUIG",@"DIT",@"CIT",@"DCU",@"DBS",@"GMT"];
        
        
        /*reverse next two lines to retrieve original*/
        
        //self.detailController = [[BIDCollegeLevelViewController alloc] initWithNibName:@"CollegeView" bundle:nil];
        
        self.detailController = [[BIDCollegeLevelDetailViewController alloc] initWithNibName:@"CollegeLevelDetailView" bundle:nil];
        
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
    /* test */
     
     self.detailController.title = @"Disclosure Button Pressed";
     NSString *selectedCollege = self.colleges[indexPath.row];
     self.detailController.title = selectedCollege;
     [self.navigationController pushViewController:self.detailController animated:YES];
     
     /* end - test */
    
}


-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    NSString *name=nil;
    
    if([self.detailController.title isEqualToString:@"UCC"])
        name = @"University College Cork";
        
    else if([self.detailController.title isEqualToString:@"TCD"])
        name = @"Trinity College Dublin";
    
    else if([self.detailController.title isEqualToString:@"UCD"])
        name = @"University College Dublin";
    
    else if([self.detailController.title isEqualToString:@"NUIG"])
        name = @"National University of Ireland Galway";
    
    else if([self.detailController.title isEqualToString:@"DIT"])
        name = @"Dublin Institute of Technolgy";
    
    else if([self.detailController.title isEqualToString:@"CIT"])
        name = @"Cork Institute of technology";
    
    else if([self.detailController.title isEqualToString:@"DCU"])
        name = @"Dunlin City University";
  
    else if([self.detailController.title isEqualToString:@"DBS"])
        name = @"Dublin Business School";
    
    else if([self.detailController.title isEqualToString:@"GMT"])
        name = @"GMT?";
    
    else
        name = @"Institution not found ?";
    
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:name
                                                    message: @"Extra info bit ;)"
                                                   delegate:nil cancelButtonTitle:@"OK , good to know !"
                                          otherButtonTitles:nil];
    [alert show];
    
}


@end
