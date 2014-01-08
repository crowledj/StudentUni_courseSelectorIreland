/******************************/

//
//  BIDContentDetailViewController.m
//  NavigateTables
//
//  Created by EventHorizon on 14/04/2013.
//  Copyright (c) 2013 EventHorizon. All rights reserved.
//

#import "BIDContentViewController.h"
#import "BIDContentDetailViewController.h"
//#import "BIDFirstLevelViewController.m"

static NSString *CellIdentifier = @"Cell";

@implementation BIDContentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    NSLog(@"at v. start of initNib method in college detail view");
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        NSLog(@"in initNib method in college detail view -- SETTING TITLE ");
        
        self.title = @"Points by level 8 course ";
        
        NSLog(@"in initNib method in college detail view -- about to set courses ");
        
        //self.rowImage = @"";
        self.courses = @[@"Arts",@"Accountancy",@"Commerce",@"Law",@"Business Information Systems",
                         @"Finance",@"Food Science",@"Nutritional Science",@"Physics",@"Electrical Engineering",@"Civil Engineering",@"Process Engineering",
                         @"Energy Engineering",@"Pharmacy",@"Environmental Science"];
        
        //self.detailController = [[BIDContentDetailViewController alloc] init];
        self.detailController = [[BIDContentDetailViewController alloc] initWithNibName:@"ContentDetailView" bundle:nil];
        
    }
    return self;
}

- (void)viewDidLoad
{
    NSLog(@"at start of view did load method ");
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"CAO_medium_info.gif"]];
    
     NSLog(@"in view did load method ");
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
    
}


#pragma mark - Table View Data Source Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.courses count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    cell.textLabel.text = self.courses[indexPath.row];
    
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
    NSString *selectedCourse = self.courses[indexPath.row];
    //NSString *detailMessage = [[NSString alloc] initWithFormat:@"This is details for %@.",selectedCourse];
    /*test*/
    //NSString *detailUpperLeft = @"Course:";
    
   // self.detailController.message = detailMessage;
   // self.detailController.courseList = detailUpperLeft;
    self.detailController.title = selectedCourse;
    [self.navigationController pushViewController:self.detailController animated:YES];
    
}



@end






