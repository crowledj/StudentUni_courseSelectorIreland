//
//  BIDCollegeLevel67ViewController.m
//  NavigateTables
//
//  Created by EventHorizon on 07/01/2014.
//  Copyright (c) 2014 EventHorizon. All rights reserved.
//

#import "BIDCollegeLevel67ViewController.h"
#import "BIDCollegeLevel67DetailViewController.h"

//
//  BIDCollegeLevelViewController.m
//  NavigateTables
//
//  Created by EventHorizon on 23/04/2013.
//  Copyright (c) 2013 EventHorizon. All rights reserved.
//


static NSString *CellIdentifier = @"Cell";

@implementation BIDCollegeLevel67ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Level 6,7 Min. Points by Institution";
        
        self.colleges = @[@"ATHLONE IT",@"CARLOW COLLEGE",@"IT TALLAGHT ",@"NATIONAL COLLEGE OF IRELAND",@"PORTOBELLO COLLEGE",@"TRINITY COLLEGE DUBLIN",@"DUNDALK IT",@"UNIVERSITY OF LIMERICK",@"IT CARLOW",@"CORK IT",@"COLLEGE OF COMPUTER TRAINING",@"GALWAY-MAYO IT",@"LETTERKENNY IT",@"DUBLIN BUSINESS SCHOOL",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"NATIONAL COUNSELLING AND PSYCHOTHERAPY INSTITUTE",@"LIMERICK IT",@"IT SLIGO ",@"ST ANGELAS - SLIGO",@"DUN LAOGHAIRE IADT",@"GRAFTON COLLEGE of MANAGEMENT SCIENCES",@"GRIFFITH COLLEGE DUBLIN, CORK AND LIMERICK",@"INSTITUTE OF BUSINESS AND TECHNOLOGY  SWORDS",@"IT BLANCHARDSTOWN ",@"IT TRALEE",@"WATERFORD INSTITUTE OF TECHNOLOGY"];
        
        /*reverse next two lines to retrieve original*/
        
        self.detailController = (BIDCollegeLevel67ViewController *)[[BIDCollegeLevel67DetailViewController alloc] initWithNibName:@"CollegeLevel67DetailView" bundle:nil];
        
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

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
    
    self.detailController.title = @"Disclosure Button Pressed";
    NSString *selectedCollege = self.colleges[indexPath.row];
    
    self.detailController.title = selectedCollege;
    [self.navigationController pushViewController:self.detailController animated:YES];
    
    
}



-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    self.detailController.title = @"Disclosure Button Pressed";
    NSString *selectedCollege = self.colleges[indexPath.row];
    NSString *name=nil;

    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:name
                                                    message: selectedCollege
                                                   delegate:nil cancelButtonTitle:@"OK , good to know !"
                                          otherButtonTitles:nil];
    [alert show];
}


@end

