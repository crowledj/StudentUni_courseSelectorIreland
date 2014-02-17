//
//  BIDCollegeLevelViewController.m
//  NavigateTables
//
//  Created by EventHorizon on 23/04/2013.
//  Copyright (c) 2013 EventHorizon. All rights reserved.
//

#import "BIDCollegeLevelViewController.h"
#import "BIDCollegeLevelDetailViewController.h"

#define COLLEGE_NUM 45

static NSString *CellIdentifier = @"Cell";

@implementation BIDCollegeLevelViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Level 8 Min. Points by Institution";
        
        self.colleges = @[@"Athlone IT",@"Carlow College",@"IT Carlow ",@"Cork IT",@"Royal college of Surgeons",@"University College Dublin",@"Dundalk IT",@"University College Cork",@"All Hallows",@"American College",@"Church of Ireland College",@"Marino Institute of Technology",@"Dublin Business School",@"IT Blanchardstown",@"Galway - Mayo IT",@"NUI - Galway",@"St Patricks - Thurles",@"Dublin City University",@"Griffith College Dublin, Cork and Limerick",@"Institute of Business and Technology Swords",@"Mater Dei",@"National College of Art and Design",@"University of Limerick",@"Limerick IT",@"Dublin Institute of Technology",@"Dun Laoghaire IADT",@"Independent Colleges Dublin ",@"ICD Business School",@"National College of Ireland",@"Letterkenny IT",@"Marino Institute of Technology",@"National Counselling and Psychotherapy Institute",@"ST Patricks (Pontifical)-Maynooth",@"NUI - Maynooth",@"Shannon College of Hotel Mgt",@"IT Tallaght",@"St Patricks Drumcondra",@"Trinity College Dublin",@"St Angelas - Sligo",@"IT Sligo",@"IT Tralee",@"Waterford Institute of Technology"];
        
        
        /*reverse next two lines to retrieve original*/

        
        self.detailController = (BIDCollegeLevelViewController *)[[BIDCollegeLevelDetailViewController alloc] initWithNibName:@"CollegeLevelDetailView" bundle:nil];
        
    }
    
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"CAO_medium_info.gif"]];
    //self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"David Crowley.jpg"]];
    
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
    NSString *rowName=nil;
    
    //store fulll college name in a variable String for display on disclosure button press.
    rowName=self.colleges[indexPath.row];

    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:name
                                                    message: rowName
                                                   delegate:nil cancelButtonTitle:@"OK , good to know !"
                                          otherButtonTitles:nil];
    [alert show];
    
}
 
 


@end
