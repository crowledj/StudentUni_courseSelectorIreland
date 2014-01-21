
//
//  CollegeLevelDetailViewController.m
//  NavigateTables
//
//  Created by EventHorizon on 02/06/2013.
//  Copyright (c) 2013 EventHorizon. All rights reserved.
//

#import <objc/runtime.h>
#import "BIDCollegeLevelDetailViewController.h"
#define SIZE 10
#define COLLEGE_NUM 11
#define MAX_COURSE_NUM 1000
#define FIELD_NUM 10
#define TABLE_FIELD_NUM 14
#define TABLE_ROW_NUM 500

#define UCC_COURSE_NUM 220
#define CIT_COURSE_NUM 128
#define UCD_COURSE_NUM 244
#define DBS_COURSE_NUM 68
#define GMT_COURSE_NUM 60
#define NUIM_COURSE_NUM 164
#define NUIG_COURSE_NUM 220


struct cao_entry{
    
    const char *college;
    NSArray *course;
    
};


/* NB */
/**  Create a 'custom' type of UIButton - one that derives all other properties of UIButton
 
 , but includes another property called 'assign' - this can then be used to 'pick-up'
 other attributes besides just the buttonls label upon a button press.
 Further below, I have used the 'setter' here to assign the unique course code to each button -
 , then I have used the 'getter' func. in the 'namePressed' action method below to retrieve this
 and use it in the function 'getRowsFromAllTables' function to pick up any field I wish - including
 the full course name and display it in th epop-up method , which is in fact it's use here.
 
 */

@implementation UIButton(Assign)

static char UIB_PROPERTY_KEY;

@dynamic assign;

-(void)setAssign:(NSObject *)assign
{
    objc_setAssociatedObject(self, &UIB_PROPERTY_KEY, assign, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSObject*)assign
{
    return (NSObject*)objc_getAssociatedObject(self, &UIB_PROPERTY_KEY);
}

@end


/**      */


struct cao_entry entryA;


/*      test      */


@interface BIDCollegeLevelDetailViewController ()
{
    sqlite3 *db;
}

@end




@implementation BIDCollegeLevelDetailViewController


/* .xib implementation for your view. */
/*
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
 {
 
 self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
 if (self) {
 // Custom initialization
 }
 
 return self;
 }
 */

/*
 -(BIDCollegeLevelDetailViewController*)initWithFrame:(CGRect)frame;
 {
 self = [super initWithFrame:frame];
 scroller = [[UIScrollView alloc] initWithFrame:CGRectMake(0,0,360,200)];
 scroller.scrollEnabled = YES;
 scroller.contentSize = CGSizeMake(360*3,200);
 [self addSubview:scroller];
 [scroller setScrollEnabled:YES];
 
 return self;
 }
 */


- (void)viewDidLoad
{
    [super viewDidLoad];
    [scroller setContentSize:CGSizeMake(320, 2539)];
    
    
    heading.font= [UIFont boldSystemFontOfSize:16];
    year_1.font = [UIFont boldSystemFontOfSize:16];
    year_2.font = [UIFont boldSystemFontOfSize:16];
    year_3.font = [UIFont boldSystemFontOfSize:16];
    
    
    course_2.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_3.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_4.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_5.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_6.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_7.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_8.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_9.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_10.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_11.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_12.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_13.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_14.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_15.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_16.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_17.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_18.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_19.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_20.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_21.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_22.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_23.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_24.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_25.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_26.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_27.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_28.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_29.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_30.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_31.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_32.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_33.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_34.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_35.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_36.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_37.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_38.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_39.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_40.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_41.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_42.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_43.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_44.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_45.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_46.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_47.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_48.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_49.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_50.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_51.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_52.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_53.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_54.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_55.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_56.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_57.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_58.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_59.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    course_60.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    
    
    // points1_2012.font = [UIFont boldSystemFontOfSize:14];
    points2_2012.font = [UIFont boldSystemFontOfSize:14];
    points3_2012.font = [UIFont boldSystemFontOfSize:14];
    points4_2012.font = [UIFont boldSystemFontOfSize:14];
    points5_2012.font = [UIFont boldSystemFontOfSize:14];
    points6_2012.font = [UIFont boldSystemFontOfSize:14];
    points7_2012.font = [UIFont boldSystemFontOfSize:14];
    points8_2012.font = [UIFont boldSystemFontOfSize:14];
    points9_2012.font = [UIFont boldSystemFontOfSize:14];
    points10_2012.font = [UIFont boldSystemFontOfSize:14];
    points11_2012.font = [UIFont boldSystemFontOfSize:14];
    points12_2012.font = [UIFont boldSystemFontOfSize:14];
    points13_2012.font = [UIFont boldSystemFontOfSize:14];
    points14_2012.font = [UIFont boldSystemFontOfSize:14];
    points15_2012.font = [UIFont boldSystemFontOfSize:14];
    points16_2012.font = [UIFont boldSystemFontOfSize:14];
    points17_2012.font = [UIFont boldSystemFontOfSize:14];
    points18_2012.font = [UIFont boldSystemFontOfSize:14];
    points19_2012.font = [UIFont boldSystemFontOfSize:14];
    points20_2012.font = [UIFont boldSystemFontOfSize:14];
    points21_2012.font = [UIFont boldSystemFontOfSize:14];
    points22_2012.font = [UIFont boldSystemFontOfSize:14];
    points23_2012.font = [UIFont boldSystemFontOfSize:14];
    points24_2012.font = [UIFont boldSystemFontOfSize:14];
    points25_2012.font = [UIFont boldSystemFontOfSize:14];
    points26_2012.font = [UIFont boldSystemFontOfSize:14];
    points27_2012.font = [UIFont boldSystemFontOfSize:14];
    points28_2012.font = [UIFont boldSystemFontOfSize:14];
    points29_2012.font = [UIFont boldSystemFontOfSize:14];
    points30_2012.font = [UIFont boldSystemFontOfSize:14];
    points31_2012.font = [UIFont boldSystemFontOfSize:14];
    points32_2012.font = [UIFont boldSystemFontOfSize:14];
    points33_2012.font = [UIFont boldSystemFontOfSize:14];
    points34_2012.font = [UIFont boldSystemFontOfSize:14];
    points35_2012.font = [UIFont boldSystemFontOfSize:14];
    points36_2012.font = [UIFont boldSystemFontOfSize:14];
    points37_2012.font = [UIFont boldSystemFontOfSize:14];
    points38_2012.font = [UIFont boldSystemFontOfSize:14];
    points39_2012.font = [UIFont boldSystemFontOfSize:14];
    points40_2012.font = [UIFont boldSystemFontOfSize:14];
    points41_2012.font = [UIFont boldSystemFontOfSize:14];
    points42_2012.font = [UIFont boldSystemFontOfSize:14];
    points43_2012.font = [UIFont boldSystemFontOfSize:14];
    points44_2012.font = [UIFont boldSystemFontOfSize:14];
    points45_2012.font = [UIFont boldSystemFontOfSize:14];
    points46_2012.font = [UIFont boldSystemFontOfSize:14];
    points47_2012.font = [UIFont boldSystemFontOfSize:14];
    points48_2012.font = [UIFont boldSystemFontOfSize:14];
    points49_2012.font = [UIFont boldSystemFontOfSize:14];
    points50_2012.font = [UIFont boldSystemFontOfSize:14];
    points51_2012.font = [UIFont boldSystemFontOfSize:14];
    points52_2012.font = [UIFont boldSystemFontOfSize:14];
    points53_2012.font = [UIFont boldSystemFontOfSize:14];
    points54_2012.font = [UIFont boldSystemFontOfSize:14];
    points55_2012.font = [UIFont boldSystemFontOfSize:14];
    points56_2012.font = [UIFont boldSystemFontOfSize:14];
    points57_2012.font = [UIFont boldSystemFontOfSize:14];
    points58_2012.font = [UIFont boldSystemFontOfSize:14];
    points59_2012.font = [UIFont boldSystemFontOfSize:14];
    points60_2012.font = [UIFont boldSystemFontOfSize:14];
    
    
    //points1_2011.font = [UIFont boldSystemFontOfSize:14];
    
    points2_2011.font = [UIFont boldSystemFontOfSize:14];
    points3_2011.font = [UIFont boldSystemFontOfSize:14];
    points4_2011.font = [UIFont boldSystemFontOfSize:14];
    points5_2011.font = [UIFont boldSystemFontOfSize:14];
    points6_2011.font = [UIFont boldSystemFontOfSize:14];
    points7_2011.font = [UIFont boldSystemFontOfSize:14];
    points8_2011.font = [UIFont boldSystemFontOfSize:14];
    points9_2011.font = [UIFont boldSystemFontOfSize:14];
    points10_2011.font = [UIFont boldSystemFontOfSize:14];
    points11_2011.font = [UIFont boldSystemFontOfSize:14];
    points12_2011.font = [UIFont boldSystemFontOfSize:14];
    points13_2011.font = [UIFont boldSystemFontOfSize:14];
    points14_2011.font = [UIFont boldSystemFontOfSize:14];
    points15_2011.font = [UIFont boldSystemFontOfSize:14];
    points16_2011.font = [UIFont boldSystemFontOfSize:14];
    points17_2011.font = [UIFont boldSystemFontOfSize:14];
    points18_2011.font = [UIFont boldSystemFontOfSize:14];
    points19_2011.font = [UIFont boldSystemFontOfSize:14];
    points20_2011.font = [UIFont boldSystemFontOfSize:14];
    points21_2011.font = [UIFont boldSystemFontOfSize:14];
    points22_2011.font = [UIFont boldSystemFontOfSize:14];
    points23_2011.font = [UIFont boldSystemFontOfSize:14];
    points24_2011.font = [UIFont boldSystemFontOfSize:14];
    points25_2011.font = [UIFont boldSystemFontOfSize:14];
    points26_2011.font = [UIFont boldSystemFontOfSize:14];
    points27_2011.font = [UIFont boldSystemFontOfSize:14];
    points28_2011.font = [UIFont boldSystemFontOfSize:14];
    points29_2011.font = [UIFont boldSystemFontOfSize:14];
    points30_2011.font = [UIFont boldSystemFontOfSize:14];
    points31_2011.font = [UIFont boldSystemFontOfSize:14];
    points32_2011.font = [UIFont boldSystemFontOfSize:14];
    points33_2011.font = [UIFont boldSystemFontOfSize:14];
    points34_2011.font = [UIFont boldSystemFontOfSize:14];
    points35_2011.font = [UIFont boldSystemFontOfSize:14];
    points36_2011.font = [UIFont boldSystemFontOfSize:14];
    points37_2011.font = [UIFont boldSystemFontOfSize:14];
    points38_2011.font = [UIFont boldSystemFontOfSize:14];
    points39_2011.font = [UIFont boldSystemFontOfSize:14];
    points40_2011.font = [UIFont boldSystemFontOfSize:14];
    points41_2011.font = [UIFont boldSystemFontOfSize:14];
    points42_2011.font = [UIFont boldSystemFontOfSize:14];
    points43_2011.font = [UIFont boldSystemFontOfSize:14];
    points44_2011.font = [UIFont boldSystemFontOfSize:14];
    points45_2011.font = [UIFont boldSystemFontOfSize:14];
    points46_2011.font = [UIFont boldSystemFontOfSize:14];
    points47_2011.font = [UIFont boldSystemFontOfSize:14];
    points48_2011.font = [UIFont boldSystemFontOfSize:14];
    points49_2011.font = [UIFont boldSystemFontOfSize:14];
    points50_2011.font = [UIFont boldSystemFontOfSize:14];
    points51_2011.font = [UIFont boldSystemFontOfSize:14];
    points52_2011.font = [UIFont boldSystemFontOfSize:14];
    points53_2011.font = [UIFont boldSystemFontOfSize:14];
    points54_2011.font = [UIFont boldSystemFontOfSize:14];
    points55_2011.font = [UIFont boldSystemFontOfSize:14];
    points56_2011.font = [UIFont boldSystemFontOfSize:14];
    points57_2011.font = [UIFont boldSystemFontOfSize:14];
    points58_2011.font = [UIFont boldSystemFontOfSize:14];
    points59_2011.font = [UIFont boldSystemFontOfSize:14];
    points60_2011.font = [UIFont boldSystemFontOfSize:14];
    
    
    //points1_2010.font = [UIFont boldSystemFontOfSize:14];
    points2_2010.font = [UIFont boldSystemFontOfSize:14];
    points3_2010.font = [UIFont boldSystemFontOfSize:14];
    points4_2010.font = [UIFont boldSystemFontOfSize:14];
    points5_2010.font = [UIFont boldSystemFontOfSize:14];
    points6_2010.font = [UIFont boldSystemFontOfSize:14];
    points7_2010.font = [UIFont boldSystemFontOfSize:14];
    points8_2010.font = [UIFont boldSystemFontOfSize:14];
    points9_2010.font = [UIFont boldSystemFontOfSize:14];
    points10_2010.font = [UIFont boldSystemFontOfSize:14];
    points11_2010.font = [UIFont boldSystemFontOfSize:14];
    points12_2010.font = [UIFont boldSystemFontOfSize:14];
    points13_2010.font = [UIFont boldSystemFontOfSize:14];
    points14_2010.font = [UIFont boldSystemFontOfSize:14];
    points15_2010.font = [UIFont boldSystemFontOfSize:14];
    points16_2010.font = [UIFont boldSystemFontOfSize:14];
    points17_2010.font = [UIFont boldSystemFontOfSize:14];
    points18_2010.font = [UIFont boldSystemFontOfSize:14];
    points19_2010.font = [UIFont boldSystemFontOfSize:14];
    points20_2010.font = [UIFont boldSystemFontOfSize:14];
    points21_2010.font = [UIFont boldSystemFontOfSize:14];
    points22_2010.font = [UIFont boldSystemFontOfSize:14];
    points23_2010.font = [UIFont boldSystemFontOfSize:14];
    points24_2010.font = [UIFont boldSystemFontOfSize:14];
    points25_2010.font = [UIFont boldSystemFontOfSize:14];
    points26_2010.font = [UIFont boldSystemFontOfSize:14];
    points27_2010.font = [UIFont boldSystemFontOfSize:14];
    points28_2010.font = [UIFont boldSystemFontOfSize:14];
    points29_2010.font = [UIFont boldSystemFontOfSize:14];
    points30_2010.font = [UIFont boldSystemFontOfSize:14];
    points31_2010.font = [UIFont boldSystemFontOfSize:14];
    points32_2010.font = [UIFont boldSystemFontOfSize:14];
    points33_2010.font = [UIFont boldSystemFontOfSize:14];
    points34_2010.font = [UIFont boldSystemFontOfSize:14];
    points35_2010.font = [UIFont boldSystemFontOfSize:14];
    points36_2010.font = [UIFont boldSystemFontOfSize:14];
    points37_2010.font = [UIFont boldSystemFontOfSize:14];
    points38_2010.font = [UIFont boldSystemFontOfSize:14];
    points39_2010.font = [UIFont boldSystemFontOfSize:14];
    points40_2010.font = [UIFont boldSystemFontOfSize:14];
    points41_2010.font = [UIFont boldSystemFontOfSize:14];
    points42_2010.font = [UIFont boldSystemFontOfSize:14];
    points43_2010.font = [UIFont boldSystemFontOfSize:14];
    points44_2010.font = [UIFont boldSystemFontOfSize:14];
    points45_2010.font = [UIFont boldSystemFontOfSize:14];
    points46_2010.font = [UIFont boldSystemFontOfSize:14];
    points47_2010.font = [UIFont boldSystemFontOfSize:14];
    points48_2010.font = [UIFont boldSystemFontOfSize:14];
    points49_2010.font = [UIFont boldSystemFontOfSize:14];
    points50_2010.font = [UIFont boldSystemFontOfSize:14];
    points51_2010.font = [UIFont boldSystemFontOfSize:14];
    points52_2010.font = [UIFont boldSystemFontOfSize:14];
    points53_2010.font = [UIFont boldSystemFontOfSize:14];
    points54_2010.font = [UIFont boldSystemFontOfSize:14];
    points55_2010.font = [UIFont boldSystemFontOfSize:14];
    points56_2010.font = [UIFont boldSystemFontOfSize:14];
    points57_2010.font = [UIFont boldSystemFontOfSize:14];
    points58_2010.font = [UIFont boldSystemFontOfSize:14];
    points59_2010.font = [UIFont boldSystemFontOfSize:14];
    points60_2010.font = [UIFont boldSystemFontOfSize:14];
    
    [self openDB];
    
    
    [self fillCAO_Entries];
    
    [self createTableOneNamed : @"CAO_collegeLevelGenData_7addfields" withField1: @"courseID" withField2: @"courseName" withField3: @"abbrev. courseName" withField4: @"college" withField5: @"2010" withField6: @"2011" withField7: @"2012" withField8: @"NotAllonPtsOffered" withField9: @"MusictestInterview" withField10: @"Interview" withField11: @"testInterviewPortfolio" withField12: @"AQA" withField13: @"VacantPlaces" withField14: @"Matriculate"];
    
    
    NSString *courseName;
    NSString *courseID;
    NSString *abbrevcourseName;
    NSString *collegeName;
    NSString *lastYrPoints;
    NSString *lastTwoYrPoints;
    NSString *lastThreeYrPoints;
    NSString *NotAllonPtsOffered;
    NSString *MusictestInterview;
    NSString *Interview;
    NSString *testInterviewPortfolio;
    NSString *AQA;
    NSString *VacantPlaces;
    NSString *Matriculate;
    
    
    for(int i=0;i < TABLE_FIELD_NUM*TABLE_ROW_NUM ;i+=TABLE_FIELD_NUM)
    {
        
        if([entryA.course objectAtIndex:i] == nil)
            break;
        
        NSLog(@" [entryA.course objectAtIndex:i] =  %@",[entryA.course objectAtIndex:i]);
        
        courseID               =  [entryA.course objectAtIndex:i];
        courseName             =  [entryA.course objectAtIndex:i+1];
        abbrevcourseName       =  [entryA.course objectAtIndex:i+2];
        collegeName            =  [entryA.course objectAtIndex:i+3];
        lastYrPoints           =  [entryA.course objectAtIndex:i+4];
        lastTwoYrPoints        =  [entryA.course objectAtIndex:i+5];
        lastThreeYrPoints      =  [entryA.course objectAtIndex:i+6];
        NotAllonPtsOffered     =  [entryA.course objectAtIndex:i+7];
        MusictestInterview     =  [entryA.course objectAtIndex:i+8];
        Interview              =  [entryA.course objectAtIndex:i+9];
        testInterviewPortfolio =  [entryA.course objectAtIndex:i+10];
        AQA                    =  [entryA.course objectAtIndex:i+11];
        VacantPlaces           =  [entryA.course objectAtIndex:i+12];
        Matriculate            =  [entryA.course objectAtIndex:i+13];
        
        
        
        [self insertRecordIntoTableNamed: @"CAO_collegeLevelGenData_7addfields"
                              withField1:@"courseID"                field1Value:courseID
                               andField2:@"courseName"              field2Value:courseName
                               andField3:@"abbrev. courseName"      field3Value:abbrevcourseName
                               andField4:@"college"                 field4Value:collegeName
                               andField5:@"2010"                    field5Value:lastYrPoints
                               andField6:@"2011"                    field6Value:lastTwoYrPoints
                               andField7:@"2012"                    field7Value:lastThreeYrPoints
                               andField8:@"NotAllonPtsOffered"      field8Value:NotAllonPtsOffered
                               andField9:@"MusictestInterview"      field9Value:MusictestInterview
                               andField10:@"Interview"              field10Value:Interview
                               andField11:@"testInterviewPortfolio" field11Value:testInterviewPortfolio
                               andField12:@"AQA"                    field12Value:AQA
                               andField13:@"VacantPlaces"           field13Value:VacantPlaces
                               andField14:@"Matriculate"            field14Value:Matriculate
         
         ];
    }
    
    
    
    //NSLog(@"past ,main for loop in viewDidLoad");
    
}

-(void) viewWillAppear:(BOOL)animated;
{
    
    NSString *collegeSelection=self.title;
    NSString *mainTable=@"CAO_collegeLevelGenData_7addfields";
    
    NSString *unique_code=nil;
    
    
    NSString *qsql_1 = [NSString stringWithFormat: @"SELECT * FROM '%@' WHERE  college='%@'",mainTable,collegeSelection];
    NSString *strings[MAX_COURSE_NUM][FIELD_NUM];
    int college_course_counter=0;
    
    sqlite3_stmt *statement_1;
    
    //reset al previously set fields as on GUI.
    
    [self InitializeVars];
    
    
    NSString *field1Str=nil;
    NSString *field2Str=nil;
    NSString *field3Str=nil;
    NSString *field4Str=nil;
    NSString *field5Str=nil;
    NSString *field6Str=nil;
    NSString *field7Str=nil;
    NSString *field8Str=nil;
    NSString *field9Str=nil;
    
    NSString *truncatedField2Str=nil;
    NSString *truncatedField3Str=nil;
    NSString *truncatedField4Str=nil;
    NSString *truncatedField5Str=nil;
    NSString *truncatedField6Str=nil;
    NSString *truncatedField7Str=nil;
    NSString *truncatedField8Str=nil;
    NSString *truncatedField9Str=nil;
    
    if(sqlite3_prepare(db, [qsql_1 UTF8String],-1, &statement_1,nil) == SQLITE_OK )
    {
        int k=0;
        
        while(sqlite3_step(statement_1) == SQLITE_ROW)
        {
            char *field1 = (char *) sqlite3_column_text(statement_1,0);
            field1Str = [[NSString alloc] initWithUTF8String : field1];
            
            unique_code=field1Str;
            
            char *field2 = (char *) sqlite3_column_text(statement_1,1);
            field2Str = [[NSString alloc] initWithUTF8String : field2];
            
            char *field3 = (char *) sqlite3_column_text(statement_1,2);
            field3Str = [[NSString alloc] initWithUTF8String : field3];
            
            
            char *field4 = (char *) sqlite3_column_text(statement_1,3);
            field4Str = [[NSString alloc] initWithUTF8String : field4];
            
            
            char *field5 = (char *) sqlite3_column_text(statement_1,4);
            field5Str = [[NSString alloc] initWithUTF8String : field5];
            
            
            char *field6 = (char *) sqlite3_column_text(statement_1,5);
            field6Str = [[NSString alloc] initWithUTF8String : field6];
            
            
            char *field7 = (char *) sqlite3_column_text(statement_1,6);
            field7Str = [[NSString alloc] initWithUTF8String : field7];
            
            char *field8 = (char *) sqlite3_column_text(statement_1,7);
            field8Str = [[NSString alloc] initWithUTF8String : field8];
            
            char *field9 = (char *) sqlite3_column_text(statement_1,8);
            field9Str = [[NSString alloc] initWithUTF8String : field9];
            
            
            truncatedField2Str = [field2Str substringToIndex:[field2Str length]-2];
            
            truncatedField4Str = [field4Str substringToIndex:[field4Str length]-2];
            truncatedField5Str = [field5Str substringToIndex:[field5Str length]-2];
            truncatedField6Str = [field6Str substringToIndex:[field6Str length]-2];
            truncatedField7Str = [field7Str substringToIndex:[field7Str length]-2];
            //truncatedField8Str = [field8Str substringToIndex:[field8Str length]-2];
            //truncatedField9Str = [field9Str substringToIndex:[field9Str length]-2];
            
            
            strings[k][0]=field3Str;
            strings[k][1]=truncatedField5Str;
            strings[k][2]=truncatedField6Str;
            strings[k][3]=truncatedField7Str;
            strings[k][4]=field1Str;
            
            k++;
            
        }//end while
        
        college_course_counter=k;
        
        
        NSLog(@"college course counter = %d ",college_course_counter);
        
        //---delete the compiled statement from memory---
        sqlite3_finalize(statement_1);
        
    }//end if
    
    
    for(int i=0;i<college_course_counter;i++)
    {
        
        switch(i)
        {
                
                /*working case :
                 
                 case 0:
                 
                 //NSLog(@"in case 0 -- strings[0][0] = %@ -- strings[i][4] = %@ ",strings[i][0],strings[i][4]);
                 
                 
                 [button setTitle: strings[i][0] forState:UIControlStateNormal];
                 [button setAssign: strings[i][4]];
                 
                 points1_2012.text = strings[i][1];
                 points1_2011.text = strings[i][2];
                 points1_2010.text = strings[i][3];
                 break;
                 
                 */
                
            case 1:
                
                //NSLog(@"in case 1 -- strings[0][0] = %@ -- strings[i][4] = %@ ",strings[i][0],strings[i][4]);
                
                [course_2 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_2 setAssign: strings[i][4]];
                
                points2_2012.text = strings[i][1];
                points2_2011.text = strings[i][2];
                points2_2010.text = strings[i][3];
                break;
                
            case 2:
                [course_3 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_3 setAssign: strings[i][4]];
                points3_2012.text = strings[i][1];
                points3_2011.text = strings[i][2];
                points3_2010.text = strings[i][3];
                break;
                
            case 3:
                [course_4 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_4 setAssign: strings[i][4]];
                points4_2012.text = strings[i][1];
                points4_2011.text = strings[i][2];
                points4_2010.text = strings[i][3];
                break;
                
            case 4:
                [course_5 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_5 setAssign: strings[i][4]];
                points5_2012.text = strings[i][1];
                points5_2011.text = strings[i][2];
                points5_2010.text = strings[i][3];
                break;
                
            case 5:
                [course_6 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_6 setAssign: strings[i][4]];
                points6_2012.text = strings[i][1];
                points6_2011.text = strings[i][2];
                points6_2010.text = strings[i][3];
                break;
                
            case 6:
                [course_7 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_7 setAssign: strings[i][4]];
                points7_2012.text = strings[i][1];
                points7_2011.text = strings[i][2];
                points7_2010.text = strings[i][3];
                break;
                
            case 7:
                [course_8 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_8 setAssign: strings[i][4]];
                points8_2012.text = strings[i][1];
                points8_2011.text = strings[i][2];
                points8_2010.text = strings[i][3];
                break;
                
            case 8:
                [course_9 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_9 setAssign: strings[i][4]];
                points9_2012.text = strings[i][1];
                points9_2011.text = strings[i][2];
                points9_2010.text = strings[i][3];
                break;
                
            case 9:
                [course_10 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_10 setAssign: strings[i][4]];
                points10_2012.text = strings[i][1];
                points10_2011.text = strings[i][2];
                points10_2010.text = strings[i][3];
                break;
                
            case 10:
                [course_11 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_11 setAssign: strings[i][4]];
                points11_2012.text = strings[i][1];
                points11_2011.text = strings[i][2];
                points11_2010.text = strings[i][3];
                break;
                
            case 11:
                [course_12 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_12 setAssign: strings[i][4]];
                points12_2012.text = strings[i][1];
                points12_2011.text = strings[i][2];
                points12_2010.text = strings[i][3];
                
                break;
                
            case 12:
                [course_13 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_13 setAssign: strings[i][4]];
                points13_2012.text = strings[i][1];
                points13_2011.text = strings[i][2];
                points13_2010.text = strings[i][3];
                break;
                
            case 13:
                [course_14 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_14 setAssign: strings[i][4]];
                points14_2012.text = strings[i][1];
                points14_2011.text = strings[i][2];
                points14_2010.text = strings[i][3];
                break;
                
            case 14:
                [course_15 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_15 setAssign: strings[i][4]];
                points15_2012.text = strings[i][1];
                points15_2011.text = strings[i][2];
                points15_2010.text = strings[i][3];
                break;
                
            case 15:
                [course_16 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_16 setAssign: strings[i][4]];
                points16_2012.text = strings[i][1];
                points16_2011.text = strings[i][2];
                points16_2010.text = strings[i][3];
                break;
                
            case 16:
                [course_17 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_17 setAssign: strings[i][4]];
                points17_2012.text = strings[i][1];
                points17_2011.text = strings[i][2];
                points17_2010.text = strings[i][3];
                break;
                
            case 17:
                [course_18 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_18 setAssign: strings[i][4]];
                points18_2012.text = strings[i][1];
                points18_2011.text = strings[i][2];
                points18_2010.text = strings[i][3];
                break;
                
            case 18:
                [course_19 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_19 setAssign: strings[i][4]];
                points19_2012.text = strings[i][1];
                points19_2011.text = strings[i][2];
                points19_2010.text = strings[i][3];
                break;
                
            case 19:
                [course_20 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_20 setAssign: strings[i][4]];
                points20_2012.text = strings[i][1];
                points20_2011.text = strings[i][2];
                points20_2010.text = strings[i][3];
                break;
                
            case 20:
                [course_21 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_21 setAssign: strings[i][4]];
                points21_2012.text = strings[i][1];
                points21_2011.text = strings[i][2];
                points21_2010.text = strings[i][3];
                break;
                
            case 21:
                [course_22 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_22 setAssign: strings[i][4]];
                points22_2012.text = strings[i][1];
                points22_2011.text = strings[i][2];
                points22_2010.text = strings[i][3];
                break;
                
            case 22:
                [course_23 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_23 setAssign: strings[i][4]];
                points23_2012.text = strings[i][1];
                points23_2011.text = strings[i][2];
                points23_2010.text = strings[i][3];
                break;
                
            case 23:
                [course_24 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_24 setAssign: strings[i][4]];
                points24_2012.text = strings[i][1];
                points24_2011.text = strings[i][2];
                points24_2010.text = strings[i][3];
                break;
                
            case 24:
                [course_25 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_25 setAssign: strings[i][4]];
                points25_2012.text = strings[i][1];
                points25_2011.text = strings[i][2];
                points25_2010.text = strings[i][3];
                break;
                
            case 25:
                [course_26 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_26 setAssign: strings[i][4]];
                points26_2012.text = strings[i][1];
                points26_2011.text = strings[i][2];
                points26_2010.text = strings[i][3];
                break;
                
            case 26:
                [course_27 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_27 setAssign: strings[i][4]];
                points27_2012.text = strings[i][1];
                points27_2011.text = strings[i][2];
                points27_2010.text = strings[i][3];
                break;
                
            case 27:
                [course_28 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_28 setAssign: strings[i][4]];
                points28_2012.text = strings[i][1];
                points28_2011.text = strings[i][2];
                points28_2010.text = strings[i][3];
                break;
                
            case 28:
                [course_29 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_29 setAssign: strings[i][4]];
                points29_2012.text = strings[i][1];
                points29_2011.text = strings[i][2];
                points29_2010.text = strings[i][3];
                break;
                
            case 29:
                [course_30 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_30 setAssign: strings[i][4]];
                points30_2012.text = strings[i][1];
                points30_2011.text = strings[i][2];
                points30_2010.text = strings[i][3];
                break;
                
            case 30:
                [course_31 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_31 setAssign: strings[i][4]];
                points31_2012.text = strings[i][1];
                points31_2011.text = strings[i][2];
                points31_2010.text = strings[i][3];
                break;
                
            case 31:
                [course_32 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_32 setAssign: strings[i][4]];
                points32_2012.text = strings[i][1];
                points32_2011.text = strings[i][2];
                points32_2010.text = strings[i][3];
                break;
                
            case 32:
                [course_33 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_33 setAssign: strings[i][4]];
                points33_2012.text = strings[i][1];
                points33_2011.text = strings[i][2];
                points33_2010.text = strings[i][3];
                break;
                
            case 33:
                [course_34 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_34 setAssign: strings[i][4]];
                points34_2012.text = strings[i][1];
                points34_2011.text = strings[i][2];
                points34_2010.text = strings[i][3];
                break;
                
            case 34:
                [course_35 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_35 setAssign: strings[i][4]];
                points35_2012.text = strings[i][1];
                points35_2011.text = strings[i][2];
                points35_2010.text = strings[i][3];
                break;
                
            case 35:
                [course_36 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_36 setAssign: strings[i][4]];
                points36_2012.text = strings[i][1];
                points36_2011.text = strings[i][2];
                points36_2010.text = strings[i][3];
                break;
                
            case 36:
                [course_37 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_37 setAssign: strings[i][4]];
                points37_2012.text = strings[i][1];
                points37_2011.text = strings[i][2];
                points37_2010.text = strings[i][3];
                break;
                
            case 37:
                [course_38 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_38 setAssign: strings[i][4]];
                points38_2012.text = strings[i][1];
                points38_2011.text = strings[i][2];
                points38_2010.text = strings[i][3];
                break;
                
            case 38:
                [course_39 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_39 setAssign: strings[i][4]];
                points39_2012.text = strings[i][1];
                points39_2011.text = strings[i][2];
                points39_2010.text = strings[i][3];
                break;
                
            case 39:
                [course_40 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_40 setAssign: strings[i][4]];
                points40_2012.text = strings[i][1];
                points40_2011.text = strings[i][2];
                points40_2010.text = strings[i][3];
                break;
                
            case 40:
                [course_41 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_41 setAssign: strings[i][4]];
                points41_2012.text = strings[i][1];
                points41_2011.text = strings[i][2];
                points41_2010.text = strings[i][3];
                break;
                
            case 41:
                [course_42 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_42 setAssign: strings[i][4]];
                points42_2012.text = strings[i][1];
                points42_2011.text = strings[i][2];
                points42_2010.text = strings[i][3];
                break;
                
            case 42:
                [course_43 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_43 setAssign: strings[i][4]];
                points43_2012.text = strings[i][1];
                points43_2011.text = strings[i][2];
                points43_2010.text = strings[i][3];
                break;
                
            case 43:
                [course_44 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_44 setAssign: strings[i][4]];
                points44_2012.text = strings[i][1];
                points44_2011.text = strings[i][2];
                points44_2010.text = strings[i][3];
                break;
                
            case 44:
                [course_45 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_45 setAssign: strings[i][4]];
                points45_2012.text = strings[i][1];
                points45_2011.text = strings[i][2];
                points45_2010.text = strings[i][3];
                break;
                
            case 45:
                [course_46 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_46 setAssign: strings[i][4]];
                points46_2012.text = strings[i][1];
                points46_2011.text = strings[i][2];
                points46_2010.text = strings[i][3];
                break;
                
            case 46:
                [course_47 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_47 setAssign: strings[i][4]];
                points47_2012.text = strings[i][1];
                points47_2011.text = strings[i][2];
                points47_2010.text = strings[i][3];
                break;
                
            case 47:
                [course_48 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_48 setAssign: strings[i][4]];
                points48_2012.text = strings[i][1];
                points48_2011.text = strings[i][2];
                points48_2010.text = strings[i][3];
                break;
                
            case 48:
                [course_49 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_49 setAssign: strings[i][4]];
                points49_2012.text = strings[i][1];
                points49_2011.text = strings[i][2];
                points49_2010.text = strings[i][3];
                break;
                
            case 49:
                [course_50 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_50 setAssign: strings[i][4]];
                points50_2012.text = strings[i][1];
                points50_2011.text = strings[i][2];
                points50_2010.text = strings[i][3];
                break;
                
            case 50:
                [course_51 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_51 setAssign: strings[i][4]];
                points51_2012.text = strings[i][1];
                points51_2011.text = strings[i][2];
                points51_2010.text = strings[i][3];
                break;
                
            case 51:
                [course_52 setTitle: strings[i][0] forState:UIControlStateNormal];
                [course_52 setAssign: strings[i][4]];
                points52_2012.text = strings[i][1];
                points52_2011.text = strings[i][2];
                points52_2010.text = strings[i][3];
                break;
                
                
            default:
                break;
                
        }
        
        
    }
    
    
}  //end function.




-(void) fillCAO_Entries
{
    //fill CAO entry with data.
    
    entryA.course =
    /* level 6/7 courses*/
    
    
    
    
    /* a sample of 'coding free errors' level 8 data */
    
    /*[NSArray arrayWithObjects : @"AL802",@"Software Design (Games Development)",@"Software Design (…",@"ATHLONE IT",@"275",@"300",@"285",@"",@"",@"",@"",@"",@"",@"",@"AL803",@"Software Design (Cloud Computing)",@"Software Design (…",@"ATHLONE IT",@"280",@"310",@"285",@"",@"",@"",@"",@"",@"",@"",@"AL830",@"General Nursing",@"General Nursing",@"ATHLONE IT",@"410",@"415",@"400",@"",@"",@"",@"",@"",@"",@"",@"AL831",@"Mature Applicants General Nursing",@"Mature Applicants…",@"ATHLONE IT",@"566",@"233",@"225",@"",@"",@"",@"",@"",@"",@"",@"AL832",@"Psychiatric Nursing",@"Psychiatric Nursi…",@"ATHLONE IT",@"395",@"395",@"375",@"",@"",@"",@"",@"",@"",@"",@"AL833",@"Mature Applicants Psychiatric Nursing",@"Mature Applicants…",@"ATHLONE IT",@"557",@"230",@"217",@"",@"",@"",@"",@"",@"",@"",@"AL836",@"Health Science and Nutrition",@"Health Science an…",@"ATHLONE IT",@"395",@"375",@"",@"",@"",@"",@"",@"",@"",@"",@"AL837",@"Sports Science and Exercise Physiology",@"Sports Science an…",@"ATHLONE IT"@"400",@"360",@"375",@"",@"",@"",@"",@"",@"",@"",@"AL838",@"Biotechnology",@"Biotechnology",@"ATHLONE IT",@"275",@"270",@"170",@"",@"",@"",@"",@"",@"",@"",@"AL839",@"Human and Animal Toxicology",@"Human and Animal…",@"ATHLONE IT",@"275",@"275",@"",@"",@"",@"",@"",@"",@"",@"",@"AL840",@"Pharmaceutical Science",@"Pharmaceutical Sc…",@"ATHLONE IT",@"270",@"260",@"",@"",@"",@"",@"",@"",@"",@"",@"AL841",@"Sports Therapy with Rehabilitation",@"Sports Therapy wi…",@"ATHLONE IT",@"420",@"365",@"",@"",@"",@"",@"",@"",@"",@"",@"AL850",@"Business",@"Business",@"ATHLONE IT",@"285",@"270",@"270",@"",@"",@"",@"",@"",@"",@"",@"AL851",@"Business and Law",@"Business and Law",@"ATHLONE IT",@"270",@"270",@"255",@"",@"",@"",@"",@"",@"",@"",@"AL852",@"Accounting",@"Accounting",@"ATHLONE IT",@"340",@"295",@"260",@"",@"",@"",@"",@"",@"",@"",@"AL860",@"Social Care Practice",@"Social Care Pract…",@"ATHLONE IT",@"325",@"340",@"330",@"",@"",@"",@"",@"",@"",@"",@"AL862",@"Visual Communications",@"Visual Communicat…",@"ATHLONE IT",@"510",@"795",@"",@"",@"",@"",@"",@"",@"",@"",@"PC405",@"Citizenship & Community Studies",@"Citizenship & Com…",@"CARLOW COLLEGE",@"250",@"280",@"",@"",@"",@"",@"",@"",@"",@"",@"PC410",@"Humanities",@"Humanities",@"CARLOW COLLEGE",@"250",@"255",@"280",@"",@"",@"",@"",@"",@"",@"",@"PC411",@"English and History",@"English and Histo…",@"CARLOW COLLEGE",@"275",@"270",@"300",@"",@"",@"",@"",@"",@"",@"",@"CW018",@"Business (Wexford)",@"Business (Wexford…",@"IT CARLOW",@"255",@"280",@"",@"",@"",@"",@"",@"",@"",@"",@"CW028",@"Early Childhood Education and Care (Wexford)",@"Early Childhood E…",@"IT CARLOW",@"275",@"290",@"",@"",@"",@"",@"",@"",@"",@"",@"CW038",@"Art (Wexford) - Portfolio",@"Art (Wexford) - P…",@"IT CARLOW",@"700",@"700",@"",@"",@"",@"",@"",@"",@"",@"",@"CW068",@"Applied Social Studies (Professional Social Care - Wexford)",@"Applied Social St…",@"IT CARLOW",@"360",@"350",@"",@"",@"",@"",@"",@"",@"",@"",@"CW088",@"Visual Communications and Design (Wexford)",@"Visual Communicat…",@"IT CARLOW",@"305",@"330",@"",@"",@"",@"",@"",@"",@"",@"",@"CW108",@"Biosciences with Bioforensics or Biopharmaceuticals",@"Biosciences with…",@"IT CARLOW",@"300",@"290",@"",@"",@"",@"",@"",@"",@"",@"",@"CW168",@"Environmental Science",@"Environmental Sci…",@"IT CARLOW",@"330",@"320",@"320",@"",@"",@"",@"",@"",@"",@"",@"CW178",@"Sport Science",@"Sport Science",@"IT CARLOW",@"400",@"400",@"415",@"",@"",@"",@"",@"",@"",@"",@"CW188",@"Sports Rehabilitation and Athletic Therapy",@"Sports Rehabilita…",@"IT CARLOW",@"480",@"450",@"445",@"",@"",@"",@"",@"",@"",@"",@"CW198",@"Strength and Conditioning",@"Strength and Cond…",@"IT CARLOW",@"405",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"CW208",@"Computer Games Development",@"Computer Games De…",@"IT CARLOW",@"325",@"325",@"325",@"",@"",@"",@"",@"",@"",@"",@"CW238",@"Software Development",@"Software Developm…",@"IT CARLOW",@"300",@"325",@"295",@"",@"",@"",@"",@"",@"",@"",@"CW248",@"Computing Systems Management",@"Computing Systems…",@"IT CARLOW",@"300",@"290",@"290",@"",@"",@"",@"",@"",@"",@"",@"CW438",@"Construction - Quantity Surveying",@"Construction - Qu…",@"IT CARLOW",@"235",@"285",@"250",@"",@"",@"",@"",@"",@"",@"",@"CW448",@"Construction - Facilities and Energy Management",@"Construction - Fa…",@"IT CARLOW",@"280",@"280",@"300",@"",@"",@"",@"",@"",@"",@"",@"CW468",@"Architectural Technology",@"Architectural Tec…",@"IT CARLOW",@"260",@"275",@"275",@"",@"",@"",@"",@"",@"",@"",@"CW478",@"Civil Engineering",@"Civil Engineering",@"IT CARLOW",@"280",@"210",@"185",@"",@"",@"",@"",@"",@"",@"",@"CW548",@"Mechanical Engineering",@"Mechanical Engine…",@"IT CARLOW",@"290",@"300",@"315",@"",@"",@"",@"",@"",@"",@"",@"CW558",@"Electronic Systems",@"Electronic System…",@"IT CARLOW",@"310",@"300",@"300",@"",@"",@"",@"",@"",@"",@"",@"CW568",@"Aerospace Engineering",@"Aerospace Enginee…",@"IT CARLOW",@"370",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"CW708",@"Law",@"Law",@"IT CARLOW",@"300",@"305",@"305",@"",@"",@"",@"",@"",@"",@"",@"CW728",@"Product Design Innovation",@"Product Design In…",@"IT CARLOW",@"330",@"305",@"305",@"",@"",@"",@"",@"",@"",@"",@"CW748",@"Early Childhood Education and Care",@"Early Childhood E…",@"IT CARLOW",@"315",@"315",@"320",@"",@"",@"",@"",@"",@"",@"",@"CW758",@"Applied Social Studies (Professional Social Care)",@"Applied Social St…",@"IT CARLOW",@"340",@"340",@"",@"",@"",@"",@"",@"",@"",@"",@"CW768",@"Social and Community Studies",@"Social and Commun…",@"IT CARLOW",@"280",@"300",@"330",@"",@"",@"",@"",@"",@"",@"",@"CW788",@"Youth and Community Work",@"Youth and Communi…",@"IT CARLOW",@"300",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"CW808",@"Media and Public Relations",@"Media and Public…",@"IT CARLOW",@"285",@"300",@"",@"",@"",@"",@"",@"",@"",@"",@"CW838",@"Business - Marketing",@"Business - Market…",@"IT CARLOW",@"280",@"285",@"295",@"",@"",@"",@"",@"",@"",@"",@"CW858",@"Sports Management and Coaching",@"Sports Management…",@"IT CARLOW",@"700",@"700",@"",@"",@"",@"",@"",@"",@"",@"",@"CW908",@"Business - Management",@"Business - Manage…",@"IT CARLOW",@"280",@"280",@"",@"",@"",@"",@"",@"",@"",@"",@"CW928",@"Business - Human Resource Management",@"Business - Human…",@"IT CARLOW",@"290",@"295",@"285",@"",@"",@"",@"",@"",@"",@"",@"CW938",@"Business with Law",@"Business with Law",@"IT CARLOW",@"290",@"315",@"320",@"",@"",@"",@"",@"",@"",@"",@"CW948",@"Accounting",@"Accounting",@"IT CARLOW",@"335",@"300",@"315",@"",@"",@"",@"",@"",@"",@"",@"CR105",@"Chemical and Biopharmaceutical Engineering",@"Chemical and Biop…",@"CORK IT",@"360",@"335",@"395",@"",@"",@"",@"",@"",@"",@"",@"CR106",@"Software Development",@"Software Developm…",@"CORK IT",@"300",@"300",@"290",@"",@"",@"",@"",@"",@"",@"",@"CR108",@"Mechanical Engineering",@"Mechanical Engine…",@"CORK IT",@"340",@"340",@"345",@"",@"",@"",@"",@"",@"",@"",@"CR109",@"Structural Engineering",@"Structural Engine…",@"CORK IT",@"400",@"",@"380",@"",@"",@"",@"",@"",@"",@"",@"CR112",@"Multimedia",@"Multimedia",@"CORK IT",@"350",@"365",@"390",@"",@"",@"",@"",@"",@"",@"",@"CR116",@"Software Development and Computer Networking",@"Software Developm…",@"CORK IT",@"305",@"305",@"290",@"",@"",@"",@"",@"",@"",@"",@"CR121",@"Music at CIT - Cork School of Music",@"Music at CIT - Co…",@"CORK IT",@"700",@"630",@"",@"",@"",@"",@"",@"",@"",@"",@"CR125",@"Popular Music: Electric Bass Guitar at CIT Cork School of Mu",@"Popular Music: El…",@"CORK IT",@"615",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"CR126",@"Popular Music: Drums at CIT Cork School of Music",@"Popular Music: Dr…",@"CORK IT",@"755",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"CR127",@"Popular Music: Electric Guitar at CIT Cork School of Music",@"Popular Music: El…",@"CORK IT",@"795",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"CR128",@"Popular Music: Keyboards at CIT Cork School of Music",@"Popular Music: Ke…",@"CORK IT",@"720",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"CR129",@"Popular Music: Voice at CIT Cork School of Music",@"Popular Music: Vo…",@"CORK IT",@"795",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"CR150",@"Business Information Systems",@"Business Informat…",@"CORK IT",@"335",@"315",@"315",@"",@"",@"",@"",@"",@"",@"",@"CR210",@"Contemporary Applied Art",@"Contemporary Appl…",@"CORK IT",@"1035",@"685",@"",@"",@"",@"",@"",@"",@"",@"",@"CR220",@"Fine Art at CIT Crawford College of Art and Design",@"Fine Art at CIT C…",@"CORK IT",@"535",@"600",@"",@"",@"",@"",@"",@"",@"",@"",@"CR305",@"Physical Sciences (Level 8 - Common Entry)",@"Physical Sciences…",@"CORK IT",@"310",@"320",@"",@"",@"",@"",@"",@"",@"",@"",@"CR310",@"IT Management",@"IT Management",@"CORK IT",@"290",@"290",@"290",@"",@"",@"",@"",@"",@"",@"",@"CR312",@"Web Development",@"Web Development",@"CORK IT",@"295",@"295",@"295",@"",@"",@"",@"",@"",@"",@"",@"CR320",@"Biomedical Science - Joint CIT and UCC programme",@"Biomedical Scienc…",@"CORK IT",@"520",@"520",@"",@"",@"",@"",@"",@"",@"",@"",@"CR325",@"Pharmaceutical Biotechnology",@"Pharmaceutical Bi…",@"CORK IT",@"315",@"300",@"285",@"",@"",@"",@"",@"",@"",@"",@"CR330",@"Herbal Science",@"Herbal Science",@"CORK IT",@"290",@"265",@"250",@"",@"",@"",@"",@"",@"",@"",@"CR333",@"Nutrition and Health Science",@"Nutrition and Hea…",@"CORK IT",@"345",@"340",@"320",@"",@"",@"",@"",@"",@"",@"",@"CR340",@"Analytical Chemistry with Quality Assurance",@"Analytical Chemis…",@"CORK IT",@"350",@"295",@"290",@"",@"",@"",@"",@"",@"",@"",@"CR360",@"Instrument Engineering",@"Instrument Engine…",@"CORK IT",@"330",@"320",@"320",@"",@"",@"",@"",@"",@"",@"",@"CR365",@"Environmental Science and Sustainable Technology",@"Environmental Sci…",@"CORK IT",@"300",@"310",@"330",@"",@"",@"",@"",@"",@"",@"",@"CR400",@"Accounting",@"Accounting",@"CORK IT",@"330",@"325",@"355",@"",@"",@"",@"",@"",@"",@"",@"CR420",@"Marketing",@"Marketing",@"CORK IT",@"285",@"295",@"295",@"",@"",@"",@"",@"",@"",@"",@"CR500",@"Engineering (Common Entry)",@"Engineering (Comm…",@"CORK IT",@"345",@"310",@"",@"",@"",@"",@"",@"",@"",@"",@"CR510",@"Sustainable Energy",@"Sustainable Energ…",@"CORK IT",@"305",@"300",@"330",@"",@"",@"",@"",@"",@"",@"",@"CR520",@"Biomedical Engineering",@"Biomedical Engine…",@"CORK IT",@"440",@"390",@"330",@"",@"",@"",@"",@"",@"",@"",@"CR522",@"Building Energy Systems",@"Building Energy S…",@"CORK IT",@"300",@"260",@"",@"",@"",@"",@"",@"",@"",@"",@"CR560",@"Architectural Technology",@"Architectural Tec…",@"CORK IT",@"285",@"285",@"320",@"",@"",@"",@"",@"",@"",@"",@"CR565",@"Interior Architecture",@"Interior Architec…",@"CORK IT",@"275",@"280",@"300",@"",@"",@"",@"",@"",@"",@"",@"CR570",@"Quantity Surveying",@"Quantity Surveyin…",@"CORK IT",@"275",@"280",@"285",@"",@"",@"",@"",@"",@"",@"",@"CR572",@"Construction Management",@"Construction Mana…",@"CORK IT",@"245",@"255",@"250",@"",@"",@"",@"",@"",@"",@"",@"CR580",@"Electrical Power Systems",@"Electrical Power…",@"CORK IT",@"315",@"305",@"310",@"",@"",@"",@"",@"",@"",@"",@"CR590",@"Electronic Systems Engineering",@"Electronic System…",@"CORK IT",@"300",@"330",@"300",@"",@"",@"",@"",@"",@"",@"",@"CR600",@"Visual Communications",@"Visual Communicat…",@"CORK IT",@"485",@"595",@"550",@"",@"",@"",@"",@"",@"",@"",@"CR660",@"Tourism",@"Tourism",@"CORK IT",@"250",@"260",@"260",@"",@"",@"",@"",@"",@"",@"",@"CR700",@"Theatre and Drama Studies at CIT Cork School of Music",@"Theatre and Drama…",@"CORK IT",@"720",@"685",@"",@"",@"",@"",@"",@"",@"",@"",@"RC001",@"Medicine - (Undergraduate Entry)",@"Medicine - (Under…",@"ROYAL COLLEGE OF SURGEONS ",@"741",@"740",@"732",@"",@"",@"",@"",@"",@"",@"",@"RC004",@"Physiotherapy",@"Physiotherapy",@"ROYAL COLLEGE OF SURGEONS ",@"525",@"535",@"530",@"",@"",@"",@"",@"",@"",@"",@"RC005",@"Pharmacy",@"Pharmacy",@"ROYAL COLLEGE OF SURGEONS ",@"555",@"555",@"535",@"",@"",@"",@"",@"",@"",@"",@"RC101",@"Medicine - (Graduate Entry)",@"Medicine - (Gradu…",@"ROYAL COLLEGE OF SURGEONS ",@"57",@"59",@"",@"",@"",@"",@"",@"",@"",@"",@"DN100",@"Architecture",@"Architecture",@"UNIVERSITY COLLEGE DUBLIN",@"450",@"475",@"465",@"",@"",@"",@"",@"",@"",@"",@"DN120",@"Landscape Architecture",@"Landscape Archite…",@"UNIVERSITY COLLEGE DUBLIN",@"360",@"345",@"360",@"",@"",@"",@"",@"",@"",@"",@"DN140",@"Structural Engineering with Architecture",@"Structural Engine…",@"UNIVERSITY COLLEGE DUBLIN",@"400",@"425",@"410",@"",@"",@"",@"",@"",@"",@"",@"DN150",@"Engineering",@"Engineering",@"UNIVERSITY COLLEGE DUBLIN",@"475",@"460",@"430",@"",@"",@"",@"",@"",@"",@"",@"DN200",@"Science",@"Science",@"UNIVERSITY COLLEGE DUBLIN",@"505",@"500",@"455",@"",@"",@"",@"",@"",@"",@"",@"DN201",@"Computer Science",@"Computer Science",@"UNIVERSITY COLLEGE DUBLIN",@"470",@"470",@"410",@"",@"",@"",@"",@"",@"",@"",@"DN210",@"Archaeology and Geology",@"Archaeology and G…",@"UNIVERSITY COLLEGE DUBLIN",@"305",@"350",@"360",@"",@"",@"",@"",@"",@"",@"",@"DN230",@"Actuarial and Financial Studies",@"Actuarial and Fin…",@"UNIVERSITY COLLEGE DUBLIN",@"560",@"560",@"530",@"",@"",@"",@"",@"",@"",@"",@"DN250",@"Agricultural Science",@"Agricultural Scie…",@"UNIVERSITY COLLEGE DUBLIN",@"455",@"445",@"430",@"",@"",@"",@"",@"",@"",@"",@"DN251",@"Animal Science - Equine",@"Animal Science -…",@"UNIVERSITY COLLEGE DUBLIN",@"445",@"440",@"420",@"",@"",@"",@"",@"",@"",@"",@"DN252",@"Dairy Business",@"Dairy Business",@"UNIVERSITY COLLEGE DUBLIN",@"440",@"430",@"405",@"",@"",@"",@"",@"",@"",@"",@"DN261",@"Food Science",@"Food Science",@"UNIVERSITY COLLEGE DUBLIN",@"470",@"455",@"430",@"",@"",@"",@"",@"",@"",@"",@"DN262",@"Human Nutrition",@"Human Nutrition",@"UNIVERSITY COLLEGE DUBLIN",@"525",@"525",@"520",@"",@"",@"",@"",@"",@"",@"",@"DN271",@"Forestry",@"Forestry",@"UNIVERSITY COLLEGE DUBLIN",@"385",@"350",@"360",@"",@"",@"",@"",@"",@"",@"",@"DN272",@"Horticulture, Landscape and Sportsturf Management",@"Horticulture, Lan…",@"UNIVERSITY COLLEGE DUBLIN",@"325",@"335",@"",@"",@"",@"",@"",@"",@"",@"",@"DN300",@"Veterinary Medicine - Undergraduate entry",@"Veterinary Medici…",@"UNIVERSITY COLLEGE DUBLIN",@"575",@"580",@"560",@"",@"",@"",@"",@"",@"",@"",@"DN301",@"Veterinary Medicine - Graduate Entry",@"Veterinary Medici…",@"UNIVERSITY COLLEGE DUBLIN",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"DN310",@"Veterinary Nursing",@"Veterinary Nursin…",@"UNIVERSITY COLLEGE DUBLIN",@"460",@"470",@"445",@"",@"",@"",@"",@"",@"",@"",@"DN400",@"Medicine - Undergraduate Entry",@"Medicine - Underg…",@"UNIVERSITY COLLEGE DUBLIN",@"747",@"745",@"735",@"",@"",@"",@"",@"",@"",@"",@"DN401",@"Medicine - Graduate Entry",@"Medicine - Gradua…",@"UNIVERSITY COLLEGE DUBLIN",@"57",@"57",@"58",@"",@"",@"",@"",@"",@"",@"",@"DN410",@"Radiography",@"Radiography",@"UNIVERSITY COLLEGE DUBLIN",@"530",@"555",@"535",@"",@"",@"",@"",@"",@"",@"",@"DN420",@"Physiotherapy",@"Physiotherapy",@"UNIVERSITY COLLEGE DUBLIN",@"545",@"550",@"535",@"",@"",@"",@"",@"",@"",@"",@"DN425",@"Health and Performance Science",@"Health and Perfor…",@"UNIVERSITY COLLEGE DUBLIN",@"490",@"490",@"465",@"",@"",@"",@"",@"",@"",@"",@"DN430",@"Sport and Exercise Management",@"Sport and Exercis…",@"UNIVERSITY COLLEGE DUBLIN",@"430",@"425",@"405",@"",@"",@"",@"",@"",@"",@"",@"DN440",@"Biomedical, Health and Life Sciences",@"Biomedical, Healt…",@"UNIVERSITY COLLEGE DUBLIN",@"560",@"555",@"",@"",@"",@"",@"",@"",@"",@"",@"DN450",@"General Nursing",@"General Nursing",@"UNIVERSITY COLLEGE DUBLIN",@"425",@"420",@"415",@"",@"",@"",@"",@"",@"",@"",@"DN451",@"Children`s and General Nursing (Integrated)",@"Children`s and Ge…",@"UNIVERSITY COLLEGE DUBLIN",@"490",@"490",@"",@"",@"",@"",@"",@"",@"",@"",@"DN452",@"Midwifery",@"Midwifery",@"UNIVERSITY COLLEGE DUBLIN",@"490",@"470",@"455",@"",@"",@"",@"",@"",@"",@"",@"DN453",@"Psychiatric Nursing",@"Psychiatric Nursi…",@"UNIVERSITY COLLEGE DUBLIN",@"415",@"410",@"395",@"",@"",@"",@"",@"",@"",@"",@"DN460",@"Mature Applicants General Nursing",@"Mature Applicants…",@"UNIVERSITY COLLEGE DUBLIN",@"552",@"223",@"218",@"",@"",@"",@"",@"",@"",@"",@"DN461",@"Mature Apps Children`s & General Nurs(Integrated)",@"Mature Apps Child…",@"UNIVERSITY COLLEGE DUBLIN",@"572",@"233",@"",@"",@"",@"",@"",@"",@"",@"",@"DN462",@"Mature Applicants Midwifery",@"Mature Applicants…",@"UNIVERSITY COLLEGE DUBLIN",@"575",@"235",@"226",@"",@"",@"",@"",@"",@"",@"",@"DN463",@"Mature Applicants Psychiatric Nursing",@"Mature Applicants…",@"UNIVERSITY COLLEGE DUBLIN",@"549",@"216",@"212",@"",@"",@"",@"",@"",@"",@"",@"DN500",@"BA Degree - joint honours (full-time)",@"BA Degree - joint…",@"UNIVERSITY COLLEGE DUBLIN",@"335",@"350",@"",@"",@"",@"",@"",@"",@"",@"",@"DN501",@"BA Degree - joint honours (part-time day)",@"BA Degree - joint…",@"UNIVERSITY COLLEGE DUBLIN",@"335",@"350",@"",@"",@"",@"",@"",@"",@"",@"",@"DN510",@"Economics",@"Economics",@"UNIVERSITY COLLEGE DUBLIN",@"465",@"450",@"440",@"",@"",@"",@"",@"",@"",@"",@"DN511",@"English",@"English",@"UNIVERSITY COLLEGE DUBLIN",@"480",@"465",@"465",@"",@"",@"",@"",@"",@"",@"",@"DN512",@"English with Drama",@"English with Dram…",@"UNIVERSITY COLLEGE DUBLIN",@"330",@"350",@"355",@"",@"",@"",@"",@"",@"",@"",@"DN513",@"English with Film",@"English with Film",@"UNIVERSITY COLLEGE DUBLIN",@"410",@"405",@"415",@"",@"",@"",@"",@"",@"",@"",@"DN514",@"Planning, Geography and Environment",@"Planning, Geograp…",@"UNIVERSITY COLLEGE DUBLIN",@"345",@"330",@"",@"",@"",@"",@"",@"",@"",@"",@"DN515",@"History",@"History",@"UNIVERSITY COLLEGE DUBLIN",@"420",@"405",@"440",@"",@"",@"",@"",@"",@"",@"",@"DN517",@"Music",@"Music",@"UNIVERSITY COLLEGE DUBLIN",@"335",@"330",@"330",@"",@"",@"",@"",@"",@"",@"",@"DN518",@"Philosophy",@"Philosophy",@"UNIVERSITY COLLEGE DUBLIN",@"330",@"330",@"390",@"",@"",@"",@"",@"",@"",@"",@"DN519",@"Psychology",@"Psychology",@"UNIVERSITY COLLEGE DUBLIN",@"505",@"515",@"510",@"",@"",@"",@"",@"",@"",@"",@"DN531",@"International French",@"International Fre…",@"UNIVERSITY COLLEGE DUBLIN",@"365",@"330",@"335",@"",@"",@"",@"",@"",@"",@"",@"DN532",@"International German",@"International Ger…",@"UNIVERSITY COLLEGE DUBLIN",@"370",@"330",@"335",@"",@"",@"",@"",@"",@"",@"",@"DN533",@"International Spanish",@"International Spa…",@"UNIVERSITY COLLEGE DUBLIN",@"415",@"390",@"375",@"",@"",@"",@"",@"",@"",@"",@"DN541",@"International Languages",@"International Lan…",@"UNIVERSITY COLLEGE DUBLIN",@"465",@"440",@"410",@"",@"",@"",@"",@"",@"",@"",@"DN550",@"Social Science",@"Social Science",@"UNIVERSITY COLLEGE DUBLIN",@"410",@"405",@"390",@"",@"",@"",@"",@"",@"",@"",@"DN600",@"Law",@"Law",@"UNIVERSITY COLLEGE DUBLIN",@"500",@"495",@"",@"",@"",@"",@"",@"",@"",@"",@"DN610",@"Business and Law",@"Business and Law",@"UNIVERSITY COLLEGE DUBLIN",@"510",@"495",@"480",@"",@"",@"",@"",@"",@"",@"",@"DN615",@"BCL Maîtrise",@"BCL Maîtrise",@"UNIVERSITY COLLEGE DUBLIN",@"550",@"525",@"",@"",@"",@"",@"",@"",@"",@"", @"DN616",@"Law with French Law (BCL)",@"Law with French L…",@"UNIVERSITY COLLEGE DUBLIN",@"565",@"560",@"",@"",@"",@"",@"",@"",@"",@"DN650",@"Commerce",@"Commerce",@"UNIVERSITY COLLEGE DUBLIN",@"475",@"465",@"445",@"",@"",@"",@"",@"",@"",@"DN660",@"Commerce International",@"Commerce Internat…",@"UNIVERSITY COLLEGE DUBLIN",@"505",@"495",@"465",@"",@"",@"",@"",@"",@"",@"DN671",@"Economics and Finance",@"Economics and Fin…",@"UNIVERSITY COLLEGE DUBLIN",@"560",@"540",@"480",@"",@"",@"",@"",@"",@"",@"DK810",@"Accounting and Finance",@"Accounting and Fi…",@"DUNDALK IT",@"300",@"300",@"300",@"",@"",@"",@"",@"",@"",@"DK812",@"Marketing",@"Marketing",@"DUNDALK IT",@"305",@"300",@"305",@"",@"",@"",@"",@"",@"",@"DK815",@"Public Relations and Online Communication",@"Public Relations…",@"DUNDALK IT",@"300",@"300",@"300",@"",@"",@"",@"",@"",@"",@"DK816",@"Business Studies",@"Business Studies",@"DUNDALK IT",@"300",@"300",@"300",@"",@"",@"",@"",@"",@"",@"DK820",@"Computing in Games Development",@"Computing in Game…",@"DUNDALK IT",@"325",@"340",@"335",@"",@"",@"",@"",@"",@"",@"DK821",@"Computing",@"Computing",@"DUNDALK IT",@"300",@"300",@"300",@"",@"",@"",@"",@"",@"",@"DK830",@"Building Surveying",@"Building Surveyin…",@"DUNDALK IT",@"305",@"300",@"300",@"",@"",@"",@"",@"",@"",@"DK860",@"Applied Music",@"Applied Music",@"DUNDALK IT",@"500",@"500",@"430",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DK861",@"Humanities",@"Humanities",@"DUNDALK IT",@"310",@"300",@"300",@"",@"",@"",@"",@"",@"",@"DK862",@"Social Care",@"Social Care",@"DUNDALK IT",@"330",@"345",@"335",@"",@"",@"",@"",@"",@"",@"DK870",@"General Nursing",@"General Nursing",@"DUNDALK IT",@"400",@"405",@"390",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"DK871",@"Mature Applicants General Nursing",@"Mature Applicants…",@"DUNDALK IT",@"574",@"223",@"225",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DK872",@"Intellectual Disability Nursing",@"Intellectual Disa…",@"DUNDALK IT",@"365",@"350",@"345",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"DK873",@"Mature Applicants Intellectual Disability Nursing",@"Mature Applicants…",@"DUNDALK IT",@"521",@"209",@"210",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DK874",@"Psychiatric Nursing",@"Psychiatric Nursi…",@"DUNDALK IT",@"370",@"375",@"350",@"",@"",@"",@"",@"",@"",@"DK875",@"Mature Applicants Psychiatric Nursing",@"Mature Applicants…",@"DUNDALK IT",@"544",@"214",@"213",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DK876",@"Early Childhood Studies",@"Early Childhood S…",@"DUNDALK IT",@"315",@"330",@"350",@"",@"",@"",@"",@"",@"",@"DK877",@"Midwifery",@"Midwifery",@"DUNDALK IT",@"400",@"415",@"390",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"DK878",@"Mature Applicants Midwifery",@"Mature Applicants…",@"DUNDALK IT",@"583",@"229",@"236",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DK880",@"Health and Physical Activity",@"Health and Physic…",@"DUNDALK IT",@"355",@"330",@"370",@"",@"",@"",@"",@"",@"",@"DK890",@"Interactive Applications Design and Development",@"Interactive Appli…",@"DUNDALK IT",@"300",@"",@"",@"",@"",@"",@"",@"",@"",@"CK101",@"Arts",@"Arts",@"UNIVERSITY COLLEGE CORK",@"330",@"330",@"345",@"",@"",@"",@"",@"",@"",@"CK102",@"Social Science",@"Social Science",@"UNIVERSITY COLLEGE CORK",@"380",@"390",@"385",@"",@"",@"",@"",@"",@"",@"CK103",@"Music",@"Music",@"UNIVERSITY COLLEGE CORK",@"400",@"370",@"375",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"CK104",@"Arts with Music",@"Arts with Music",@"UNIVERSITY COLLEGE CORK",@"340",@"335",@"410",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"CK105",@"Film and Screen Media",@"Film and Screen M…",@"UNIVERSITY COLLEGE CORK",@"420",@"",@"",@"",@"",@"",@"",@"",@"",@"CK106",@"Applied Psychology",@"Applied Psycholog…",@"UNIVERSITY COLLEGE CORK",@"500",@"510",@"500",@"",@"",@"",@"",@"",@"",@"CK107",@"Geography and Archaeology",@"Geography and Arc…",@"UNIVERSITY COLLEGE CORK",@"355",@"",@"",@"",@"",@"",@"",@"",@"",@"CK108",@"Arts International",@"Arts Internationa…",@"UNIVERSITY COLLEGE CORK",@"430",@"",@"",@"",@"",@"",@"",@"",@"",@"CK111",@"Early Years and Childhood Studies",@"Early Years and C…",@"UNIVERSITY COLLEGE CORK",@"395",@"395",@"400",@"",@"",@"",@"",@"",@"",@"CK112",@"Drama and Theatre Studies",@"Drama and Theatre…",@"UNIVERSITY COLLEGE CORK",@"375",@"355",@"400",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"CK114",@"Social Science (Youth & Community Work) - Mature App`s only",@"Social Science (Y…",@"UNIVERSITY COLLEGE CORK",@"",@"999",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"CK115",@"Social Work - Mature Applicants only",@"Social Work - Mat…",@"UNIVERSITY COLLEGE CORK",@"",@"999",@"0",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"CK116",@"Sports Studies and Physical Education",@"Sports Studies an…",@"UNIVERSITY COLLEGE CORK",@"485",@"475",@"480",@"",@"",@"",@"",@"",@"",@"CK201",@"Commerce",@"Commerce",@"UNIVERSITY COLLEGE CORK",@"435",@"430",@"420",@"",@"",@"",@"",@"",@"",@"CK202",@"Accounting",@"Accounting",@"UNIVERSITY COLLEGE CORK",@"445",@"430",@"425",@"",@"",@"",@"",@"",@"",@"CK203",@"Business Information Systems",@"Business Informat…",@"UNIVERSITY COLLEGE CORK",@"440",@"410",@"400",@"",@"",@"",@"",@"",@"",@"CK204",@"Finance",@"Finance",@"UNIVERSITY COLLEGE CORK",@"475",@"420",@"430",@"",@"",@"",@"",@"",@"",@"CK205",@"Commerce (International) with French",@"Commerce (Interna…",@"UNIVERSITY COLLEGE CORK",@"470",@"485",@"500",@"",@"",@"",@"",@"",@"",@"CK206",@"Commerce (International) with German",@"Commerce (Interna…",@"UNIVERSITY COLLEGE CORK",@"460",@"405",@"370",@"",@"",@"",@"",@"",@"",@"CK207",@"Commerce (International) with Italian",@"Commerce (Interna…",@"UNIVERSITY COLLEGE CORK",@"395",@"385",@"350",@"",@"",@"",@"",@"",@"",@"CK208",@"Commerce (International) with Hispanic Studies",@"Commerce (Interna…",@"UNIVERSITY COLLEGE CORK",@"435",@"430",@"420",@"",@"",@"",@"",@"",@"",@"CK209",@"Commerce (International) with Irish",@"Commerce (Interna…",@"UNIVERSITY COLLEGE CORK",@"480",@"430",@"440",@"",@"",@"",@"",@"",@"",@"CK210",@"Government",@"Government",@"UNIVERSITY COLLEGE CORK",@"330",@"330",@"335",@"",@"",@"",@"",@"",@"",@"CK211",@"Commerce (International) with Chinese Studies",@"Commerce (Interna…",@"UNIVERSITY COLLEGE CORK",@"370",@"355",@"360",@"",@"",@"",@"",@"",@"",@"CK301",@"Law",@"Law",@"UNIVERSITY COLLEGE CORK",@"475",@"470",@"480",@"",@"",@"",@"",@"",@"",@"CK302",@"Law and French",@"Law and French",@"UNIVERSITY COLLEGE CORK",@"510",@"500",@"535",@"",@"",@"",@"",@"",@"",@"CK304",@"Law and Irish",@"Law and Irish",@"UNIVERSITY COLLEGE CORK",@"495",@"525",@"500",@"",@"",@"",@"",@"",@"",@"CK305",@"Law (Clinical)",@"Law (Clinical)",@"UNIVERSITY COLLEGE CORK",@"510",@"530",@"520",@"",@"",@"",@"",@"",@"",@"CK306",@"Law (International)",@"Law (Internationa…",@"UNIVERSITY COLLEGE CORK",@"540",@"550",@"545",@"",@"",@"",@"",@"",@"",@"CK401",@"Computer Science",@"Computer Science",@"UNIVERSITY COLLEGE CORK",@"425",@"340",@"330",@"",@"",@"",@"",@"",@"",@"CK402",@"Biological and Chemical Sciences",@"Biological and Ch…",@"UNIVERSITY COLLEGE CORK",@"440",@"410",@"400",@"",@"",@"",@"",@"",@"",@"CK404",@"Biological, Earth and Environmental Science",@"Biological, Earth…",@"UNIVERSITY COLLEGE CORK",@"400",@"390",@"380",@"",@"",@"",@"",@"",@"",@"CK405",@"Genetics",@"Genetics",@"UNIVERSITY COLLEGE CORK",@"475",@"465",@"460",@"",@"",@"",@"",@"",@"",@"CK406",@"Chemical Sciences",@"Chemical Sciences",@"UNIVERSITY COLLEGE CORK",@"400",@"380",@"360",@"",@"",@"",@"",@"",@"",@"CK407",@"Mathematical Sciences",@"Mathematical Scie…",@"UNIVERSITY COLLEGE CORK",@"525",@"520",@"515",@"",@"",@"",@"",@"",@"",@"CK408",@"Physics and Astrophysics",@"Physics and Astro…",@"UNIVERSITY COLLEGE CORK",@"500",@"460",@"445",@"",@"",@"",@"",@"",@"",@"CK502",@"Food Marketing and Entrepreneurship",@"Food Marketing an…",@"UNIVERSITY COLLEGE CORK",@"440",@"435",@"420",@"",@"",@"",@"",@"",@"",@"CK504",@"Nutritional Sciences",@"Nutritional Scien…",@"UNIVERSITY COLLEGE CORK",@"500",@"490",@"490",@"",@"",@"",@"",@"",@"",@"CK505",@"Food Science",@"Food Science",@"UNIVERSITY COLLEGE CORK",@"435",@"405",@"365",@"",@"",@"",@"",@"",@"",@"CK506",@"International Development and Food Policy",@"International Dev…",@"UNIVERSITY COLLEGE CORK",@"335",@"335",@"350",@"",@"",@"",@"",@"",@"",@"CK601",@"Process and Chemical Engineering",@"Process and Chemi…",@"UNIVERSITY COLLEGE CORK",@"495",@"405",@"440",@"",@"",@"",@"",@"",@"",@"CK602",@"Civil and Environmental Engineering",@"Civil and Environ…",@"UNIVERSITY COLLEGE CORK",@"390",@"395",@"405",@"",@"",@"",@"",@"",@"",@"CK603",@"Energy Engineering",@"Energy Engineerin…",@"UNIVERSITY COLLEGE CORK",@"400",@"400",@"465",@"",@"",@"",@"",@"",@"",@"CK605",@"Electrical and Electronic Engineering",@"Electrical and El…",@"UNIVERSITY COLLEGE CORK",@"395",@"410",@"405",@"",@"",@"",@"",@"",@"",@"CK606",@"Architecture - Joint UCC and CIT programme",@"Architecture - Jo…",@"UNIVERSITY COLLEGE CORK",@"400",@"400",@"420",@"",@"",@"",@"",@"",@"",@"CK701",@"Medicine - (Undergraduate Entry)",@"Medicine - (Under…",@"UNIVERSITY COLLEGE CORK",@"742",@"738",@"733",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"CK702",@"Dentistry",@"Dentistry",@"UNIVERSITY COLLEGE CORK",@"570",@"575",@"570",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"CK703",@"Pharmacy",@"Pharmacy",@"UNIVERSITY COLLEGE CORK",@"565",@"565",@"545",@"",@"",@"",@"",@"",@"",@"CK704",@"Occupational Therapy",@"Occupational Ther…",@"UNIVERSITY COLLEGE CORK",@"525",@"530",@"515",@"",@"",@"",@"",@"",@"",@"CK705",@"Speech and Language Therapy",@"Speech and Langua…",@"UNIVERSITY COLLEGE CORK",@"510",@"525",@"520",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"CK706",@"Public Health",@"Public Health",@"UNIVERSITY COLLEGE CORK",@"385",@"375",@"",@"",@"",@"",@"",@"",@"",@"CK710",@"General Nursing",@"General Nursing",@"UNIVERSITY COLLEGE CORK",@"450",@"450",@"440",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"CK711",@"Mature Applicants General Nursing",@"Mature Applicants…",@"UNIVERSITY COLLEGE CORK",@"562",@"229",@"231",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"CK712",@"Children`s and General Nursing (Integrated)",@"Children`s and Ge…",@"UNIVERSITY COLLEGE CORK",@"520",@"525",@"500",@"",@"",@"",@"",@"",@"",@"CK713",@"Mature Applicants Children`s and General Nursing (Integrated)",@"Mature Applicants…",@"UNIVERSITY COLLEGE CORK",@"578",@"232",@"244",@"(*) Not all on this points score were offered places; (#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"CK720",@"Psychiatric Nursing",@"Psychiatric Nursi…",@"UNIVERSITY COLLEGE CORK",@"430",@"430",@"415",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"CK721",@"Mature Applicants Psychiatric Nursing",@"Mature Applicants…",@"UNIVERSITY COLLEGE CORK",@"546",@"220",@"219",@"(*) Not all on this points score were offered places; (#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"CK730",@"Intellectual Disability Nursing",@"Intellectual Disa…",@"UNIVERSITY COLLEGE CORK",@"425",@"425",@"410",@"",@"",@"",@"",@"",@"",@"CK731",@"Mature Applicants Intellectual Disability Nursing",@"Mature Applicants…",@"UNIVERSITY COLLEGE CORK",@"511",@"206",@"217",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"CK740",@"Midwifery",@"Midwifery",@"UNIVERSITY COLLEGE CORK",@"445",@"455",@"455",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"CK741",@"Mature Applicants Midwifery",@"Mature Applicants…",@"UNIVERSITY COLLEGE CORK",@"570",@"233",@"230",@"(*) Not all on this points score were offered places; (#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"CK791",@"Medicine - (Graduate Entry)",@"Medicine - (Gradu…",@"UNIVERSITY COLLEGE CORK",@"54",@"55",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"AH001",@"Theology and Philosophy",@"Theology and Phil…",@"ALL HALLOWS",@"250",@"250",@"270",@"",@"",@"",@"",@"",@"",@"AH002",@"Theology and Psychology",@"Theology and Psyc…",@"ALL HALLOWS",@"310",@"315",@"340",@"",@"",@"",@"",@"",@"",@"AH003",@"Theology and English Literature",@"Theology and Engl…",@"ALL HALLOWS",@"290",@"295",@"300",@"",@"",@"",@"",@"",@"",@"AC120",@"International Business",@"International Bus…",@"AMERICAN COLLEGE",@"285",@"295",@"280",@"",@"",@"",@"",@"",@"",@"AC121",@"Accounting and Finance",@"Accounting and Fi…",@"AMERICAN COLLEGE",@"300",@"275",@"335",@"",@"",@"",@"",@"",@"",@"AC137",@"Liberal Arts",@"Liberal Arts",@"AMERICAN COLLEGE",@"200",@"280",@"",@"",@"",@"",@"",@"",@"",@"CE001",@"Education - Primary Teaching",@"Education - Prima…",@"CHURCH OF IRELAND COLLEGE",@"405",@"435",@"390",@"(***) Applicants are ranked as for other courses but the final decision depends on performance in interview.",@"",@"",@"",@"",@"",@"CM001",@"Education - Primary Teaching",@"Education - Prima…",@"MARINO INSTITUTE OF EDUCATION",@"460",@"465",@"465",@"",@"",@"",@"",@"",@"",@"CM002",@"Education - Primary Teaching - Gaeltacht Applicants",@"Education - Prima…",@"MARINO INSTITUTE OF EDUCATION",@"",@"435",@"425",@"",@"",@"",@"",@"",@"",@"CM010",@"Education Studies",@"Education Studies",@"MARINO INSTITUTE OF EDUCATION",@"310",@"310",@"",@"",@"",@"",@"",@"",@"",@"DB512",@"Business",@"Business",@"DUBLIN BUSINESS SCHOOL",@"235",@"220",@"230",@"",@"",@"",@"",@"",@"",@"DB514",@"Business (Law stream)",@"Business (Law str…",@"DUBLIN BUSINESS SCHOOL",@"255",@"195",@"215",@"",@"",@"",@"",@"",@"",@"DB515",@"Business (Human Resource Management stream)",@"Business (Human R…",@"DUBLIN BUSINESS SCHOOL",@"275",@"305",@"210",@"",@"",@"",@"",@"",@"",@"DB516",@"Financial Services",@"Financial Service…",@"DUBLIN BUSINESS SCHOOL",@"260",@"235",@"245",@"",@"",@"",@"",@"",@"",@"DB517",@"Marketing (Event Management stream)",@"Marketing (Event…",@"DUBLIN BUSINESS SCHOOL",@"240",@"235",@"255",@"",@"",@"",@"",@"",@"",@"DB518",@"Marketing (Digital Media stream)",@"Marketing (Digita…",@"DUBLIN BUSINESS SCHOOL",@"295",@"205",@"",@"",@"",@"",@"",@"",@"",@"DB520",@"Business (work placement stream)",@"Business (work pl…",@"DUBLIN BUSINESS SCHOOL",@"285",@"255",@"",@"",@"",@"",@"",@"",@"",@"DB521",@"Accounting and Finance",@"Accounting and Fi…",@"DUBLIN BUSINESS SCHOOL",@"275",@"230",@"235",@"",@"",@"",@"",@"",@"",@"DB524",@"Business Information Systems",@"Business Informat…",@"DUBLIN BUSINESS SCHOOL",@"415",@"",@"",@"",@"",@"",@"",@"",@"",@"DB525",@"Marketing (Digital Media and Cloud Computing stream)",@"Marketing (Digita…",@"DUBLIN BUSINESS SCHOOL",@"225",@"260",@"",@"",@"",@"",@"",@"",@"",@"DB526",@"Business Information Systems (Cloud Computing stream)",@"Business Informat…",@"DUBLIN BUSINESS SCHOOL",@"245",@"285",@"",@"",@"",@"",@"",@"",@"",@"DB531",@"Marketing",@"Marketing",@"DUBLIN BUSINESS SCHOOL",@"255",@"100",@"240",@"",@"",@"",@"",@"",@"",@"DB553",@"Film, Literature and Drama",@"Film, Literature…",@"DUBLIN BUSINESS SCHOOL",@"260",@"250",@"",@"",@"",@"",@"",@"",@"",@"DB561",@"Arts (General)",@"Arts (General)",@"DUBLIN BUSINESS SCHOOL",@"245",@"210",@"240",@"",@"",@"",@"",@"",@"",@"DB562",@"Psychology",@"Psychology",@"DUBLIN BUSINESS SCHOOL",@"200",@"235",@"215",@"",@"",@"",@"",@"",@"",@"DB565",@"Journalism",@"Journalism",@"DUBLIN BUSINESS SCHOOL",@"205",@"210",@"240",@"",@"",@"",@"",@"",@"",@"DB566",@"Social Science",@"Social Science",@"DUBLIN BUSINESS SCHOOL",@"255",@"225",@"205",@"",@"",@"",@"",@"",@"",@"DB567",@"Film Studies",@"Film Studies",@"DUBLIN BUSINESS SCHOOL",@"225",@"220",@"240",@"",@"",@"",@"",@"",@"",@"DB568",@"Law",@"Law",@"DUBLIN BUSINESS SCHOOL",@"250",@"230",@"205",@"",@"",@"",@"",@"",@"",@"DB569",@"Business (Psychology stream)",@"Business (Psychol…",@"DUBLIN BUSINESS SCHOOL",@"290",@"235",@"",@"",@"",@"",@"",@"",@"",@"BN101",@"Business",@"Business",@"IT BLANCHARDSTOWN ",@"215",@"210",@"210",@"",@"",@"",@"",@"",@"",@"BN103",@"Business and Information Technology",@"Business and Info…",@"IT BLANCHARDSTOWN ",@"225",@"210",@"250",@"",@"",@"",@"",@"",@"",@"BN104",@"Computing (Information Technology)",@"Computing (Inform…",@"IT BLANCHARDSTOWN ",@"235",@"215",@"220",@"",@"",@"",@"",@"",@"",@"BN107",@"Applied Social Studies in Social Care",@"Applied Social St…",@"IT BLANCHARDSTOWN ",@"330",@"360",@"355",@"",@"",@"",@"",@"",@"",@"BN110",@"International Business",@"International Bus…",@"IT BLANCHARDSTOWN ",@"230",@"255",@"235",@"",@"",@"",@"",@"",@"",@"BN111",@"Sports Management and Coaching",@"Sports Management…",@"IT BLANCHARDSTOWN ",@"335",@"320",@"345",@"",@"",@"",@"",@"",@"",@"BN112",@"Creative Digital Media",@"Creative Digital…",@"IT BLANCHARDSTOWN ",@"305",@"310",@"320",@"",@"",@"",@"",@"",@"",@"BN113",@"Horticulture",@"Horticulture",@"IT BLANCHARDSTOWN ",@"215",@"225",@"255",@"",@"",@"",@"",@"",@"",@"BN114",@"Accounting and Finance",@"Accounting and Fi…",@"IT BLANCHARDSTOWN ",@"230",@"",@"",@"",@"",@"",@"",@"",@"",@"BN115",@"Social and Community Development",@"Social and Commun…",@"IT BLANCHARDSTOWN ",@"300",@"310",@"315",@"",@"",@"",@"",@"",@"",@"BN117",@"Computer Engineering in Mobile Systems",@"Computer Engineer…",@"IT BLANCHARDSTOWN ",@"210",@"240",@"205",@"",@"",@"",@"",@"",@"",@"BN118",@"Early Childhood Care and Education",@"Early Childhood C…",@"IT BLANCHARDSTOWN ",@"340",@"330",@"",@"",@"",@"",@"",@"",@"",@"BN120",@"Information Security and Digital Forensics",@"Information Secur…",@"IT BLANCHARDSTOWN ",@"240",@"",@"",@"",@"",@"",@"",@"",@"",@"BN121",@"Mechatronic Engineering",@"Mechatronic Engin…",@"IT BLANCHARDSTOWN ",@"205",@"205",@"200",@"",@"",@"",@"",@"",@"",@"GA181",@"Accounting",@"Accounting",@"GALWAY-MAYO IT",@"265",@"265",@"285",@"",@"",@"",@"",@"",@"",@"GA182",@"Business",@"Business",@"GALWAY-MAYO IT",@"300",@"240",@"260",@"",@"",@"",@"",@"",@"",@"GA183",@"Information Systems Management",@"Information Syste…",@"GALWAY-MAYO IT",@"285",@"",@"",@"",@"",@"",@"",@"",@"",@"GA281",@"Film and Documentary",@"Film and Document…",@"GALWAY-MAYO IT",@"305",@"320",@"",@"",@"",@"",@"",@"",@"",@"GA282",@"Heritage Studies",@"Heritage Studies",@"GALWAY-MAYO IT",@"245",@"225",@"235",@"",@"",@"",@"",@"",@"",@"GA380",@"Hotel and Catering Management",@"Hotel and Caterin…",@"GALWAY-MAYO IT",@"200",@"230",@"235",@"",@"",@"",@"",@"",@"",@"GA480",@"Construction Management",@"Construction Mana…",@"GALWAY-MAYO IT",@"215",@"240",@"210",@"",@"",@"",@"",@"",@"",@"GA482",@"Construction Economics and Quantity Surveying",@"Construction Econ…",@"GALWAY-MAYO IT",@"260",@"140",@"140",@"",@"",@"",@"",@"",@"",@"GA483",@"Architectural Technology",@"Architectural Tec…",@"GALWAY-MAYO IT",@"205",@"155",@"180",@"",@"",@"",@"",@"",@"",@"GA484",@"Civil Engineering",@"Civil Engineering",@"GALWAY-MAYO IT",@"245",@"165",@"180",@"",@"",@"",@"",@"",@"",@"GA680",@"Mechanical Engineering",@"Mechanical Engine…",@"GALWAY-MAYO IT",@"315",@"305",@"325",@"",@"",@"",@"",@"",@"",@"GA681",@"Energy Engineering",@"Energy Engineerin…",@"GALWAY-MAYO IT",@"260",@"250",@"320",@"",@"",@"",@"",@"",@"",@"GA780",@"Applied Freshwater and Marine Biology",@"Applied Freshwate…",@"GALWAY-MAYO IT",@"370",@"375",@"340",@"",@"",@"",@"",@"",@"",@"GA781",@"Applied Biology and Biopharmaceutical Science",@"Applied Biology a…",@"GALWAY-MAYO IT",@"360",@"375",@"330",@"",@"",@"",@"",@"",@"",@"GA782",@"Chemical and Pharmaceutical Science",@"Chemical and Phar…",@"GALWAY-MAYO IT",@"310",@"310",@"310",@"",@"",@"",@"",@"",@"",@"GA783",@"Physics and Instrumentation",@"Physics and Instr…",@"GALWAY-MAYO IT",@"325",@"290",@"265",@"",@"",@"",@"",@"",@"",@"GA784",@"Science (Undenominated)",@"Science (Undenomi…",@"GALWAY-MAYO IT",@"350",@"360",@"330",@"",@"",@"",@"",@"",@"",@"GA785",@"Medical Science",@"Medical Science",@"GALWAY-MAYO IT",@"410",@"390",@"390",@"",@"",@"",@"",@"",@"",@"GA786",@"Forensic Science and Analysis",@"Forensic Science…",@"GALWAY-MAYO IT",@"355",@"380",@"380",@"",@"",@"",@"",@"",@"", @"GA880",@"General Nursing (Castlebar)",@"General Nursing (…",@"GALWAY-MAYO IT",@"405",@"405",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"GA881",@"Mature Applicants General Nursing (Castlebar)",@"Mature Applicants…",@"GALWAY-MAYO IT",@"562",@"224",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"GA882",@"Psychiatric Nursing (Castlebar)",@"Psychiatric Nursi…",@"GALWAY-MAYO IT",@"370",@"375",@"",@"",@"",@"",@"",@"",@"",@"GA883",@"Mature Applicants Psychiatric Nursing (Castlebar)",@"Mature Applicants…",@"GALWAY-MAYO IT",@"537",@"220",@"",@"(*) Not all on this points score were offered places; (#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"GA884",@"Digital Media and Society",@"Digital Media and…",@"GALWAY-MAYO IT",@"255",@"",@"",@"",@"",@"",@"",@"",@"",@"GA980",@"Design and Technology Education (Letterfrack)",@"Design and Techno…",@"GALWAY-MAYO IT",@"420",@"425",@"",@"",@"",@"",@"",@"",@"",@"GA981",@"Furniture Design and Manufacture (Letterfrack)",@"Furniture Design…",@"GALWAY-MAYO IT",@"365",@"",@"",@"",@"",@"",@"",@"",@"",@"GA982",@"Furniture and Wood Technology (Letterfrack)",@"Furniture and Woo…",@"GALWAY-MAYO IT",@"360",@"",@"",@"",@"",@"",@"",@"",@"",@"GY101",@"Arts",@"Arts",@"NUI - GALWAY",@"300",@"300",@"340",@"",@"",@"",@"",@"",@"",@"GY103",@"Arts (Public and Social Policy)",@"Arts (Public and…",@"NUI - GALWAY",@"320",@"300",@"315",@"",@"",@"",@"",@"",@"",@"GY104",@"Arts (Psychology)",@"Arts (Psychology)",@"NUI - GALWAY",@"530",@"525",@"525",@"",@"",@"",@"",@"",@"",@"GY105",@"Arts (History)",@"Arts (History)",@"NUI - GALWAY",@"305",@"320",@"",@"",@"",@"",@"",@"",@"",@"GY106",@"Na Dána (Cumarsáid)",@"Na Dána (Cumarsái…",@"NUI - GALWAY",@"300",@"350",@"325",@"",@"",@"",@"",@"",@"",@"GY107",@"Na Dána (Gaeilge agus Léann an Aistriúcháin)",@"Na Dána (Gaeilge…",@"NUI - GALWAY",@"345",@"345",@"",@"",@"",@"",@"",@"",@"",@"GY109",@"Arts (Mathematics and Education)",@"Arts (Mathematics…",@"NUI - GALWAY",@"365",@"405",@"420",@"",@"",@"",@"",@"",@"",@"GY110",@"Arts with Children`s Studies",@"Arts with Childre…",@"NUI - GALWAY",@"420",@"420",@"",@"",@"",@"",@"",@"",@"",@"GY111",@"Arts with Creative Writing",@"Arts with Creativ…",@"NUI - GALWAY",@"470",@"490",@"505",@"",@"",@"",@"",@"",@"",@"GY112",@"Arts with Film Studies",@"Arts with Film St…",@"NUI - GALWAY",@"385",@"390",@"450",@"",@"",@"",@"",@"",@"",@"GY113",@"Arts with Human Rights",@"Arts with Human R…",@"NUI - GALWAY",@"430",@"425",@"470",@"",@"",@"",@"",@"",@"",@"GY114",@"Arts with Irish Studies",@"Arts with Irish S…",@"NUI - GALWAY",@"310",@"300",@"415",@"",@"",@"",@"",@"",@"",@"GY115",@"Arts with Performing Arts Studies",@"Arts with Perform…",@"NUI - GALWAY",@"400",@"410",@"465",@"",@"",@"",@"",@"",@"",@"GY117",@"Arts with Latin American Studies",@"Arts with Latin A…",@"NUI - GALWAY",@"385",@"305",@"335",@"",@"",@"",@"",@"",@"",@"GY118",@"Arts (Drama, Theatre and Performance Studies)",@"Arts (Drama, Thea…",@"NUI - GALWAY",@"450",@"450",@"",@"",@"",@"",@"",@"",@"",@"GY119",@"Arts with Journalism",@"Arts with Journal…",@"NUI - GALWAY",@"480",@"",@"",@"",@"",@"",@"",@"",@"",@"GY120",@"Arts (Youth and Family Studies) at St Angela`s College",@"Arts (Youth and F…",@"NUI - GALWAY",@"300",@"300",@"",@"",@"",@"",@"",@"",@"",@"GY201",@"Commerce",@"Commerce",@"NUI - GALWAY",@"375",@"340",@"360",@"",@"",@"",@"",@"",@"",@"GY202",@"Commerce (International) with French",@"Commerce (Interna…",@"NUI - GALWAY",@"525",@"495",@"475",@"",@"",@"",@"",@"",@"",@"GY203",@"Commerce (International) with German",@"Commerce (Interna…",@"NUI - GALWAY",@"450",@"405",@"400",@"",@"",@"",@"",@"",@"",@"GY204",@"Commerce (International) with Spanish",@"Commerce (Interna…",@"NUI - GALWAY",@"460",@"410",@"380",@"",@"",@"",@"",@"",@"",@"GY206",@"Business Information Systems",@"Business Informat…",@"NUI - GALWAY",@"400",@"370",@"355",@"",@"",@"",@"",@"",@"",@"GY207",@"Commerce (Accounting)",@"Commerce (Account…",@"NUI - GALWAY",@"440",@"420",@"420",@"",@"",@"",@"",@"",@"",@"GY250",@"Corporate Law",@"Corporate Law",@"NUI - GALWAY",@"355",@"340",@"385",@"",@"",@"",@"",@"",@"",@"GY251",@"Civil Law",@"Civil Law",@"NUI - GALWAY",@"415",@"405",@"450",@"",@"",@"",@"",@"",@"",@"GY301",@"Science",@"Science",@"NUI - GALWAY",@"395",@"380",@"370",@"",@"",@"",@"",@"",@"",@"GY303",@"Biomedical Science",@"Biomedical Scienc…",@"NUI - GALWAY",@"540",@"540",@"515",@"",@"",@"",@"",@"",@"",@"GY304",@"Biotechnology",@"Biotechnology",@"NUI - GALWAY",@"465",@"445",@"415",@"",@"",@"",@"",@"",@"",@"GY308",@"Environmental Science",@"Environmental Sci…",@"NUI - GALWAY",@"400",@"375",@"385",@"",@"",@"",@"",@"",@"",@"GY309",@"Financial Mathematics and Economics",@"Financial Mathema…",@"NUI - GALWAY",@"450",@"430",@"430",@"",@"",@"",@"",@"",@"",@"GY310",@"Marine Science",@"Marine Science",@"NUI - GALWAY",@"410",@"400",@"400",@"",@"",@"",@"",@"",@"",@"GY313",@"Health and Safety Systems",@"Health and Safety…",@"NUI - GALWAY",@"305",@"345",@"350",@"",@"",@"",@"",@"",@"",@"GY314",@"Earth and Ocean Sciences",@"Earth and Ocean S…",@"NUI - GALWAY",@"380",@"380",@"365",@"",@"",@"",@"",@"",@"",@"GY318",@"Biopharmaceutical Chemistry",@"Biopharmaceutical…",@"NUI - GALWAY",@"505",@"495",@"415",@"",@"",@"",@"",@"",@"",@"GY319",@"Mathematical Science",@"Mathematical Scie…",@"NUI - GALWAY",@"485",@"485",@"455",@"",@"",@"",@"",@"",@"",@"GY320",@"Physics(options in Applied/Astrophysics/Biomedical/Theoretic",@"Physics(options i…",@"NUI - GALWAY",@"400",@"",@"",@"",@"",@"",@"",@"",@"",@"GY350",@"Computer Science and Information Technology",@"Computer Science…",@"NUI - GALWAY",@"420",@"415",@"390",@"",@"",@"",@"",@"",@"",@"GY401",@"Engineering (Undenominated)",@"Engineering (Unde…",@"NUI - GALWAY",@"400",@"430",@"400",@"",@"",@"",@"",@"",@"",@"GY402",@"Civil Engineering",@"Civil Engineering",@"NUI - GALWAY",@"400",@"430",@"400",@"",@"",@"",@"",@"",@"",@"GY405",@"Mechanical Engineering",@"Mechanical Engine…",@"NUI - GALWAY",@"400",@"425",@"435",@"",@"",@"",@"",@"",@"",@"GY406",@"Electronic and Computer Engineering",@"Electronic and Co…",@"NUI - GALWAY",@"435",@"445",@"405",@"",@"",@"",@"",@"",@"",@"GY408",@"Biomedical Engineering",@"Biomedical Engine…",@"NUI - GALWAY",@"405",@"430",@"425",@"",@"",@"",@"",@"",@"",@"GY410",@"Project and Construction Management",@"Project and Const…",@"NUI - GALWAY",@"355",@"325",@"315",@"",@"",@"",@"",@"",@"",@"GY413",@"Energy Systems Engineering",@"Energy Systems En…",@"NUI - GALWAY",@"440",@"430",@"410",@"",@"",@"",@"",@"",@"",@"GY414",@"Electrical and Electronic Engineering",@"Electrical and El…",@"NUI - GALWAY",@"515",@"455",@"445",@"",@"",@"",@"",@"",@"",@"GY501",@"Medicine (5-year/6-year course and 8-year embedded PhD option)",@"Medicine (5-year/…",@"NUI - GALWAY",@"739",@"736",@"728",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"GY502",@"Occupational Therapy",@"Occupational Ther…",@"NUI - GALWAY",@"520",@"520",@"505",@"",@"",@"",@"",@"",@"",@"GY503",@"Speech and Language Therapy",@"Speech and Langua…",@"NUI - GALWAY",@"520",@"520",@"510",@"",@"",@"",@"",@"",@"",@"GY504",@"Podiatry",@"Podiatry",@"NUI - GALWAY",@"470",@"460",@"450",@"",@"",@"",@"",@"",@"",@"GY515",@"General Nursing (Galway and Portiuncula)",@"General Nursing (…",@"NUI - GALWAY",@"450",@"455",@"445",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"GY516",@"Psychiatric Nursing",@"Psychiatric Nursi…",@"NUI - GALWAY",@"410",@"410",@"395",@"",@"",@"",@"",@"",@"",@"GY517",@"Midwifery",@"Midwifery",@"NUI - GALWAY",@"450",@"450",@"420",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"GY525",@"Mature Applicants General Nursing (Galway and Portiuncula)",@"Mature Applicants…",@"NUI - GALWAY",@"575",@"233",@"228",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"GY526",@"Mature Applicants Psychiatric Nursing",@"Mature Applicants…",@"NUI - GALWAY",@"548",@"224",@"221",@"(*) Not all on this points score were offered places; (#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"GY527",@"Mature Applicants Midwifery",@"Mature Applicants…",@"NUI - GALWAY",@"593",@"243",@"228",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"TH002",@"Education (Joint Honours) - Business Studies and Accounting",@"Education (Joint…",@"ST PATRICK'S - THURLES",@"335",@"",@"",@"",@"",@"",@"",@"",@"",@"TH003",@"Education (Joint Honours) - Business Studies and Religious Studies",@"Education (Joint…",@"ST PATRICK'S - THURLES",@"330",@"",@"",@"",@"",@"",@"",@"",@"",@"TH004",@"Education (Joint Honours) - Irish and Religious Studies",@"Education (Joint…",@"ST PATRICK'S - THURLES",@"340",@"350",@"",@"",@"",@"",@"",@"",@"",@"TH005",@"Education (Joint Honours) - Irish and Business Studies",@"Education (Joint…",@"ST PATRICK'S - THURLES",@"365",@"",@"",@"",@"",@"",@"",@"",@"",@"DC110",@"Business Studies International",@"Business Studies…",@"DUBLIN CITY UNIVERSITY",@"445",@"415",@"400",@"",@"",@"",@"",@"",@"",@"DC111",@"Business Studies",@"Business Studies",@"DUBLIN CITY UNIVERSITY",@"440",@"425",@"420",@"",@"",@"",@"",@"",@"",@"DC112",@"Global Business (French)",@"Global Business (…",@"DUBLIN CITY UNIVERSITY",@"490",@"480",@"430",@"",@"",@"",@"",@"",@"",@"DC113",@"Global Business (German)",@"Global Business (…",@"DUBLIN CITY UNIVERSITY",@"430",@"405",@"360",@"",@"",@"",@"",@"",@"",@"DC114",@"Global Business (Spanish)",@"Global Business (…",@"DUBLIN CITY UNIVERSITY",@"445",@"405",@"405",@"",@"",@"",@"",@"",@"",@"DC115",@"Accounting and Finance",@"Accounting and Fi…",@"DUBLIN CITY UNIVERSITY",@"460",@"450",@"425",@"",@"",@"",@"",@"",@"",@"DC116",@"Global Business (USA)",@"Global Business (…",@"DUBLIN CITY UNIVERSITY",@"545",@"550",@"530",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"DC117",@"Aviation Management/ AM with Pilot Studies",@"Aviation Manageme…",@"DUBLIN CITY UNIVERSITY",@"440",@"425",@"",@"",@"",@"",@"",@"",@"",@"DC118",@"Gnó agus Gaeilge/Business and Irish",@"Gnó agus Gaeilge/…",@"DUBLIN CITY UNIVERSITY",@"340",@"340",@"330",@"",@"",@"",@"",@"",@"",@"DC120",@"Enterprise Computing",@"Enterprise Comput…",@"DUBLIN CITY UNIVERSITY",@"370",@"350",@"330",@"",@"",@"",@"",@"",@"",@"DC121",@"Computer Applications",@"Computer Applicat…",@"DUBLIN CITY UNIVERSITY",@"405",@"390",@"340",@"",@"",@"",@"",@"",@"",@"DC122",@"Computational Problem-Solving and Software Development",@"Computational Pro…",@"DUBLIN CITY UNIVERSITY",@"430",@"",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DC126",@"Actuarial Mathematics",@"Actuarial Mathema…",@"DUBLIN CITY UNIVERSITY",@"515",@"515",@"480",@"",@"",@"",@"",@"",@"",@"DC127",@"Actuarial Financial and Mathematical Sciences (common entry)",@"Actuarial Financi…",@"DUBLIN CITY UNIVERSITY",@"430",@"450",@"",@"",@"",@"",@"",@"",@"",@"DC131",@"Communication Studies",@"Communication Stu…",@"DUBLIN CITY UNIVERSITY",@"410",@"425",@"440",@"",@"",@"",@"",@"",@"",@"DC132",@"Journalism",@"Journalism",@"DUBLIN CITY UNIVERSITY",@"435",@"410",@"440",@"",@"",@"",@"",@"",@"",@"DC133",@"Multimedia",@"Multimedia",@"DUBLIN CITY UNIVERSITY",@"425",@"430",@"420",@"",@"",@"",@"",@"",@"",@"DC155",@"Applied Language and Translation Studies",@"Applied Language…",@"DUBLIN CITY UNIVERSITY",@"360",@"350",@"",@"",@"",@"",@"",@"",@"",@"DC156",@"Languages for International Comm. - English Stream - non-nat",@"Languages for Int…",@"DUBLIN CITY UNIVERSITY",@"490",@"",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DC161",@"Analytical Science",@"Analytical Scienc…",@"DUBLIN CITY UNIVERSITY",@"460",@"460",@"425",@"",@"",@"",@"",@"",@"",@"DC162",@"Chemical and Pharmaceutical Sciences",@"Chemical and Phar…",@"DUBLIN CITY UNIVERSITY",@"475",@"470",@"425",@"",@"",@"",@"",@"",@"",@"DC166",@"Environmental Science and Health",@"Environmental Sci…",@"DUBLIN CITY UNIVERSITY",@"435",@"405",@"380",@"",@"",@"",@"",@"",@"",@"DC167",@"Physics with Astronomy",@"Physics with Astr…",@"DUBLIN CITY UNIVERSITY",@"410",@"415",@"370",@"",@"",@"",@"",@"",@"",@"DC168",@"Genetics and Cell Biology",@"Genetics and Cell…",@"DUBLIN CITY UNIVERSITY",@"495",@"485",@"455",@"",@"",@"",@"",@"",@"",@"DC170",@"Horticulture",@"Horticulture",@"DUBLIN CITY UNIVERSITY",@"350",@"380",@"375",@"",@"",@"",@"",@"",@"",@"DC171",@"Applied Physics",@"Applied Physics",@"DUBLIN CITY UNIVERSITY",@"405",@"410",@"360",@"",@"",@"",@"",@"",@"",@"DC173",@"Physics with Biomedical Sciences",@"Physics with Biom…",@"DUBLIN CITY UNIVERSITY",@"420",@"415",@"420",@"",@"",@"",@"",@"",@"",@"DC181",@"Biotechnology",@"Biotechnology",@"DUBLIN CITY UNIVERSITY",@"470",@"465",@"435",@"",@"",@"",@"",@"",@"",@"DC191",@"Electronic Engineering",@"Electronic Engine…",@"DUBLIN CITY UNIVERSITY",@"390",@"380",@"330",@"",@"",@"",@"",@"",@"",@"DC192",@"Information and Communications Engineering",@"Information and C…",@"DUBLIN CITY UNIVERSITY",@"410",@"425",@"380",@"",@"",@"",@"",@"",@"",@"DC193",@"Mechatronic Engineering",@"Mechatronic Engin…",@"DUBLIN CITY UNIVERSITY",@"400",@"380",@"370",@"",@"",@"",@"",@"",@"",@"DC195",@"Mechanical and Manufacturing Engineering",@"Mechanical and Ma…",@"DUBLIN CITY UNIVERSITY",@"390",@"345",@"345",@"",@"",@"",@"",@"",@"",@"DC196",@"Manufacturing Engineering with Business Studies",@"Manufacturing Eng…",@"DUBLIN CITY UNIVERSITY",@"375",@"330",@"300",@"",@"",@"",@"",@"",@"",@"DC197",@"Biomedical Engineering",@"Biomedical Engine…",@"DUBLIN CITY UNIVERSITY",@"380",@"380",@"320",@"",@"",@"",@"",@"",@"",@"DC199",@"Digital Media Engineering",@"Digital Media Eng…",@"DUBLIN CITY UNIVERSITY",@"385",@"350",@"410",@"",@"",@"",@"",@"",@"",@"DC200",@"Common Entry into Engineering (Undenominated Entry)",@"Common Entry into…",@"DUBLIN CITY UNIVERSITY",@"390",@"370",@"300",@"",@"",@"",@"",@"",@"",@"DC201",@"Common Entry into Science (Undenominated Entry)",@"Common Entry into…",@"DUBLIN CITY UNIVERSITY",@"450",@"435",@"400",@"",@"",@"",@"",@"",@"",@"DC202",@"Sport Science and Health",@"Sport Science and…",@"DUBLIN CITY UNIVERSITY",@"485",@"475",@"455",@"",@"",@"",@"",@"",@"",@"DC203",@"Science Education",@"Science Education",@"DUBLIN CITY UNIVERSITY",@"420",@"440",@"440",@"",@"",@"",@"",@"",@"",@"DC204",@"Athletic Therapy and Training",@"Athletic Therapy…",@"DUBLIN CITY UNIVERSITY",@"510",@"520",@"500",@"",@"",@"",@"",@"",@"",@"DC205",@"Physical Education with Biology",@"Physical Educatio…",@"DUBLIN CITY UNIVERSITY",@"490",@"505",@"485",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"DC206",@"Physical Education with Mathematics",@"Physical Educatio…",@"DUBLIN CITY UNIVERSITY",@"490",@"500",@"",@"",@"",@"",@"",@"",@"",@"DC208",@"Psychology",@"Psychology",@"DUBLIN CITY UNIVERSITY",@"500",@"500",@"490",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"DC209",@"Health and Society",@"Health and Societ…",@"DUBLIN CITY UNIVERSITY",@"420",@"430",@"405",@"",@"",@"",@"",@"",@"",@"DC215",@"General Nursing",@"General Nursing",@"DUBLIN CITY UNIVERSITY",@"445",@"440",@"435",@"",@"",@"",@"",@"",@"",@"DC216",@"Psychiatric Nursing",@"Psychiatric Nursi…",@"DUBLIN CITY UNIVERSITY",@"400",@"390",@"375",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"DC217",@"Intellectual Disability Nursing",@"Intellectual Disa…",@"DUBLIN CITY UNIVERSITY",@"395",@"395",@"370",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"DC218",@"Children`s and General Nursing (Integrated)",@"Children`s and Ge…",@"DUBLIN CITY UNIVERSITY",@"485",@"495",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"DC225",@"Mature Applicants General Nursing",@"Mature Applicants…",@"DUBLIN CITY UNIVERSITY",@"559",@"225",@"226",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DC226",@"Mature Applicants Psychiatric Nursing",@"Mature Applicants…",@"DUBLIN CITY UNIVERSITY",@"530",@"216",@"206",@"(*) Not all on this points score were offered places; (#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DC227",@"Mature Applicants Intellectual Disability Nursing",@"Mature Applicants…",@"DUBLIN CITY UNIVERSITY",@"510",@"210",@"202",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DC228",@"Mature Applicants Children`s and General Nursing (Integrated",@"Mature Applicants…",@"DUBLIN CITY UNIVERSITY",@"574",@"241",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DC230",@"Economics, Politics and Law",@"Economics, Politi…",@"DUBLIN CITY UNIVERSITY",@"390",@"390",@"",@"",@"",@"",@"",@"",@"",@"DC231",@"International Relations",@"International Rel…",@"DUBLIN CITY UNIVERSITY",@"380",@"390",@"405",@"",@"",@"",@"",@"",@"",@"DC232",@"Law and Society (BCL)",@"Law and Society (…",@"DUBLIN CITY UNIVERSITY",@"415",@"410",@"440",@"",@"",@"",@"",@"",@"",@"DC235",@"Education and Training",@"Education and Tra…",@"DUBLIN CITY UNIVERSITY",@"315",@"320",@"330",@"",@"",@"",@"",@"",@"",@"DC238",@"Contemporary Culture and Society",@"Contemporary Cult…",@"DUBLIN CITY UNIVERSITY",@"325",@"335",@"350",@"",@"",@"",@"",@"",@"",@"DC239",@"Gaeilge agus Iriseoireacht/Irish and Journalism",@"Gaeilge agus Iris…",@"DUBLIN CITY UNIVERSITY",@"440",@"470",@"465",@"",@"",@"",@"",@"",@"",@"DC240",@"Marketing, Innovation and Technology",@"Marketing, Innova…",@"DUBLIN CITY UNIVERSITY",@"445",@"430",@"",@"",@"",@"",@"",@"",@"",@"DC251",@"Arts - Joint Honours Programme (Law and Politics)",@"Arts - Joint Hono…",@"DUBLIN CITY UNIVERSITY",@"400",@"",@"",@"",@"",@"",@"",@"",@"",@"DC252",@"Arts - Joint Honours Programme (Law and Irish)",@"Arts - Joint Hono…",@"DUBLIN CITY UNIVERSITY",@"425",@"",@"",@"",@"",@"",@"",@"",@"",@"DC253",@"Arts - Joint Honours Programme (Law and French)",@"Arts - Joint Hono…",@"DUBLIN CITY UNIVERSITY",@"420",@"",@"",@"",@"",@"",@"",@"",@"",@"DC258",@"Arts - Joint Honours Programme (Law and Media Studies)",@"Arts - Joint Hono…",@"DUBLIN CITY UNIVERSITY",@"400",@"",@"",@"",@"",@"",@"",@"",@"",@"DC260",@"Arts - Joint Honours Programme (Politics and French)",@"Arts - Joint Hono…",@"DUBLIN CITY UNIVERSITY",@"400",@"",@"",@"",@"",@"",@"",@"",@"",@"DC265",@"Arts - Joint Honours Programme (Politics and Media Studies)",@"Arts - Joint Hono…",@"DUBLIN CITY UNIVERSITY",@"400",@"",@"",@"",@"",@"",@"",@"",@"",@"DC266",@"Arts - Joint Honours Programme (Irish and French)",@"Arts - Joint Hono…",@"DUBLIN CITY UNIVERSITY",@"450",@"",@"",@"",@"",@"",@"",@"",@"",@"DC271",@"Arts - Joint Honours Programme (Media Studies and Irish)",@"Arts - Joint Hono…",@"DUBLIN CITY UNIVERSITY",@"400",@"",@"",@"",@"",@"",@"",@"",@"",@"DC272",@"Arts - Joint Honours Programme (Media Studies and French)",@"Arts - Joint Hono…",@"DUBLIN CITY UNIVERSITY",@"410",@"",@"",@"",@"",@"",@"",@"",@"",@"DC277",@"Arts - Joint Honours Programme (Law with International Lang)",@"Arts - Joint Hono…",@"DUBLIN CITY UNIVERSITY",@"430",@"",@"",@"",@"",@"",@"",@"",@"",@"DC278",@"Arts - Joint Honours Programme (Politics with International Lang)",@"Arts - Joint Hono…",@"DUBLIN CITY UNIVERSITY",@"405",@"",@"",@"",@"",@"",@"",@"",@"",@"DC279",@"Arts - Joint Honours Programme (Media Studies with Intl. Lang)",@"Arts - Joint Hono…",@"DUBLIN CITY UNIVERSITY",@"400",@"",@"",@"",@"",@"",@"",@"",@"",@"DC280",@"Arts - Joint Honours Programme (Irish with International Lang)",@"Arts - Joint Hono…",@"DUBLIN CITY UNIVERSITY",@"410",@"",@"",@"",@"",@"",@"",@"",@"",@"GC203",@"Law (Cork)",@"Law (Cork)",@"GRIFFITH COLLEGE DUBLIN, CORK AND LIMERICK",@"",@"315",@"300",@"",@"",@"",@"",@"",@"",@"GC204",@"Business and Law (Cork)",@"Business and Law…",@"GRIFFITH COLLEGE DUBLIN, CORK AND LIMERICK",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"GC300",@"Business Studies (Limerick)",@"Business Studies…",@"GRIFFITH COLLEGE DUBLIN, CORK AND LIMERICK",@"300",@"",@"",@"",@"",@"",@"",@"",@"",@"GC301",@"Accounting and Finance (Limerick)",@"Accounting and Fi…",@"GRIFFITH COLLEGE DUBLIN, CORK AND LIMERICK",@"230",@"AQA",@"",@"",@"",@"",@"",@"",@"",@"GC400",@"Business Studies (Dublin)",@"Business Studies…",@"GRIFFITH COLLEGE DUBLIN, CORK AND LIMERICK",@"240",@"275",@"270",@"",@"",@"",@"",@"",@"",@"GC401",@"Accounting and Finance (Dublin)",@"Accounting and Fi…",@"GRIFFITH COLLEGE DUBLIN, CORK AND LIMERICK",@"235",@"260",@"260",@"",@"",@"",@"",@"",@"",@"GC403",@"Law (Dublin)",@"Law (Dublin)",@"GRIFFITH COLLEGE DUBLIN, CORK AND LIMERICK",@"305",@"305",@"300",@"",@"",@"",@"",@"",@"",@"GC404",@"Business and Law (Dublin)",@"Business and Law…",@"GRIFFITH COLLEGE DUBLIN, CORK AND LIMERICK",@"255",@"250",@"265",@"",@"",@"",@"",@"",@"",@"GC405",@"International Hospitality Management (Dublin)",@"International Hos…",@"GRIFFITH COLLEGE DUBLIN, CORK AND LIMERICK",@"260",@"210",@"260",@"",@"",@"",@"",@"",@"",@"GC430",@"Computing Science (Dublin)",@"Computing Science…",@"GRIFFITH COLLEGE DUBLIN, CORK AND LIMERICK",@"240",@"190",@"205",@"",@"",@"",@"",@"",@"",@"GC450",@"Journalism and Visual Media (Dublin)",@"Journalism and Vi…",@"GRIFFITH COLLEGE DUBLIN, CORK AND LIMERICK",@"230",@"215",@"205",@"",@"",@"",@"",@"",@"", @"GC455",@"Music Production (Dublin) - Interview",@"Music Production…",@"GRIFFITH COLLEGE DUBLIN, CORK AND LIMERICK",@"285",@"",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"GC489",@"Interior Architecture (Dublin)",@"Interior Architec…",@"GRIFFITH COLLEGE DUBLIN, CORK AND LIMERICK",@"260",@"220",@"260",@"",@"",@"",@"",@"",@"",@"GC494",@"Fashion Design (Dublin) - Portfolio",@"Fashion Design (D…",@"GRIFFITH COLLEGE DUBLIN, CORK AND LIMERICK",@"270",@"255",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"BY301",@"Business",@"Business",@"INSTITUTE OF BUSINESS AND TECHNOLOGY  SWORDS",@"777",@"21",@"",@"",@"",@"",@"",@"",@"",@"MD201",@"Education, Religion and English second level teaching",@"Education, Religi…",@"MATER DEI",@"395",@"415",@"",@"",@"",@"",@"",@"",@"",@"MD301",@"Education, Religion and History second level teaching",@"Education, Religi…",@"MATER DEI",@"385",@"385",@"",@"",@"",@"",@"",@"",@"",@"MD401",@"Education, Religion and Music second level teaching",@"Education, Religi…",@"MATER DEI",@"390",@"370",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"MD500",@"Arts - Irish Studies and Religious Studies",@"Arts - Irish Stud…",@"MATER DEI",@"280",@"265",@"320",@"",@"",@"",@"",@"",@"",@"AD101",@"Art and Design (1st Year Common Entry)",@"Art and Design (1…",@"NATIONAL COLLEGE OF ART AND DESIGN",@"",@"",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"AD202",@"Design or Fine Art and Education second level teaching",@"Design or Fine Ar…",@"NATIONAL COLLEGE OF ART AND DESIGN",@"",@"",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"AD212",@"Product Design",@"Product Design",@"NATIONAL COLLEGE OF ART AND DESIGN",@"",@"",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"AD215",@"Visual Culture",@"Visual Culture",@"NATIONAL COLLEGE OF ART AND DESIGN",@"360",@"",@"",@"",@"",@"",@"",@"",@"",@"LM020",@"Law and Accounting",@"Law and Accountin…",@"UNIVERSITY OF LIMERICK",@"420",@"415",@"430",@"",@"",@"",@"",@"",@"",@"LM022",@"Politics and International Relations",@"Politics and Inte…",@"UNIVERSITY OF LIMERICK",@"350",@"335",@"360",@"",@"",@"",@"",@"",@"",@"LM023",@"Health Informatics",@"Health Informatic…",@"UNIVERSITY OF LIMERICK",@"365",@"340",@"330",@"",@"",@"",@"",@"",@"",@"LM029",@"Law Plus",@"Law Plus",@"UNIVERSITY OF LIMERICK",@"405",@"405",@"440",@"",@"",@"",@"",@"",@"",@"LM030",@"Irish Music and Dance",@"Irish Music and D…",@"UNIVERSITY OF LIMERICK",@"350",@"330",@"300",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"LM031",@"Voice and Dance",@"Voice and Dance",@"UNIVERSITY OF LIMERICK",@"330",@"270",@"300",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"LM032",@"Arts (Joint Honours)",@"Arts (Joint Honou…",@"UNIVERSITY OF LIMERICK",@"435",@"415",@"450",@"",@"",@"",@"",@"",@"",@"LM033",@"New Media and English",@"New Media and Eng…",@"UNIVERSITY OF LIMERICK",@"355",@"340",@"375",@"",@"",@"",@"",@"",@"",@"LM035",@"English and History",@"English and Histo…",@"UNIVERSITY OF LIMERICK",@"325",@"340",@"385",@"",@"",@"",@"",@"",@"",@"LM036",@"Economics and Sociology",@"Economics and Soc…",@"UNIVERSITY OF LIMERICK",@"325",@"320",@"330",@"",@"",@"",@"",@"",@"",@"LM037",@"Economics and Mathematical Sciences",@"Economics and Mat…",@"UNIVERSITY OF LIMERICK",@"375",@"380",@"510",@"",@"",@"",@"",@"",@"",@"LM038",@"Psychology and Sociology",@"Psychology and So…",@"UNIVERSITY OF LIMERICK",@"495",@"495",@"485",@"",@"",@"",@"",@"",@"",@"LM039",@"Journalism and New Media",@"Journalism and Ne…",@"UNIVERSITY OF LIMERICK",@"410",@"380",@"430",@"",@"",@"",@"",@"",@"",@"LM040",@"European Studies",@"European Studies",@"UNIVERSITY OF LIMERICK",@"355",@"340",@"375",@"",@"",@"",@"",@"",@"",@"LM041",@"Politics and Public Administration",@"Politics and Publ…",@"UNIVERSITY OF LIMERICK",@"330",@"310",@"",@"",@"",@"",@"",@"",@"",@"LM043",@"International Insurance and European Studies",@"International Ins…",@"UNIVERSITY OF LIMERICK",@"320",@"315",@"315",@"",@"",@"",@"",@"",@"",@"LM044",@"Applied Languages",@"Applied Languages",@"UNIVERSITY OF LIMERICK",@"440",@"405",@"460",@"",@"",@"",@"",@"",@"",@"LM045",@"Language and Literature",@"Language and Lite…",@"UNIVERSITY OF LIMERICK",@"340",@"340",@"",@"",@"",@"",@"",@"",@"",@"LM046",@"History Politics Sociology and Social Studies",@"History Politics…",@"UNIVERSITY OF LIMERICK",@"320",@"320",@"",@"",@"",@"",@"",@"",@"",@"LM048",@"Irish and New Media/An Ghaeilge agus na Meáin Úra",@"Irish and New Med…",@"UNIVERSITY OF LIMERICK",@"355",@"340",@"",@"",@"",@"",@"",@"",@"",@"LM050",@"Business Studies",@"Business Studies",@"UNIVERSITY OF LIMERICK",@"410",@"375",@"390",@"",@"",@"",@"",@"",@"",@"LM051",@"Computer Systems",@"Computer Systems",@"UNIVERSITY OF LIMERICK",@"360",@"325",@"340",@"",@"",@"",@"",@"",@"",@"LM052",@"Business Studies and a Modern Language (French)",@"Business Studies…",@"UNIVERSITY OF LIMERICK",@"420",@"365",@"",@"",@"",@"",@"",@"",@"",@"LM053",@"Business Studies and a Modern Language (German)",@"Business Studies…",@"UNIVERSITY OF LIMERICK",@"430",@"375",@"",@"",@"",@"",@"",@"",@"",@"LM055",@"Business Studies and a Modern Language (Japanese)",@"Business Studies…",@"UNIVERSITY OF LIMERICK",@"400",@"375",@"",@"",@"",@"",@"",@"",@"",@"LM056",@"International Business",@"International Bus…",@"UNIVERSITY OF LIMERICK",@"460",@"430",@"",@"",@"",@"",@"",@"",@"",@"LM058",@"Financial Mathematics",@"Financial Mathema…",@"UNIVERSITY OF LIMERICK",@"430",@"420",@"395",@"",@"",@"",@"",@"",@"",@"LM060",@"Mathematical Science",@"Mathematical Scie…",@"UNIVERSITY OF LIMERICK",@"380",@"350",@"360",@"",@"",@"",@"",@"",@"",@"LM061",@"Pharmaceutical and Industrial Chemistry",@"Pharmaceutical an…",@"UNIVERSITY OF LIMERICK",@"395",@"380",@"370",@"",@"",@"",@"",@"",@"",@"LM063",@"Technology Management",@"Technology Manage…",@"UNIVERSITY OF LIMERICK",@"300",@"320",@"",@"",@"",@"",@"",@"",@"",@"LM064",@"Industrial Biochemistry",@"Industrial Bioche…",@"UNIVERSITY OF LIMERICK",@"360",@"370",@"380",@"",@"",@"",@"",@"",@"",@"LM065",@"Applied Physics",@"Applied Physics",@"UNIVERSITY OF LIMERICK",@"365",@"370",@"385",@"",@"",@"",@"",@"",@"",@"LM066",@"Environmental Science",@"Environmental Sci…",@"UNIVERSITY OF LIMERICK",@"355",@"360",@"365",@"",@"",@"",@"",@"",@"",@"LM067",@"Wood Science and Technology",@"Wood Science and…",@"UNIVERSITY OF LIMERICK",@"300",@"300",@"305",@"",@"",@"",@"",@"",@"",@"LM068",@"Food Science and Health",@"Food Science and…",@"UNIVERSITY OF LIMERICK",@"375",@"350",@"360",@"",@"",@"",@"",@"",@"",@"LM071",@"Biomedical Engineering",@"Biomedical Engine…",@"UNIVERSITY OF LIMERICK",@"420",@"420",@"415",@"",@"",@"",@"",@"",@"",@"LM073",@"Mechanical Engineering",@"Mechanical Engine…",@"UNIVERSITY OF LIMERICK",@"420",@"400",@"400",@"",@"",@"",@"",@"",@"",@"LM074",@"Computer Aided Engineering and Design",@"Computer Aided En…",@"UNIVERSITY OF LIMERICK",@"450",@"495",@"410",@"",@"",@"",@"",@"",@"",@"LM076",@"Product Design and Technology",@"Product Design an…",@"UNIVERSITY OF LIMERICK",@"375",@"350",@"370",@"",@"",@"",@"",@"",@"",@"LM077",@"Aeronautical Engineering",@"Aeronautical Engi…",@"UNIVERSITY OF LIMERICK",@"425",@"415",@"410",@"",@"",@"",@"",@"",@"",@"LM080",@"Electronics",@"Electronics",@"UNIVERSITY OF LIMERICK",@"330",@"300",@"310",@"",@"",@"",@"",@"",@"",@"LM082",@"Construction Management and Engineering",@"Construction Mana…",@"UNIVERSITY OF LIMERICK",@"330",@"315",@"360",@"",@"",@"",@"",@"",@"",@"LM083",@"Mobile Communications and Security",@"Mobile Communicat…",@"UNIVERSITY OF LIMERICK",@"355",@"320",@"345",@"",@"",@"",@"",@"",@"",@"LM085",@"Civil Engineering",@"Civil Engineering",@"UNIVERSITY OF LIMERICK",@"425",@"415",@"400",@"",@"",@"",@"",@"",@"",@"LM087",@"Energy",@"Energy",@"UNIVERSITY OF LIMERICK",@"380",@"380",@"400",@"",@"",@"",@"",@"",@"",@"LM088",@"Mathematics and Physics",@"Mathematics and P…",@"UNIVERSITY OF LIMERICK",@"480",@"535",@"390",@"",@"",@"",@"",@"",@"",@"LM089",@"Sport and Exercise Sciences",@"Sport and Exercis…",@"UNIVERSITY OF LIMERICK",@"480",@"455",@"445",@"",@"",@"",@"",@"",@"",@"LM090",@"Physical Education with concurrent Teacher Education",@"Physical Educatio…",@"UNIVERSITY OF LIMERICK",@"495",@"490",@"495",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"LM092",@"Science with concurrent Teacher Ed. (Bio. Sciences with Phys or Chem)",@"Science with conc…",@"UNIVERSITY OF LIMERICK",@"435",@"440",@"465",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"LM093",@"Equine Science",@"Equine Science",@"UNIVERSITY OF LIMERICK",@"325",@"340",@"335",@"",@"",@"",@"",@"",@"",@"LM094",@"Materials and Architectural Technology with concurrent Teacher ed",@"Materials and Arc…",@"UNIVERSITY OF LIMERICK",@"440",@"440",@"",@"",@"",@"",@"",@"",@"",@"LM095",@"Materials and Engineering Technology with concurrent Teacher ed",@"Materials and Eng…",@"UNIVERSITY OF LIMERICK",@"395",@"405",@"430",@"",@"",@"",@"",@"",@"",@"LM096",@"Science with concurrent Teacher Education (Physics and Chem)",@"Science with conc…",@"UNIVERSITY OF LIMERICK",@"420",@"380",@"425",@"",@"",@"",@"",@"",@"",@"LM099",@"Architecture",@"Architecture",@"UNIVERSITY OF LIMERICK",@"375",@"380",@"400",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"LM100",@"Physiotherapy",@"Physiotherapy",@"UNIVERSITY OF LIMERICK",@"555",@"550",@"560",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"LM101",@"Medicine - Graduate Entry",@"Medicine - Gradua…",@"UNIVERSITY OF LIMERICK",@"53",@"53",@"54",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"LM102",@"Psychology",@"Psychology",@"UNIVERSITY OF LIMERICK",@"510",@"510",@"515",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"LM110",@"Computer Games Development",@"Computer Games De…",@"UNIVERSITY OF LIMERICK",@"340",@"320",@"",@"",@"",@"",@"",@"",@"",@"LM113",@"Digital Media Design",@"Digital Media Des…",@"UNIVERSITY OF LIMERICK",@"300",@"305",@"335",@"",@"",@"",@"",@"",@"",@"LM114",@"Music, Media and Performance Technology",@"Music, Media and…",@"UNIVERSITY OF LIMERICK",@"335",@"345",@"",@"",@"",@"",@"",@"",@"",@"LM115",@"Chemical and Biochemical Engineering",@"Chemical and Bioc…",@"UNIVERSITY OF LIMERICK",@"420",@"480",@"400",@"",@"",@"",@"",@"",@"",@"LM116",@"Engineering (Choice)",@"Engineering (Choi…",@"UNIVERSITY OF LIMERICK",@"400",@"390",@"395",@"",@"",@"",@"",@"",@"",@"LM117",@"Science (Choice)",@"Science (Choice)",@"UNIVERSITY OF LIMERICK",@"360",@"360",@"380",@"",@"",@"",@"",@"",@"",@"LM118",@"Electronic and Computer Engineering",@"Electronic and Co…",@"UNIVERSITY OF LIMERICK",@"395",@"390",@"405",@"",@"",@"",@"",@"",@"",@"LM119",@"Design and Manufacture",@"Design and Manufa…",@"UNIVERSITY OF LIMERICK",@"445",@"440",@"",@"",@"",@"",@"",@"",@"",@"LM150",@"General Nursing",@"General Nursing",@"UNIVERSITY OF LIMERICK",@"445",@"450",@"445",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"LM151",@"Mature Applicants General Nursing",@"Mature Applicants…",@"UNIVERSITY OF LIMERICK",@"584",@"235",@"234",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"LM152",@"Mental Health Nursing",@"Mental Health Nur…",@"UNIVERSITY OF LIMERICK",@"425",@"415",@"425",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"LM153",@"Mature Applicants Mental Health Nursing",@"Mature Applicants…",@"UNIVERSITY OF LIMERICK",@"569",@"224",@"220",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"LM154",@"Intellectual Disability Nursing",@"Intellectual Disa…",@"UNIVERSITY OF LIMERICK",@"430",@"415",@"400",@"",@"",@"",@"",@"",@"",@"LM155",@"Mature Applicants Intellectual Disability Nursing",@"Mature Applicants…",@"UNIVERSITY OF LIMERICK",@"537",@"220",@"215",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"LM156",@"Midwifery",@"Midwifery",@"UNIVERSITY OF LIMERICK",@"435",@"450",@"445",@"",@"",@"",@"",@"",@"",@"LM157",@"Mature Applicants Midwifery",@"Mature Applicants…",@"UNIVERSITY OF LIMERICK",@"609",@"234",@"230",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"LC110",@"Art and Design",@"Art and Design",@"LIMERICK IT",@"613",@"607",@"701",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"LC223",@"Law and Taxation",@"Law and Taxation",@"LIMERICK IT",@"325",@"305",@"305",@"",@"",@"",@"",@"",@"",@"LC224",@"Business (Accounting/Finance)",@"Business (Account…",@"LIMERICK IT",@"315",@"330",@"335",@"",@"",@"",@"",@"",@"",@"LC225",@"Business (Marketing and Management)",@"Business (Marketi…",@"LIMERICK IT",@"300",@"320",@"335",@"",@"",@"",@"",@"",@"",@"LC226",@"Entrepreneurship",@"Entrepreneurship",@"LIMERICK IT",@"295",@"",@"",@"",@"",@"",@"",@"",@"",@"LC231",@"Business Technology (Information Systems)",@"Business Technolo…",@"LIMERICK IT",@"240",@"",@"",@"",@"",@"",@"",@"",@"",@"LC233",@"Software Development",@"Software Developm…",@"LIMERICK IT",@"255",@"330",@"320",@"",@"",@"",@"",@"",@"",@"LC234",@"Multimedia Programming and Design",@"Multimedia Progra…",@"LIMERICK IT",@"270",@"295",@"295",@"",@"",@"",@"",@"",@"",@"LC236",@"Internet Systems Development",@"Internet Systems…",@"LIMERICK IT",@"333",@"240",@"250",@"",@"",@"",@"",@"",@"",@"LC239",@"Computer Networks and Systems Management",@"Computer Networks…",@"LIMERICK IT",@"275",@"270",@"",@"",@"",@"",@"",@"",@"",@"LC241",@"Construction Management",@"Construction Mana…",@"LIMERICK IT",@"225",@"215",@"250",@"",@"",@"",@"",@"",@"",@"LC242",@"Property Valuation and Management",@"Property Valuatio…",@"LIMERICK IT",@"260",@"275",@"",@"",@"",@"",@"",@"",@"",@"LC243",@"Quantity Surveying",@"Quantity Surveyin…",@"LIMERICK IT",@"245",@"290",@"310",@"",@"",@"",@"",@"",@"",@"LC252",@"Civil Engineering Management",@"Civil Engineering…",@"LIMERICK IT",@"255",@"255",@"275",@"",@"",@"",@"",@"",@"",@"LC265",@"Pharmaceutical and Forensic Analysis",@"Pharmaceutical an…",@"LIMERICK IT",@"370",@"360",@"330",@"",@"",@"",@"",@"",@"",@"LC266",@"Drug and Medicinal Product Analysis",@"Drug and Medicina…",@"LIMERICK IT",@"270",@"290",@"285",@"",@"",@"",@"",@"",@"",@"LC292",@"Applied Social Studies (Social Care)",@"Applied Social St…",@"LIMERICK IT",@"330",@"355",@"360",@"",@"",@"",@"",@"",@"",@"LC293",@"Business with Tourism",@"Business with Tou…",@"LIMERICK IT",@"270",@"245",@"270",@"",@"",@"",@"",@"",@"",@"LC294",@"Business with Event Management",@"Business with Eve…",@"LIMERICK IT",@"300",@"340",@"350",@"",@"",@"",@"",@"",@"",@"LC295",@"Business with Sports Management",@"Business with Spo…",@"LIMERICK IT",@"300",@"330",@"335",@"",@"",@"",@"",@"",@"",@"LC407",@"Social and Community Studies (Thurles)",@"Social and Commun…",@"LIMERICK IT",@"200",@"245",@"",@"",@"",@"",@"",@"",@"",@"LC408",@"Environmental and Natural Resource Management (Thurles)",@"Environmental and…",@"LIMERICK IT",@"255",@"270",@"",@"",@"",@"",@"",@"",@"",@"LC410",@"Accounting and Finance (Thurles)",@"Accounting and Fi…",@"LIMERICK IT",@"335",@"305",@"",@"",@"",@"",@"",@"",@"",@"DT001",@"Product Design",@"Product Design",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"400",@"395",@"370",@"",@"",@"",@"",@"",@"",@"DT021",@"Electrical and Electronic Engineering",@"Electrical and El…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"385",@"393",@"",@"",@"",@"",@"",@"",@"",@"DT023",@"Manufacturing and Design Engineering",@"Manufacturing and…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"290",@"315",@"305",@"",@"",@"",@"",@"",@"",@"DT025",@"Engineering - Common 1st Year",@"Engineering - Com…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"350",@"365",@"340",@"",@"",@"",@"",@"",@"",@"DT028",@"Transport Operations and Technology",@"Transport Operati…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"270",@"270",@"255",@"",@"",@"",@"",@"",@"",@"DT081",@"Computer and Communications Engineering",@"Computer and Comm…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"375",@"370",@"320",@"",@"",@"",@"",@"",@"",@"DT101",@"Architecture",@"Architecture",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"520",@"545",@"525",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DT106",@"Planning and Environmental Management",@"Planning and Envi…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"260",@"275",@"270",@"",@"",@"",@"",@"",@"",@"DT110",@"Property Economics (Valuation Surveying)",@"Property Economic…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"300",@"275",@"305",@"",@"",@"",@"",@"",@"",@"DT111",@"Construction Economics and Management (Quantity Surveying)",@"Construction Econ…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"275",@"270",@"285",@"",@"",@"",@"",@"",@"",@"DT112",@"Geomatics (Surveying and Mapping)",@"Geomatics (Survey…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"270",@"270",@"290",@"",@"",@"",@"",@"",@"",@"DT117",@"Construction Management",@"Construction Mana…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"260",@"260",@"270",@"",@"",@"",@"",@"",@"",@"DT175",@"Architectural Technology",@"Architectural Tec…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"300",@"300",@"320",@"",@"",@"",@"",@"",@"",@"DT201",@"Science (General Entry)",@"Science (General…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"405",@"",@"",@"",@"",@"",@"",@"",@"",@"DT203",@"Forensic and Environmental Chemistry",@"Forensic and Envi…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"340",@"325",@"",@"",@"",@"",@"",@"",@"",@"DT204",@"Biomedical Science",@"Biomedical Scienc…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"495",@"480",@"430",@"",@"",@"",@"",@"",@"",@"DT205",@"Mathematical Sciences",@"Mathematical Scie…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"265",@"285",@"255",@"",@"",@"",@"",@"",@"",@"DT211",@"Computing",@"Computing",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"375",@"350",@"320",@"",@"",@"",@"",@"",@"",@"DT220",@"Industrial Mathematics",@"Industrial Mathem…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"270",@"275",@"290",@"",@"",@"",@"",@"",@"",@"DT221",@"Physics with Energy and Environment",@"Physics with Ener…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"310",@"",@"",@"",@"",@"",@"",@"",@"",@"DT222",@"Physics Technology",@"Physics Technolog…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"320",@"320",@"305",@"",@"",@"",@"",@"",@"",@"DT223",@"Human Nutrition and Dietetics",@"Human Nutrition a…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"545",@"555",@"535",@"",@"",@"",@"",@"",@"",@"DT224",@"Optometry",@"Optometry",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"495",@"525",@"495",@"",@"",@"",@"",@"",@"",@"DT225",@"Public Health Nutrition",@"Public Health Nut…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"385",@"",@"",@"",@"",@"",@"",@"",@"",@"DT227",@"Science with Nanotechnology",@"Science with Nano…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"350",@"375",@"325",@"",@"",@"",@"",@"",@"",@"DT228",@"Computer Science",@"Computer Science",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"405",@"400",@"350",@"",@"",@"",@"",@"",@"",@"DT229",@"Clinical Measurement Science",@"Clinical Measurem…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"450",@"440",@"",@"",@"",@"",@"",@"",@"",@"DT235",@"Physics with Medical Physics and Bioengineering",@"Physics with Medi…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"325",@"325",@"320",@"",@"",@"",@"",@"",@"",@"DT299",@"Chemical Sciences with Medicinal Chemistry",@"Chemical Sciences…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"395",@"390",@"335",@"",@"",@"",@"",@"",@"",@"DT321",@"Business and Law",@"Business and Law",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"430",@"400",@"",@"",@"",@"",@"",@"",@"",@"DT341",@"Marketing",@"Marketing",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"380",@"375",@"370",@"",@"",@"",@"",@"",@"",@"DT343",@"Retail and Services Management",@"Retail and Servic…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"330",@"330",@"325",@"",@"",@"",@"",@"",@"",@"DT354",@"Business Computing",@"Business Computin…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"365",@"340",@"350",@"",@"",@"",@"",@"",@"",@"DT358",@"Logistics and Supply Chain Management",@"Logistics and Sup…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"300",@"290",@"285",@"",@"",@"",@"",@"",@"",@"DT365",@"Business and Management",@"Business and Mana…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"415",@"400",@"400",@"",@"",@"",@"",@"",@"",@"DT366",@"Accounting and Finance",@"Accounting and Fi…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"400",@"380",@"385",@"",@"",@"",@"",@"",@"",@"DT398",@"Human Resource Management",@"Human Resource Ma…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"345",@"340",@"335",@"",@"",@"",@"",@"",@"",@"DT399",@"Economics and Finance",@"Economics and Fin…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"385",@"385",@"385",@"",@"",@"",@"",@"",@"",@"DT401",@"International Hospitality Management",@"International Hos…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"300",@"295",@"280",@"",@"",@"",@"",@"",@"",@"DT407",@"Culinary Arts",@"Culinary Arts",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"370",@"370",@"385",@"",@"",@"",@"",@"",@"",@"DT412",@"Tourism Marketing",@"Tourism Marketing",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"290",@"250",@"250",@"",@"",@"",@"",@"",@"",@"DT413",@"Event Management",@"Event Management",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"365",@"380",@"380",@"",@"",@"",@"",@"",@"", @"DT416",@"Culinary Entrepreneurship",@"Culinary Entrepre…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"350",@"335",@"315",@"",@"",@"",@"",@"",@"",@"DT417",@"Bar Studies (Management and Entrepreneurship)",@"Bar Studies (Mana…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"300",@"285",@"290",@"",@"",@"",@"",@"",@"",@"DT420",@"Nutraceuticals in Health and Nutrition",@"Nutraceuticals in…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"405",@"400",@"355",@"",@"",@"",@"",@"",@"",@"DT421",@"Food Innovation",@"Food Innovation",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"330",@"280",@"270",@"",@"",@"",@"",@"",@"",@"DT422",@"Pharmaceutical Healthcare",@"Pharmaceutical He…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"365",@"345",@"315",@"",@"",@"",@"",@"",@"",@"DT491",@"Environmental Health",@"Environmental Hea…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"325",@"325",@"330",@"",@"",@"",@"",@"",@"",@"DT501",@"Music",@"Music",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"341",@"317",@"343",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DT504",@"Film and Broadcasting",@"Film and Broadcas…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"460",@"460",@"420",@"",@"",@"",@"",@"",@"",@"DT505",@"Film and Broadcasting with a Language",@"Film and Broadcas…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"450",@"415",@"380",@"",@"",@"",@"",@"",@"",@"DT506",@"Commercial Modern Music",@"Commercial Modern…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"900",@"435",@"305",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DT517",@"English Studies & Languages",@"English Studies &…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"310",@"",@"",@"",@"",@"",@"",@"",@"",@"DT518",@"Languages and International Tourism (French)",@"Languages and Int…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"310",@"310",@"",@"",@"",@"",@"",@"",@"",@"DT519",@"Languages and International Tourism (German)",@"Languages and Int…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"300",@"320",@"",@"",@"",@"",@"",@"",@"",@"DT520",@"Languages and International Tourism (Spanish)",@"Languages and Int…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"310",@"305",@"",@"",@"",@"",@"",@"",@"",@"DT529",@"Drama (Performance)",@"Drama (Performanc…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"370",@"360",@"405",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DT532",@"Law (LL.B)",@"Law (LL.B)",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"385",@"350",@"",@"",@"",@"",@"",@"",@"",@"DT533",@"Visual and Critical Studies",@"Visual and Critic…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"300",@"300",@"310",@"",@"",@"",@"",@"",@"",@"DT544",@"Design - Interior and Furniture",@"Design - Interior…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"580",@"465",@"505",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DT545",@"Design - Visual Communication",@"Design - Visual C…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"720",@"655",@"735",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DT546",@"Fine Art",@"Fine Art",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"715",@"715",@"840",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DT553",@"Journalism with a Language",@"Journalism with a…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"340",@"330",@"360",@"",@"",@"",@"",@"",@"",@"DT555",@"International Business and Languages - (French)",@"International Bus…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"380",@"380",@"395",@"",@"",@"",@"",@"",@"",@"DT556",@"International Business and Languages - (German)",@"International Bus…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"370",@"340",@"325",@"",@"",@"",@"",@"",@"",@"DT557",@"International Business and Languages - (Spanish)",@"International Bus…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"375",@"365",@"370",@"",@"",@"",@"",@"",@"",@"DT558",@"International Business and Languages (English - non-native speakers)",@"International Bus…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"425",@"310",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DT559",@"Photography",@"Photography",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"555",@"560",@"635",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DT564",@"International Business and Languages - (Italian)",@"International Bus…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"310",@"310",@"330",@"",@"",@"",@"",@"",@"",@"DT565",@"Chinese and International Business",@"Chinese and Inter…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"350",@"345",@"345",@"",@"",@"",@"",@"",@"",@"DT571",@"Social Care",@"Social Care",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"395",@"410",@"400",@"",@"",@"",@"",@"",@"",@"DT572",@"Early Childhood Education",@"Early Childhood E…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"420",@"435",@"410",@"",@"",@"",@"",@"",@"",@"DT582",@"Journalism",@"Journalism",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"405",@"400",@"415",@"",@"",@"",@"",@"",@"",@"DT596",@"Print and Digital Media Technology Management",@"Print and Digital…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"235",@"185",@"",@"",@"",@"",@"",@"",@"",@"DT597",@"Creative and Cultural Industries",@"Creative and Cult…",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"365",@"365",@"",@"",@"",@"",@"",@"",@"",@"DL041",@"Animation",@"Animation",@"DUN LAOGHAIRE IADT",@"755",@"835",@"850",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DL042",@"Photography",@"Photography",@"DUN LAOGHAIRE IADT",@"665",@"715",@"725",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DL043",@"Visual Communications",@"Visual Communicat…",@"DUN LAOGHAIRE IADT",@"660",@"669",@"695",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DL044",@"Visual Arts Practice (Fine Art)",@"Visual Arts Pract…",@"DUN LAOGHAIRE IADT",@"525",@"550",@"565",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DL045",@"Film and Television Production",@"Film and Televisi…",@"DUN LAOGHAIRE IADT",@"815",@"860",@"900",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DL046",@"Modelmaking, Design and Digital Effects",@"Modelmaking, Desi…",@"DUN LAOGHAIRE IADT",@"555",@"665",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DL047",@"Design for Stage and Screen (Production Design)",@"Design for Stage…",@"DUN LAOGHAIRE IADT",@"745",@"660",@"630",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DL048",@"Design for Stage and Screen (Costume Design)",@"Design for Stage…",@"DUN LAOGHAIRE IADT",@"685",@"875",@"860",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DL049",@"Design for Stage and Screen (Makeup Design)",@"Design for Stage…",@"DUN LAOGHAIRE IADT",@"785",@"950",@"860",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DL141",@"Applied Psychology",@"Applied Psycholog…",@"DUN LAOGHAIRE IADT",@"380",@"385",@"380",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"DL143",@"Multimedia Systems/Web Engineering",@"Multimedia System…",@"DUN LAOGHAIRE IADT",@"290",@"310",@"290",@"",@"",@"",@"",@"",@"",@"DL241",@"English, Media and Cultural Studies",@"English, Media an…",@"DUN LAOGHAIRE IADT",@"300",@"305",@"",@"",@"",@"",@"",@"",@"",@"DL242",@"Business Studies and Arts Management",@"Business Studies…",@"DUN LAOGHAIRE IADT",@"205",@"290",@"325",@"",@"",@"",@"",@"",@"",@"DL245",@"Business Studies - Entrepreneurship and Management",@"Business Studies…",@"DUN LAOGHAIRE IADT",@"265",@"210",@"",@"",@"",@"",@"",@"",@"",@"IC001",@"Journalism",@"Journalism",@"INDEPENDENT COLLEGES DUBLIN ",@"215",@"240",@"260",@"",@"",@"",@"",@"",@"",@"IC004",@"Business Studies",@"Business Studies",@"INDEPENDENT COLLEGES DUBLIN ",@"265",@"250",@"328",@"",@"",@"",@"",@"",@"",@"IC005",@"Accounting and Finance",@"Accounting and Fi…",@"INDEPENDENT COLLEGES DUBLIN ",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"IC007",@"Marketing",@"Marketing",@"INDEPENDENT COLLEGES DUBLIN ",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"ID001",@"Accounting and Finance",@"Accounting and Fi…",@"ICD BUSINESS SCHOOL",@"280",@"16",@"",@"",@"",@"",@"",@"",@"",@"ID002",@"Business Studies",@"Business Studies",@"ICD BUSINESS SCHOOL",@"",@"18",@"",@"",@"",@"",@"",@"",@"",@"ID003",@"Business Studies with Chinese",@"Business Studies…",@"ICD BUSINESS SCHOOL",@"",@"12",@"",@"",@"",@"",@"",@"",@"",@"NC003",@"Computing",@"Computing",@"NATIONAL COLLEGE OF IRELAND",@"270",@"320",@"270",@"",@"",@"",@"",@"",@"",@"NC004",@"Business Information Systems",@"Business Informat…",@"NATIONAL COLLEGE OF IRELAND",@"265",@"325",@"275",@"",@"",@"",@"",@"",@"",@"NC005",@"Human Resource Management",@"Human Resource Ma…",@"NATIONAL COLLEGE OF IRELAND",@"275",@"290",@"290",@"",@"",@"",@"",@"",@"",@"NC006",@"Accounting",@"Accounting",@"NATIONAL COLLEGE OF IRELAND",@"325",@"340",@"340",@"",@"",@"",@"",@"",@"",@"NC009",@"Business",@"Business",@"NATIONAL COLLEGE OF IRELAND",@"270",@"280",@"290",@"",@"",@"",@"",@"",@"",@"NC010",@"Psychology",@"Psychology",@"NATIONAL COLLEGE OF IRELAND",@"210",@"AQA",@"",@"",@"",@"",@"",@"",@"",@"NC020",@"Marketing Practice",@"Marketing Practic…",@"NATIONAL COLLEGE OF IRELAND",@"245",@"",@"",@"",@"",@"",@"",@"",@"",@"LC413",@"Business (Thurles)",@"Business (Thurles…",@"LIMERICK IT",@"350",@"265",@"",@"",@"",@"",@"",@"",@"",@"LC415",@"Computing - Software Development (Thurles)",@"Computing - Softw…",@"LIMERICK IT",@"200",@"250",@"",@"",@"",@"",@"",@"",@"",@"LC418",@"Computing - Games Design and Development (Thurles)",@"Computing - Games…",@"LIMERICK IT",@"260",@"245",@"",@"",@"",@"",@"",@"",@"",@"LC420",@"Computing - Smart Energy Systems (Thurles)",@"Computing - Smart…",@"LIMERICK IT",@"",@"260",@"",@"",@"",@"",@"",@"",@"",@"LC422",@"Sports Strength and Conditioning (Thurles)",@"Sports Strength a…",@"LIMERICK IT",@"300",@"310",@"",@"",@"",@"",@"",@"",@"",@"LC513",@"Business (Clonmel)",@"Business (Clonmel…",@"LIMERICK IT",@"275",@"315",@"",@"",@"",@"",@"",@"",@"",@"LC517",@"Creative Multimedia (Clonmel)",@"Creative Multimed…",@"LIMERICK IT",@"225",@"305",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"LC518",@"Digital Animation Production (Clonmel)",@"Digital Animation…",@"LIMERICK IT",@"550",@"527",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"LY108",@"Business - Accounting",@"Business - Accoun…",@"LETTERKENNY IT",@"280",@"275",@"270",@"",@"",@"",@"",@"",@"",@"LY118",@"Business",@"Business",@"LETTERKENNY IT",@"285",@"265",@"",@"",@"",@"",@"",@"",@"",@"LY208",@"Law",@"Law",@"LETTERKENNY IT",@"230",@"",@"",@"",@"",@"",@"",@"",@"",@"LY218",@"Business - with Irish/French/Spanish/German",@"Business - with I…",@"LETTERKENNY IT",@"220",@"250",@"",@"",@"",@"",@"",@"",@"",@"LY228",@"Sports Coaching and Performance",@"Sports Coaching a…",@"LETTERKENNY IT",@"240",@"265",@"",@"",@"",@"",@"",@"",@"",@"LY308",@"Destination Tourism with Marketing at Killybegs",@"Destination Touri…",@"LETTERKENNY IT",@"295",@"",@"",@"",@"",@"",@"",@"",@"",@"LY408",@"Design - Visual Communication",@"Design - Visual C…",@"LETTERKENNY IT",@"240",@"225",@"",@"",@"",@"",@"",@"",@"",@"LY508",@"Fire Safety Engineering",@"Fire Safety Engin…",@"LETTERKENNY IT",@"230",@"270",@"",@"",@"",@"",@"",@"",@"",@"LY708",@"Applied Computing",@"Applied Computing",@"LETTERKENNY IT",@"245",@"250",@"250",@"",@"",@"",@"",@"",@"",@"LY718",@"Computing with Cloud and Green Information Technology",@"Computing with Cl…",@"LETTERKENNY IT",@"245",@"290",@"",@"",@"",@"",@"",@"",@"",@"LY908",@"General Nursing",@"General Nursing",@"LETTERKENNY IT",@"400",@"400",@"385",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"LY918",@"Psychiatric Nursing",@"Psychiatric Nursi…",@"LETTERKENNY IT",@"365",@"375",@"350",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"LY928",@"Intellectual Disability Nursing",@"Intellectual Disa…",@"LETTERKENNY IT",@"365",@"365",@"345",@"",@"",@"",@"",@"",@"",@"LY938",@"Mature Applicants General Nursing",@"Mature Applicants…",@"LETTERKENNY IT",@"559",@"228",@"221",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"LY948",@"Mature Applicants Psychiatric Nursing",@"Mature Applicants…",@"LETTERKENNY IT",@"555",@"216",@"219",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"LY958",@"Mature Applicants Intellectual Disability Nursing",@"Mature Applicants…",@"LETTERKENNY IT",@"525",@"202",@"219",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"LY968",@"Early Childhood Care, Health and Education",@"Early Childhood C…",@"LETTERKENNY IT",@"270",@"315",@"",@"",@"",@"",@"",@"",@"",@"MI004",@"Liberal Arts",@"Liberal Arts",@"MARY IMMACULATE LIMERICK",@"345",@"370",@"390",@"",@"",@"",@"",@"",@"",@"MI005",@"Education - Primary Teaching",@"Education - Prima…",@"MARY IMMACULATE LIMERICK",@"465",@"465",@"470",@"",@"",@"",@"",@"",@"",@"MI006",@"Education - Primary Teaching - Gaeltacht Applicants",@"Education - Prima…",@"MARY IMMACULATE LIMERICK",@"425",@"430",@"430",@"",@"",@"",@"",@"",@"",@"MI007",@"Early Childhood Care and Education",@"Early Childhood C…",@"MARY IMMACULATE LIMERICK",@"365",@"370",@"365",@"",@"",@"",@"",@"",@"",@"MI008",@"Education and Psychology - Primary Teaching",@"Education and Psy…",@"MARY IMMACULATE LIMERICK",@"560",@"555",@"545",@"",@"",@"",@"",@"",@"",@"CI101",@"Counselling and Psychotherapy",@"Counselling and P…",@"NATIONAL COUNSELLING AND PSYCHOTHERAPY INSTITUTE",@"265",@"260",@"245",@"",@"",@"",@"",@"",@"",@"MU001",@"Theology and Arts",@"Theology and Arts",@"ST PATRICK'S (PONTIFICAL)-MAYNOOTH",@"310",@"315",@"325",@"",@"",@"",@"",@"",@"",@"MU002",@"Theology",@"Theology",@"ST PATRICK'S (PONTIFICAL)-MAYNOOTH",@"325",@"315",@"320",@"",@"",@"",@"",@"",@"",@"MH001",@"Education - Primary Teaching",@"Education - Prima…",@"NUI - MAYNOOTH",@"495",@"465",@"",@"",@"",@"",@"",@"",@"",@"MH002",@"Education - Primary Teaching - Gaeltacht Applicants",@"Education - Prima…",@"NUI - MAYNOOTH",@"",@"425",@"",@"",@"",@"",@"",@"",@"",@"MH003",@"Early Childhood - Teaching and Learning (part-time)",@"Early Childhood -…",@"NUI - MAYNOOTH",@"365",@"350",@"",@"",@"",@"",@"",@"",@"",@"MH101",@"Arts",@"Arts",@"NUI - MAYNOOTH",@"355",@"365",@"375",@"",@"",@"",@"",@"",@"",@"MH102",@"Music Technology",@"Music Technology",@"NUI - MAYNOOTH",@"385",@"405",@"400",@"",@"",@"",@"",@"",@"",@"MH103",@"Music",@"Music",@"NUI - MAYNOOTH",@"",@"",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"MH104",@"Mathematics",@"Mathematics",@"NUI - MAYNOOTH",@"485",@"535",@"510",@"",@"",@"",@"",@"",@"",@"MH106",@"Psychology",@"Psychology",@"NUI - MAYNOOTH",@"505",@"515",@"505",@"",@"",@"",@"",@"",@"",@"MH107",@"Social Science",@"Social Science",@"NUI - MAYNOOTH",@"400",@"410",@"390",@"",@"",@"",@"",@"",@"",@"MH108",@"European Studies",@"European Studies",@"NUI - MAYNOOTH",@"395",@"395",@"385",@"",@"",@"",@"",@"",@"",@"MH109",@"Media Studies",@"Media Studies",@"NUI - MAYNOOTH",@"450",@"450",@"445",@"",@"",@"",@"",@"",@"",@"MH110",@"Digital Media",@"Digital Media",@"NUI - MAYNOOTH",@"350",@"350",@"365",@"",@"",@"",@"",@"",@"",@"MH111",@"Anthropology",@"Anthropology",@"NUI - MAYNOOTH",@"375",@"375",@"370",@"",@"",@"",@"",@"",@"",@"MH112",@"Politics",@"Politics",@"NUI - MAYNOOTH",@"350",@"350",@"350",@"",@"",@"",@"",@"",@"",@"MH113",@"History",@"History",@"NUI - MAYNOOTH",@"400",@"400",@"400",@"",@"",@"",@"",@"",@"",@"MH114",@"English",@"English",@"NUI - MAYNOOTH",@"430",@"450",@"440",@"",@"",@"",@"",@"",@"",@"MH115",@"Law (BCL) and Arts",@"Law (BCL) and Art…",@"NUI - MAYNOOTH",@"450",@"460",@"450",@"",@"",@"",@"",@"",@"",@"MH116",@"Community and Youth Work - Full Time",@"Community and You…",@"NUI - MAYNOOTH",@"",@"",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"MH117",@"Community and Youth Work - Part-Time In-service",@"Community and You…",@"NUI - MAYNOOTH",@"",@"",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"MH119",@"Law (LLB)",@"Law (LLB)",@"NUI - MAYNOOTH",@"460",@"475",@"460",@"",@"",@"",@"",@"",@"",@"MH120",@"Philosophy, Politics and Economics (PPE)",@"Philosophy, Polit…",@"NUI - MAYNOOTH",@"400",@"410",@"",@"",@"",@"",@"",@"",@"",@"MH121",@"International Development",@"International Dev…",@"NUI - MAYNOOTH",@"360",@"",@"",@"",@"",@"",@"",@"",@"",@"MH140",@"Computer Science and Software Engineering (Arts)",@"Computer Science…",@"NUI - MAYNOOTH",@"385",@"380",@"",@"",@"",@"",@"",@"",@"",@"MH201",@"Science",@"Science",@"NUI - MAYNOOTH",@"410",@"415",@"375",@"",@"",@"",@"",@"",@"",@"MH202",@"Biotechnology",@"Biotechnology",@"NUI - MAYNOOTH",@"425",@"415",@"380",@"",@"",@"",@"",@"",@"",@"MH203",@"Computer Science and Software Engineering (Science Entry)",@"Computer Science…",@"NUI - MAYNOOTH",@"405",@"400",@"355",@"",@"",@"",@"",@"",@"",@"MH204",@"Physics with Astrophysics",@"Physics with Astr…",@"NUI - MAYNOOTH",@"445",@"440",@"410",@"",@"",@"",@"",@"",@"",@"MH206",@"Theoretical Physics and Mathematics",@"Theoretical Physi…",@"NUI - MAYNOOTH",@"570",@"505",@"520",@"",@"",@"",@"",@"",@"",@"MH208",@"Biological and Biomedical Sciences",@"Biological and Bi…",@"NUI - MAYNOOTH",@"460",@"455",@"435",@"",@"",@"",@"",@"",@"",@"MH209",@"Psychology (through Science)",@"Psychology (throu…",@"NUI - MAYNOOTH",@"470",@"455",@"465",@"",@"",@"",@"",@"",@"",@"MH210",@"Pharmaceutical and Biomedical Chemistry",@"Pharmaceutical an…",@"NUI - MAYNOOTH",@"435",@"445",@"400",@"",@"",@"",@"",@"",@"",@"MH211",@"Multimedia, Mobile and Web development",@"Multimedia, Mobil…",@"NUI - MAYNOOTH",@"360",@"360",@"355",@"",@"",@"",@"",@"",@"",@"MH212",@"Science Education",@"Science Education",@"NUI - MAYNOOTH",@"465",@"500",@"470",@"",@"",@"",@"",@"",@"",@"MH213",@"Mathematics Education",@"Mathematics Educa…",@"NUI - MAYNOOTH",@"445",@"495",@"",@"",@"",@"",@"",@"",@"",@"MH214",@"Computational Thinking (Comp Science, Mathematics and Philosophy)",@"Computational Thi…",@"NUI - MAYNOOTH",@"520",@"500",@"",@"",@"",@"",@"",@"",@"",@"MH301",@"Electronic Engineering with Computers",@"Electronic Engine…",@"NUI - MAYNOOTH",@"390",@"395",@"350",@"",@"",@"",@"",@"",@"",@"MH302",@"Electronic Engineering",@"Electronic Engine…",@"NUI - MAYNOOTH",@"360",@"320",@"335",@"",@"",@"",@"",@"",@"",@"MH303",@"Electronic Engineering with Communications",@"Electronic Engine…",@"NUI - MAYNOOTH",@"355",@"335",@"350",@"",@"",@"",@"",@"",@"",@"MH304",@"Common entry to Computer, Electronic and Communications Engineering",@"Common entry to C…",@"NUI - MAYNOOTH",@"380",@"390",@"",@"",@"",@"",@"",@"",@"",@"MH305",@"Product Design",@"Product Design",@"NUI - MAYNOOTH",@"330",@"350",@"",@"",@"",@"",@"",@"",@"",@"MH401",@"Finance",@"Finance",@"NUI - MAYNOOTH",@"360",@"360",@"350",@"",@"",@"",@"",@"",@"",@"MH403",@"Accounting and Finance",@"Accounting and Fi…",@"NUI - MAYNOOTH",@"400",@"395",@"",@"",@"",@"",@"",@"",@"",@"MH404",@"Business and Management",@"Business and Mana…",@"NUI - MAYNOOTH",@"430",@"425",@"420",@"",@"",@"",@"",@"",@"",@"MH405",@"Equine Business",@"Equine Business",@"NUI - MAYNOOTH",@"355",@"380",@"360",@"",@"",@"",@"",@"",@"",@"MH406",@"Law and Business",@"Law and Business",@"NUI - MAYNOOTH",@"450",@"460",@"450",@"",@"",@"",@"",@"",@"",@"MH407",@"Business and Accounting",@"Business and Acco…",@"NUI - MAYNOOTH",@"400",@"395",@"380",@"",@"",@"",@"",@"",@"",@"MH408",@"International Finance and Economics",@"International Fin…",@"NUI - MAYNOOTH",@"420",@"420",@"410",@"",@"",@"",@"",@"",@"",@"MH410",@"Marketing",@"Marketing",@"NUI - MAYNOOTH",@"400",@"400",@"",@"",@"",@"",@"",@"",@"",@"MH411",@"Entrepreneurship",@"Entrepreneurship",@"NUI - MAYNOOTH",@"355",@"355",@"",@"",@"",@"",@"",@"",@"",@"MH901",@"Arts (Kilkenny Campus - first year only)",@"Arts (Kilkenny Ca…",@"NUI - MAYNOOTH",@"305",@"",@"",@"",@"",@"",@"",@"",@"",@"SN001",@"Business Studies in International Hotel Management",@"Business Studies…",@"SHANNON COLLEGE OF HOTEL MGT",@"471",@"471",@"476",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"SN002",@"Commerce (Year 4 in NUI",@"Commerce (Year 4…",@"SHANNON COLLEGE OF HOTEL MGT",@"621",@"625",@"621",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"TA021",@"European Studies",@"European Studies",@"IT TALLAGHT ",@"210",@"215",@"180",@"",@"",@"",@"",@"",@"",@"TA022",@"Creative Digital Media",@"Creative Digital…",@"IT TALLAGHT ",@"325",@"350",@"350",@"",@"",@"",@"",@"",@"",@"TA023",@"Advertising and Marketing Communications",@"Advertising and M…",@"IT TALLAGHT ",@"205",@"230",@"235",@"(v) New competition for Available/Vacant Places",@"",@"",@"",@"",@"",@"TA025",@"Social Care Practice",@"Social Care Pract…",@"IT TALLAGHT ",@"325",@"350",@"335",@"",@"",@"",@"",@"",@"", @"TA026",@"International Hospitality and Tourism Management",@"International Hos…",@"IT TALLAGHT ",@"235",@"245",@"255",@"",@"",@"",@"",@"",@"",@"TA121",@"Accounting and Finance",@"Accounting and Fi…",@"IT TALLAGHT ",@"230",@"230",@"265",@"",@"",@"",@"",@"",@"",@"TA122",@"Management",@"Management",@"IT TALLAGHT ",@"205",@"245",@"230",@"",@"",@"",@"",@"",@"",@"TA123",@"Marketing Management",@"Marketing Managem…",@"IT TALLAGHT ",@"220",@"200",@"225",@"",@"",@"",@"",@"",@"",@"TA221",@"Electronic Engineering",@"Electronic Engine…",@"IT TALLAGHT ",@"230",@"255",@"230",@"",@"",@"",@"",@"",@"",@"TA222",@"Mechanical Engineering",@"Mechanical Engine…",@"IT TALLAGHT ",@"255",@"245",@"255",@"",@"",@"",@"",@"",@"",@"TA223",@"Energy Systems Engineering",@"Energy Systems En…",@"IT TALLAGHT ",@"260",@"245",@"305",@"",@"",@"",@"",@"",@"",@"TA321",@"Pharmaceutical Science",@"Pharmaceutical Sc…",@"IT TALLAGHT ",@"360",@"345",@"325",@"",@"",@"",@"",@"",@"",@"TA322",@"Computing",@"Computing",@"IT TALLAGHT ",@"300",@"320",@"290",@"",@"",@"",@"",@"",@"",@"TA323",@"Information Technology Management",@"Information Techn…",@"IT TALLAGHT ",@"245",@"270",@"225",@"",@"",@"",@"",@"",@"",@"TA326",@"DNA and Forensic Science",@"DNA and Forensic…",@"IT TALLAGHT ",@"370",@"370",@"360",@"",@"",@"",@"",@"",@"",@"TA327",@"Sports Science and Health",@"Sports Science an…",@"IT TALLAGHT ",@"400",@"390",@"375",@"",@"",@"",@"",@"",@"",@"PD101",@"Education - Primary Teaching",@"Education - Prima…",@"ST PATRICK'S DRUMCONDRA",@"460",@"470",@"475",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"PD102",@"Education - Primary Teaching - Gaeltacht Applicants",@"Education - Prima…",@"ST PATRICK'S DRUMCONDRA",@"425",@"430",@"440",@"",@"",@"",@"",@"",@"",@"PD103",@"Arts/Humanities",@"Arts/Humanities",@"ST PATRICK'S DRUMCONDRA",@"385",@"390",@"420",@"",@"",@"",@"",@"",@"",@"TR002",@"Music",@"Music",@"TRINITY COLLEGE DUBLIN",@"405",@"420",@"420",@"(**) ““d candidates are considered but admission is on the basis of performance in the music test and interview.",@"",@"",@"",@"",@"",@"TR003",@"History",@"History",@"TRINITY COLLEGE DUBLIN",@"465",@"485",@"445",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR004",@"Law",@"Law",@"TRINITY COLLEGE DUBLIN",@"530",@"525",@"505",@"",@"",@"",@"",@"",@"",@"TR005",@"Philosophy",@"Philosophy",@"TRINITY COLLEGE DUBLIN",@"435",@"455",@"430",@"",@"",@"",@"",@"",@"",@"TR006",@"Psychology",@"Psychology",@"TRINITY COLLEGE DUBLIN",@"560",@"565",@"545",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR007",@"Clinical Speech and Language Studies",@"Clinical Speech a…",@"TRINITY COLLEGE DUBLIN",@"525",@"535",@"520",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR008",@"World Religions and Theology",@"World Religions a…",@"TRINITY COLLEGE DUBLIN",@"380",@"365",@"345",@"",@"",@"",@"",@"",@"",@"TR009",@"Music Education",@"Music Education",@"TRINITY COLLEGE DUBLIN",@"405",@"525",@"450",@"(**) ““d candidates are considered but admission is on the basis of performance in the music test and interview.",@"",@"",@"",@"",@"",@"TR012",@"History and Political Science",@"History and Polit…",@"TRINITY COLLEGE DUBLIN",@"510",@"515",@"505",@"",@"",@"",@"",@"",@"",@"TR015",@"Philosophy, Political Science, Economics and Sociology",@"Philosophy, Polit…",@"TRINITY COLLEGE DUBLIN",@"530",@"535",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR016",@"Deaf Studies",@"Deaf Studies",@"TRINITY COLLEGE DUBLIN",@"390",@"395",@"385",@"",@"",@"",@"",@"",@"",@"TR017",@"Law and Business",@"Law and Business",@"TRINITY COLLEGE DUBLIN",@"570",@"565",@"555",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR018",@"Law and French",@"Law and French",@"TRINITY COLLEGE DUBLIN",@"560",@"565",@"550",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR019",@"Law and German",@"Law and German",@"TRINITY COLLEGE DUBLIN",@"515",@"525",@"495",@"",@"",@"",@"",@"",@"",@"TR020",@"Law and Political Science",@"Law and Political…",@"TRINITY COLLEGE DUBLIN",@"570",@"575",@"560",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR021",@"Classics",@"Classics",@"TRINITY COLLEGE DUBLIN",@"465",@"390",@"405",@"",@"",@"",@"",@"",@"",@"TR022",@"Early and Modern Irish",@"Early and Modern…",@"TRINITY COLLEGE DUBLIN",@"365",@"375",@"350",@"",@"",@"",@"",@"",@"",@"TR023",@"English Studies",@"English Studies",@"TRINITY COLLEGE DUBLIN",@"515",@"510",@"495",@"",@"",@"",@"",@"",@"",@"TR024",@"European Studies",@"European Studies",@"TRINITY COLLEGE DUBLIN",@"535",@"545",@"530",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR025",@"Drama and Theatre Studies",@"Drama and Theatre…",@"TRINITY COLLEGE DUBLIN",@"450",@"510",@"455",@"(***) Applicants are ranked as for other courses but the final decision depends on performance in interview.",@"",@"",@"",@"",@"",@"TR027",@"Irish Studies",@"Irish Studies",@"TRINITY COLLEGE DUBLIN",@"420",@"400",@"375",@"",@"",@"",@"",@"",@"",@"TR028",@"Ancient and Medieval History and Culture",@"Ancient and Medie…",@"TRINITY COLLEGE DUBLIN",@"425",@"405",@"415",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR029",@"Political Science and Geography",@"Political Science…",@"TRINITY COLLEGE DUBLIN",@"445",@"435",@"475",@"",@"",@"",@"",@"",@"",@"TR030",@"Catholic Theological Studies",@"Catholic Theologi…",@"TRINITY COLLEGE DUBLIN",@"290",@"",@"",@"",@"",@"",@"",@"",@"",@"TR031",@"Mathematics",@"Mathematics",@"TRINITY COLLEGE DUBLIN",@"520",@"535",@"485",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR032",@"Integrated Engineering",@"Integrated Engine…",@"TRINITY COLLEGE DUBLIN",@"455",@"465",@"400",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR033",@"Computer Science",@"Computer Science",@"TRINITY COLLEGE DUBLIN",@"460",@"450",@"385",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR034",@"Management Science and Information Systems Studies",@"Management Scienc…",@"TRINITY COLLEGE DUBLIN",@"480",@"455",@"385",@"",@"",@"",@"",@"",@"",@"TR035",@"Theoretical Physics",@"Theoretical Physi…",@"TRINITY COLLEGE DUBLIN",@"490",@"540",@"490",@"",@"",@"",@"",@"",@"",@"TR038",@"Integrated Engineering with Management",@"Integrated Engine…",@"TRINITY COLLEGE DUBLIN",@"450",@"435",@"380",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR039",@"Computer Science and Language",@"Computer Science…",@"TRINITY COLLEGE DUBLIN",@"525",@"490",@"",@"",@"",@"",@"",@"",@"",@"TR051",@"Medicine",@"Medicine",@"TRINITY COLLEGE DUBLIN",@"748",@"746",@"739",@"(*) Not all on this points score were offered places; (#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"TR052",@"Dental Science",@"Dental Science",@"TRINITY COLLEGE DUBLIN",@"575",@"590",@"570",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR053",@"Physiotherapy",@"Physiotherapy",@"TRINITY COLLEGE DUBLIN",@"535",@"550",@"535",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR054",@"Occupational Therapy",@"Occupational Ther…",@"TRINITY COLLEGE DUBLIN",@"505",@"510",@"500",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR055",@"Radiation Therapy",@"Radiation Therapy",@"TRINITY COLLEGE DUBLIN",@"530",@"535",@"515",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR056",@"Human Health and Disease",@"Human Health and…",@"TRINITY COLLEGE DUBLIN",@"530",@"540",@"520",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR071",@"Science",@"Science",@"TRINITY COLLEGE DUBLIN",@"505",@"500",@"470",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR072",@"Pharmacy",@"Pharmacy",@"TRINITY COLLEGE DUBLIN",@"565",@"565",@"545",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR073",@"Human Genetics",@"Human Genetics",@"TRINITY COLLEGE DUBLIN",@"560",@"560",@"535",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR074",@"Chemistry with Molecular Modelling",@"Chemistry with Mo…",@"TRINITY COLLEGE DUBLIN",@"470",@"490",@"430",@"",@"",@"",@"",@"",@"",@"TR075",@"Medicinal Chemistry",@"Medicinal Chemist…",@"TRINITY COLLEGE DUBLIN",@"535",@"535",@"500",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR076",@"Nanoscience, Physics and Chemistry of Advanced Materials",@"Nanoscience, Phys…",@"TRINITY COLLEGE DUBLIN",@"570",@"515",@"475",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR077",@"Earth Sciences",@"Earth Sciences",@"TRINITY COLLEGE DUBLIN",@"490",@"480",@"460",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR081",@"Business, Economic and Social Studies (BESS)",@"Business, Economi…",@"TRINITY COLLEGE DUBLIN",@"495",@"490",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR082",@"Computer Science and Business",@"Computer Science…",@"TRINITY COLLEGE DUBLIN",@"465",@"465",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR083",@"Sociology and Social Policy",@"Sociology and Soc…",@"TRINITY COLLEGE DUBLIN",@"455",@"415",@"435",@"",@"",@"",@"",@"",@"",@"TR084",@"Social Studies (Social Work)",@"Social Studies (S…",@"TRINITY COLLEGE DUBLIN",@"460",@"465",@"465",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR085",@"Business Studies and French",@"Business Studies…",@"TRINITY COLLEGE DUBLIN",@"550",@"515",@"510",@"",@"",@"",@"",@"",@"",@"TR086",@"Business Studies and German",@"Business Studies…",@"TRINITY COLLEGE DUBLIN",@"485",@"480",@"450",@"",@"",@"",@"",@"",@"",@"TR087",@"Business Studies and Russian",@"Business Studies…",@"TRINITY COLLEGE DUBLIN",@"470",@"475",@"410",@"",@"",@"",@"",@"",@"",@"TR089",@"Business Studies and Polish",@"Business Studies…",@"TRINITY COLLEGE DUBLIN",@"470",@"415",@"390",@"",@"",@"",@"",@"",@"",@"TR090",@"Business Studies and Spanish",@"Business Studies…",@"TRINITY COLLEGE DUBLIN",@"510",@"505",@"475",@"",@"",@"",@"",@"",@"",@"TR091",@"General Nursing (Meath and St James`s)",@"General Nursing (…",@"TRINITY COLLEGE DUBLIN",@"420",@"420",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR092",@"Mature Applicants General Nursing (Meath and St James`s)",@"Mature Applicants…",@"TRINITY COLLEGE DUBLIN",@"560",@"227",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"TR093",@"General Nursing (Adelaide School of Nursing)",@"General Nursing (…",@"TRINITY COLLEGE DUBLIN",@"420",@"400",@"395",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"TR094",@"Mature Applicants General Nursing (Adelaide Sch. of Nursing)",@"Mature Applicants…",@"TRINITY COLLEGE DUBLIN",@"506",@"216",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"TR095",@"Psychiatric Nursing",@"Psychiatric Nursi…",@"TRINITY COLLEGE DUBLIN",@"400",@"395",@"370",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR096",@"Mature Applicants Psychiatric Nursing",@"Mature Applicants…",@"TRINITY COLLEGE DUBLIN",@"522",@"212",@"203",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"TR097",@"Intellectual Disability Nursing",@"Intellectual Disa…",@"TRINITY COLLEGE DUBLIN",@"390",@"395",@"375",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR098",@"Mature Applicants Intellectual Disability Nursing",@"Mature Applicants…",@"TRINITY COLLEGE DUBLIN",@"502",@"203",@"188",@"(*) Not all on this points score were offered places; (#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"TR911",@"Children`s and General Nursing (Integrated)",@"Children`s and Ge…",@"TRINITY COLLEGE DUBLIN",@"505",@"490",@"480",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR912",@"Mature Applicants Children`s and General Nursing (Integrated",@"Mature Applicants…",@"TRINITY COLLEGE DUBLIN",@"578",@"230",@"232",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"TR913",@"Midwifery",@"Midwifery",@"TRINITY COLLEGE DUBLIN",@"445",@"460",@"445",@"",@"",@"",@"",@"",@"",@"TR914",@"Mature Applicants Midwifery",@"Mature Applicants…",@"TRINITY COLLEGE DUBLIN",@"574",@"233",@"224",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"",@"TCD two-subject moderatorship (TSM) minimum entry levels",@"TCD two-subject m…",@"TRINITY COLLEGE DUBLIN",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"Ancient history and archaeology:",@"Ancient history a…",@"TRINITY COLLEGE DUBLIN",@"400 – 535",@"",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"",@"Classical civilisation:",@"Classical civilis…",@"TRINITY COLLEGE DUBLIN",@"400 – 535",@"",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"",@"Drama studies:",@"Drama studies:",@"TRINITY COLLEGE DUBLIN",@"435 – 535",@"",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"",@"Early Irish:",@"Early Irish:",@"TRINITY COLLEGE DUBLIN",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"Economics:",@"Economics:",@"TRINITY COLLEGE DUBLIN",@"495 - 580",@"",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"",@"English Literature:",@"English Literatur…",@"TRINITY COLLEGE DUBLIN",@"535 - 580",@"",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"",@"Film studies:",@"Film studies:",@"TRINITY COLLEGE DUBLIN",@"490 - 535",@"",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"",@"French:",@"French:",@"TRINITY COLLEGE DUBLIN",@"480 - 580",@"",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"",@"Geography:",@"Geography:",@"TRINITY COLLEGE DUBLIN",@"450 - 580",@"",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"",@"German:",@"German:",@"TRINITY COLLEGE DUBLIN",@"455 – 575",@"",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"",@"Greek:",@"Greek:",@"TRINITY COLLEGE DUBLIN",@"445 – 535",@"",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"",@"History:",@"History:",@"TRINITY COLLEGE DUBLIN",@"530 - 535",@"",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"",@"History of art and architecture:",@"History of art an…",@"TRINITY COLLEGE DUBLIN",@"445 - 535",@"",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"",@"Italian:",@"Italian:",@"TRINITY COLLEGE DUBLIN",@"425 – 580",@"",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"",@"Jewish and Islamic civilisations:",@"Jewish and Islami…",@"TRINITY COLLEGE DUBLIN",@"415 – 580",@"",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"",@"Latin:",@"Latin:",@"TRINITY COLLEGE DUBLIN",@"525 – 535",@"",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"",@"Mathematics:",@"Mathematics:",@"TRINITY COLLEGE DUBLIN",@"575 - 580",@"",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"",@"Modern Irish:",@"Modern Irish:",@"TRINITY COLLEGE DUBLIN",@"425 – 535",@"",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"",@"Music:",@"Music:",@"TRINITY COLLEGE DUBLIN",@"490 - 580",@"",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"",@"Philosophy:",@"Philosophy:",@"TRINITY COLLEGE DUBLIN",@"450 – 580",@"",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"",@"Psychology:",@"Psychology:",@"TRINITY COLLEGE DUBLIN",@"580",@"",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"",@"Russian:",@"Russian:",@"TRINITY COLLEGE DUBLIN",@"435 – 535",@"",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"",@"Sociology:",@"Sociology:",@"TRINITY COLLEGE DUBLIN",@"445 - 580",@"",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"",@"Spanish:",@"Spanish:",@"TRINITY COLLEGE DUBLIN",@"475 - 535",@"",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"",@"World religions and theology:",@"World religions a…",@"TRINITY COLLEGE DUBLIN",@"400 – 580",@"",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"AS001",@"Home Economics with Biology - second level teaching",@"Home Economics wi…",@"ST ANGELA'S - SLIGO",@"480",@"500",@"500",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"AS002",@"Home Economics with Religious Education - second level teach",@"Home Economics wi…",@"ST ANGELA'S - SLIGO",@"435",@"450",@"470",@"",@"",@"",@"",@"",@"",@"AS003",@"Home Economics with Irish - second level teaching",@"Home Economics wi…",@"ST ANGELA'S - SLIGO",@"455",@"480",@"455",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"AS004",@"Home Economics with Economics - second level teaching",@"Home Economics wi…",@"ST ANGELA'S - SLIGO",@"440",@"450",@"",@"",@"",@"",@"",@"",@"",@"AS051",@"Food and Business Management",@"Food and Business…",@"ST ANGELA'S - SLIGO",@"220",@"270",@"305",@"",@"",@"",@"",@"",@"",@"AS052",@"Health and Disability Studies",@"Health and Disabi…",@"ST ANGELA'S - SLIGO",@"235",@"210",@"250",@"",@"",@"",@"",@"",@"",@"AS053",@"Textiles, Fashion and Design with Business Management",@"Textiles, Fashion…",@"ST ANGELA'S - SLIGO",@"240",@"",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"AS110",@"General Nursing",@"General Nursing",@"ST ANGELA'S - SLIGO",@"405",@"410",@"400",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"AS111",@"Mature Applicants General Nursing",@"Mature Applicants…",@"ST ANGELA'S - SLIGO",@"578",@"230",@"234",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"AS130",@"Intellectual Disability Nursing",@"Intellectual Disa…",@"ST ANGELA'S - SLIGO",@"365",@"375",@"365",@"",@"",@"",@"",@"",@"",@"AS131",@"Mature Applicants Intellectual Disability Nursing",@"Mature Applicants…",@"ST ANGELA'S - SLIGO",@"504",@"212",@"214",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"SG141",@"Business",@"Business",@"IT SLIGO ",@"215",@"210",@"240",@"(v) New competition for Available/Vacant Places",@"",@"",@"",@"",@"",@"SG146",@"Accounting",@"Accounting",@"IT SLIGO ",@"270",@"220",@"200",@"",@"",@"",@"",@"",@"",@"SG241",@"Performing Arts",@"Performing Arts",@"IT SLIGO ",@"265",@"255",@"310",@"",@"",@"",@"",@"",@"",@"SG242",@"Early Childhood Education",@"Early Childhood E…",@"IT SLIGO ",@"285",@"320",@"325",@"",@"",@"",@"",@"",@"",@"SG243",@"Social Care Practice",@"Social Care Pract…",@"IT SLIGO ",@"300",@"345",@"",@"",@"",@"",@"",@"",@"",@"SG245",@"Creative Design",@"Creative Design",@"IT SLIGO ",@"210",@"220",@"",@"",@"",@"",@"",@"",@"",@"SG345",@"Interior Architecture",@"Interior Architec…",@"IT SLIGO ",@"225",@"235",@"220",@"",@"",@"",@"",@"",@"",@"SG441",@"Environmental Science",@"Environmental Sci…",@"IT SLIGO ",@"290",@"260",@"320",@"",@"",@"",@"",@"",@"",@"SG442",@"Occupational Safety and Health",@"Occupational Safe…",@"IT SLIGO ",@"340",@"280",@"310",@"",@"",@"",@"",@"",@"",@"SG445",@"Pharmaceutical Science with Drug Development",@"Pharmaceutical Sc…",@"IT SLIGO ",@"300",@"280",@"280",@"",@"",@"",@"",@"",@"",@"SG446",@"Applied Archaeology",@"Applied Archaeolo…",@"IT SLIGO ",@"255",@"295",@"310",@"(v) New competition for Available/Vacant Places",@"",@"",@"",@"",@"",@"SG448",@"Forensic Investigation and Analysis",@"Forensic Investig…",@"IT SLIGO ",@"270",@"295",@"335",@"",@"",@"",@"",@"",@"",@"SG449",@"Medical Biotechnology",@"Medical Biotechno…",@"IT SLIGO ",@"280",@"260",@"300",@"",@"",@"",@"",@"",@"",@"TL800",@"Social Media and Web Technologies",@"Social Media and…",@"IT TRALEE",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"TL801",@"Interactive Multimedia",@"Interactive Multi…",@"IT TRALEE",@"285",@"290",@"290",@"",@"",@"",@"",@"",@"",@"TL802",@"TV, Radio and New Media Broadcasting",@"TV, Radio and New…",@"IT TRALEE",@"315",@"",@"",@"",@"",@"",@"",@"",@"",@"TL803",@"Music Technology",@"Music Technology",@"IT TRALEE",@"270",@"305",@"305",@"",@"",@"",@"",@"",@"",@"TL804",@"Creative Writing for Digital Media",@"Creative Writing…",@"IT TRALEE",@"295",@"",@"",@"",@"",@"",@"",@"",@"",@"TL805",@"Information Systems Management",@"Information Syste…",@"IT TRALEE",@"370",@"",@"",@"",@"",@"",@"",@"",@"",@"TL811",@"Computing with Games Development",@"Computing with Ga…",@"IT TRALEE",@"320",@"320",@"300",@"",@"",@"",@"",@"",@"",@"TL812",@"Computing with Multimedia",@"Computing with Mu…",@"IT TRALEE",@"305",@"310",@"295",@"",@"",@"",@"",@"",@"",@"TL814",@"Computing with Mobile App Development",@"Computing with Mo…",@"IT TRALEE",@"375",@"",@"",@"",@"",@"",@"",@"",@"",@"TL820",@"Travel and Tourism Management",@"Travel and Touris…",@"IT TRALEE",@"340",@"295",@"310",@"",@"",@"",@"",@"",@"",@"TL821",@"Adventure Tourism Management",@"Adventure Tourism…",@"IT TRALEE",@"285",@"305",@"310",@"",@"",@"",@"",@"",@"",@"TL822",@"Hotel Management",@"Hotel Management",@"IT TRALEE",@"355",@"",@"",@"",@"",@"",@"",@"",@"",@"TL831",@"Business Studies (options: Accounting or Agribusiness or Mar",@"Business Studies…",@"IT TRALEE",@"305",@"",@"",@"",@"",@"",@"",@"",@"",@"TL833",@"International Business",@"International Bus…",@"IT TRALEE",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"TL850",@"Field Biology and Wildlife Tourism",@"Field Biology and…",@"IT TRALEE",@"305",@"",@"",@"",@"",@"",@"",@"",@"",@"TL851",@"Wildlife Biology",@"Wildlife Biology",@"IT TRALEE",@"300",@"300",@"325",@"",@"",@"",@"",@"",@"",@"TL853",@"Pharmaceutical Analysis with Forensics",@"Pharmaceutical An…",@"IT TRALEE",@"",@"",@"325",@"",@"",@"",@"",@"",@"",@"TL854",@"Pharmaceutical Analysis with Environmental Science",@"Pharmaceutical An…",@"IT TRALEE",@"",@"",@"240",@"",@"",@"",@"",@"",@"",@"TL871",@"Health and Leisure",@"Health and Leisur…",@"IT TRALEE",@"365",@"295",@"355",@"",@"",@"",@"",@"",@"",@"TL872",@"Health and Leisure with Massage",@"Health and Leisur…",@"IT TRALEE",@"355",@"300",@"335",@"",@"",@"",@"",@"",@"", @"TL880",@"Early Childhood Care and Education",@"Early Childhood C…",@"IT TRALEE",@"315",@"335",@"355",@"",@"",@"",@"",@"",@"",@"TL890",@"General Nursing",@"General Nursing",@"IT TRALEE",@"415",@"435",@"410",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TL891",@"Mental Health Nursing",@"Mental Health Nur…",@"IT TRALEE",@"380",@"410",@"400",@"",@"",@"",@"",@"",@"",@"TL892",@"Mature Applicants General Nursing",@"Mature Applicants…",@"IT TRALEE",@"580",@"222",@"230",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"TL893",@"Mature Applicants Mental Health Nursing",@"Mature Applicants…",@"IT TRALEE",@"563",@"217",@"217",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"WD025",@"Construction Management and Engineering",@"Construction Mana…",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"290",@"295",@"",@"",@"",@"",@"",@"",@"",@"WD027",@"Music",@"Music",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"305",@"305",@"310",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"WD028",@"Applied Computing",@"Applied Computing",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"300",@"295",@"300",@"",@"",@"",@"",@"",@"",@"WD048",@"Business",@"Business",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"290",@"300",@"300",@"",@"",@"",@"",@"",@"",@"WD049",@"Business with French",@"Business with Fre…",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"310",@"325",@"",@"",@"",@"",@"",@"",@"",@"WD080",@"Business with German",@"Business with Ger…",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"330",@"305",@"",@"",@"",@"",@"",@"",@"",@"WD084",@"Accounting",@"Accounting",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"305",@"305",@"300",@"",@"",@"",@"",@"",@"",@"WD085",@"Mechanical and Manufacturing Engineering",@"Mechanical and Ma…",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"290",@"280",@"280",@"",@"",@"",@"",@"",@"",@"WD086",@"Electronic Engineering",@"Electronic Engine…",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"370",@"355",@"345",@"",@"",@"",@"",@"",@"",@"WD091",@"Hospitality Management",@"Hospitality Manag…",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"265",@"270",@"280",@"",@"",@"",@"",@"",@"",@"WD095",@"Marketing with Advertising and Online Media",@"Marketing with Ad…",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"290",@"285",@"",@"",@"",@"",@"",@"",@"",@"WD116",@"General Nursing",@"General Nursing",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"420",@"425",@"420",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"WD117",@"Psychiatric Nursing",@"Psychiatric Nursi…",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"390",@"395",@"380",@"",@"",@"",@"",@"",@"",@"WD120",@"Intellectual Disability Nursing",@"Intellectual Disa…",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"385",@"380",@"385",@"",@"",@"",@"",@"",@"",@"WD124",@"Health Promotion",@"Health Promotion",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"300",@"300",@"315",@"",@"",@"",@"",@"",@"",@"WD125",@"Exercise and Health Studies",@"Exercise and Heal…",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"295",@"300",@"300",@"",@"",@"",@"",@"",@"",@"WD134",@"International Business",@"International Bus…",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"315",@"310",@"300",@"",@"",@"",@"",@"",@"",@"WD135",@"Applied Social Studies in Social Care",@"Applied Social St…",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"340",@"355",@"355",@"",@"",@"",@"",@"",@"",@"WD137",@"Design Visual Communications",@"Design Visual Com…",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"300",@"305",@"300",@"",@"",@"",@"",@"",@"",@"WD140",@"Law",@"Law",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"290",@"295",@"300",@"",@"",@"",@"",@"",@"",@"WD144",@"Architecture",@"Architecture",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"300",@"335",@"400",@"",@"",@"",@"",@"",@"",@"WD147",@"Pharmaceutical Science",@"Pharmaceutical Sc…",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"355",@"315",@"325",@"",@"",@"",@"",@"",@"",@"WD148",@"Tourism Marketing",@"Tourism Marketing",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"285",@"285",@"295",@"",@"",@"",@"",@"",@"",@"WD149",@"Early Childhood Studies",@"Early Childhood S…",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"330",@"345",@"340",@"",@"",@"",@"",@"",@"",@"WD150",@"Criminal Justice Studies",@"Criminal Justice…",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"300",@"310",@"315",@"",@"",@"",@"",@"",@"",@"WD152",@"Visual Art",@"Visual Art",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"320",@"310",@"",@"",@"",@"",@"",@"",@"",@"WD160",@"Finance and Investment",@"Finance and Inves…",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"325",@"325",@"340",@"",@"",@"",@"",@"",@"",@"WD161",@"Computer Forensics and Security",@"Computer Forensic…",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"275",@"290",@"",@"",@"",@"",@"",@"",@"",@"WD162",@"Quantity Surveying",@"Quantity Surveyin…",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"300",@"290",@"300",@"",@"",@"",@"",@"",@"",@"WD163",@"Psychology",@"Psychology",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"390",@"385",@"380",@"",@"",@"",@"",@"",@"",@"WD168",@"Entertainment Systems",@"Entertainment Sys…",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"280",@"290",@"",@"",@"",@"",@"",@"",@"",@"WD171",@"Sustainable Energy Engineering",@"Sustainable Energ…",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"290",@"300",@"300",@"",@"",@"",@"",@"",@"",@"WD179",@"Business with Irish",@"Business with Iri…",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"400",@"365",@"",@"",@"",@"",@"",@"",@"",@"WD180",@"Physics for Modern Technology",@"Physics for Moder…",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"375",@"345",@"",@"",@"",@"",@"",@"",@"",@"WD186",@"Sports Coaching and Performance",@"Sports Coaching a…",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"360",@"",@"",@"",@"",@"",@"",@"",@"",@"WD187",@"Social Science",@"Social Science",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"300",@"",@"",@"",@"",@"",@"",@"",@"",@"WD200",@"Arts",@"Arts",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"275",@"285",@"290",@"",@"",@"",@"",@"",@"",@"WD816",@"Mature Applicants General Nursing",@"Mature Applicants…",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"582",@"234",@"232",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"WD817",@"Mature Applicants Psychiatric Nursing",@"Mature Applicants…",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"557",@"223",@"224",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"WD820",@"Mature Applicants Intellectual Disability Nursing",@"Mature Applicants…",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"537",@"217",@"220",@"(*) Not all on this points score were offered places; (#) Test / Interview / Portfolio",@"",@"",@"",@"",@"", nil];
     */

}


-(void) InitializeVars
{
    //label_1.text=@"";
    //working line
    //button.titleLabel.text=@"";
    
    /*
     points1_2010.text=@"";
     points1_2011.text=@"";
     points1_2012.text=@"";
     */
    
    
    NSLog(@"in Initialize vars function :) ");
    
    //course_2.titleLabel.text=@"";
    [course_2 setTitle: @"" forState:UIControlStateNormal];
    points2_2010.text=@"";
    points2_2011.text=@"";
    points2_2012.text=@"";
    
    //course_3.titleLabel.text=@"";
    [course_3 setTitle: @"" forState:UIControlStateNormal];
    points3_2010.text=@"";
    points3_2011.text=@"";
    points3_2012.text=@"";
    
    //course_4.titleLabel.text=@"";
    [course_4 setTitle: @"" forState:UIControlStateNormal];
    points4_2010.text=@"";
    points4_2011.text=@"";
    points4_2012.text=@"";
    
    //course_5.titleLabel.text=@"";
    [course_5 setTitle: @"" forState:UIControlStateNormal];
    points5_2010.text=@"";
    points5_2011.text=@"";
    points5_2012.text=@"";
    
    //course_6.titleLabel.text=@"";
    [course_6 setTitle: @"" forState:UIControlStateNormal];
    points6_2010.text=@"";
    points6_2011.text=@"";
    points6_2012.text=@"";
    
    //course_7.titleLabel.text=@"";
    [course_7 setTitle: @"" forState:UIControlStateNormal];
    
    points7_2010.text=@"";
    points7_2011.text=@"";
    points7_2012.text=@"";
    
    //course_8.titleLabel.text=@"";
    [course_8 setTitle: @"" forState:UIControlStateNormal];
    
    points8_2010.text=@"";
    points8_2011.text=@"";
    points8_2012.text=@"";
    
    //course_9.titleLabel.text=@"";
    [course_9 setTitle: @"" forState:UIControlStateNormal];
    
    points9_2010.text=@"";
    points9_2011.text=@"";
    points9_2012.text=@"";
    
    //course_10.titleLabel.text=@"";
    [course_10 setTitle: @"" forState:UIControlStateNormal];
    
    points10_2010.text=@"";
    points10_2011.text=@"";
    points10_2012.text=@"";
    
    
    //course_11.titleLabel.text=@"";
    [course_11 setTitle: @"" forState:UIControlStateNormal];
    
    points11_2010.text=@"";
    points11_2011.text=@"";
    points11_2012.text=@"";
    
    //course_12.titleLabel.text=@"";
    [course_12 setTitle: @"" forState:UIControlStateNormal];
    
    points12_2010.text=@"";
    points12_2011.text=@"";
    points12_2012.text=@"";
    
    //course_13.titleLabel.text=@"";
    [course_13 setTitle: @"" forState:UIControlStateNormal];
    points13_2010.text=@"";
    points13_2011.text=@"";
    points13_2012.text=@"";
    
    //course_14.titleLabel.text=@"";
    [course_14 setTitle: @"" forState:UIControlStateNormal];
    points14_2010.text=@"";
    points14_2011.text=@"";
    points14_2012.text=@"";
    
    //course_15.titleLabel.text=@"";
    [course_15 setTitle: @"" forState:UIControlStateNormal];
    points15_2010.text=@"";
    points15_2011.text=@"";
    points15_2012.text=@"";
    
    
    //course_16.titleLabel.text=@"";
    [course_16 setTitle: @"" forState:UIControlStateNormal];
    points16_2010.text=@"";
    points16_2011.text=@"";
    points16_2012.text=@"";
    
    //course_17.titleLabel.text=@"";
    [course_17 setTitle: @"" forState:UIControlStateNormal];
    points17_2010.text=@"";
    points17_2011.text=@"";
    points17_2012.text=@"";
    
    //course_18.titleLabel.text=@"";
    [course_18 setTitle: @"" forState:UIControlStateNormal];
    points18_2010.text=@"";
    points18_2011.text=@"";
    points18_2012.text=@"";
    
    //course_19.titleLabel.text=@"";
    [course_19 setTitle: @"" forState:UIControlStateNormal];
    points19_2010.text=@"";
    points19_2011.text=@"";
    points19_2012.text=@"";
    
    //course_20.titleLabel.text=@"";
    [course_20 setTitle: @"" forState:UIControlStateNormal];
    points20_2010.text=@"";
    points20_2011.text=@"";
    points20_2012.text=@"";
    
    
    //course_21.titleLabel.text=@"";
    [course_21 setTitle: @"" forState:UIControlStateNormal];
    points21_2010.text=@"";
    points21_2011.text=@"";
    points21_2012.text=@"";
    
    //course_22.titleLabel.text=@"";
    [course_22 setTitle: @"" forState:UIControlStateNormal];
    points22_2010.text=@"";
    points22_2011.text=@"";
    points22_2012.text=@"";
    
    //course_23.titleLabel.text=@"";
    [course_23 setTitle: @"" forState:UIControlStateNormal];
    points23_2010.text=@"";
    points23_2011.text=@"";
    points23_2012.text=@"";
    
    //course_24.titleLabel.text=@"";
    [course_24 setTitle: @"" forState:UIControlStateNormal];
    points24_2010.text=@"";
    points24_2011.text=@"";
    points24_2012.text=@"";
    
    //course_25.titleLabel.text=@"";
    [course_25 setTitle: @"" forState:UIControlStateNormal];
    points25_2010.text=@"";
    points25_2011.text=@"";
    points25_2012.text=@"";
    
    //course_26.titleLabel.text=@"";
    [course_26 setTitle: @"" forState:UIControlStateNormal];
    points26_2010.text=@"";
    points26_2011.text=@"";
    points26_2012.text=@"";
    
    //course_27.titleLabel.text=@"";
    [course_27 setTitle: @"" forState:UIControlStateNormal];
    points27_2010.text=@"";
    points27_2011.text=@"";
    points27_2012.text=@"";
    
    //course_28.titleLabel.text=@"";
    [course_28 setTitle: @"" forState:UIControlStateNormal];
    points28_2010.text=@"";
    points28_2011.text=@"";
    points28_2012.text=@"";
    
    //course_29.titleLabel.text=@"";
    [course_29 setTitle: @"" forState:UIControlStateNormal];
    points29_2010.text=@"";
    points29_2011.text=@"";
    points29_2012.text=@"";
    
    //course_30.titleLabel.text=@"";
    [course_30 setTitle: @"" forState:UIControlStateNormal];
    points30_2010.text=@"";
    points30_2011.text=@"";
    points30_2012.text=@"";
    
    //course_31.titleLabel.text=@"";
    [course_31 setTitle: @"" forState:UIControlStateNormal];
    points31_2010.text=@"";
    points31_2011.text=@"";
    points31_2012.text=@"";
    
    //course_32.titleLabel.text=@"";
    [course_32 setTitle: @"" forState:UIControlStateNormal];
    points32_2010.text=@"";
    points32_2011.text=@"";
    points32_2012.text=@"";
    
    //course_33.titleLabel.text=@"";
    [course_33 setTitle: @"" forState:UIControlStateNormal];
    points33_2010.text=@"";
    points33_2011.text=@"";
    points33_2012.text=@"";
    
    //course_34.titleLabel.text=@"";
    [course_34 setTitle: @"" forState:UIControlStateNormal];
    points34_2010.text=@"";
    points34_2011.text=@"";
    points34_2012.text=@"";
    
    //course_35.titleLabel.text=@"";
    [course_35 setTitle: @"" forState:UIControlStateNormal];
    points35_2010.text=@"";
    points35_2011.text=@"";
    points35_2012.text=@"";
    
    //course_36.titleLabel.text=@"";
    [course_36 setTitle: @"" forState:UIControlStateNormal];
    points36_2010.text=@"";
    points36_2011.text=@"";
    points36_2012.text=@"";
    
    //course_37.titleLabel.text=@"";
    [course_37 setTitle: @"" forState:UIControlStateNormal];
    points37_2010.text=@"";
    points37_2011.text=@"";
    points37_2012.text=@"";
    
    //course_38.titleLabel.text=@"";
    [course_38 setTitle: @"" forState:UIControlStateNormal];
    points38_2010.text=@"";
    points38_2011.text=@"";
    points38_2012.text=@"";
    
    //course_39.titleLabel.text=@"";
    [course_39 setTitle: @"" forState:UIControlStateNormal];
    points39_2010.text=@"";
    points39_2011.text=@"";
    points39_2012.text=@"";
    
    //course_40.titleLabel.text=@"";
    [course_40 setTitle: @"" forState:UIControlStateNormal];
    points40_2010.text=@"";
    points40_2011.text=@"";
    points40_2012.text=@"";
    
    
    //course_30.titleLabel.text=@"";
    [course_41 setTitle: @"" forState:UIControlStateNormal];
    points41_2010.text=@"";
    points41_2011.text=@"";
    points41_2012.text=@"";
    
    //course_31.titleLabel.text=@"";
    [course_42 setTitle: @"" forState:UIControlStateNormal];
    points42_2010.text=@"";
    points42_2011.text=@"";
    points42_2012.text=@"";
    
    //course_32.titleLabel.text=@"";
    [course_43 setTitle: @"" forState:UIControlStateNormal];
    points43_2010.text=@"";
    points43_2011.text=@"";
    points43_2012.text=@"";
    
    //course_33.titleLabel.text=@"";
    [course_44 setTitle: @"" forState:UIControlStateNormal];
    points44_2010.text=@"";
    points44_2011.text=@"";
    points44_2012.text=@"";
    
    //course_34.titleLabel.text=@"";
    [course_45 setTitle: @"" forState:UIControlStateNormal];
    points45_2010.text=@"";
    points45_2011.text=@"";
    points45_2012.text=@"";
    
    //course_35.titleLabel.text=@"";
    [course_46 setTitle: @"" forState:UIControlStateNormal];
    points46_2010.text=@"";
    points46_2011.text=@"";
    points46_2012.text=@"";
    
    //course_36.titleLabel.text=@"";
    [course_47 setTitle: @"" forState:UIControlStateNormal];
    points47_2010.text=@"";
    points47_2011.text=@"";
    points47_2012.text=@"";
    
    //course_37.titleLabel.text=@"";
    [course_48 setTitle: @"" forState:UIControlStateNormal];
    points48_2010.text=@"";
    points48_2011.text=@"";
    points48_2012.text=@"";
    
    //course_38.titleLabel.text=@"";
    [course_49 setTitle: @"" forState:UIControlStateNormal];
    points49_2010.text=@"";
    points49_2011.text=@"";
    points49_2012.text=@"";
    
    //course_40.titleLabel.text=@"";
    [course_50 setTitle: @"" forState:UIControlStateNormal];
    points50_2010.text=@"";
    points50_2011.text=@"";
    points50_2012.text=@"";
    
    [course_51 setTitle: @"" forState:UIControlStateNormal];
    points51_2010.text=@"";
    points51_2011.text=@"";
    points51_2012.text=@"";
    
    [course_52 setTitle: @"" forState:UIControlStateNormal];
    points52_2010.text=@"";
    points52_2011.text=@"";
    points52_2012.text=@"";
    
    [course_53 setTitle: @"" forState:UIControlStateNormal];
    points53_2010.text=@"";
    points53_2011.text=@"";
    points53_2012.text=@"";
    
    [course_54 setTitle: @"" forState:UIControlStateNormal];
    points54_2010.text=@"";
    points54_2011.text=@"";
    points54_2012.text=@"";
    
    [course_55 setTitle: @"" forState:UIControlStateNormal];
    points55_2010.text=@"";
    points55_2011.text=@"";
    points55_2012.text=@"";
    
    [course_56 setTitle: @"" forState:UIControlStateNormal];
    points56_2010.text=@"";
    points56_2011.text=@"";
    points56_2012.text=@"";
    
    [course_57 setTitle: @"" forState:UIControlStateNormal];
    points57_2010.text=@"";
    points57_2011.text=@"";
    points57_2012.text=@"";
    
    [course_58 setTitle: @"" forState:UIControlStateNormal];
    points58_2010.text=@"";
    points58_2011.text=@"";
    points58_2012.text=@"";
    
    [course_59 setTitle: @"" forState:UIControlStateNormal];
    points59_2010.text=@"";
    points59_2011.text=@"";
    points59_2012.text=@"";
    
    [course_60 setTitle: @"" forState:UIControlStateNormal];
    points60_2010.text=@"";
    points60_2011.text=@"";
    points60_2012.text=@"";
    
    
}



-(IBAction)namePressed:(UIButton *)sender
{
    NSString *name1 = (sender.titleLabel).text;
    NSString *name = (NSString *)(sender.assign);
    
    UIAlertView *alertMsg=nil;
    NSString *full_course_name=nil;
    NSString *portfolio_exist=nil;
    NSString *quota_reached_exist=nil;
    
    NSString *music_test_interview=nil;
    NSString *Interview=nil;
    NSString *testInterviewPortfolio=nil;
    NSString *AQA=nil;
    NSString *VacantPlaces=nil;
    NSString *Project_portfolio=nil;
    
    
    full_course_name   =[self getAllRowsFromTableNamed : @"CAO_collegeLevelGenData_7addfields" sortBy : name];
    //portfolio_exist    =[self getFirstExtraInfoFromTableNamed : @"CAO_collegeLevelGenData_7Add_Entries" sortBy : name];
    quota_reached_exist=[self getFirstExtraInfoFromTableNamed : @"CAO_collegeLevelGenData_7addfields" sortBy : name];
    
    music_test_interview=[self getSecondExtraInfoFromTableNamed : @"CAO_collegeLevelGenData_7addfields" sortBy : name];
    Interview=[self getThirdExtraInfoFromTableNamed : @"CAO_collegeLevelGenData_7addfields" sortBy : name];
    testInterviewPortfolio=[self getFourthExtraInfoFromTableNamed : @"CAO_collegeLevelGenData_7addfields" sortBy : name];
    AQA=[self getFifthExtraInfoFromTableNamed : @"CAO_collegeLevelGenData_7addfields" sortBy : name];
    VacantPlaces=[self getSixthExtraInfoFromTableNamed : @"CAO_collegeLevelGenData_7addfields" sortBy : name];
    Project_portfolio=[self getSeventhExtraInfoFromTableNamed : @"CAO_collegeLevelGenData_7addfields" sortBy : name];
    
    NSLog(@" past calling added info function s -- creating string to write to pop up ...");
    
    NSString *extraStuff = @"Full Title :";
    NSString *extraStuff_1 = [extraStuff stringByAppendingString:full_course_name];
    NSString *extraStuff_2 = [extraStuff_1 stringByAppendingString:@"\n Unique course code : " ];
    NSString *extraStuff_3 = [extraStuff_2 stringByAppendingString:name];
    
    /*
    NSLog(@" donecreating string to write to pop up as far as extraStuff3 ...");
    
    
    NSString *extraStuff_4 = [extraStuff_3 stringByAppendingString:@"\n Not all people with these points were offered places on the course :"];
    
    
    NSLog(@" and got to creting extraStuff_5 ... quota_reached_exist = %@ ",quota_reached_exist);

    
    NSString *extraStuff_5 = [extraStuff_4 stringByAppendingString: quota_reached_exist ];
    
    NSLog(@" donecreating string to write to pop up as far as extraStuff3 ...extraStuff_5 = %@ ",extraStuff_5);
    
    NSString *extraStuff_6 = [extraStuff_5 stringByAppendingString:@"\n Music/Test/Interview : "];
    
    NSLog(@" donecreating string to write to creating extraStuff7 ...");
    
    NSString *extraStuff_7 = [extraStuff_6 stringByAppendingString:music_test_interview];
    
    NSLog(@" donecreating string to write to pop added extraStuff7 ...");
    
    NSString *extraStuff_8 = [extraStuff_7 stringByAppendingString:@"\n Interview : "];
    NSString *extraStuff_9 = [extraStuff_8 stringByAppendingString:Interview];
    
    NSLog(@" donecreating string to write to pop up as far as extraStuff9 ...");
    
    NSString *extraStuff_10 = [extraStuff_9 stringByAppendingString:@"\n testInterviewPortfolio : "];
    NSString *extraStuff_11 = [extraStuff_10 stringByAppendingString:testInterviewPortfolio ];
    
    NSLog(@" donecreating string to write to pop up as far as extraStuff10 ...");
    
    NSString *extraStuff_12 = [extraStuff_11 stringByAppendingString:@"\n AQA : "];
    NSString *extraStuff_13 = [extraStuff_12 stringByAppendingString:AQA ];
    
    NSLog(@" donecreating string to write to pop up as far as extraStuff13 ...");
    
    NSString *extraStuff_14 = [extraStuff_13 stringByAppendingString:@"\n VacantPlaces : "];
    NSString *extraStuff_15 = [extraStuff_14 stringByAppendingString:VacantPlaces ];
    
    NSLog(@" donecreating string to write to pop up as far as extraStuff15 ...");
    
    NSString *extraStuff_16 = [extraStuff_15 stringByAppendingString:@"\n Project_portfolio : "];
    NSString *extraStuff_17 = [extraStuff_16 stringByAppendingString:Project_portfolio ];
    
    NSLog(@" donecreating string to write to pop up as far as extraStuff17 ...");
    
                              
    alertMsg = [[UIAlertView alloc] initWithTitle:@"Additional Info."
                
                                          message: extraStuff_17
                                         delegate:nil cancelButtonTitle:@"OK I get it ! :)"
                                otherButtonTitles:nil];
     
     
     */
    
    
    NSString *extraStuff_3_new = [ extraStuff_3 stringByAppendingString:  @"\n"];
    
    NSString *extraStuff_4 = [/*extraStuff_3*/ extraStuff_3_new stringByAppendingString: quota_reached_exist];
    
    NSString *extraStuff_4_new = [ extraStuff_4 stringByAppendingString:  @"\n"];
    
    NSString *extraStuff_5 = [extraStuff_4_new stringByAppendingString: music_test_interview ];
    
    NSString *extraStuff_6= [ extraStuff_5 stringByAppendingString:  @"\n"];
    
    NSString *extraStuff_7 = [extraStuff_6 stringByAppendingString:Interview];
    
    NSString *extraStuff_8= [ extraStuff_7 stringByAppendingString:  @"\n"];

    NSString *extraStuff_9 = [extraStuff_8 stringByAppendingString:testInterviewPortfolio ];
    
    NSString *extraStuff_10 = [ extraStuff_9 stringByAppendingString:  @"\n"];
    
    NSString *extraStuff_11 = [extraStuff_10 stringByAppendingString:AQA ];
    
    NSString *extraStuff_12 = [ extraStuff_11 stringByAppendingString:  @"\n"];
    
    NSString *extraStuff_13 = [extraStuff_12 stringByAppendingString:VacantPlaces ];
    
    NSString *extraStuff_14 = [ extraStuff_13 stringByAppendingString:  @"\n"];

    NSString *extraStuff_15 = [extraStuff_14 stringByAppendingString:Project_portfolio ];

    alertMsg = [[UIAlertView alloc] initWithTitle:@"Additional Info."
                
                                          message: extraStuff_15
                                         delegate:nil cancelButtonTitle:@"OK I get it ! :)"
                                otherButtonTitles:nil];
    
    
    
    
    /*
    if([portfolio_exist isEqualToString:@"Yes"] && [quota_reached_exist isEqualToString: @"No"]){
        NSString *extraStuff_4 = [extraStuff_3 stringByAppendingString:@"\n Porfolio included : Yes "];
        alertMsg = [[UIAlertView alloc] initWithTitle:@"Additional Info."
                                              message: extraStuff_4
                                             delegate:nil cancelButtonTitle:@"OK I get it ! :)"
                                    otherButtonTitles:nil];
        
    }
    
    else if([portfolio_exist isEqualToString: @"No"] &&[quota_reached_exist isEqualToString: @"Yes"]){
        NSString *extraStuff_4 = [extraStuff_3 stringByAppendingString:@"\n Some people with these pts did not get course :("];
        alertMsg = [[UIAlertView alloc] initWithTitle:@"Additional Info."
                                              message: extraStuff_4
                                             delegate:nil cancelButtonTitle:@"OK I get it ! :)"
                                    otherButtonTitles:nil];
        
    }
    
    else if([quota_reached_exist isEqualToString: @"Yes"] && [portfolio_exist isEqualToString: @"Yes"])
    {
        NSString *extraStuff_4 = [extraStuff_3 stringByAppendingString:@"\n Porfolio included : Yes "];
        NSString *extraStuff_5 = [extraStuff_4 stringByAppendingString:@"\n Some people with these pts did not get course :( "];
        alertMsg = [[UIAlertView alloc] initWithTitle:@"Additional Info."
                    
                                              message: extraStuff_5
                                             delegate:nil cancelButtonTitle:@"OK I get it ! :)"
                                    otherButtonTitles:nil];
        
    }
    
    else{
        
        alertMsg = [[UIAlertView alloc] initWithTitle:@"Additional Info."
                                              message: extraStuff_3
                                             delegate:nil cancelButtonTitle:@"OK I get it ! :)"
                                    otherButtonTitles:nil];
    }
    */
    
    
    
    [alertMsg show];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




/***   DATABASE TEST  ***/
-(NSString *) filePath;
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    
    NSString *documentsDir = [paths lastObject];
    
    
    return[documentsDir stringByAppendingPathComponent:@"cao_db_cpugenerated_data_add7fields.sql"];
}


//function to opemn the database
-(void)openDB
{
    
    //create first database
    if(sqlite3_open( [[self filePath] UTF8String], &db) != SQLITE_OK )
    {
        //NSLog(@" sqlite3 error is = %s ",sqlite3_errmsg(db));
        
        sqlite3_close(db);
        NSAssert(0,@"Database one failed to open.");
    }
    
}



-(void) createTableOneNamed:(NSString *) tableNameOne withField1:(NSString *)   field1  withField2:(NSString *)   field2
                 withField3:(NSString *)  field3      withField4:(NSString *)   field4  withField5:(NSString *)   field5
                 withField6:(NSString *)  field6      withField7:(NSString *)   field7  withField8:(NSString *)   field8
                 withField9:(NSString *)  field9      withField10:(NSString *)  field10 withField11:(NSString *)  field11
                 withField12:(NSString *) field12     withField13:(NSString *)  field13 withField14:(NSString *)  field14
{
    
    char *err;
    NSString *sql_1 = [NSString stringWithFormat:
                       @"CREATE TABLE IF NOT EXISTS '%@' ('%@' TEXT PRIMARY KEY,'%@' REAL,'%@' REAL,'%@' REAL,'%@' REAL,'%@' REAL,'%@' REAL,'%@' REAL,'%@' REAL,'%@' REAL,'%@' REAL,'%@' REAL,'%@' REAL,'%@' REAL);"
                       ,tableNameOne,field1, field2,field3,field4, field5,field6,field7,field8,field9,field10,field11,field12,field13,field14];
    
    
    if(sqlite3_exec(db,[sql_1 UTF8String],NULL,NULL, &err) != SQLITE_OK)
    {
        sqlite3_close(db);
        NSAssert(0,@"Tabled failed to create.");
    }
    
}




-(void)insertRecordIntoTableNamed: (NSString *) tableName
                       withField1: (NSString *) field1 field1Value: (NSString *) field1Value andField2: (NSString *) field2
                      field2Value: (NSString *) field2Value  andField3: (NSString *) field3
                      field3Value: (NSString *) field3Value  andField4: (NSString *) field4
                      field4Value: (NSString *) field4Value  andField5: (NSString *) field5
                      field5Value: (NSString *) field5Value  andField6: (NSString *) field6
                      field6Value: (NSString *) field6Value  andField7: (NSString *) field7
                      field7Value: (NSString *) field7Value  andField8: (NSString *) field8
                      field8Value: (NSString *) field8Value  andField9: (NSString *) field9
                      field9Value: (NSString *) field9Value  andField10: (NSString *) field10
                      field10Value: (NSString *) field10Value  andField11: (NSString *) field11
                      field11Value: (NSString *) field11Value  andField12: (NSString *) field12
                      field12Value: (NSString *) field12Value  andField13: (NSString *) field13
                      field13Value: (NSString *) field13Value  andField14: (NSString *) field14
                      field14Value: (NSString *) field14Value

{
    NSString *sql_1 =[NSString stringWithFormat:
                      @"INSERT OR REPLACE INTO '%@' ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@') VALUES ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@');",
                      tableName,field1,field2,field3,field4,field5,field6,field7,field8,field9,field10,field11,field12,field13,field14,field1Value,field2Value,field3Value,field4Value,field5Value,field6Value,field7Value,field8Value,field9Value,field10Value,field11Value,field12Value,field13Value,field14Value];
    
    char *err;
    
    if(sqlite3_exec(db,[sql_1 UTF8String],NULL,NULL, &err) != SQLITE_OK)
    {
        
        NSLog(@" ******************** getting database error - sqlite3 official error  is = ");
        
        NSLog(@" %s ", err);
        
        sqlite3_errmsg(db) ;
        
        sqlite3_errcode(db);
        
        
        NSLog(@" -- done with sqlite3_ error msg call :) ********************  ");
        
        
        sqlite3_close(db);
        
        
        
        NSAssert(0,@"Error updating table.");
    }
    
}




-(NSString*)getAllRowsFromTableNamed :(NSString *) tableName sortBy: (NSString *) column
{
    //retrieve rows
    NSString *qsql_1 = [NSString stringWithFormat: @"SELECT * FROM '%@' WHERE courseID='%@'",tableName,column];
    sqlite3_stmt *statement_1;
    
    NSString *answer=nil;
    
    if(sqlite3_prepare(db, [qsql_1 UTF8String],-1, &statement_1,nil) == SQLITE_OK )
    {
        while(sqlite3_step(statement_1) == SQLITE_ROW)
        {
            char *field1 = (char *) sqlite3_column_text(statement_1,0);
            NSString *field1Str = [[NSString alloc] initWithUTF8String : field1];
            
            char *field2 = (char *) sqlite3_column_text(statement_1,1);
            NSString *field2Str = [[NSString alloc] initWithUTF8String : field2];
            
            
            char *field3 = (char *) sqlite3_column_text(statement_1,2);
            NSString *truncatedtruncatedField3Str = [[NSString alloc] initWithUTF8String : field3];
            
            char *field4 = (char *) sqlite3_column_text(statement_1,3);
            NSString *field4Str = [[NSString alloc] initWithUTF8String : field4];
            
            NSLog(@"got to assigning answer !!");
            
            answer = [[NSString alloc] initWithUTF8String : field2];
            
            NSLog(@"in 'getAllRowsFromTableNamed' --  and answer = %@ !!",answer);
            
        }
        
        //---delete the compiled statement from memory---
        sqlite3_finalize(statement_1);
        
    }
    
    return answer;
}




/*
-(NSString*)getFirstExtraInfoFromTableNamed :(NSString *) tableName sortBy: (NSString *) column
{
    //retrieve rows
    NSString *qsql_1 = [NSString stringWithFormat: @"SELECT * FROM '%@' WHERE courseID='%@'",tableName,column];
    sqlite3_stmt *statement_1;
    
    NSString *ans=nil;
    
    if(sqlite3_prepare(db, [qsql_1 UTF8String],-1, &statement_1,nil) == SQLITE_OK )
    {
        while(sqlite3_step(statement_1) == SQLITE_ROW)
        {
            
            char *field7 = (char *) sqlite3_column_text(statement_1,7);
            NSString *field7Str = [[NSString alloc] initWithUTF8String : field7];
            
            ans = [[NSString alloc] initWithUTF8String : field7];
            
            NSLog(@"and answer = %@ !!",ans);
            
        }
        
        //---delete the compiled statement from memory---
        sqlite3_finalize(statement_1);
        
    }
    
    return ans;
}
 */



-(NSString*)getFirstExtraInfoFromTableNamed :(NSString *) tableName sortBy: (NSString *) column
{
    //retrieve rows
    NSString *qsql_1 = [NSString stringWithFormat: @"SELECT * FROM '%@' WHERE courseID='%@'",tableName,column];
    sqlite3_stmt *statement_1;
    
    NSString *sol=nil;
    
    if(sqlite3_prepare(db, [qsql_1 UTF8String],-1, &statement_1,nil) == SQLITE_OK )
    {
        while(sqlite3_step(statement_1) == SQLITE_ROW)
        {
            
            char *field8 = (char *) sqlite3_column_text(statement_1,7);
            NSString *field8Str = [[NSString alloc] initWithUTF8String : field8];
            
            sol = [[NSString alloc] initWithUTF8String : field8];
            
            NSLog(@"in 'getFirstExtraInfoFromTableNamed' -- and answer = %@ !!",sol);
            
        }
        
        //---delete the compiled statement from memory---
        sqlite3_finalize(statement_1);
        
    }
    
    return sol;
}


-(NSString*)getSecondExtraInfoFromTableNamed :(NSString *) tableName sortBy: (NSString *) column
{
    //retrieve rows
    NSString *qsql_1 = [NSString stringWithFormat: @"SELECT * FROM '%@' WHERE courseID='%@'",tableName,column];
    sqlite3_stmt *statement_1;
    
    NSString *sol1=nil;
    
    if(sqlite3_prepare(db, [qsql_1 UTF8String],-1, &statement_1,nil) == SQLITE_OK )
    {
        while(sqlite3_step(statement_1) == SQLITE_ROW)
        {
            
            char *field9 = (char *) sqlite3_column_text(statement_1,8);
            NSString *field9Str = [[NSString alloc] initWithUTF8String : field9];
            
            sol1 = [[NSString alloc] initWithUTF8String : field9];
            
            NSLog(@"in 'getSecond' --and answer = %@ !!",sol1);
            
        }
        
        //---delete the compiled statement from memory---
        sqlite3_finalize(statement_1);
        
    }
    
    return sol1;
}


-(NSString*)getThirdExtraInfoFromTableNamed :(NSString *) tableName sortBy: (NSString *) column
{
    //retrieve rows
    NSString *qsql_1 = [NSString stringWithFormat: @"SELECT * FROM '%@' WHERE courseID='%@'",tableName,column];
    sqlite3_stmt *statement_1;
    
    NSString *sol2=nil;
    
    if(sqlite3_prepare(db, [qsql_1 UTF8String],-1, &statement_1,nil) == SQLITE_OK )
    {
        while(sqlite3_step(statement_1) == SQLITE_ROW)
        {
            
            char *field10 = (char *) sqlite3_column_text(statement_1,9);
            NSString *field10Str = [[NSString alloc] initWithUTF8String : field10];
            
            sol2 = [[NSString alloc] initWithUTF8String : field10];
            
            NSLog(@"in getThird -- and answer = %@ !!",sol2);
            
        }
        
        //---delete the compiled statement from memory---
        sqlite3_finalize(statement_1);
        
    }
    
    return sol2;
}


-(NSString*)getFourthExtraInfoFromTableNamed :(NSString *) tableName sortBy: (NSString *) column
{
    //retrieve rows
    NSString *qsql_1 = [NSString stringWithFormat: @"SELECT * FROM '%@' WHERE courseID='%@'",tableName,column];
    sqlite3_stmt *statement_1;
    
    NSString *sol3=nil;
    
    if(sqlite3_prepare(db, [qsql_1 UTF8String],-1, &statement_1,nil) == SQLITE_OK )
    {
        while(sqlite3_step(statement_1) == SQLITE_ROW)
        {
            
            char *field11 = (char *) sqlite3_column_text(statement_1,10);
            NSString *field11Str = [[NSString alloc] initWithUTF8String : field11];
            
            sol3 = [[NSString alloc] initWithUTF8String : field11];
            
            NSLog(@"in getFourth -- and answer = %@ !!",sol3);
            
        }
        
        //---delete the compiled statement from memory---
        sqlite3_finalize(statement_1);
        
    }
    
    return sol3;
}


-(NSString*)getFifthExtraInfoFromTableNamed :(NSString *) tableName sortBy: (NSString *) column
{
    //retrieve rows
    NSString *qsql_1 = [NSString stringWithFormat: @"SELECT * FROM '%@' WHERE courseID='%@'",tableName,column];
    sqlite3_stmt *statement_1;
    
    NSString *sol4=nil;
    
    if(sqlite3_prepare(db, [qsql_1 UTF8String],-1, &statement_1,nil) == SQLITE_OK )
    {
        while(sqlite3_step(statement_1) == SQLITE_ROW)
        {
            
            char *field12 = (char *) sqlite3_column_text(statement_1,11);
            NSString *field12Str = [[NSString alloc] initWithUTF8String : field12];
            
            sol4 = [[NSString alloc] initWithUTF8String : field12];
            
            NSLog(@" in getFifth -- and answer = %@ !!",sol4);
            
        }
        
        //---delete the compiled statement from memory---
        sqlite3_finalize(statement_1);
        
    }
    
    return sol4;
}


-(NSString*)getSixthExtraInfoFromTableNamed :(NSString *) tableName sortBy: (NSString *) column
{
    //retrieve rows
    NSString *qsql_1 = [NSString stringWithFormat: @"SELECT * FROM '%@' WHERE courseID='%@'",tableName,column];
    sqlite3_stmt *statement_1;
    
    NSString *sol5=nil;
    
    if(sqlite3_prepare(db, [qsql_1 UTF8String],-1, &statement_1,nil) == SQLITE_OK )
    {
        while(sqlite3_step(statement_1) == SQLITE_ROW)
        {
            
            char *field13 = (char *) sqlite3_column_text(statement_1,12);
            NSString *field13Str = [[NSString alloc] initWithUTF8String : field13];
            
            sol5 = [[NSString alloc] initWithUTF8String : field13];
            
            NSLog(@"in getSixth -- and answer = %@ !!",sol5);
            
        }
        
        //---delete the compiled statement from memory---
        sqlite3_finalize(statement_1);
        
    }
    
    return sol5;
}


-(NSString*)getSeventhExtraInfoFromTableNamed :(NSString *) tableName sortBy: (NSString *) column
{
    //retrieve rows
    NSString *qsql_1 = [NSString stringWithFormat: @"SELECT * FROM '%@' WHERE courseID='%@'",tableName,column];
    sqlite3_stmt *statement_1;
    
    NSString *sol6=nil;
    
    if(sqlite3_prepare(db, [qsql_1 UTF8String],-1, &statement_1,nil) == SQLITE_OK )
    {
        while(sqlite3_step(statement_1) == SQLITE_ROW)
        {
            
            char *field14 = (char *) sqlite3_column_text(statement_1,13);
            NSString *field14Str = [[NSString alloc] initWithUTF8String : field14];
            
            sol6 = [[NSString alloc] initWithUTF8String : field14];
            
            NSLog(@"in getSeventh -- and answer = %@ !!",sol6);
            
        }
        
        //---delete the compiled statement from memory---
        sqlite3_finalize(statement_1);
        
    }
    
    return sol6;
}



@end







