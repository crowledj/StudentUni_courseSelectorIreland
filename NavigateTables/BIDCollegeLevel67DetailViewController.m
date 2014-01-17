//
//  BIDCollegeLevel67DetailViewController.m
//  NavigateTables
//
//  Created by EventHorizon on 07/01/2014.
//  Copyright (c) 2014 EventHorizon. All rights reserved.
//


//  CollegeLevelDetailViewController.m
//  NavigateTables
//
//  Created by EventHorizon on 02/06/2013.
//  Copyright (c) 2013 EventHorizon. All rights reserved.
//

#import <objc/runtime.h>
#import "BIDCollegeLevel67DetailViewController.h"
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

@implementation UIButton(assign)

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


@interface BIDCollegeLevel67DetailViewController ()
{
    sqlite3 *db;
}

@end




@implementation BIDCollegeLevel67DetailViewController



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
    
    [self createTableOneNamed : @"CAO_collegeLevel67GenData_7add_fieldsStrings" withField1: @"courseID" withField2: @"courseName" withField3: @"abbrev. courseName" withField4: @"college" withField5: @"2010" withField6: @"2011" withField7: @"2012" withField8: @"NotAllonPtsOffered" withField9: @"MusictestInterview" withField10: @"Interview" withField11: @"testInterviewPortfolio" withField12: @"AQA" withField13: @"VacantPlaces" withField14: @"Matriculate"];
    
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
        
        
        
        [self insertRecordIntoTableNamed: @"CAO_collegeLevel67GenData_7add_fieldsStrings"
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
    NSString *mainTable=@"CAO_collegeLevel67GenData_7add_fieldsStrings";
    
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
    
    [NSArray arrayWithObjects:@"GF1676",@"Finance",@"Finance",@"NUIM",@"560",@"190",@"365",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"QL2804",@"Food Science",@"Food Science",@"DIT",@"175",@"420",@"395",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"HP8121",@"Business and Accounting",@"Business and Accou",@"NUIM",@"020",@"195",@"070",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"BI6099",@"General Arts",@"General Arts",@"CIT",@"275",@"175",@"420",@"",@"",@"Offer dependent on Interview",@"",@"",@"",@"Project/Portfolio",
     @"EP9293",@"Law",@"Law",@"UCD",@"215",@"340",@"510",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"CM2238",@"Food Science",@"Food Science",@"UCD",@"275",@"175",@"420",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"",@"Project/Portfolio",
     @"EG0441",@"Accountancy",@"Accountancy",@"TCD",@"365",@"215",@"340",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@"",@"",@"",
     @"JJ2725",@"Business and Accounting",@"Business and Accou",@"DCU",@"560",@"190",@"365",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"IJ1050",@"Electrical Engineering",@"Electrical Engine",@"UCC",@"365",@"215",@"340",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"NG9723",@"Accountancy",@"Accountancy",@"WIT",@"230",@"560",@"190",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"MJ8564",@"Chemical Science",@"Chemical Science",@"GMIT",@"110",@"275",@"175",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"",@"Project/Portfolio",
     @"LF0116",@"Business Information Systems",@"Business Information Sy",@"UCC",@"195",@"070",@"420",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"NL3180",@"General Arts",@"General Arts",@"DCU",@"420",@"555",@"230",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"MS0588",@"Food Science",@"Food Science",@"UL",@"070",@"420",@"555",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"NF5706",@"Accountancy",@"Accountancy",@"TCD",@"555",@"230",@"560",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"",
     @"KO2236",@"Accountancy",@"Accountancy",@"UCC",@"110",@"275",@"175",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"PN1451",@"Accountancy",@"Accountancy",@"WIT",@"555",@"230",@"560",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"RF5537",@"Finance",@"Finance",@"DCU",@"275",@"175",@"420",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"BJ5334",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"DCU",@"215",@"340",@"510",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"",
     @"SB1702",@"Finance",@"Finance",@"CIT",@"340",@"510",@"445",@"",@"",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"",
     @"JS7653",@"Food Science",@"Food Science",@"DIT",@"420",@"395",@"220",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"KB7123",@"Environmental Science",@"Environmental Sc",@"NUIG",@"340",@"510",@"445",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"JO3407",@"Law",@"Law",@"CIT",@"195",@"070",@"420",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"LS8187",@"Accountancy",@"Accountancy",@"DIT",@"395",@"220",@"020",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"EN1547",@"Finance",@"Finance",@"GMIT",@"420",@"555",@"230",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"RL2548",@"Business Information Systems",@"Business Information Sy",@"WIT",@"340",@"510",@"445",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"II3517",@"Business Information Systems",@"Business Information Sy",@"UCC",@"420",@"555",@"230",@"",@"",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"JS9638",@"Law",@"Law",@"WIT",@"020",@"195",@"070",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"CS6330",@"Pharmacy",@"Pharmacy",@"DIT",@"555",@"230",@"560",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"JL1216",@"General Arts",@"General Arts",@"DBS",@"340",@"510",@"445",@"",@"",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"NB4240",@"Pharmacy",@"Pharmacy",@"DIT",@"215",@"340",@"510",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"QR9052",@"Business and Accounting",@"Business and Accou",@"TCD",@"190",@"365",@"215",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"OD0465",@"Business and Accounting",@"Business and Accou",@"UCD",@"020",@"195",@"070",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"BC9231",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"UL",@"395",@"220",@"020",@"Not all people on these points were offered places on this course",@"",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"BJ5206",@"Law",@"Law",@"NUIG",@"190",@"365",@"215",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"Vacant Places",@"",
     @"KM9695",@"Finance",@"Finance",@"WIT",@"560",@"190",@"365",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"SK1590",@"Law",@"Law",@"DIT",@"560",@"190",@"365",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"MJ7863",@"Physics",@"Physics",@"UCC",@"070",@"420",@"555",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"SN5934",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"WIT",@"510",@"445",@"175",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"GI0074",@"Environmental Science",@"Environmental Sc",@"UL",@"420",@"395",@"220",@"Not all people on these points were offered places on this course",@"",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"NL3973",@"Commerce",@"Commerce",@"NUIM",@"510",@"445",@"175",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"DK3434",@"Civil Engineering",@"Civil Engineering",@"TCD",@"020",@"195",@"070",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"ME9542",@"Food Science",@"Food Science",@"UL",@"560",@"190",@"365",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"CD6331",@"Commerce",@"Commerce",@"WIT",@"110",@"275",@"175",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"NH9864",@"Food Science",@"Food Science",@"DBS",@"275",@"175",@"420",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"LP9321",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"WIT",@"215",@"340",@"510",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"OF2671",@"Pharmacy",@"Pharmacy",@"DIT",@"215",@"340",@"510",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"IP8836",@"Business and Accounting",@"Business and Accou",@"NUIM",@"395",@"220",@"020",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"CN7717",@"Commerce",@"Commerce",@"GMIT",@"230",@"560",@"190",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"KI1599",@"Accountancy",@"Accountancy",@"CIT",@"110",@"275",@"175",@"",@"",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"RK8306",@"Chemical Science",@"Chemical Science",@"NUIG",@"365",@"215",@"340",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"BE6078",@"Electrical Engineering",@"Electrical Engine",@"UL",@"215",@"340",@"510",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"",@"",
     @"BQ6087",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"DBS",@"420",@"555",@"230",@"",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"CF6623",@"Nutritional Science",@"Nutritional Science",@"WIT",@"190",@"365",@"215",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"JM5676",@"Physics",@"Physics",@"UCD",@"070",@"420",@"555",@"",@"",@"",@"",@"",@"Vacant Places",@"",
     @"PL4220",@"Chemical Science",@"Chemical Science",@"UL",@"510",@"445",@"175",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"PD3903",@"Business Information Systems",@"Business Information Sy",@"UCC",@"420",@"395",@"220",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"HC8149",@"Business and Accounting",@"Business and Accou",@"DIT",@"395",@"220",@"020",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"BR2695",@"Civil Engineering",@"Civil Engineering",@"CIT",@"230",@"560",@"190",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"RI8202",@"Law",@"Law",@"GMIT",@"555",@"230",@"560",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"PO9280",@"Pharmacy",@"Pharmacy",@"NUIG",@"275",@"175",@"420",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"",
     @"IQ7857",@"Food Science",@"Food Science",@"DBS",@"365",@"215",@"340",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"IH3502",@"Electrical Engineering",@"Electrical Engine",@"WIT",@"220",@"020",@"195",@"",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"LR4588",@"Finance",@"Finance",@"NUIG",@"365",@"215",@"340",@"",@"",@"",@"",@"",@"Vacant Places",@"",
     @"RH8722",@"Physics",@"Physics",@"WIT",@"175",@"420",@"395",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"MF2349",@"Electrical Engineering",@"Electrical Engine",@"UCC",@"340",@"510",@"445",@"Not all people on these points were offered places on this course",@"",@"",@"",@"",@"Vacant Places",@"",
     @"SR4722",@"Food Science",@"Food Science",@"GMIT",@"195",@"070",@"420",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"QQ3018",@"Environmental Science",@"Environmental Sc",@"CIT",@"070",@"420",@"555",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"GM3260",@"Law",@"Law",@"UL",@"340",@"510",@"445",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"",
     @"JB4802",@"Commerce",@"Commerce",@"CIT",@"230",@"560",@"190",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"MC9007",@"Electrical Engineering",@"Electrical Engine",@"DCU",@"510",@"445",@"175",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"QR4437",@"Business Information Systems",@"Business Information Sy",@"NUIM",@"420",@"555",@"230",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@"",@"",@"",
     @"BL5951",@"Nutritional Science",@"Nutritional Science",@"UL",@"420",@"555",@"230",@"",@"",@"",@"",@"",@"",@"Project/Portfolio",
     @"SH0680",@"Finance",@"Finance",@"DIT",@"365",@"215",@"340",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"KN1185",@"Physics",@"Physics",@"WIT",@"365",@"215",@"340",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"FQ4671",@"General Arts",@"General Arts",@"CIT",@"230",@"560",@"190",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"RK0102",@"Accountancy",@"Accountancy",@"TCD",@"340",@"510",@"445",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"GI3458",@"Physics",@"Physics",@"DBS",@"230",@"560",@"190",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"GB8813",@"Commerce",@"Commerce",@"TCD",@"230",@"560",@"190",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"OB9368",@"Law",@"Law",@"DIT",@"215",@"340",@"510",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"BI3619",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"UCD",@"365",@"215",@"340",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"RB0069",@"General Arts",@"General Arts",@"UCC",@"070",@"420",@"555",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"JE2851",@"Law",@"Law",@"CIT",@"215",@"340",@"510",@"Not all people on these points were offered places on this course",@"",@"",@"",@"",@"",@"Project/Portfolio",
     @"OJ6504",@"Accountancy",@"Accountancy",@"DBS",@"420",@"555",@"230",@"",@"",@"",@"",@"",@"Vacant Places",@"",
     @"RS5512",@"Business Information Systems",@"Business Information Sy",@"WIT",@"195",@"070",@"420",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"BH3027",@"Food Science",@"Food Science",@"DIT",@"190",@"365",@"215",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"",
     @"FK2731",@"Electrical Engineering",@"Electrical Engine",@"UCC",@"555",@"230",@"560",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"SH8123",@"Chemical Science",@"Chemical Science",@"UCD",@"560",@"190",@"365",@"",@"",@"Offer dependent on Interview",@"",@"",@"",@"Project/Portfolio",
     @"OK2524",@"Business Information Systems",@"Business Information Sy",@"TCD",@"020",@"195",@"070",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"",@"Project/Portfolio",
     @"FK9139",@"General Arts",@"General Arts",@"UCC",@"020",@"195",@"070",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"SE2669",@"Law",@"Law",@"CIT",@"420",@"395",@"220",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"LC9225",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"NUIM",@"070",@"420",@"555",@"Not all people on these points were offered places on this course",@"",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"QL4892",@"Business and Accounting",@"Business and Accou",@"DBS",@"215",@"340",@"510",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"DE4328",@"Environmental Science",@"Environmental Sc",@"DIT",@"070",@"420",@"555",@"",@"",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"FF3941",@"Civil Engineering",@"Civil Engineering",@"DIT",@"560",@"190",@"365",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"DD5704",@"Nutritional Science",@"Nutritional Science",@"GMIT",@"420",@"555",@"230",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"MP1608",@"Business and Accounting",@"Business and Accou",@"TCD",@"070",@"420",@"555",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"JQ0125",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"WIT",@"555",@"230",@"560",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"FK8273",@"Accountancy",@"Accountancy",@"NUIG",@"395",@"220",@"020",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"",
     @"LO5701",@"Chemical Science",@"Chemical Science",@"NUIG",@"190",@"365",@"215",@"",@"",@"Offer dependent on Interview",@"",@"",@"",@"Project/Portfolio",
     @"JS1391",@"Food Science",@"Food Science",@"WIT",@"070",@"420",@"555",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"ES1227",@"General Arts",@"General Arts",@"NUIM",@"220",@"020",@"195",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"OR9222",@"Civil Engineering",@"Civil Engineering",@"DCU",@"340",@"510",@"445",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"KB8184",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"NUIM",@"020",@"195",@"070",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"FP8578",@"Accountancy",@"Accountancy",@"UL",@"340",@"510",@"445",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"QK5072",@"Business and Accounting",@"Business and Accou",@"GMIT",@"220",@"020",@"195",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"HK8067",@"Physics",@"Physics",@"WIT",@"510",@"445",@"175",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"CG0727",@"Commerce",@"Commerce",@"GMIT",@"070",@"420",@"555",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"SC8560",@"Finance",@"Finance",@"NUIG",@"275",@"175",@"420",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"OL5824",@"Accountancy",@"Accountancy",@"CIT",@"555",@"230",@"560",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"",
     @"OH8158",@"Finance",@"Finance",@"WIT",@"395",@"220",@"020",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"BK6060",@"Accountancy",@"Accountancy",@"DCU",@"560",@"190",@"365",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"QR6121",@"Electrical Engineering",@"Electrical Engine",@"DIT",@"560",@"190",@"365",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"DI2167",@"Pharmacy",@"Pharmacy",@"CIT",@"175",@"420",@"395",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"MR0641",@"Accountancy",@"Accountancy",@"UCD",@"420",@"395",@"220",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"KG8568",@"Law",@"Law",@"DCU",@"230",@"560",@"190",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"QC6659",@"Pharmacy",@"Pharmacy",@"DIT",@"175",@"420",@"395",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"IE0920",@"Physics",@"Physics",@"DBS",@"340",@"510",@"445",@"Not all people on these points were offered places on this course",@"",@"",@"",@"",@"",@"Project/Portfolio",
     @"RR6474",@"Business Information Systems",@"Business Information Sy",@"GMIT",@"195",@"070",@"420",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"GN1584",@"Electrical Engineering",@"Electrical Engine",@"GMIT",@"555",@"230",@"560",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"QI1096",@"Law",@"Law",@"WIT",@"560",@"190",@"365",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"HG2790",@"Business and Accounting",@"Business and Accou",@"TCD",@"195",@"070",@"420",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"SM4303",@"Environmental Science",@"Environmental Sc",@"GMIT",@"365",@"215",@"340",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"PG4963",@"Food Science",@"Food Science",@"NUIG",@"365",@"215",@"340",@"",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"HN6167",@"Law",@"Law",@"UCC",@"275",@"175",@"420",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"RF5220",@"Accountancy",@"Accountancy",@"UL",@"340",@"510",@"445",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"GC8664",@"Law",@"Law",@"UCD",@"340",@"510",@"445",@"",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"LE2305",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"WIT",@"560",@"190",@"365",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"RP1731",@"Chemical Science",@"Chemical Science",@"UCD",@"215",@"340",@"510",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"NC8752",@"Electrical Engineering",@"Electrical Engine",@"NUIG",@"215",@"340",@"510",@"Not all people on these points were offered places on this course",@"",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"HP6801",@"Food Science",@"Food Science",@"GMIT",@"340",@"510",@"445",@"",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"HB8341",@"Commerce",@"Commerce",@"DBS",@"555",@"230",@"560",@"",@"",@"Offer dependent on Interview",@"",@"",@"",@"",
     @"KG1709",@"Chemical Science",@"Chemical Science",@"NUIG",@"195",@"070",@"420",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"CQ5193",@"Civil Engineering",@"Civil Engineering",@"UCC",@"395",@"220",@"020",@"",@"",@"",@"",@"",@"",@"Project/Portfolio",
     @"DI0746",@"General Arts",@"General Arts",@"DCU",@"110",@"275",@"175",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"ES3065",@"Accountancy",@"Accountancy",@"TCD",@"395",@"220",@"020",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"FB3499",@"Civil Engineering",@"Civil Engineering",@"WIT",@"395",@"220",@"020",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"NO0885",@"Pharmacy",@"Pharmacy",@"DIT",@"420",@"395",@"220",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"FF8655",@"Environmental Science",@"Environmental Sc",@"UL",@"395",@"220",@"020",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"",@"Project/Portfolio",
     @"JR5000",@"Food Science",@"Food Science",@"NUIG",@"395",@"220",@"020",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"FP5442",@"Finance",@"Finance",@"CIT",@"175",@"420",@"395",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"OS3358",@"Food Science",@"Food Science",@"UL",@"420",@"395",@"220",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"SK8164",@"Chemical Science",@"Chemical Science",@"WIT",@"395",@"220",@"020",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"",@"",
     @"FL5176",@"Nutritional Science",@"Nutritional Science",@"CIT",@"175",@"420",@"395",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"OL8231",@"Nutritional Science",@"Nutritional Science",@"NUIG",@"555",@"230",@"560",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"PD8003",@"Accountancy",@"Accountancy",@"NUIM",@"175",@"420",@"395",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"OB6922",@"Chemical Science",@"Chemical Science",@"CIT",@"195",@"070",@"420",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"EH5727",@"Chemical Science",@"Chemical Science",@"DCU",@"230",@"560",@"190",@"",@"",@"",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"SR4544",@"Pharmacy",@"Pharmacy",@"TCD",@"020",@"195",@"070",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"EQ8298",@"Accountancy",@"Accountancy",@"UCC",@"175",@"420",@"395",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"KN5862",@"Accountancy",@"Accountancy",@"UCC",@"230",@"560",@"190",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"EP3877",@"Accountancy",@"Accountancy",@"WIT",@"195",@"070",@"420",@"",@"",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"",
     @"PK2772",@"Commerce",@"Commerce",@"NUIM",@"215",@"340",@"510",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"EM7002",@"Chemical Science",@"Chemical Science",@"NUIM",@"220",@"020",@"195",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"JD4673",@"Physics",@"Physics",@"TCD",@"110",@"275",@"175",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"CR0279",@"Accountancy",@"Accountancy",@"TCD",@"420",@"555",@"230",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@"",@"",@"",
     @"IH7020",@"Business and Accounting",@"Business and Accou",@"GMIT",@"020",@"195",@"070",@"",@"",@"Offer dependent on Interview",@"",@"",@"",@"",
     @"IK3659",@"Finance",@"Finance",@"CIT",@"420",@"395",@"220",@"",@"",@"",@"",@"",@"",@"",
     @"FK9369",@"Accountancy",@"Accountancy",@"GMIT",@"215",@"340",@"510",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"HB0790",@"Food Science",@"Food Science",@"WIT",@"420",@"555",@"230",@"",@"",@"",@"",@"",@"",@"",
     @"EO8476",@"Food Science",@"Food Science",@"DIT",@"365",@"215",@"340",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"IL9844",@"Accountancy",@"Accountancy",@"UL",@"340",@"510",@"445",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"OI8423",@"Accountancy",@"Accountancy",@"GMIT",@"275",@"175",@"420",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"HH3177",@"Accountancy",@"Accountancy",@"TCD",@"190",@"365",@"215",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"LL4552",@"Business Information Systems",@"Business Information Sy",@"CIT",@"555",@"230",@"560",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"IO7996",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"NUIM",@"195",@"070",@"420",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"",@"",
     @"OC8635",@"General Arts",@"General Arts",@"UCD",@"110",@"275",@"175",@"",@"",@"Offer dependent on Interview",@"",@"",@"",@"",
     @"MQ2710",@"Electrical Engineering",@"Electrical Engine",@"GMIT",@"220",@"020",@"195",@"Not all people on these points were offered places on this course",@"",@"",@"",@"",@"Vacant Places",@"",
     @"BD9742",@"Law",@"Law",@"DCU",@"070",@"420",@"555",@"",@"",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"DB5513",@"Food Science",@"Food Science",@"DIT",@"230",@"560",@"190",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"GG7868",@"Chemical Science",@"Chemical Science",@"TCD",@"215",@"340",@"510",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"OF9804",@"Physics",@"Physics",@"DBS",@"420",@"555",@"230",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"IB6522",@"Environmental Science",@"Environmental Sc",@"WIT",@"510",@"445",@"175",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"JG7779",@"Civil Engineering",@"Civil Engineering",@"WIT",@"340",@"510",@"445",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"BD5556",@"Accountancy",@"Accountancy",@"NUIG",@"365",@"215",@"340",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"PE5843",@"Accountancy",@"Accountancy",@"UL",@"215",@"340",@"510",@"",@"",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"DD3719",@"Civil Engineering",@"Civil Engineering",@"DCU",@"555",@"230",@"560",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"",@"",
     @"GL8638",@"Civil Engineering",@"Civil Engineering",@"CIT",@"230",@"560",@"190",@"Not all people on these points were offered places on this course",@"",@"",@"",@"",@"Vacant Places",@"",
     @"LK7376",@"Food Science",@"Food Science",@"WIT",@"070",@"420",@"555",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"OC7014",@"Accountancy",@"Accountancy",@"TCD",@"110",@"275",@"175",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"FE2945",@"Chemical Science",@"Chemical Science",@"GMIT",@"220",@"020",@"195",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"CL1713",@"Commerce",@"Commerce",@"NUIM",@"110",@"275",@"175",@"Not all people on these points were offered places on this course",@"",@"",@"",@"",@"",@"Project/Portfolio",
     @"OS4960",@"Commerce",@"Commerce",@"NUIG",@"070",@"420",@"555",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"QS9793",@"Finance",@"Finance",@"NUIG",@"365",@"215",@"340",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"II5620",@"General Arts",@"General Arts",@"NUIG",@"420",@"555",@"230",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"ON3470",@"General Arts",@"General Arts",@"UCC",@"070",@"420",@"555",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"PC4814",@"Business and Accounting",@"Business and Accou",@"UL",@"190",@"365",@"215",@"",@"",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"LM6417",@"Pharmacy",@"Pharmacy",@"DCU",@"560",@"190",@"365",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"BS0937",@"Finance",@"Finance",@"NUIG",@"555",@"230",@"560",@"Not all people on these points were offered places on this course",@"",@"",@"",@"",@"",@"",
     @"SI0019",@"Electrical Engineering",@"Electrical Engine",@"TCD",@"110",@"275",@"175",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"EN0730",@"Business Information Systems",@"Business Information Sy",@"GMIT",@"195",@"070",@"420",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"",
     @"DG8473",@"Business Information Systems",@"Business Information Sy",@"UCD",@"420",@"555",@"230",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"",@"Project/Portfolio",
     @"GJ9870",@"Nutritional Science",@"Nutritional Science",@"GMIT",@"340",@"510",@"445",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"PI9871",@"Finance",@"Finance",@"UL",@"275",@"175",@"420",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"LM6859",@"Commerce",@"Commerce",@"UCD",@"395",@"220",@"020",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"FJ8485",@"Accountancy",@"Accountancy",@"UCD",@"020",@"195",@"070",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"GJ9839",@"Law",@"Law",@"TCD",@"365",@"215",@"340",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"BM5638",@"Food Science",@"Food Science",@"TCD",@"215",@"340",@"510",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"DS5770",@"Electrical Engineering",@"Electrical Engine",@"UCD",@"230",@"560",@"190",@"Not all people on these points were offered places on this course",@"",@"",@"",@"",@"",@"Project/Portfolio",
     @"ED3999",@"Business Information Systems",@"Business Information Sy",@"UCC",@"420",@"395",@"220",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"IS1428",@"Law",@"Law",@"DBS",@"195",@"070",@"420",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"OI2910",@"Civil Engineering",@"Civil Engineering",@"UCC",@"175",@"420",@"395",@"",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"ME5714",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"TCD",@"110",@"275",@"175",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"FI0404",@"Chemical Science",@"Chemical Science",@"WIT",@"560",@"190",@"365",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"EH8240",@"Finance",@"Finance",@"GMIT",@"365",@"215",@"340",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"GM6308",@"Business Information Systems",@"Business Information Sy",@"DCU",@"555",@"230",@"560",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"QL7325",@"Accountancy",@"Accountancy",@"DCU",@"340",@"510",@"445",@"Not all people on these points were offered places on this course",@"",@"",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"JS8750",@"Commerce",@"Commerce",@"NUIM",@"365",@"215",@"340",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"",
     @"GQ3560",@"Physics",@"Physics",@"UL",@"365",@"215",@"340",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"OE3790",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"TCD",@"175",@"420",@"395",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"GL7169",@"Accountancy",@"Accountancy",@"DBS",@"365",@"215",@"340",@"",@"",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"MJ3416",@"Food Science",@"Food Science",@"CIT",@"215",@"340",@"510",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"HF5532",@"Physics",@"Physics",@"UCD",@"420",@"555",@"230",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"SC2284",@"Civil Engineering",@"Civil Engineering",@"DBS",@"340",@"510",@"445",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"NL2763",@"Law",@"Law",@"UL",@"175",@"420",@"395",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"DF2040",@"Business Information Systems",@"Business Information Sy",@"DIT",@"340",@"510",@"445",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"CJ6967",@"Commerce",@"Commerce",@"UCC",@"510",@"445",@"175",@"",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"SO6351",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"GMIT",@"110",@"275",@"175",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"MM2527",@"Electrical Engineering",@"Electrical Engine",@"TCD",@"340",@"510",@"445",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"DK4262",@"Business and Accounting",@"Business and Accou",@"GMIT",@"070",@"420",@"555",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"MN3503",@"Business Information Systems",@"Business Information Sy",@"UCD",@"215",@"340",@"510",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"IK7930",@"Law",@"Law",@"NUIG",@"560",@"190",@"365",@"",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"BQ9228",@"Law",@"Law",@"NUIM",@"070",@"420",@"555",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"KM6637",@"General Arts",@"General Arts",@"NUIM",@"175",@"420",@"395",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"",@"Project/Portfolio",
     @"JE5887",@"Food Science",@"Food Science",@"NUIG",@"230",@"560",@"190",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"QP5615",@"Finance",@"Finance",@"UCD",@"420",@"555",@"230",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"JS0500",@"Accountancy",@"Accountancy",@"DIT",@"420",@"395",@"220",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"QO3438",@"Physics",@"Physics",@"NUIG",@"560",@"190",@"365",@"Not all people on these points were offered places on this course",@"",@"",@"",@"",@"",@"",
     @"CM7031",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"UL",@"420",@"395",@"220",@"Not all people on these points were offered places on this course",@"",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"CB6319",@"Finance",@"Finance",@"WIT",@"190",@"365",@"215",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"LL8371",@"Physics",@"Physics",@"DIT",@"340",@"510",@"445",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"PF5433",@"Pharmacy",@"Pharmacy",@"DCU",@"175",@"420",@"395",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"BR6726",@"Law",@"Law",@"CIT",@"190",@"365",@"215",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"LI3162",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"DBS",@"020",@"195",@"070",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"",@"Project/Portfolio",
     @"KI7920",@"Pharmacy",@"Pharmacy",@"UCD",@"275",@"175",@"420",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"FO5155",@"Physics",@"Physics",@"UL",@"020",@"195",@"070",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"NP6851",@"Accountancy",@"Accountancy",@"NUIM",@"190",@"365",@"215",@"Not all people on these points were offered places on this course",@"",@"",@"",@"",@"",@"Project/Portfolio",
     @"KI4897",@"Environmental Science",@"Environmental Sc",@"GMIT",@"420",@"395",@"220",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"QP6368",@"Nutritional Science",@"Nutritional Science",@"DIT",@"110",@"275",@"175",@"",@"",@"",@"",@"",@"",@"",
     @"RR5849",@"Physics",@"Physics",@"DBS",@"560",@"190",@"365",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"",
     @"LG7265",@"Law",@"Law",@"UCD",@"190",@"365",@"215",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"RQ4345",@"General Arts",@"General Arts",@"DCU",@"560",@"190",@"365",@"",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"ES4622",@"Food Science",@"Food Science",@"UCC",@"510",@"445",@"175",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"CD7498",@"Environmental Science",@"Environmental Sc",@"UCC",@"275",@"175",@"420",@"Not all people on these points were offered places on this course",@"",@"",@"",@"",@"",@"Project/Portfolio",
     @"GH2143",@"Finance",@"Finance",@"TCD",@"420",@"555",@"230",@"",@"",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"MO5143",@"Pharmacy",@"Pharmacy",@"NUIM",@"220",@"020",@"195",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"RB5669",@"Business Information Systems",@"Business Information Sy",@"UCC",@"340",@"510",@"445",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"LM8441",@"Business and Accounting",@"Business and Accou",@"CIT",@"340",@"510",@"445",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"",
     @"NH5188",@"Business and Accounting",@"Business and Accou",@"TCD",@"175",@"420",@"395",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"FP8580",@"Chemical Science",@"Chemical Science",@"UCD",@"510",@"445",@"175",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"DI4468",@"Pharmacy",@"Pharmacy",@"WIT",@"110",@"275",@"175",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"QO7633",@"Physics",@"Physics",@"DIT",@"230",@"560",@"190",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"DP5185",@"Accountancy",@"Accountancy",@"DIT",@"215",@"340",@"510",@"",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"QL2085",@"Civil Engineering",@"Civil Engineering",@"WIT",@"175",@"420",@"395",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"SD4726",@"Food Science",@"Food Science",@"DIT",@"220",@"020",@"195",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"ON9551",@"Law",@"Law",@"DCU",@"230",@"560",@"190",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"MR3953",@"Business and Accounting",@"Business and Accou",@"DBS",@"195",@"070",@"420",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"RS2979",@"General Arts",@"General Arts",@"NUIM",@"190",@"365",@"215",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"SN0053",@"Business Information Systems",@"Business Information Sy",@"TCD",@"420",@"555",@"230",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"DC9687",@"Physics",@"Physics",@"DCU",@"175",@"420",@"395",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"",@"",
     @"SS3511",@"Environmental Science",@"Environmental Sc",@"UL",@"175",@"420",@"395",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"GC2175",@"General Arts",@"General Arts",@"DIT",@"555",@"230",@"560",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"KG9529",@"Electrical Engineering",@"Electrical Engine",@"WIT",@"195",@"070",@"420",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"MR6220",@"Business Information Systems",@"Business Information Sy",@"GMIT",@"020",@"195",@"070",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"NB3645",@"Chemical Science",@"Chemical Science",@"GMIT",@"560",@"190",@"365",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"GI5166",@"Finance",@"Finance",@"DCU",@"220",@"020",@"195",@"",@"",@"",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"QE8464",@"Accountancy",@"Accountancy",@"UL",@"510",@"445",@"175",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"CQ0298",@"Chemical Science",@"Chemical Science",@"DCU",@"230",@"560",@"190",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"LF8391",@"Accountancy",@"Accountancy",@"DCU",@"195",@"070",@"420",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"LM8593",@"Law",@"Law",@"CIT",@"190",@"365",@"215",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"RL0736",@"Business and Accounting",@"Business and Accou",@"UCD",@"560",@"190",@"365",@"",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"NN3939",@"Pharmacy",@"Pharmacy",@"NUIM",@"340",@"510",@"445",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"MH7231",@"Food Science",@"Food Science",@"NUIM",@"215",@"340",@"510",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"BP8081",@"Accountancy",@"Accountancy",@"CIT",@"070",@"420",@"555",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"IF0929",@"Chemical Science",@"Chemical Science",@"UCC",@"195",@"070",@"420",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"HL5266",@"Chemical Science",@"Chemical Science",@"CIT",@"110",@"275",@"175",@"",@"",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"ID8398",@"Finance",@"Finance",@"NUIG",@"020",@"195",@"070",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"SC2072",@"Commerce",@"Commerce",@"NUIM",@"220",@"020",@"195",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"",@"",
     @"MB1457",@"Business and Accounting",@"Business and Accou",@"DCU",@"195",@"070",@"420",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"GI6761",@"Pharmacy",@"Pharmacy",@"UCD",@"420",@"555",@"230",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"HH9233",@"Business and Accounting",@"Business and Accou",@"UCC",@"070",@"420",@"555",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"BJ6564",@"Electrical Engineering",@"Electrical Engine",@"UCD",@"190",@"365",@"215",@"",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"LM1846",@"Pharmacy",@"Pharmacy",@"DIT",@"190",@"365",@"215",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"BE7939",@"Business Information Systems",@"Business Information Sy",@"NUIG",@"175",@"420",@"395",@"",@"",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"RF6620",@"Environmental Science",@"Environmental Sc",@"NUIM",@"510",@"445",@"175",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"BJ3847",@"General Arts",@"General Arts",@"UL",@"175",@"420",@"395",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"LC7619",@"Commerce",@"Commerce",@"NUIM",@"215",@"340",@"510",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"EL1054",@"Nutritional Science",@"Nutritional Science",@"GMIT",@"175",@"420",@"395",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"CL6791",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"DBS",@"215",@"340",@"510",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"RI7572",@"Commerce",@"Commerce",@"DBS",@"195",@"070",@"420",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"",
     @"IB3292",@"General Arts",@"General Arts",@"DCU",@"560",@"190",@"365",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"",
     @"OG6555",@"Pharmacy",@"Pharmacy",@"UCD",@"220",@"020",@"195",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"Vacant Places",@"",
     @"NH9031",@"Electrical Engineering",@"Electrical Engine",@"DCU",@"395",@"220",@"020",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"MF3644",@"Environmental Science",@"Environmental Sc",@"GMIT",@"175",@"420",@"395",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"HE6495",@"Accountancy",@"Accountancy",@"DCU",@"215",@"340",@"510",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"FH3488",@"Environmental Science",@"Environmental Sc",@"CIT",@"230",@"560",@"190",@"Not all people on these points were offered places on this course",@"",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"RR7628",@"Environmental Science",@"Environmental Sc",@"UCD",@"510",@"445",@"175",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"FM4545",@"Accountancy",@"Accountancy",@"DIT",@"070",@"420",@"555",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"MF5598",@"Commerce",@"Commerce",@"DIT",@"215",@"340",@"510",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"RB0633",@"Finance",@"Finance",@"DIT",@"110",@"275",@"175",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"KB7143",@"Business Information Systems",@"Business Information Sy",@"CIT",@"220",@"020",@"195",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"QD6477",@"Chemical Science",@"Chemical Science",@"UCC",@"365",@"215",@"340",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"PH6098",@"Law",@"Law",@"DCU",@"190",@"365",@"215",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"FK1986",@"Nutritional Science",@"Nutritional Science",@"CIT",@"340",@"510",@"445",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"",@"Project/Portfolio",
     @"DE7795",@"Civil Engineering",@"Civil Engineering",@"UCD",@"175",@"420",@"395",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"KB9379",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"UL",@"195",@"070",@"420",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"SE6823",@"Business and Accounting",@"Business and Accou",@"CIT",@"420",@"395",@"220",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"CS4268",@"Pharmacy",@"Pharmacy",@"WIT",@"020",@"195",@"070",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"BS6497",@"General Arts",@"General Arts",@"DCU",@"420",@"555",@"230",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"DJ5978",@"Commerce",@"Commerce",@"CIT",@"275",@"175",@"420",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"MC8083",@"Accountancy",@"Accountancy",@"NUIM",@"020",@"195",@"070",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"",
     @"CC5130",@"Nutritional Science",@"Nutritional Science",@"UCD",@"220",@"020",@"195",@"Not all people on these points were offered places on this course",@"",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"SI5414",@"Food Science",@"Food Science",@"DBS",@"220",@"020",@"195",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"ME6256",@"Electrical Engineering",@"Electrical Engine",@"DBS",@"215",@"340",@"510",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"GO7400",@"General Arts",@"General Arts",@"UL",@"395",@"220",@"020",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"JG2386",@"Accountancy",@"Accountancy",@"NUIM",@"340",@"510",@"445",@"Not all people on these points were offered places on this course",@"",@"",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"DF7574",@"Nutritional Science",@"Nutritional Science",@"UCD",@"175",@"420",@"395",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"ME6197",@"Nutritional Science",@"Nutritional Science",@"NUIG",@"275",@"175",@"420",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"RR2938",@"Commerce",@"Commerce",@"NUIG",@"560",@"190",@"365",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"MQ6148",@"Accountancy",@"Accountancy",@"NUIM",@"230",@"560",@"190",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@"",@"",@"",
     @"QI7661",@"Nutritional Science",@"Nutritional Science",@"DBS",@"560",@"190",@"365",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"BO5034",@"Accountancy",@"Accountancy",@"NUIG",@"110",@"275",@"175",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"OO2980",@"Physics",@"Physics",@"NUIG",@"215",@"340",@"510",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"",
     @"NC6418",@"Food Science",@"Food Science",@"UCD",@"340",@"510",@"445",@"",@"",@"",@"",@"",@"",@"",
     @"HJ5656",@"Law",@"Law",@"DBS",@"215",@"340",@"510",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"MH4951",@"Food Science",@"Food Science",@"UCC",@"275",@"175",@"420",@"",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"GF8971",@"Physics",@"Physics",@"DIT",@"420",@"555",@"230",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"ES5725",@"Physics",@"Physics",@"UCC",@"555",@"230",@"560",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"RB0616",@"Electrical Engineering",@"Electrical Engine",@"NUIM",@"195",@"070",@"420",@"",@"",@"Offer dependent on Interview",@"",@"",@"",@"Project/Portfolio",
     @"DN1195",@"Electrical Engineering",@"Electrical Engine",@"DCU",@"190",@"365",@"215",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"JF1296",@"Finance",@"Finance",@"DIT",@"190",@"365",@"215",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"SL1630",@"Finance",@"Finance",@"DIT",@"420",@"395",@"220",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"SJ2658",@"Nutritional Science",@"Nutritional Science",@"WIT",@"110",@"275",@"175",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"MH1812",@"Chemical Science",@"Chemical Science",@"WIT",@"230",@"560",@"190",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"NM2330",@"Business Information Systems",@"Business Information Sy",@"NUIM",@"175",@"420",@"395",@"",@"",@"",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"PB4219",@"Business Information Systems",@"Business Information Sy",@"DBS",@"365",@"215",@"340",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"",
     @"MC5285",@"Accountancy",@"Accountancy",@"GMIT",@"275",@"175",@"420",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"OH8539",@"Chemical Science",@"Chemical Science",@"NUIG",@"110",@"275",@"175",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"HI3294",@"General Arts",@"General Arts",@"WIT",@"420",@"555",@"230",@"",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"EP2401",@"Finance",@"Finance",@"DBS",@"230",@"560",@"190",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"",@"",
     @"FC9122",@"Accountancy",@"Accountancy",@"UCD",@"070",@"420",@"555",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"LL3959",@"Accountancy",@"Accountancy",@"DCU",@"230",@"560",@"190",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"JB0253",@"Finance",@"Finance",@"DBS",@"365",@"215",@"340",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"MG2847",@"General Arts",@"General Arts",@"TCD",@"215",@"340",@"510",@"Not all people on these points were offered places on this course",@"",@"",@"",@"",@"",@"Project/Portfolio",
     @"CE7771",@"Business Information Systems",@"Business Information Sy",@"GMIT",@"020",@"195",@"070",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@"",@"",@"",
     @"RF9336",@"Food Science",@"Food Science",@"UCD",@"175",@"420",@"395",@"",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"SN1889",@"Business and Accounting",@"Business and Accou",@"NUIG",@"070",@"420",@"555",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"",
     @"KP2985",@"Pharmacy",@"Pharmacy",@"UCD",@"365",@"215",@"340",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"EO7877",@"Electrical Engineering",@"Electrical Engine",@"NUIG",@"420",@"395",@"220",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"RE6570",@"Civil Engineering",@"Civil Engineering",@"DBS",@"555",@"230",@"560",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"PJ4466",@"Business Information Systems",@"Business Information Sy",@"CIT",@"340",@"510",@"445",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"SP9354",@"Pharmacy",@"Pharmacy",@"UCD",@"020",@"195",@"070",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"HC3551",@"Finance",@"Finance",@"NUIM",@"555",@"230",@"560",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"QG3894",@"Business and Accounting",@"Business and Accou",@"DIT",@"510",@"445",@"175",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"PC5850",@"Nutritional Science",@"Nutritional Science",@"UL",@"070",@"420",@"555",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"JG1666",@"Commerce",@"Commerce",@"DBS",@"340",@"510",@"445",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"LG9486",@"Business and Accounting",@"Business and Accou",@"TCD",@"230",@"560",@"190",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"RJ8042",@"Food Science",@"Food Science",@"TCD",@"340",@"510",@"445",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"NC2394",@"Civil Engineering",@"Civil Engineering",@"DIT",@"420",@"395",@"220",@"",@"",@"Offer dependent on Interview",@"",@"",@"",@"Project/Portfolio",
     @"CL7766",@"Physics",@"Physics",@"UCC",@"395",@"220",@"020",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"PK1214",@"Business and Accounting",@"Business and Accou",@"DIT",@"340",@"510",@"445",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"",@"",
     @"FH2706",@"Commerce",@"Commerce",@"TCD",@"020",@"195",@"070",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"SK4089",@"Finance",@"Finance",@"DIT",@"365",@"215",@"340",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"RN6524",@"Physics",@"Physics",@"DBS",@"510",@"445",@"175",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"PD7398",@"Finance",@"Finance",@"CIT",@"555",@"230",@"560",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"SQ7770",@"General Arts",@"General Arts",@"DIT",@"555",@"230",@"560",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"JI9078",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"DBS",@"190",@"365",@"215",@"",@"",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"SO0135",@"Nutritional Science",@"Nutritional Science",@"UL",@"420",@"555",@"230",@"",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"HS5486",@"Nutritional Science",@"Nutritional Science",@"DCU",@"560",@"190",@"365",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"NM1725",@"Business and Accounting",@"Business and Accou",@"UL",@"220",@"020",@"195",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"NR3091",@"Commerce",@"Commerce",@"UCD",@"175",@"420",@"395",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"PQ7057",@"Business Information Systems",@"Business Information Sy",@"UCD",@"395",@"220",@"020",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"JI7806",@"Finance",@"Finance",@"DBS",@"215",@"340",@"510",@"Not all people on these points were offered places on this course",@"",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"HJ6942",@"Accountancy",@"Accountancy",@"NUIG",@"215",@"340",@"510",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"IG6624",@"Electrical Engineering",@"Electrical Engine",@"UL",@"340",@"510",@"445",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"ES3054",@"Accountancy",@"Accountancy",@"CIT",@"560",@"190",@"365",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"ED2659",@"Chemical Science",@"Chemical Science",@"DCU",@"560",@"190",@"365",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"HE5205",@"Finance",@"Finance",@"DBS",@"420",@"555",@"230",@"",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"PC5476",@"Finance",@"Finance",@"UL",@"560",@"190",@"365",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"QL6551",@"Chemical Science",@"Chemical Science",@"UCD",@"395",@"220",@"020",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"KB1732",@"General Arts",@"General Arts",@"NUIG",@"395",@"220",@"020",@"Not all people on these points were offered places on this course",@"",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"QG4147",@"Commerce",@"Commerce",@"UCD",@"340",@"510",@"445",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"SQ2224",@"Food Science",@"Food Science",@"DIT",@"195",@"070",@"420",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"BO5118",@"Food Science",@"Food Science",@"NUIG",@"070",@"420",@"555",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"JQ6932",@"Finance",@"Finance",@"NUIG",@"560",@"190",@"365",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"KQ7446",@"Law",@"Law",@"TCD",@"555",@"230",@"560",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"EJ0398",@"Business Information Systems",@"Business Information Sy",@"NUIG",@"230",@"560",@"190",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"IC4419",@"Electrical Engineering",@"Electrical Engine",@"WIT",@"070",@"420",@"555",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"LC1165",@"Accountancy",@"Accountancy",@"DBS",@"560",@"190",@"365",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"PJ0416",@"Business Information Systems",@"Business Information Sy",@"NUIG",@"070",@"420",@"555",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"SJ5980",@"General Arts",@"General Arts",@"GMIT",@"175",@"420",@"395",@"",@"",@"Offer dependent on Interview",@"",@"",@"",@"Project/Portfolio",
     @"SR3621",@"Business and Accounting",@"Business and Accou",@"NUIM",@"175",@"420",@"395",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"HK1540",@"Chemical Science",@"Chemical Science",@"TCD",@"110",@"275",@"175",@"",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"GM4463",@"Commerce",@"Commerce",@"CIT",@"510",@"445",@"175",@"",@"",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"RG9694",@"Physics",@"Physics",@"UCC",@"275",@"175",@"420",@"",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"EF3057",@"Commerce",@"Commerce",@"DCU",@"555",@"230",@"560",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"MR8920",@"Law",@"Law",@"WIT",@"220",@"020",@"195",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"JO3520",@"Electrical Engineering",@"Electrical Engine",@"GMIT",@"175",@"420",@"395",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"ED9708",@"Environmental Science",@"Environmental Sc",@"DIT",@"195",@"070",@"420",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"Vacant Places",@"",
     @"BS4230",@"Chemical Science",@"Chemical Science",@"DCU",@"195",@"070",@"420",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"QK0532",@"Accountancy",@"Accountancy",@"DBS",@"555",@"230",@"560",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"BR1928",@"Environmental Science",@"Environmental Sc",@"TCD",@"555",@"230",@"560",@"Not all people on these points were offered places on this course",@"",@"",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"JM9114",@"Nutritional Science",@"Nutritional Science",@"DCU",@"230",@"560",@"190",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"OR1591",@"Electrical Engineering",@"Electrical Engine",@"DIT",@"175",@"420",@"395",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"SG5659",@"Food Science",@"Food Science",@"WIT",@"175",@"420",@"395",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"GR6763",@"Environmental Science",@"Environmental Sc",@"CIT",@"420",@"555",@"230",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"",@"",
     @"QH6565",@"Finance",@"Finance",@"DCU",@"110",@"275",@"175",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"FO5026",@"Accountancy",@"Accountancy",@"NUIM",@"555",@"230",@"560",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"QD9562",@"Finance",@"Finance",@"UL",@"190",@"365",@"215",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"IC6995",@"Finance",@"Finance",@"DIT",@"275",@"175",@"420",@"",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"KR7188",@"Chemical Science",@"Chemical Science",@"UL",@"420",@"395",@"220",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"HP9377",@"Nutritional Science",@"Nutritional Science",@"CIT",@"175",@"420",@"395",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"HI3744",@"Physics",@"Physics",@"DCU",@"230",@"560",@"190",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"NP5104",@"Physics",@"Physics",@"NUIG",@"420",@"555",@"230",@"",@"",@"Offer dependent on Interview",@"",@"",@"",@"Project/Portfolio",
     @"CK9518",@"General Arts",@"General Arts",@"DBS",@"420",@"395",@"220",@"Not all people on these points were offered places on this course",@"",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"MC4206",@"Civil Engineering",@"Civil Engineering",@"CIT",@"190",@"365",@"215",@"",@"",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"EC8537",@"Finance",@"Finance",@"GMIT",@"510",@"445",@"175",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"Vacant Places",@"",
     @"SF8295",@"Commerce",@"Commerce",@"DBS",@"420",@"555",@"230",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"LK7292",@"Business and Accounting",@"Business and Accou",@"TCD",@"230",@"560",@"190",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"NJ8802",@"Business Information Systems",@"Business Information Sy",@"DIT",@"275",@"175",@"420",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"IB5609",@"Nutritional Science",@"Nutritional Science",@"NUIG",@"070",@"420",@"555",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"NO8942",@"Environmental Science",@"Environmental Sc",@"UL",@"110",@"275",@"175",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"RI7988",@"Business Information Systems",@"Business Information Sy",@"DIT",@"420",@"555",@"230",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"ED6863",@"Accountancy",@"Accountancy",@"UCC",@"420",@"395",@"220",@"Not all people on these points were offered places on this course",@"",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"IB1826",@"General Arts",@"General Arts",@"NUIM",@"365",@"215",@"340",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"LK9454",@"Finance",@"Finance",@"WIT",@"395",@"220",@"020",@"Not all people on these points were offered places on this course",@"",@"",@"",@"",@"Vacant Places",@"",
     @"BB4983",@"Finance",@"Finance",@"GMIT",@"190",@"365",@"215",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"",@"Project/Portfolio",
     @"IQ1837",@"General Arts",@"General Arts",@"UL",@"175",@"420",@"395",@"",@"",@"Offer dependent on Interview",@"",@"",@"",@"",
     @"CN9709",@"General Arts",@"General Arts",@"GMIT",@"175",@"420",@"395",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"DJ1293",@"Electrical Engineering",@"Electrical Engine",@"NUIG",@"560",@"190",@"365",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"JQ6046",@"Civil Engineering",@"Civil Engineering",@"GMIT",@"110",@"275",@"175",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"MN6645",@"Physics",@"Physics",@"WIT",@"365",@"215",@"340",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"EI4985",@"Nutritional Science",@"Nutritional Science",@"UCC",@"175",@"420",@"395",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"GE1097",@"Business and Accounting",@"Business and Accou",@"UCC",@"420",@"555",@"230",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"DD7822",@"Commerce",@"Commerce",@"GMIT",@"230",@"560",@"190",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"CO8194",@"Environmental Science",@"Environmental Sc",@"UL",@"365",@"215",@"340",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"JK2165",@"Chemical Science",@"Chemical Science",@"NUIG",@"190",@"365",@"215",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"HD5178",@"Food Science",@"Food Science",@"TCD",@"215",@"340",@"510",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"QN6884",@"Environmental Science",@"Environmental Sc",@"TCD",@"175",@"420",@"395",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"BB5240",@"Nutritional Science",@"Nutritional Science",@"GMIT",@"555",@"230",@"560",@"",@"",@"",@"",@"",@"Vacant Places",@"",
     @"PF3214",@"Pharmacy",@"Pharmacy",@"UL",@"070",@"420",@"555",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"EH4957",@"Finance",@"Finance",@"UCC",@"195",@"070",@"420",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"HS8212",@"Electrical Engineering",@"Electrical Engine",@"UCC",@"510",@"445",@"175",@"Not all people on these points were offered places on this course",@"",@"",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"DQ9447",@"Business and Accounting",@"Business and Accou",@"DIT",@"340",@"510",@"445",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"JG0906",@"Commerce",@"Commerce",@"UL",@"220",@"020",@"195",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"PP5510",@"Nutritional Science",@"Nutritional Science",@"DCU",@"340",@"510",@"445",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"BI4202",@"Finance",@"Finance",@"NUIG",@"275",@"175",@"420",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"LD7825",@"Accountancy",@"Accountancy",@"TCD",@"365",@"215",@"340",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"Vacant Places",@"",
     @"PQ9677",@"Environmental Science",@"Environmental Sc",@"NUIM",@"510",@"445",@"175",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"DC0052",@"Law",@"Law",@"GMIT",@"070",@"420",@"555",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"CI1997",@"Accountancy",@"Accountancy",@"UL",@"365",@"215",@"340",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"NL1107",@"Nutritional Science",@"Nutritional Science",@"WIT",@"230",@"560",@"190",@"",@"",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"MG6699",@"Civil Engineering",@"Civil Engineering",@"UL",@"215",@"340",@"510",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"",@"",
     @"KB7198",@"Civil Engineering",@"Civil Engineering",@"DIT",@"070",@"420",@"555",@"",@"",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"RF2437",@"Business Information Systems",@"Business Information Sy",@"NUIM",@"220",@"020",@"195",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"FL6244",@"General Arts",@"General Arts",@"TCD",@"420",@"395",@"220",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"Project/Portfolio",
     @"KG8409",@"Physics",@"Physics",@"DIT",@"220",@"020",@"195",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"HS7384",@"Business and Accounting",@"Business and Accou",@"UCC",@"070",@"420",@"555",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"LG8056",@"Accountancy",@"Accountancy",@"UCC",@"395",@"220",@"020",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"PH5035",@"Environmental Science",@"Environmental Sc",@"NUIG",@"195",@"070",@"420",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"FL8801",@"Business and Accounting",@"Business and Accou",@"TCD",@"510",@"445",@"175",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"HL3542",@"Accountancy",@"Accountancy",@"CIT",@"555",@"230",@"560",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"RB3607",@"Commerce",@"Commerce",@"WIT",@"395",@"220",@"020",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"",@"",
     @"QB4968",@"Environmental Science",@"Environmental Sc",@"DIT",@"510",@"445",@"175",@"",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"EC1100",@"Business Information Systems",@"Business Information Sy",@"UL",@"365",@"215",@"340",@"Not all people on these points were offered places on this course",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"RJ2459",@"Finance",@"Finance",@"DBS",@"190",@"365",@"215",@"",@"",@"Offer dependent on Interview",@"",@"",@"",@"",
     @"OK4101",@"Chemical Science",@"Chemical Science",@"NUIG",@"560",@"190",@"365",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@"",@"Vacant Places",@"",
     @"HL7363",@"Environmental Science",@"Environmental Sc",@"UCC",@"555",@"230",@"560",@"Not all people on these points were offered places on this course",@"",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"KN6872",@"Finance",@"Finance",@"UL",@"215",@"340",@"510",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"QL1373",@"Law",@"Law",@"NUIG",@"275",@"175",@"420",@"Not all people on these points were offered places on this course",@"",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"GB6045",@"Accountancy",@"Accountancy",@"DBS",@"110",@"275",@"175",@"",@"",@"",@"",@"",@"Vacant Places",@"",
     @"RP3259",@"Civil Engineering",@"Civil Engineering",@"NUIM",@"195",@"070",@"420",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"LH2822",@"General Arts",@"General Arts",@"UCD",@"420",@"555",@"230",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"LF9813",@"Food Science",@"Food Science",@"CIT",@"275",@"175",@"420",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"EE6898",@"Business and Accounting",@"Business and Accou",@"WIT",@"020",@"195",@"070",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"BK0216",@"Chemical Science",@"Chemical Science",@"DIT",@"220",@"020",@"195",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"PM4753",@"Chemical Science",@"Chemical Science",@"TCD",@"420",@"555",@"230",@"",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"PE6688",@"General Arts",@"General Arts",@"DCU",@"215",@"340",@"510",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"FC2325",@"Electrical Engineering",@"Electrical Engine",@"TCD",@"420",@"555",@"230",@"",@"",@"",@"",@"",@"Vacant Places",@"",
     @"FD5641",@"Accountancy",@"Accountancy",@"TCD",@"190",@"365",@"215",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"JN2607",@"Electrical Engineering",@"Electrical Engine",@"UCC",@"195",@"070",@"420",@"",@"",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"KJ2488",@"Physics",@"Physics",@"CIT",@"395",@"220",@"020",@"Not all people on these points were offered places on this course",@"",@"",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"DM5420",@"Electrical Engineering",@"Electrical Engine",@"GMIT",@"340",@"510",@"445",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"Vacant Places",@"",
     @"GG4524",@"General Arts",@"General Arts",@"DBS",@"420",@"395",@"220",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"",
     @"DR6316",@"General Arts",@"General Arts",@"DIT",@"195",@"070",@"420",@"Not all people on these points were offered places on this course",@"",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"CE2352",@"Physics",@"Physics",@"NUIM",@"020",@"195",@"070",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"FF4934",@"Accountancy",@"Accountancy",@"DCU",@"110",@"275",@"175",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"HG7285",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"DIT",@"220",@"020",@"195",@"",@"",@"Offer dependent on Interview",@"",@"",@"",@"Project/Portfolio",
     @"LO9878",@"Business Information Systems",@"Business Information Sy",@"NUIM",@"220",@"020",@"195",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"HR9138",@"Law",@"Law",@"UL",@"420",@"395",@"220",@"",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"RF4257",@"Environmental Science",@"Environmental Sc",@"NUIM",@"510",@"445",@"175",@"",@"Offer also dependent on Music/Test/Interview",@"",@"",@"",@"Vacant Places",@"",
     @"RJ7866",@"Physics",@"Physics",@"DCU",@"420",@"555",@"230",@"",@"",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"Project/Portfolio",
     @"RN5299",@"Food Science",@"Food Science",@"DIT",@"340",@"510",@"445",@"Not all people on these points were offered places on this course",@"",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
     @"DJ8071",@"Law",@"Law",@"UCC",@"395",@"220",@"020",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"",@"",@" AQA - Offer for all Qualified Applicants on these points",@"",@"",
     @"RM0360",@"Accountancy",@"Accountancy",@"NUIG",@"110",@"275",@"175",@"Not all people on these points were offered places on this course",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"Vacant Places",@"Project/Portfolio",
     @"MJ5577",@"Business and Accounting",@"Business and Accou",@"NUIG",@"420",@"555",@"230",@"",@"Offer also dependent on Music/Test/Interview",@"",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"DC2253",@"Accountancy",@"Accountancy",@"GMIT",@"230",@"560",@"190",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@"",@"",@"",
     @"ES9802",@"Physics",@"Physics",@"NUIM",@"020",@"195",@"070",@"Not all people on these points were offered places on this course",@"",@"",@"",@"",@"Vacant Places",@"Project/Portfolio",
     @"OC9351",@"Food Science",@"Food Science",@"DBS",@"555",@"230",@"560",@"Not all people on these points were offered places on this course",@"",@"Offer dependent on Interview",@"",@" AQA - Offer for all Qualified Applicants on these points",@"Vacant Places",@"",
     @"NM5584",@"Civil Engineering",@"Civil Engineering",@"NUIM",@"275",@"175",@"420",@"",@"Offer also dependent on Music/Test/Interview",@"Offer dependent on Interview",@"Offer dependent on test , Interview & Portfolio",@" AQA - Offer for all Qualified Applicants on these points",@"",@"Project/Portfolio",
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
    
    
    full_course_name   =[self getAllRowsFromTableNamed : @"CAO_collegeLevel67GenData_7add_fieldsStrings" sortBy : name];
    //portfolio_exist    =[self getFirstExtraInfoFromTableNamed : @"CAO_collegeLevelGenData_7Add_Entries" sortBy : name];
    quota_reached_exist=[self getFirstExtraInfoFromTableNamed : @"CAO_collegeLevel67GenData_7add_fieldsStrings" sortBy : name];
    
    music_test_interview=[self getSecondExtraInfoFromTableNamed : @"CAO_collegeLevel67GenData_7add_fieldsStrings" sortBy : name];
    Interview=[self getThirdExtraInfoFromTableNamed : @"CAO_collegeLevel67GenData_7add_fieldsStrings" sortBy : name];
    testInterviewPortfolio=[self getFourthExtraInfoFromTableNamed : @"CAO_collegeLevel67GenData_7add_fieldsStrings" sortBy : name];
    AQA=[self getFifthExtraInfoFromTableNamed : @"CAO_collegeLevel67GenData_7add_fieldsStrings" sortBy : name];
    VacantPlaces=[self getSixthExtraInfoFromTableNamed : @"CAO_collegeLevel67GenData_7add_fieldsStrings" sortBy : name];
    Project_portfolio=[self getSeventhExtraInfoFromTableNamed : @"CAO_collegeLevel67GenData_7add_fieldsStrings" sortBy : name];
    
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
    
    
    return[documentsDir stringByAppendingPathComponent:@"cao_db_level67_data7fields.sql"];
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







