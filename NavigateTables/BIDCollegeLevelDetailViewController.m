
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
    
    /*
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
    */
    
    
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
    
    [NSArray arrayWithObjects:@"KM4908",@"Commerce",@"Commerce",@"DIT",@"295",@"075",@"055",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"MN2763",@"Law",@"Law",@"DCU",@"270",@"165",@"540",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"GS1807",@"Commerce",@"Commerce",@"CIT",@"450",@"055",@"490",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"QK3816",@"Civil Engineering",@"Civil Engineering",@"UL",@"105",@"270",@"165",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"IO7910",@"Nutritional Science",@"Nutritional Science",@"GMIT",@"440",@"275",@"045",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"QE6615",@"Business and Accounting",@"Business and Accou",@"NUIM",@"105",@"270",@"165",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"SP5810",@"Commerce",@"Commerce",@"UL",@"055",@"440",@"275",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"HI3891",@"Nutritional Science",@"Nutritional Science",@"TCD",@"295",@"075",@"055",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"GR8138",@"Food Science",@"Food Science",@"DIT",@"055",@"440",@"275",@"",@"",@"Offer dependent on Interview",@"",@"",@"",@"Project/Portfolio",
     @"BS6005",@"Civil Engineering",@"Civil Engineering",@"UCC",@"380",@"295",@"075",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"KR3855",@"Accountancy",@"Accountancy",@"DBS",@"545",@"105",@"270",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"NB6600",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"WIT",@"055",@"490",@"095",@"Not all people on these points were offered places on this course",@"",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"OG4417",@"Civil Engineering",@"Civil Engineering",@"WIT",@"235",@"380",@"295",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"",@"",
     @"LQ8730",@"Accountancy",@"Accountancy",@"UCD",@"490",@"095",@"235",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@"",@"",@"Project/Portfolio",
     @"DG1910",@"Accountancy",@"Accountancy",@"DIT",@"235",@"380",@"295",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"IG7113",@"Environmental Science",@"Environmental Sc",@"DIT",@"545",@"105",@"270",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"HP9131",@"Business Information Systems",@"Business Information Sy",@"UL",@"380",@"295",@"075",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"PP4030",@"Civil Engineering",@"Civil Engineering",@"UL",@"105",@"270",@"165",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"KC1614",@"Food Science",@"Food Science",@"NUIG",@"440",@"275",@"045",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"SQ9117",@"Finance",@"Finance",@"GMIT",@"275",@"045",@"230",@"",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"EF3713",@"Environmental Science",@"Environmental Sc",@"UCC",@"165",@"540",@"450",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"FE8239",@"Nutritional Science",@"Nutritional Science",@"NUIM",@"275",@"045",@"230",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"DH0754",@"Nutritional Science",@"Nutritional Science",@"UCD",@"490",@"095",@"235",@"Not all people on these points were offered places on this course",@"",@"",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"SF4141",@"Accountancy",@"Accountancy",@"UCD",@"540",@"450",@"055",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"OG2890",@"Physics",@"Physics",@"UL",@"235",@"380",@"295",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"IO6758",@"Physics",@"Physics",@"DBS",@"275",@"045",@"230",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"SN6783",@"Chemical Science",@"Chemical Science",@"DBS",@"095",@"235",@"380",@"",@"",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"",
     @"IR9385",@"Civil Engineering",@"Civil Engineering",@"UCD",@"055",@"490",@"095",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"CC3968",@"Food Science",@"Food Science",@"NUIG",@"235",@"380",@"295",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"NI4026",@"Pharmacy",@"Pharmacy",@"TCD",@"275",@"045",@"230",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"DJ1513",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"GMIT",@"440",@"275",@"045",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"EB8630",@"Accountancy",@"Accountancy",@"NUIG",@"055",@"440",@"275",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"SB9510",@"Pharmacy",@"Pharmacy",@"UL",@"450",@"055",@"490",@"",@"",@"Offer dependent on Interview",@"",@"",@"",@"Project/Portfolio",
     @"SQ0969",@"Pharmacy",@"Pharmacy",@"TCD",@"540",@"450",@"055",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"LR5278",@"Civil Engineering",@"Civil Engineering",@"TCD",@"075",@"055",@"440",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"Vacant Places",@"",
     @"NN5724",@"Environmental Science",@"Environmental Sc",@"UCC",@"295",@"075",@"055",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"KL8089",@"Accountancy",@"Accountancy",@"NUIM",@"295",@"075",@"055",@"Not all people on these points were offered places on this course",@"",@"",@"",@"",@"Vacant Places",@"",
     @"CD1636",@"Accountancy",@"Accountancy",@"DCU",@"095",@"235",@"380",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"LF1621",@"Physics",@"Physics",@"UCD",@"045",@"230",@"285",@"",@"",@"",@"",@"",@"",@"",
     @"MS7763",@"General Arts",@"General Arts",@"NUIG",@"165",@"540",@"450",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"DH4341",@"Commerce",@"Commerce",@"CIT",@"045",@"230",@"285",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"BC9772",@"Chemical Science",@"Chemical Science",@"TCD",@"055",@"490",@"095",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"JQ5279",@"Accountancy",@"Accountancy",@"UCC",@"295",@"075",@"055",@"",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"RP4551",@"Nutritional Science",@"Nutritional Science",@"TCD",@"545",@"105",@"270",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"HL7196",@"Commerce",@"Commerce",@"UCC",@"105",@"270",@"165",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"RG8515",@"Law",@"Law",@"WIT",@"440",@"275",@"045",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"Vacant Places",@"",
     @"NH1093",@"Environmental Science",@"Environmental Sc",@"DCU",@"440",@"275",@"045",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@"",@"",@"Project/Portfolio",
     @"LB1647",@"Environmental Science",@"Environmental Sc",@"UL",@"540",@"450",@"055",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"HL3230",@"Business and Accounting",@"Business and Accou",@"DBS",@"295",@"075",@"055",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"FB5516",@"Nutritional Science",@"Nutritional Science",@"TCD",@"545",@"105",@"270",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"IQ8363",@"Commerce",@"Commerce",@"NUIM",@"055",@"440",@"275",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"KI4185",@"Environmental Science",@"Environmental Sc",@"UCC",@"440",@"275",@"045",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"DS7238",@"Business and Accounting",@"Business and Accou",@"NUIM",@"095",@"235",@"380",@"Not all people on these points were offered places on this course",@"",@"",@"",@"",@"",@"Project/Portfolio",
     @"KC3497",@"General Arts",@"General Arts",@"GMIT",@"075",@"055",@"440",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"BK2829",@"Commerce",@"Commerce",@"DIT",@"490",@"095",@"235",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"SK6049",@"Electrical Engineering",@"Electrical Engine",@"UCC",@"045",@"230",@"285",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"MM3549",@"Accountancy",@"Accountancy",@"DBS",@"165",@"540",@"450",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"PB2693",@"Environmental Science",@"Environmental Sc",@"WIT",@"540",@"450",@"055",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"BG2403",@"Pharmacy",@"Pharmacy",@"UL",@"380",@"295",@"075",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"BQ7671",@"General Arts",@"General Arts",@"UCC",@"235",@"380",@"295",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"FL4605",@"Commerce",@"Commerce",@"NUIM",@"105",@"270",@"165",@"",@"",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"",
     @"OG1465",@"Civil Engineering",@"Civil Engineering",@"GMIT",@"055",@"440",@"275",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"SM3817",@"Commerce",@"Commerce",@"NUIM",@"450",@"055",@"490",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"MC5019",@"Food Science",@"Food Science",@"GMIT",@"230",@"285",@"175",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"IB5812",@"Law",@"Law",@"CIT",@"055",@"440",@"275",@"Not all people on these points were offered places on this course",@"",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"EQ5023",@"Accountancy",@"Accountancy",@"NUIG",@"270",@"165",@"540",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"MO7159",@"Physics",@"Physics",@"DCU",@"275",@"045",@"230",@"Not all people on these points were offered places on this course",@"",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"IG4677",@"Physics",@"Physics",@"TCD",@"490",@"095",@"235",@"Not all people on these points were offered places on this course",@"",@"",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"KQ0228",@"Accountancy",@"Accountancy",@"UL",@"490",@"095",@"235",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"PD4393",@"Electrical Engineering",@"Electrical Engine",@"TCD",@"275",@"045",@"230",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"CC6206",@"Finance",@"Finance",@"DCU",@"380",@"295",@"075",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"EL0719",@"Civil Engineering",@"Civil Engineering",@"DIT",@"045",@"230",@"285",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"DE3610",@"Food Science",@"Food Science",@"UCC",@"235",@"380",@"295",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"NS2824",@"Civil Engineering",@"Civil Engineering",@"DCU",@"235",@"380",@"295",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"NQ3381",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"UCD",@"055",@"440",@"275",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"NS2562",@"Food Science",@"Food Science",@"UCC",@"055",@"440",@"275",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"CC0911",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"NUIM",@"380",@"295",@"075",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"HJ6643",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"DBS",@"275",@"045",@"230",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"OM5039",@"Accountancy",@"Accountancy",@"NUIG",@"295",@"075",@"055",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"",@"Project/Portfolio",
     @"CH8810",@"Accountancy",@"Accountancy",@"DCU",@"380",@"295",@"075",@"",@"",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"RE2149",@"Pharmacy",@"Pharmacy",@"DBS",@"440",@"275",@"045",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"CE1689",@"Civil Engineering",@"Civil Engineering",@"DBS",@"055",@"440",@"275",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"FL4069",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"TCD",@"490",@"095",@"235",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"BK9937",@"Electrical Engineering",@"Electrical Engine",@"GMIT",@"440",@"275",@"045",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"",
     @"IR1448",@"Commerce",@"Commerce",@"TCD",@"235",@"380",@"295",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"OC4598",@"Nutritional Science",@"Nutritional Science",@"UCC",@"490",@"095",@"235",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"RK6337",@"Law",@"Law",@"NUIM",@"055",@"440",@"275",@"Not all people on these points were offered places on this course",@"",@"",@"",@"",@"",@"Project/Portfolio",
     @"QE7836",@"Environmental Science",@"Environmental Sc",@"GMIT",@"235",@"380",@"295",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"RO1279",@"Commerce",@"Commerce",@"CIT",@"295",@"075",@"055",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@"",@"",@"",
     @"KE5115",@"General Arts",@"General Arts",@"WIT",@"055",@"490",@"095",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"OF9921",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"UL",@"230",@"285",@"175",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"NB6287",@"Chemical Science",@"Chemical Science",@"DCU",@"450",@"055",@"490",@"",@"",@"Offer dependent on Interview",@"",@"",@"",@"Project/Portfolio",
     @"KL9008",@"Accountancy",@"Accountancy",@"DCU",@"165",@"540",@"450",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"CI1674",@"Pharmacy",@"Pharmacy",@"WIT",@"095",@"235",@"380",@"",@"",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"",
     @"FD8618",@"Environmental Science",@"Environmental Sc",@"DBS",@"440",@"275",@"045",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@"",@"",@"Project/Portfolio",
     @"PE7632",@"Accountancy",@"Accountancy",@"DCU",@"230",@"285",@"175",@"",@"",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"QR3546",@"Commerce",@"Commerce",@"UCC",@"095",@"235",@"380",@"",@"",@"",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"JO0894",@"Electrical Engineering",@"Electrical Engine",@"GMIT",@"295",@"075",@"055",@"Not all people on these points were offered places on this course",@"",@"",@"",@"",@"",@"Project/Portfolio",
     @"KG3022",@"Nutritional Science",@"Nutritional Science",@"DBS",@"095",@"235",@"380",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"PO3243",@"Accountancy",@"Accountancy",@"DBS",@"490",@"095",@"235",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"",@"",
     @"CC3419",@"Pharmacy",@"Pharmacy",@"UCD",@"235",@"380",@"295",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"",
     @"EH7783",@"Accountancy",@"Accountancy",@"TCD",@"540",@"450",@"055",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"NR0413",@"Food Science",@"Food Science",@"CIT",@"055",@"440",@"275",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"JJ3862",@"Business and Accounting",@"Business and Accou",@"TCD",@"490",@"095",@"235",@"",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"LJ7260",@"Environmental Science",@"Environmental Sc",@"CIT",@"540",@"450",@"055",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"",@"",
     @"FH3780",@"Business and Accounting",@"Business and Accou",@"NUIM",@"275",@"045",@"230",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"LH2728",@"Pharmacy",@"Pharmacy",@"NUIM",@"055",@"490",@"095",@"",@"",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"CB5431",@"Pharmacy",@"Pharmacy",@"TCD",@"275",@"045",@"230",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"Vacant Places",@"",
     @"IG7808",@"Food Science",@"Food Science",@"TCD",@"540",@"450",@"055",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"BL0184",@"Physics",@"Physics",@"UCD",@"045",@"230",@"285",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"PJ5729",@"Law",@"Law",@"DBS",@"045",@"230",@"285",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"",@"Project/Portfolio",
     @"PM5637",@"Business and Accounting",@"Business and Accou",@"DBS",@"095",@"235",@"380",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"",@"Project/Portfolio",
     @"LQ7963",@"Business Information Systems",@"Business Information Sy",@"CIT",@"105",@"270",@"165",@"",@"",@"Offer dependent on Interview",@"",@"",@"",@"Project/Portfolio",
     @"DL7163",@"Nutritional Science",@"Nutritional Science",@"DBS",@"235",@"380",@"295",@"",@"",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"IJ2203",@"Nutritional Science",@"Nutritional Science",@"UCC",@"540",@"450",@"055",@"",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"CC6709",@"Environmental Science",@"Environmental Sc",@"DIT",@"295",@"075",@"055",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"DM5723",@"Business and Accounting",@"Business and Accou",@"DIT",@"295",@"075",@"055",@"",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"CR1952",@"Business and Accounting",@"Business and Accou",@"UCD",@"270",@"165",@"540",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"BB3637",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"TCD",@"165",@"540",@"450",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"NJ8985",@"Law",@"Law",@"DBS",@"295",@"075",@"055",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"BL8638",@"General Arts",@"General Arts",@"WIT",@"270",@"165",@"540",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"QP0394",@"Environmental Science",@"Environmental Sc",@"NUIM",@"275",@"045",@"230",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"PG6631",@"Civil Engineering",@"Civil Engineering",@"GMIT",@"055",@"490",@"095",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"",
     @"RS7276",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"DBS",@"235",@"380",@"295",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"BN7080",@"Nutritional Science",@"Nutritional Science",@"GMIT",@"295",@"075",@"055",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"PB9398",@"Finance",@"Finance",@"UCD",@"055",@"490",@"095",@"",@"",@"Offer dependent on Interview",@"",@"",@"",@"",
     @"HD3630",@"Finance",@"Finance",@"NUIG",@"055",@"440",@"275",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@"",@"",@"Project/Portfolio",
     @"IQ3276",@"Finance",@"Finance",@"DBS",@"055",@"440",@"275",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"MI4843",@"Commerce",@"Commerce",@"UCD",@"105",@"270",@"165",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"KH6320",@"Business Information Systems",@"Business Information Sy",@"DCU",@"275",@"045",@"230",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"BH7842",@"Business Information Systems",@"Business Information Sy",@"TCD",@"275",@"045",@"230",@"",@"",@"Offer dependent on Interview",@"",@"",@"",@"",
     @"KE5605",@"Nutritional Science",@"Nutritional Science",@"NUIM",@"075",@"055",@"440",@"Not all people on these points were offered places on this course",@"",@"",@"",@"",@"",@"",
     @"CP7507",@"Pharmacy",@"Pharmacy",@"DIT",@"440",@"275",@"045",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"SK0072",@"Business and Accounting",@"Business and Accou",@"WIT",@"440",@"275",@"045",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"EB8376",@"Physics",@"Physics",@"WIT",@"275",@"045",@"230",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"",@"",
     @"PN7909",@"Nutritional Science",@"Nutritional Science",@"UL",@"380",@"295",@"075",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"SS9345",@"Law",@"Law",@"UL",@"055",@"490",@"095",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"OE8426",@"Accountancy",@"Accountancy",@"DIT",@"540",@"450",@"055",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"IS6318",@"Business and Accounting",@"Business and Accou",@"NUIM",@"545",@"105",@"270",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"ED2796",@"Civil Engineering",@"Civil Engineering",@"CIT",@"540",@"450",@"055",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"",
     @"IK5834",@"Accountancy",@"Accountancy",@"NUIG",@"540",@"450",@"055",@"",@"",@"Offer dependent on Interview",@"",@"",@"",@"Project/Portfolio",
     @"MK2710",@"Commerce",@"Commerce",@"TCD",@"165",@"540",@"450",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"DQ6795",@"Business Information Systems",@"Business Information Sy",@"UL",@"165",@"540",@"450",@"",@"",@"",@"",@"",@"",@"",
     @"RR4805",@"Business Information Systems",@"Business Information Sy",@"UCC",@"540",@"450",@"055",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"DR8714",@"Business Information Systems",@"Business Information Sy",@"WIT",@"230",@"285",@"175",@"Not all people on these points were offered places on this course",@"",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"MF8297",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"TCD",@"270",@"165",@"540",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"LL8316",@"Electrical Engineering",@"Electrical Engine",@"UCC",@"165",@"540",@"450",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"FL5488",@"General Arts",@"General Arts",@"NUIG",@"165",@"540",@"450",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"JL7930",@"Food Science",@"Food Science",@"DBS",@"270",@"165",@"540",@"",@"",@"Offer dependent on Interview",@"",@"",@"",@"Project/Portfolio",
     @"QC5580",@"Business Information Systems",@"Business Information Sy",@"TCD",@"380",@"295",@"075",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"PG2333",@"Civil Engineering",@"Civil Engineering",@"DBS",@"270",@"165",@"540",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"IJ2498",@"Nutritional Science",@"Nutritional Science",@"UCC",@"055",@"490",@"095",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"OJ6618",@"Finance",@"Finance",@"DIT",@"295",@"075",@"055",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"ON6411",@"Chemical Science",@"Chemical Science",@"UCD",@"450",@"055",@"490",@"",@"",@"",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"BD8453",@"Finance",@"Finance",@"WIT",@"230",@"285",@"175",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"RE4317",@"Electrical Engineering",@"Electrical Engine",@"GMIT",@"270",@"165",@"540",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"ND1564",@"Chemical Science",@"Chemical Science",@"CIT",@"295",@"075",@"055",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"LR3843",@"Finance",@"Finance",@"DBS",@"055",@"490",@"095",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"MJ1495",@"Chemical Science",@"Chemical Science",@"WIT",@"275",@"045",@"230",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"RH9912",@"Food Science",@"Food Science",@"TCD",@"450",@"055",@"490",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"SM4686",@"Physics",@"Physics",@"NUIM",@"545",@"105",@"270",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@"",@"",@"",
     @"SR7932",@"Physics",@"Physics",@"TCD",@"095",@"235",@"380",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"EE3299",@"Finance",@"Finance",@"UL",@"450",@"055",@"490",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"HR4071",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"TCD",@"165",@"540",@"450",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"DL2557",@"General Arts",@"General Arts",@"UCC",@"440",@"275",@"045",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"",@"",
     @"OR4922",@"Chemical Science",@"Chemical Science",@"DIT",@"235",@"380",@"295",@"",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"DN8860",@"Electrical Engineering",@"Electrical Engine",@"TCD",@"055",@"440",@"275",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"EP0310",@"Pharmacy",@"Pharmacy",@"UCC",@"275",@"045",@"230",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"RK6253",@"Accountancy",@"Accountancy",@"UCC",@"105",@"270",@"165",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"LI9328",@"Law",@"Law",@"UCD",@"055",@"440",@"275",@"Not all people on these points were offered places on this course",@"",@"",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"HK6475",@"Pharmacy",@"Pharmacy",@"UL",@"380",@"295",@"075",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"LJ8087",@"Business Information Systems",@"Business Information Sy",@"UCD",@"490",@"095",@"235",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"IP0265",@"Food Science",@"Food Science",@"DBS",@"545",@"105",@"270",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"EM6110",@"Chemical Science",@"Chemical Science",@"DCU",@"450",@"055",@"490",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"DC0047",@"Finance",@"Finance",@"UL",@"095",@"235",@"380",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"NR0145",@"Business Information Systems",@"Business Information Sy",@"GMIT",@"380",@"295",@"075",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"PB9656",@"Civil Engineering",@"Civil Engineering",@"DIT",@"440",@"275",@"045",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"OC5148",@"Nutritional Science",@"Nutritional Science",@"CIT",@"095",@"235",@"380",@"",@"",@"Offer dependent on Interview",@"",@"",@"",@"Project/Portfolio",
     @"FJ6346",@"Environmental Science",@"Environmental Sc",@"NUIG",@"045",@"230",@"285",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"QM5855",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"NUIM",@"275",@"045",@"230",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"SE7036",@"Business and Accounting",@"Business and Accou",@"DIT",@"055",@"440",@"275",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"BJ0289",@"Pharmacy",@"Pharmacy",@"WIT",@"440",@"275",@"045",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"LF3212",@"Food Science",@"Food Science",@"UL",@"380",@"295",@"075",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"QJ3575",@"Food Science",@"Food Science",@"NUIM",@"380",@"295",@"075",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"PK7339",@"Civil Engineering",@"Civil Engineering",@"NUIM",@"490",@"095",@"235",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"JG1269",@"Nutritional Science",@"Nutritional Science",@"TCD",@"545",@"105",@"270",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"JD7569",@"Accountancy",@"Accountancy",@"DCU",@"450",@"055",@"490",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"GE8503",@"Business Information Systems",@"Business Information Sy",@"GMIT",@"230",@"285",@"175",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"PO5863",@"Pharmacy",@"Pharmacy",@"UCD",@"545",@"105",@"270",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"QQ6038",@"Accountancy",@"Accountancy",@"NUIG",@"490",@"095",@"235",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"EF3710",@"Nutritional Science",@"Nutritional Science",@"NUIM",@"055",@"440",@"275",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"JM7335",@"General Arts",@"General Arts",@"UCC",@"235",@"380",@"295",@"Not all people on these points were offered places on this course",@"",@"",@"",@"",@"",@"Project/Portfolio",
     @"FO2966",@"Business Information Systems",@"Business Information Sy",@"DBS",@"490",@"095",@"235",@"",@"",@"Offer dependent on Interview",@"",@"",@"",@"",
     @"PN2018",@"Physics",@"Physics",@"UCD",@"075",@"055",@"440",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"EE1042",@"Physics",@"Physics",@"NUIM",@"075",@"055",@"440",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"OD9297",@"Physics",@"Physics",@"NUIG",@"235",@"380",@"295",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"MP8445",@"Accountancy",@"Accountancy",@"NUIM",@"545",@"105",@"270",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"GC0277",@"Environmental Science",@"Environmental Sc",@"UCD",@"490",@"095",@"235",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"QR5665",@"Business Information Systems",@"Business Information Sy",@"WIT",@"230",@"285",@"175",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"",@"",
     @"GC8273",@"Physics",@"Physics",@"CIT",@"230",@"285",@"175",@"",@"",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"MR4682",@"Business and Accounting",@"Business and Accou",@"GMIT",@"235",@"380",@"295",@"",@"",@"Offer dependent on Interview",@"",@"",@"",@"Project/Portfolio",
     @"JL6673",@"Business and Accounting",@"Business and Accou",@"UCD",@"275",@"045",@"230",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"DO4557",@"Environmental Science",@"Environmental Sc",@"DCU",@"105",@"270",@"165",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"",
     @"JP7285",@"Finance",@"Finance",@"DCU",@"540",@"450",@"055",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"SH4039",@"Physics",@"Physics",@"NUIM",@"230",@"285",@"175",@"Not all people on these points were offered places on this course",@"",@"",@"",@"",@"Vacant Places",@"",
     @"CK4722",@"Commerce",@"Commerce",@"WIT",@"450",@"055",@"490",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"OL8181",@"Commerce",@"Commerce",@"TCD",@"440",@"275",@"045",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"MM8899",@"Civil Engineering",@"Civil Engineering",@"UCD",@"440",@"275",@"045",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"RS0865",@"Law",@"Law",@"CIT",@"380",@"295",@"075",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"ME6958",@"General Arts",@"General Arts",@"UL",@"165",@"540",@"450",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"IS5363",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"UCC",@"490",@"095",@"235",@"Not all people on these points were offered places on this course",@"",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"RH6470",@"General Arts",@"General Arts",@"DCU",@"270",@"165",@"540",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@"",@"",@"",
     @"QG5349",@"Chemical Science",@"Chemical Science",@"CIT",@"545",@"105",@"270",@"",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"GQ2616",@"General Arts",@"General Arts",@"UCD",@"295",@"075",@"055",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"FH1482",@"Business Information Systems",@"Business Information Sy",@"NUIM",@"055",@"440",@"275",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"OB6045",@"Physics",@"Physics",@"UCD",@"235",@"380",@"295",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"IF4653",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"UCC",@"275",@"045",@"230",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"MJ1508",@"Business and Accounting",@"Business and Accou",@"DIT",@"055",@"440",@"275",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"LK6447",@"Commerce",@"Commerce",@"UL",@"055",@"440",@"275",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"",
     @"QN6607",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"UCD",@"270",@"165",@"540",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"PG3095",@"Finance",@"Finance",@"CIT",@"440",@"275",@"045",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"SF6103",@"Accountancy",@"Accountancy",@"UL",@"440",@"275",@"045",@"Not all people on these points were offered places on this course",@"",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"FS9185",@"Pharmacy",@"Pharmacy",@"NUIG",@"095",@"235",@"380",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"ME4438",@"Accountancy",@"Accountancy",@"UCD",@"275",@"045",@"230",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"",@"",
     @"SS2051",@"Law",@"Law",@"UCC",@"270",@"165",@"540",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"ED7115",@"Electrical Engineering",@"Electrical Engine",@"GMIT",@"045",@"230",@"285",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"OR7839",@"Accountancy",@"Accountancy",@"NUIM",@"045",@"230",@"285",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"HB0847",@"Electrical Engineering",@"Electrical Engine",@"CIT",@"545",@"105",@"270",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"BB1048",@"Electrical Engineering",@"Electrical Engine",@"CIT",@"275",@"045",@"230",@"",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"KH6882",@"Commerce",@"Commerce",@"DIT",@"095",@"235",@"380",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"CD5110",@"Electrical Engineering",@"Electrical Engine",@"DBS",@"440",@"275",@"045",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"HC2084",@"Nutritional Science",@"Nutritional Science",@"GMIT",@"075",@"055",@"440",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"RK6597",@"Electrical Engineering",@"Electrical Engine",@"GMIT",@"230",@"285",@"175",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"Vacant Places",@"",
     @"HD6231",@"Physics",@"Physics",@"TCD",@"095",@"235",@"380",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"CF7430",@"Nutritional Science",@"Nutritional Science",@"NUIM",@"270",@"165",@"540",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"LM3045",@"Business Information Systems",@"Business Information Sy",@"UCC",@"380",@"295",@"075",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"SH4869",@"Accountancy",@"Accountancy",@"TCD",@"095",@"235",@"380",@"",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"GN6664",@"Electrical Engineering",@"Electrical Engine",@"GMIT",@"165",@"540",@"450",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"EO8541",@"Finance",@"Finance",@"WIT",@"295",@"075",@"055",@"",@"",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"",
     @"CD0602",@"General Arts",@"General Arts",@"DBS",@"165",@"540",@"450",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"DP2766",@"Pharmacy",@"Pharmacy",@"GMIT",@"075",@"055",@"440",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"KG0035",@"Civil Engineering",@"Civil Engineering",@"NUIM",@"275",@"045",@"230",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"IG4894",@"Chemical Science",@"Chemical Science",@"UCD",@"230",@"285",@"175",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"FQ4384",@"Accountancy",@"Accountancy",@"UCC",@"270",@"165",@"540",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"KR5685",@"Commerce",@"Commerce",@"TCD",@"075",@"055",@"440",@"",@"",@"",@"",@"",@"",@"",
     @"QF2856",@"Law",@"Law",@"DBS",@"045",@"230",@"285",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"JF0040",@"Food Science",@"Food Science",@"GMIT",@"055",@"490",@"095",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"BH9420",@"Civil Engineering",@"Civil Engineering",@"UL",@"545",@"105",@"270",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"RO7607",@"Physics",@"Physics",@"UL",@"450",@"055",@"490",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"ML8035",@"Finance",@"Finance",@"WIT",@"075",@"055",@"440",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"LL8736",@"Food Science",@"Food Science",@"DBS",@"270",@"165",@"540",@"Not all people on these points were offered places on this course",@"",@"",@"",@"",@"",@"",
     @"NR0486",@"Business Information Systems",@"Business Information Sy",@"GMIT",@"545",@"105",@"270",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"",@"",
     @"JM8616",@"Civil Engineering",@"Civil Engineering",@"TCD",@"075",@"055",@"440",@"",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"EF7306",@"Finance",@"Finance",@"UCC",@"075",@"055",@"440",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"DN5484",@"Commerce",@"Commerce",@"UL",@"075",@"055",@"440",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"RD9506",@"Electrical Engineering",@"Electrical Engine",@"WIT",@"045",@"230",@"285",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"BC0494",@"Chemical Science",@"Chemical Science",@"UCC",@"105",@"270",@"165",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"RI0313",@"Business and Accounting",@"Business and Accou",@"NUIM",@"095",@"235",@"380",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"LM3071",@"Finance",@"Finance",@"CIT",@"540",@"450",@"055",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"IO5210",@"Accountancy",@"Accountancy",@"DBS",@"275",@"045",@"230",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"MH5600",@"Electrical Engineering",@"Electrical Engine",@"CIT",@"275",@"045",@"230",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"EG6273",@"Business and Accounting",@"Business and Accou",@"CIT",@"270",@"165",@"540",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"QQ7261",@"Civil Engineering",@"Civil Engineering",@"UCC",@"045",@"230",@"285",@"Not all people on these points were offered places on this course",@"",@"",@"",@"",@"",@"Project/Portfolio",
     @"IN9618",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"UCD",@"545",@"105",@"270",@"",@"",@"",@"",@"",@"",@"Project/Portfolio",
     @"JN6583",@"Chemical Science",@"Chemical Science",@"NUIG",@"380",@"295",@"075",@"",@"",@"Offer dependent on Interview",@"",@"",@"",@"",
     @"ER5294",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"UL",@"440",@"275",@"045",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"Vacant Places",@"",
     @"DD1584",@"Business Information Systems",@"Business Information Sy",@"UCD",@"270",@"165",@"540",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"QB9410",@"Finance",@"Finance",@"NUIM",@"450",@"055",@"490",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"HK4140",@"Chemical Science",@"Chemical Science",@"DBS",@"380",@"295",@"075",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"JQ1442",@"Electrical Engineering",@"Electrical Engine",@"NUIG",@"490",@"095",@"235",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"BB1012",@"Finance",@"Finance",@"UL",@"075",@"055",@"440",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"HS5851",@"Food Science",@"Food Science",@"DCU",@"095",@"235",@"380",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"LE4920",@"Electrical Engineering",@"Electrical Engine",@"TCD",@"230",@"285",@"175",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"KP2738",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"NUIM",@"270",@"165",@"540",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"OS4174",@"Environmental Science",@"Environmental Sc",@"NUIG",@"105",@"270",@"165",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"RR5386",@"Finance",@"Finance",@"WIT",@"235",@"380",@"295",@"",@"",@"",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"OE7428",@"Nutritional Science",@"Nutritional Science",@"TCD",@"490",@"095",@"235",@"Not all people on these points were offered places on this course",@"",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"CG0463",@"Law",@"Law",@"NUIM",@"055",@"490",@"095",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"QH3366",@"Electrical Engineering",@"Electrical Engine",@"CIT",@"075",@"055",@"440",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"JQ2223",@"Accountancy",@"Accountancy",@"NUIG",@"450",@"055",@"490",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"QH7149",@"Finance",@"Finance",@"DBS",@"045",@"230",@"285",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"CJ8457",@"Commerce",@"Commerce",@"WIT",@"380",@"295",@"075",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"DQ1639",@"Business and Accounting",@"Business and Accou",@"UCC",@"490",@"095",@"235",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"DK7527",@"Accountancy",@"Accountancy",@"NUIM",@"075",@"055",@"440",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"NH8790",@"Civil Engineering",@"Civil Engineering",@"UL",@"075",@"055",@"440",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"SC2312",@"Nutritional Science",@"Nutritional Science",@"DBS",@"275",@"045",@"230",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"",@"Project/Portfolio",
     @"CK3684",@"Electrical Engineering",@"Electrical Engine",@"WIT",@"230",@"285",@"175",@"Not all people on these points were offered places on this course",@"",@"",@"",@"",@"Vacant Places",@"",
     @"LQ1504",@"Civil Engineering",@"Civil Engineering",@"TCD",@"440",@"275",@"045",@"Not all people on these points were offered places on this course",@"",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"DR5325",@"Physics",@"Physics",@"WIT",@"230",@"285",@"175",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"JO2077",@"Commerce",@"Commerce",@"DIT",@"490",@"095",@"235",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"SF2175",@"Electrical Engineering",@"Electrical Engine",@"UL",@"230",@"285",@"175",@"",@"",@"",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"PB1000",@"Physics",@"Physics",@"UCD",@"055",@"490",@"095",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"MI7386",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"DBS",@"545",@"105",@"270",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"ED3874",@"Food Science",@"Food Science",@"UL",@"230",@"285",@"175",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"PD2539",@"Physics",@"Physics",@"DCU",@"055",@"490",@"095",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"EM0962",@"Finance",@"Finance",@"NUIG",@"450",@"055",@"490",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"CF9731",@"Business Information Systems",@"Business Information Sy",@"NUIG",@"055",@"490",@"095",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"LB6276",@"Finance",@"Finance",@"UCC",@"095",@"235",@"380",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"NH1625",@"Business and Accounting",@"Business and Accou",@"NUIM",@"095",@"235",@"380",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"EL8661",@"Finance",@"Finance",@"DBS",@"075",@"055",@"440",@"Not all people on these points were offered places on this course",@"",@"",@"",@"",@"",@"",
     @"PF6002",@"Accountancy",@"Accountancy",@"CIT",@"075",@"055",@"440",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"Vacant Places",@"",
     @"OD2719",@"Electrical Engineering",@"Electrical Engine",@"DBS",@"270",@"165",@"540",@"",@"",@"",@"",@"",@"",@"",
     @"RC7474",@"Business Information Systems",@"Business Information Sy",@"UCC",@"045",@"230",@"285",@"Not all people on these points were offered places on this course",@"",@"",@"",@"",@"Vacant Places",@"",
     @"JF2806",@"Environmental Science",@"Environmental Sc",@"UCD",@"270",@"165",@"540",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"BF2388",@"Physics",@"Physics",@"DCU",@"275",@"045",@"230",@"",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"GM4262",@"Business Information Systems",@"Business Information Sy",@"UCD",@"270",@"165",@"540",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"MS1361",@"Business and Accounting",@"Business and Accou",@"DBS",@"275",@"045",@"230",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"HG1609",@"Law",@"Law",@"UCC",@"490",@"095",@"235",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"PP7504",@"Chemical Science",@"Chemical Science",@"TCD",@"295",@"075",@"055",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"DR6912",@"Accountancy",@"Accountancy",@"DBS",@"450",@"055",@"490",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"SN5290",@"Business and Accounting",@"Business and Accou",@"CIT",@"165",@"540",@"450",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"",
     @"KR1809",@"Electrical Engineering",@"Electrical Engine",@"NUIM",@"230",@"285",@"175",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"MH0248",@"Law",@"Law",@"NUIM",@"270",@"165",@"540",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"OK1240",@"Commerce",@"Commerce",@"DCU",@"275",@"045",@"230",@"Not all people on these points were offered places on this course",@"",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"HL8160",@"Pharmacy",@"Pharmacy",@"DCU",@"295",@"075",@"055",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"NL4620",@"Business and Accounting",@"Business and Accou",@"NUIM",@"045",@"230",@"285",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"IJ1035",@"Chemical Science",@"Chemical Science",@"UCC",@"095",@"235",@"380",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"ME2220",@"Civil Engineering",@"Civil Engineering",@"CIT",@"440",@"275",@"045",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"FE0285",@"Electrical Engineering",@"Electrical Engine",@"DBS",@"230",@"285",@"175",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"EP4034",@"Civil Engineering",@"Civil Engineering",@"DIT",@"545",@"105",@"270",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"OE8663",@"Commerce",@"Commerce",@"DIT",@"450",@"055",@"490",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"RO0690",@"Commerce",@"Commerce",@"UCD",@"440",@"275",@"045",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"RQ7653",@"Accountancy",@"Accountancy",@"NUIG",@"055",@"440",@"275",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"",@"Project/Portfolio",
     @"FR6044",@"Environmental Science",@"Environmental Sc",@"DBS",@"045",@"230",@"285",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"HR2938",@"Electrical Engineering",@"Electrical Engine",@"GMIT",@"105",@"270",@"165",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"BH5868",@"Accountancy",@"Accountancy",@"UCC",@"490",@"095",@"235",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"GJ8739",@"Business and Accounting",@"Business and Accou",@"WIT",@"165",@"540",@"450",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"LQ2846",@"Business and Accounting",@"Business and Accou",@"UCD",@"055",@"490",@"095",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"",@"",
     @"QN2110",@"Electrical Engineering",@"Electrical Engine",@"UCD",@"235",@"380",@"295",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"EN5173",@"Accountancy",@"Accountancy",@"NUIM",@"105",@"270",@"165",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"KN9565",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"GMIT",@"055",@"490",@"095",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"LB1897",@"Accountancy",@"Accountancy",@"TCD",@"450",@"055",@"490",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"",
     @"LR2642",@"Pharmacy",@"Pharmacy",@"CIT",@"450",@"055",@"490",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"PL2327",@"Law",@"Law",@"CIT",@"440",@"275",@"045",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"",@"Project/Portfolio",
     @"IR4471",@"Food Science",@"Food Science",@"UL",@"540",@"450",@"055",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"KO1054",@"Food Science",@"Food Science",@"DBS",@"275",@"045",@"230",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"CB4744",@"General Arts",@"General Arts",@"DBS",@"270",@"165",@"540",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"GD8787",@"Nutritional Science",@"Nutritional Science",@"GMIT",@"105",@"270",@"165",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"GQ8775",@"Commerce",@"Commerce",@"TCD",@"230",@"285",@"175",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"IO6463",@"Civil Engineering",@"Civil Engineering",@"NUIM",@"075",@"055",@"440",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"NQ1713",@"Environmental Science",@"Environmental Sc",@"NUIG",@"295",@"075",@"055",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"LD6941",@"Nutritional Science",@"Nutritional Science",@"NUIG",@"295",@"075",@"055",@"Not all people on these points were offered places on this course",@"",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"OB5291",@"Nutritional Science",@"Nutritional Science",@"GMIT",@"545",@"105",@"270",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"DC9727",@"Civil Engineering",@"Civil Engineering",@"GMIT",@"275",@"045",@"230",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"MI3193",@"Physics",@"Physics",@"UCC",@"230",@"285",@"175",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"RK8684",@"Pharmacy",@"Pharmacy",@"DCU",@"275",@"045",@"230",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"MJ5642",@"Law",@"Law",@"CIT",@"440",@"275",@"045",@"",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"GR8532",@"Nutritional Science",@"Nutritional Science",@"UCD",@"230",@"285",@"175",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"",@"",
     @"HG4800",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"UL",@"105",@"270",@"165",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"JD1854",@"Commerce",@"Commerce",@"DBS",@"235",@"380",@"295",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"EE3014",@"Nutritional Science",@"Nutritional Science",@"CIT",@"380",@"295",@"075",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"MG7692",@"Food Science",@"Food Science",@"NUIG",@"490",@"095",@"235",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"SI2439",@"Physics",@"Physics",@"DIT",@"075",@"055",@"440",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"GR7627",@"Pharmacy",@"Pharmacy",@"DCU",@"055",@"440",@"275",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"KF8409",@"Pharmacy",@"Pharmacy",@"UCC",@"165",@"540",@"450",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"Vacant Places",@"",
     @"FL6560",@"Finance",@"Finance",@"UCC",@"545",@"105",@"270",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"LR0468",@"Food Science",@"Food Science",@"GMIT",@"295",@"075",@"055",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"CJ3467",@"Electrical Engineering",@"Electrical Engine",@"CIT",@"270",@"165",@"540",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"JQ7191",@"Accountancy",@"Accountancy",@"DBS",@"055",@"440",@"275",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"KJ8102",@"Nutritional Science",@"Nutritional Science",@"DIT",@"105",@"270",@"165",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"DD0788",@"Nutritional Science",@"Nutritional Science",@"TCD",@"545",@"105",@"270",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"QI0429",@"Commerce",@"Commerce",@"WIT",@"095",@"235",@"380",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"KK1570",@"Commerce",@"Commerce",@"DCU",@"380",@"295",@"075",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"",@"",
     @"DK8006",@"Business and Accounting",@"Business and Accou",@"UL",@"095",@"235",@"380",@"Not all people on these points were offered places on this course",@"",@"",@"",@"",@"",@"Project/Portfolio",
     @"LC8277",@"Accountancy",@"Accountancy",@"UCD",@"380",@"295",@"075",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"MP3556",@"Electrical Engineering",@"Electrical Engine",@"GMIT",@"055",@"440",@"275",@"",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"GP7840",@"Business Information Systems",@"Business Information Sy",@"DIT",@"440",@"275",@"045",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"LR3316",@"Chemical Science",@"Chemical Science",@"GMIT",@"055",@"490",@"095",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"NE3168",@"Law",@"Law",@"UCC",@"105",@"270",@"165",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"PK6589",@"Accountancy",@"Accountancy",@"UCD",@"095",@"235",@"380",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"MP9999",@"Pharmacy",@"Pharmacy",@"UCC",@"055",@"440",@"275",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"Vacant Places",@"",
     @"DR9623",@"Nutritional Science",@"Nutritional Science",@"UCC",@"270",@"165",@"540",@"Not all people on these points were offered places on this course",@"",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"JB6699",@"Commerce",@"Commerce",@"UCD",@"235",@"380",@"295",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"FH7120",@"Physics",@"Physics",@"DBS",@"275",@"045",@"230",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"",@"Project/Portfolio",
     @"CN6338",@"Accountancy",@"Accountancy",@"DCU",@"055",@"490",@"095",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"CJ3954",@"Civil Engineering",@"Civil Engineering",@"WIT",@"380",@"295",@"075",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@"",@"",@"",
     @"JM7499",@"Finance",@"Finance",@"DBS",@"045",@"230",@"285",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"HI0731",@"Environmental Science",@"Environmental Sc",@"NUIM",@"490",@"095",@"235",@"",@"",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"",
     @"OE6425",@"Commerce",@"Commerce",@"DBS",@"045",@"230",@"285",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"HQ7040",@"Pharmacy",@"Pharmacy",@"NUIG",@"295",@"075",@"055",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"SP8971",@"Business Information Systems",@"Business Information Sy",@"UCC",@"275",@"045",@"230",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"Vacant Places",@"",
     @"IN7174",@"Accountancy",@"Accountancy",@"GMIT",@"165",@"540",@"450",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"QK6604",@"Physics",@"Physics",@"DCU",@"540",@"450",@"055",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"MJ0846",@"Environmental Science",@"Environmental Sc",@"NUIG",@"275",@"045",@"230",@"Not all people on these points were offered places on this course",@"",@"",@"",@"",@"",@"",
     @"JR2078",@"Nutritional Science",@"Nutritional Science",@"UL",@"055",@"490",@"095",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"EH0697",@"Business and Accounting",@"Business and Accou",@"DCU",@"055",@"440",@"275",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"BC9606",@"Environmental Science",@"Environmental Sc",@"UCC",@"045",@"230",@"285",@"",@"",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"PM6224",@"Accountancy",@"Accountancy",@"DBS",@"380",@"295",@"075",@"",@"",@"",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"SG2870",@"Physics",@"Physics",@"DIT",@"380",@"295",@"075",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"JD5402",@"Law",@"Law",@"NUIG",@"230",@"285",@"175",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"BQ0309",@"Accountancy",@"Accountancy",@"UL",@"075",@"055",@"440",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"CB0931",@"General Arts",@"General Arts",@"CIT",@"235",@"380",@"295",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"SG4708",@"Civil Engineering",@"Civil Engineering",@"WIT",@"075",@"055",@"440",@"Not all people on these points were offered places on this course",@"",@"",@"",@"",@"Vacant Places",@"",
     @"QQ3475",@"Chemical Science",@"Chemical Science",@"UCD",@"450",@"055",@"490",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"DF5486",@"Business Information Systems",@"Business Information Sy",@"UCC",@"270",@"165",@"540",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"GI0303",@"Finance",@"Finance",@"UL",@"540",@"450",@"055",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"GJ1387",@"Food Science",@"Food Science",@"DBS",@"440",@"275",@"045",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"DE0748",@"Business Information Systems",@"Business Information Sy",@"UCD",@"275",@"045",@"230",@"Not all people on these points were offered places on this course",@"",@"",@"",@"",@"Vacant Places",@"",
     @"PD6977",@"Law",@"Law",@"WIT",@"275",@"045",@"230",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"FQ9429",@"Finance",@"Finance",@"DCU",@"075",@"055",@"440",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"RM9926",@"Business and Accounting",@"Business and Accou",@"UCC",@"295",@"075",@"055",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"",@"Project/Portfolio",
     @"IS4027",@"General Arts",@"General Arts",@"NUIG",@"235",@"380",@"295",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"DO8486",@"General Arts",@"General Arts",@"NUIM",@"295",@"075",@"055",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"LD3370",@"Law",@"Law",@"UCD",@"540",@"450",@"055",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"MO4209",@"Accountancy",@"Accountancy",@"DIT",@"165",@"540",@"450",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"BO9753",@"Business Information Systems",@"Business Information Sy",@"TCD",@"230",@"285",@"175",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"OM1734",@"Physics",@"Physics",@"DIT",@"230",@"285",@"175",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"DR4199",@"Environmental Science",@"Environmental Sc",@"DIT",@"275",@"045",@"230",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"GJ3693",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"GMIT",@"490",@"095",@"235",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"EI7990",@"General Arts",@"General Arts",@"GMIT",@"490",@"095",@"235",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"DO5592",@"Physics",@"Physics",@"CIT",@"075",@"055",@"440",@"",@"",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"QP4114",@"Civil Engineering",@"Civil Engineering",@"TCD",@"235",@"380",@"295",@"Not all people on these points were offered places on this course",@"",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"LH9150",@"Finance",@"Finance",@"DIT",@"380",@"295",@"075",@"Not all people on these points were offered places on this course",@"",@"",@"",@"",@"",@"Project/Portfolio",
     @"FI7350",@"Environmental Science",@"Environmental Sc",@"TCD",@"490",@"095",@"235",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"FH7645",@"Business Information Systems",@"Business Information Sy",@"DBS",@"295",@"075",@"055",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"DC6586",@"General Arts",@"General Arts",@"NUIG",@"095",@"235",@"380",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"KL7442",@"Food Science",@"Food Science",@"DCU",@"270",@"165",@"540",@"Not all people on these points were offered places on this course",@"",@"",@"",@"",@"",@"",
     @"PL4697",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"WIT",@"270",@"165",@"540",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"OR0868",@"Civil Engineering",@"Civil Engineering",@"NUIG",@"545",@"105",@"270",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@"",@"",@"Project/Portfolio",
     @"JH2409",@"Law",@"Law",@"UCC",@"045",@"230",@"285",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"",@"Project/Portfolio",
     @"QB2402",@"Nutritional Science",@"Nutritional Science",@"DBS",@"105",@"270",@"165",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"RB0908",@"Finance",@"Finance",@"NUIM",@"235",@"380",@"295",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"MH6364",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"CIT",@"540",@"450",@"055",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"",@"Project/Portfolio",
     @"IR5128",@"Electrical Engineering",@"Electrical Engine",@"TCD",@"270",@"165",@"540",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"SH8020",@"Law",@"Law",@"UCC",@"490",@"095",@"235",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"RK8466",@"Chemical Science",@"Chemical Science",@"TCD",@"490",@"095",@"235",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"SK8083",@"Business and Accounting",@"Business and Accou",@"UL",@"235",@"380",@"295",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"DS8283",@"Commerce",@"Commerce",@"TCD",@"380",@"295",@"075",@"",@"",@"Offer dependent on Interview",@"",@"",@"",@"Project/Portfolio",
     @"FK2883",@"Business Information Systems",@"Business Information Sy",@"DIT",@"380",@"295",@"075",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"DP2042",@"Accountancy",@"Accountancy",@"WIT",@"270",@"165",@"540",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"CE1378",@"Nutritional Science",@"Nutritional Science",@"CIT",@"270",@"165",@"540",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"",
     @"FK9735",@"Commerce",@"Commerce",@"CIT",@"235",@"380",@"295",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"ED3177",@"Nutritional Science",@"Nutritional Science",@"TCD",@"545",@"105",@"270",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"IC8866",@"Finance",@"Finance",@"TCD",@"380",@"295",@"075",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"CI9603",@"Law",@"Law",@"NUIG",@"075",@"055",@"440",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"SH2011",@"Finance",@"Finance",@"NUIG",@"105",@"270",@"165",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"FO1076",@"Physics",@"Physics",@"UCD",@"165",@"540",@"450",@"Not all people on these points were offered places on this course",@"",@"",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"DK2282",@"Commerce",@"Commerce",@"UCD",@"270",@"165",@"540",@"",@"",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"",
     @"EN7540",@"Civil Engineering",@"Civil Engineering",@"DCU",@"380",@"295",@"075",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"NO0945",@"Commerce",@"Commerce",@"UL",@"230",@"285",@"175",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"MR0592",@"Electrical Engineering",@"Electrical Engine",@"DIT",@"095",@"235",@"380",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"MS8455",@"Business and Accounting",@"Business and Accou",@"DIT",@"165",@"540",@"450",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"IK7328",@"Accountancy",@"Accountancy",@"TCD",@"075",@"055",@"440",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"PO2119",@"Business and Accounting",@"Business and Accou",@"DBS",@"045",@"230",@"285",@"Not all people on these points were offered places on this course",@"",@"",@"",@"",@"",@"Project/Portfolio",
     @"GF8862",@"Accountancy",@"Accountancy",@"TCD",@"095",@"235",@"380",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"MO2507",@"Business and Accounting",@"Business and Accou",@"NUIG",@"230",@"285",@"175",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"IM7136",@"Accountancy",@"Accountancy",@"UL",@"380",@"295",@"075",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"QP6792",@"General Arts",@"General Arts",@"DIT",@"105",@"270",@"165",@"",@"",@"",@"",@"",@"",@"",
     @"QQ3061",@"Civil Engineering",@"Civil Engineering",@"GMIT",@"095",@"235",@"380",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"IO8014",@"Nutritional Science",@"Nutritional Science",@"NUIG",@"545",@"105",@"270",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"GC7983",@"Finance",@"Finance",@"NUIG",@"095",@"235",@"380",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"GS6091",@"Business Information Systems",@"Business Information Sy",@"UCC",@"165",@"540",@"450",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"FJ3650",@"Business Information Systems",@"Business Information Sy",@"DIT",@"055",@"440",@"275",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"QF7392",@"Law",@"Law",@"DBS",@"165",@"540",@"450",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"DB9785",@"Nutritional Science",@"Nutritional Science",@"TCD",@"075",@"055",@"440",@"Not all people on these points were offered places on this course",@"",@"",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"NG3568",@"Commerce",@"Commerce",@"UCD",@"105",@"270",@"165",@"Not all people on these points were offered places on this course",@"",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"QC6025",@"Electrical Engineering",@"Electrical Engine",@"DCU",@"270",@"165",@"540",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"LC2619",@"Business Information Systems",@"Business Information Sy",@"GMIT",@"075",@"055",@"440",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"",@"",
     @"KJ8166",@"General Arts",@"General Arts",@"WIT",@"545",@"105",@"270",@"Not all people on these points were offered places on this course",@"",@"",@"",@"",@"",@"",
     @"DR5847",@"Law",@"Law",@"DCU",@"055",@"440",@"275",@"Not all people on these points were offered places on this course",@"",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"RP5342",@"Business Information Systems",@"Business Information Sy",@"DIT",@"270",@"165",@"540",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"GH1915",@"Accountancy",@"Accountancy",@"DIT",@"235",@"380",@"295",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"",@"",
     @"BH9412",@"Law",@"Law",@"WIT",@"380",@"295",@"075",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"IS6952",@"Nutritional Science",@"Nutritional Science",@"UCC",@"440",@"275",@"045",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"RQ5045",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"UCC",@"075",@"055",@"440",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"",@"",
     @"FO5779",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"CIT",@"440",@"275",@"045",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"JO9311",@"Physics",@"Physics",@"UCC",@"270",@"165",@"540",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"OI6974",@"Finance",@"Finance",@"UL",@"235",@"380",@"295",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"LC6386",@"Law",@"Law",@"NUIG",@"095",@"235",@"380",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"HI5727",@"Nutritional Science",@"Nutritional Science",@"UCC",@"490",@"095",@"235",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"",
     @"FM2104",@"Business Information Systems",@"Business Information Sy",@"UL",@"045",@"230",@"285",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"MQ1551",@"Business and Accounting",@"Business and Accou",@"DBS",@"275",@"045",@"230",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"ME0147",@"Accountancy",@"Accountancy",@"DIT",@"450",@"055",@"490",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"JL2400",@"Physics",@"Physics",@"GMIT",@"275",@"045",@"230",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"IJ1488",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"WIT",@"105",@"270",@"165",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"",@"",
     @"SC5798",@"Law",@"Law",@"DIT",@"055",@"440",@"275",@"Not all people on these points were offered places on this course",@"",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"IH9435",@"Electrical Engineering",@"Electrical Engine",@"UL",@"230",@"285",@"175",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"PG9764",@"Pharmacy",@"Pharmacy",@"UCD",@"045",@"230",@"285",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"",
     @"IP1902",@"Nutritional Science",@"Nutritional Science",@"UL",@"095",@"235",@"380",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"IM3842",@"Accountancy",@"Accountancy",@"NUIM",@"055",@"440",@"275",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"HN3428",@"Chemical Science",@"Chemical Science",@"TCD",@"230",@"285",@"175",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"CG2061",@"Accountancy",@"Accountancy",@"DCU",@"295",@"075",@"055",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"LO6877",@"Accountancy",@"Accountancy",@"TCD",@"440",@"275",@"045",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"GO0120",@"Finance",@"Finance",@"DIT",@"095",@"235",@"380",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"KH0729",@"Accountancy",@"Accountancy",@"TCD",@"450",@"055",@"490",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"IS2385",@"Law",@"Law",@"UCC",@"165",@"540",@"450",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"FQ3627",@"Environmental Science",@"Environmental Sc",@"DIT",@"540",@"450",@"055",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"KH3640",@"Business Information Systems",@"Business Information Sy",@"CIT",@"095",@"235",@"380",@"",@"",@"",@"",@"",@"",@"Project/Portfolio",
     @"CJ0747",@"Accountancy",@"Accountancy",@"UCD",@"540",@"450",@"055",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"",@"Project/Portfolio",
     @"FE1721",@"Accountancy",@"Accountancy",@"DIT",@"490",@"095",@"235",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"KQ8380",@"Environmental Science",@"Environmental Sc",@"GMIT",@"045",@"230",@"285",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"",@"Project/Portfolio",
     @"MI5883",@"Finance",@"Finance",@"UCD",@"380",@"295",@"075",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"RL7657",@"General Arts",@"General Arts",@"GMIT",@"540",@"450",@"055",@"Not all people on these points were offered places on this course",@"",@"",@"",@"",@"",@"Project/Portfolio",
     @"HD9282",@"Accountancy",@"Accountancy",@"UCC",@"045",@"230",@"285",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"JQ8522",@"Chemical Science",@"Chemical Science",@"NUIM",@"055",@"440",@"275",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"OK8506",@"Physics",@"Physics",@"DIT",@"075",@"055",@"440",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"SR4540",@"Finance",@"Finance",@"TCD",@"295",@"075",@"055",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"JN7321",@"Accountancy",@"Accountancy",@"WIT",@"380",@"295",@"075",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"FM9343",@"Accountancy",@"Accountancy",@"NUIM",@"440",@"275",@"045",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"Vacant Places",@"",
     @"FH0695",@"Pharmacy",@"Pharmacy",@"DBS",@"230",@"285",@"175",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"Vacant Places",@"",
     nil];
    
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







