
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
#define TABLE_FIELD_NUM 13
#define TABLE_ROW_NUM 925

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
NSArray *courseArray;
NSArray *pts_2012Array;
NSArray *pts_2011Array;
NSArray *pts_2010Array;


/*      test      */


@interface BIDCollegeLevelDetailViewController ()
{
    sqlite3 *db;
}

@end


@implementation BIDCollegeLevelDetailViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [scroller setContentSize:CGSizeMake(320, 3539)];
    

    courseArray = [[NSArray alloc] initWithObjects:course_2,course_3,course_4,course_5,course_6,course_7,course_8,course_9,course_10,course_11,course_12,
                            course_13,course_14,course_15,course_16,course_17,course_18,course_19,course_20,course_21,course_22,course_23,course_24,course_25,course_26,
                            course_27,course_28,course_29,course_30,course_31,course_32,course_33,course_34,course_35,course_36,course_37,course_38,course_39,course_40,
                            course_41,course_42,course_43,course_44,course_45,course_46,course_47,course_48,course_49,course_50,course_51,course_52,course_53,course_54,
                            course_55,course_56,course_57,course_58,course_59,course_60,course_61,course_62,course_63,course_64,course_65,course_66,course_67,course_68,
                            course_69,course_70,course_71,course_72,course_73,course_74,course_75,course_76,course_77,course_78,course_79,course_80,course_81,course_82,
                            course_83,course_84,course_85,course_86,course_87,course_88,course_89,course_90,course_91,course_92,nil];
    
    pts_2012Array = [[NSArray alloc] initWithObjects:points2_2012,points3_2012,points4_2012,points5_2012,points6_2012,points7_2012,points8_2012,
                                 points9_2012,points10_2012,points11_2012,points12_2012,points13_2012,points14_2012,points15_2012,points16_2012,points17_2012,
                                 points18_2012,points19_2012,points20_2012,points21_2012,points22_2012,points23_2012,points24_2012,points25_2012,points26_2012,
                                 points27_2012,points28_2012,points29_2012,points30_2012,points31_2012,points32_2012,points33_2012,points34_2012,points35_2012,
                                 points36_2012,points37_2012,points38_2012,points39_2012,points40_2012,points41_2012,points42_2012,points43_2012,points44_2012,
                                 points45_2012,points46_2012,points47_2012,points48_2012,points49_2012,points50_2012,points51_2012,points52_2012,points53_2012,
                                 points54_2012,points55_2012,points56_2012,points57_2012,points58_2012,points59_2012,points60_2012,points61_2012,points62_2012,
                                 points63_2012,points64_2012,points65_2012,points66_2012,points67_2012,points68_2012,points69_2012,points70_2012,points71_2012,
                                 points72_2012,points73_2012,points74_2012,points75_2012,points76_2012,points77_2012,points78_2012,points79_2012,points80_2012,
                                 points81_2012,points82_2012,points83_2012,points84_2012,points85_2012,points86_2012,points87_2012,points88_2012,points89_2012,
                                 points90_2012,points91_2012,points92_2012,nil];
    
    
    pts_2011Array = [[NSArray alloc] initWithObjects:points2_2011,points3_2011,points4_2011,points5_2011,points6_2011,points7_2011,points8_2011,
                              points9_2011,points10_2011,points11_2011,points12_2011,points13_2011,points14_2011,points15_2011,points16_2011,points17_2011,
                              points18_2011,points19_2011,points20_2011,points21_2011,points22_2011,points23_2011,points24_2011,points25_2011,points26_2011,
                              points27_2011,points28_2011,points29_2011,points30_2011,points31_2011,points32_2011,points33_2011,points34_2011,points35_2011,
                              points36_2011,points37_2011,points38_2011,points39_2011,points40_2011,points41_2011,points42_2011,points43_2011,points44_2011,
                              points45_2011,points46_2011,points47_2011,points48_2011,points49_2011,points50_2011,points51_2011,points52_2011,points53_2011,
                              points54_2011,points55_2011,points56_2011,points57_2011,points58_2011,points59_2011,points60_2011,points61_2011,points62_2011,
                              points63_2011,points64_2011,points65_2011,points66_2011,points67_2011,points68_2011,points69_2011,points70_2011,points71_2011,
                              points72_2011,points73_2011,points74_2011,points75_2011,points76_2011,points77_2011,points78_2011,points79_2011,points80_2011,
                              points81_2011,points82_2011,points83_2011,points84_2011,points85_2011,points86_2011,points87_2011,points88_2011,points89_2011,
                              points90_2011,points91_2011,points92_2011,nil];
    
    pts_2010Array = [[NSArray alloc] initWithObjects:points2_2010,points3_2010,points4_2010,points5_2010,points6_2010,points7_2010,points8_2010,
                              points9_2010,points10_2010,points11_2010,points12_2010,points13_2010,points14_2010,points15_2010,points16_2010,points17_2010,
                              points18_2010,points19_2010,points20_2010,points21_2010,points22_2010,points23_2010,points24_2010,points25_2010,points26_2010,
                              points27_2010,points28_2010,points29_2010,points30_2010,points31_2010,points32_2010,points33_2010,points34_2010,points35_2010,
                              points36_2010,points37_2010,points38_2010,points39_2010,points40_2010,points41_2010,points42_2010,points43_2010,points44_2010,
                              points45_2010,points46_2010,points47_2010,points48_2010,points49_2010,points50_2010,points51_2010,points52_2010,points53_2010,
                              points54_2010,points55_2010,points56_2010,points57_2010,points58_2010,points59_2010,points60_2010,points61_2010,points62_2010,
                              points63_2010,points64_2010,points65_2010,points66_2010,points67_2010,points68_2010,points69_2010,points70_2010,points71_2010,
                              points72_2010,points73_2010,points74_2010,points75_2010,points76_2010,points77_2010,points78_2010,points79_2010,points80_2010,
                              points81_2010,points82_2010,points83_2010,points84_2010,points85_2010,points86_2010,points87_2010,points88_2010,points89_2010,
                              points90_2010,points91_2010,points92_2010,nil];
    
    
    heading.font= [UIFont boldSystemFontOfSize:16];
    year_1.font = [UIFont boldSystemFontOfSize:16];
    year_2.font = [UIFont boldSystemFontOfSize:16];
    year_3.font = [UIFont boldSystemFontOfSize:16];
    
    
    //bold all text in view
    
    for(UIButton *courses  in courseArray)
        courses.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    
    for(UILabel *pts_2012  in pts_2012Array)
        pts_2012.font = [UIFont boldSystemFontOfSize:14];
        
    for(UILabel *pts_2011  in pts_2011Array)
        pts_2011.font = [UIFont boldSystemFontOfSize:14];
    
    for(UILabel *pts_2010  in pts_2010Array)
        pts_2010.font = [UIFont boldSystemFontOfSize:14];

     
    [self openDB];
    
    
    [self fillCAO_Entries];
    
    [self createTableOneNamed : @"CAO_collegeLevelGenData_oldData" withField1: @"courseID" withField2: @"courseName" withField3: @"abbrev. courseName" withField4: @"college" withField5: @"2010" withField6: @"2011" withField7: @"2012" withField8: @"NotAllonPtsOffered" withField9: @"MusictestInterview" withField10: @"Interview" withField11: @"testInterviewPortfolio" withField12: @"AQA" withField13: @"VacantPlaces"];
    
    
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
        
        //NSLog(@" [entryA.course objectAtIndex:i] =  %@",[entryA.course objectAtIndex:i]);
        //NSLog(@" [entryA.college objectAtIndex:i+3] =  %@",[entryA.course objectAtIndex:i+3]);
        
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
        
        
        [self insertRecordIntoTableNamed: @"CAO_collegeLevelGenData_oldData"
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
         
         ];
    }
    
}

-(void) viewWillAppear:(BOOL)animated;
{
    
    NSString *collegeSelection=self.title;
    NSString *mainTable=@"CAO_collegeLevelGenData_oldData";
    
    NSString *unique_code=nil;
    
    
    NSString *qsql_1 = [NSString stringWithFormat: @"SELECT * FROM '%@' WHERE  college='%@'",mainTable,collegeSelection];
    NSString *strings[MAX_COURSE_NUM][FIELD_NUM];
    int college_course_counter=0;
    
    sqlite3_stmt *statement_1;
    
    //reset all previously set fields as on GUI.
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
        
        //NSLog(@"sqlite3_step value = %d -- can't get into this loop",sqlite3_step(statement_1));
        
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
            
            
            NSString *newStr = [field5Str substringWithRange:NSMakeRange(3, [field5Str length]-3)];
            
            
            if([field5Str isEqualToString:@""]  || ([newStr length] > 3) )
                truncatedField5Str = field5Str;
            
            
            else
                truncatedField5Str = [field5Str substringToIndex:[field5Str length]-2];
            
            
            if([field6Str isEqualToString:@""])
                 truncatedField6Str = field6Str;
            else
                 truncatedField6Str = [field6Str substringToIndex:[field6Str length]-2];
                 
            if([field7Str isEqualToString:@""])
                 truncatedField7Str = field7Str;
            else
                 truncatedField7Str = [field7Str substringToIndex:[field7Str length]-2];
            
            strings[k][0]=field3Str;
            strings[k][1]=truncatedField5Str;
            strings[k][2]=truncatedField6Str;
            strings[k][3]=truncatedField7Str;
            strings[k][4]=field1Str;
            
            NSLog(@"Reading from BD table : in %@ -- courseCode = %@ -- courseName = %@ -- pts2012 = %@ -- pts2011 = %@ -- pts2010 = %@ ",collegeSelection,strings[k][4],strings[k][0],strings[k][1],strings[k][2],strings[k][3]);
            
            k++;
            
        }//end while
        
        college_course_counter=k;
        
        //---delete the compiled statement from memory---
        sqlite3_finalize(statement_1);
        
    }//end if
    
    NSLog(@"college_course_counter = %d",college_course_counter);
    
    for(int i=0;i<college_course_counter;i++)
    {
     
        [[courseArray objectAtIndex:i] setTitle: strings[i][0] forState:UIControlStateNormal];
        [[courseArray objectAtIndex:i] setAssign: strings[i][4]];
        
        NSLog(@"at index %d -- course title = %@ -- code = %@ ",i,strings[i][0], strings[i][4]);
        
        ((UILabel *)[pts_2012Array objectAtIndex:i]).text = strings[i][1];
        ((UILabel *)[pts_2011Array objectAtIndex:i]).text = strings[i][2];
        ((UILabel *)[pts_2010Array objectAtIndex:i]).text = strings[i][3];
        
    }

    
    
}  //end function.


-(void) fillCAO_Entries
{
    //fill CAO entry with data.
    
    entryA.course =
    /* level 6/7 courses*/
    
    /* level 8's  */
    
    [NSArray arrayWithObjects:@"AL802",@"Software Design (Games Development)",@"Software Design (…",@"Athlone IT",@"275",@"300",@"285",@"",@"",@"",@"",@"",@"",@"AL803",@"Software Design (Cloud Computing)",@"Software Design (…",@"Athlone IT",@"280",@"310",@"285",@"",@"",@"",@"",@"",@"",@"AL830",@"General Nursing",@"General Nursing",@"Athlone IT",@"410",@"415",@"400",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"AL831",@"Mature Applicants General Nursing",@"Mature Applicants…",@"Athlone IT",@"566",@"233",@"225",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"AL832",@"Psychiatric Nursing",@"Psychiatric Nursi…",@"Athlone IT",@"395",@"395",@"375",@"",@"",@"",@"",@"",@"",@"AL833",@"Mature Applicants Psychiatric Nursing",@"Mature Applicants…",@"Athlone IT",@"557",@"230",@"217",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"AL836",@"Health Science and Nutrition",@"Health Science an…",@"Athlone IT",@"395",@"375",@"",@"",@"",@"",@"",@"",@"",@"AL837",@"Sports Science and Exercise Physiology",@"Sports Science an…",@"Athlone IT",@"400",@"360",@"375",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"AL838",@"Biotechnology",@"Biotechnology",@"Athlone IT",@"275",@"270",@"170",@"",@"",@"",@"",@"",@"",@"AL839",@"Human and Animal Toxicology",@"Human and Animal…",@"Athlone IT",@"275",@"275",@"",@"",@"",@"",@"",@"",@"",@"AL840",@"Pharmaceutical Science",@"Pharmaceutical Sc…",@"Athlone IT",@"270",@"260",@"",@"",@"",@"",@"",@"",@"",@"AL841",@"Sports Therapy with Rehabilitation",@"Sports Therapy wi…",@"Athlone IT",@"420",@"365",@"",@"",@"",@"",@"",@"",@"",@"AL850",@"Business",@"Business",@"Athlone IT",@"285",@"270",@"270",@"",@"",@"",@"",@"",@"",@"AL851",@"Business and Law",@"Business and Law",@"Athlone IT",@"270",@"270",@"255",@"",@"",@"",@"",@"",@"",@"AL852",@"Accounting",@"Accounting",@"Athlone IT",@"340",@"295",@"260",@"",@"",@"",@"",@"",@"",@"AL860",@"Social Care Practice",@"Social Care Pract…",@"Athlone IT",@"325",@"340",@"330",@"",@"",@"",@"",@"",@"",@"AL862",@"Visual Communications",@"Visual Communicat…",@"Athlone IT",@"510",@"795",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"PC405",@"Citizenship & Community Studies",@"Citizenship & Com…",@"Carlow College",@"250",@"280",@"",@"",@"",@"",@"",@"",@"",@"PC410",@"Humanities",@"Humanities",@"Carlow College",@"250",@"255",@"280",@"",@"",@"",@"",@"",@"",@"PC411",@"English and History",@"English and Histo…",@"Carlow College",@"275",@"270",@"300",@"",@"",@"",@"",@"",@"",@"CW018",@"Business (Wexford)",@"Business (Wexford…",@"IT Carlow  ",@"255",@"280",@"",@"",@"",@"",@"",@"",@"",@"CW028",@"Early Childhood Education and Care (Wexford)",@"Early Childhood E…",@"IT Carlow  ",@"275",@"290",@"",@"",@"",@"",@"",@"",@"",@"CW038",@"Art (Wexford) - Portfolio",@"Art (Wexford) - P…",@"IT Carlow  ",@"700",@"700",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"CW068",@"Applied Social Studies (Professional Social Care - Wexford)",@"Applied Social St…",@"IT Carlow ",@"360",@"350",@"",@"",@"",@"",@"",@"",@"",@"CW088",@"Visual Communications and Design (Wexford)",@"Visual Communicat…",@"IT Carlow ",@"305",@"330",@"",@"",@"",@"",@"",@"",@"",@"CW108",@"Biosciences with Bioforensics or Biopharmaceuticals",@"Biosciences with…",@"IT Carlow ",@"300",@"290",@"",@"",@"",@"",@"",@"",@"",@"CW168",@"Environmental Science",@"Environmental Sci…",@"IT Carlow ",@"330",@"320",@"320",@"",@"",@"",@"",@"",@"",@"CW178",@"Sport Science",@"Sport Science",@"IT Carlow ",@"400",@"400",@"415",@"",@"",@"",@"",@"",@"",@"CW188",@"Sports Rehabilitation and Athletic Therapy",@"Sports Rehabilita…",@"IT Carlow ",@"480",@"450",@"445",@"",@"",@"",@"",@"",@"",@"CW198",@"Strength and Conditioning",@"Strength and Cond…",@"IT Carlow ",@"405",@"",@"",@"",@"",@"",@"",@"",@"",@"CW208",@"Computer Games Development",@"Computer Games De…",@"IT Carlow ",@"325",@"325",@"325",@"",@"",@"",@"",@"",@"",@"CW238",@"Software Development",@"Software Developm…",@"IT Carlow ",@"300",@"325",@"295",@"",@"",@"",@"",@"",@"",@"CW248",@"Computing Systems Management",@"Computing Systems…",@"IT Carlow ",@"300",@"290",@"290",@"",@"",@"",@"",@"",@"",@"CW438",@"Construction - Quantity Surveying",@"Construction - Qu…",@"IT Carlow ",@"235",@"285",@"250",@"",@"",@"",@"",@"",@"",@"CW448",@"Construction - Facilities and Energy Management",@"Construction - Fa…",@"IT Carlow ",@"280",@"280",@"300",@"",@"",@"",@"",@"",@"",@"CW468",@"Architectural Technology",@"Architectural Tec…",@"IT Carlow ",@"260",@"275",@"275",@"",@"",@"",@"",@"",@"",@"CW478",@"Civil Engineering",@"Civil Engineering",@"IT Carlow ",@"280",@"210",@"185",@"",@"",@"",@"",@"",@"",@"CW548",@"Mechanical Engineering",@"Mechanical Engine…",@"IT Carlow ",@"290",@"300",@"315",@"",@"",@"",@"",@"",@"",@"CW558",@"Electronic Systems",@"Electronic System…",@"IT Carlow ",@"310",@"300",@"300",@"",@"",@"",@"",@"",@"",@"CW568",@"Aerospace Engineering",@"Aerospace Enginee…",@"IT Carlow ",@"370",@"",@"",@"",@"",@"",@"",@"",@"",@"CW708",@"Law",@"Law",@"IT Carlow ",@"300",@"305",@"305",@"",@"",@"",@"",@"",@"",@"CW728",@"Product Design Innovation",@"Product Design In…",@"IT Carlow ",@"330",@"305",@"305",@"",@"",@"",@"",@"",@"",@"CW748",@"Early Childhood Education and Care",@"Early Childhood E…",@"IT Carlow ",@"315",@"315",@"320",@"",@"",@"",@"",@"",@"",@"CW758",@"Applied Social Studies (Professional Social Care)",@"Applied Social St…",@"IT Carlow ",@"340",@"340",@"",@"",@"",@"",@"",@"",@"",@"CW768",@"Social and Community Studies",@"Social and Commun…",@"IT Carlow ",@"280",@"300",@"330",@"",@"",@"",@"",@"",@"",@"CW788",@"Youth and Community Work",@"Youth and Communi…",@"IT Carlow ",@"300",@"",@"",@"",@"",@"",@"",@"",@"",@"CW808",@"Media and Public Relations",@"Media and Public…",@"IT Carlow ",@"285",@"300",@"",@"",@"",@"",@"",@"",@"",@"CW838",@"Business - Marketing",@"Business - Market…",@"IT Carlow ",@"280",@"285",@"295",@"",@"",@"",@"",@"",@"",@"CW858",@"Sports Management and Coaching",@"Sports Management…",@"IT Carlow ",@"700",@"700",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"CW908",@"Business - Management",@"Business - Manage…",@"IT Carlow ",@"280",@"280",@"",@"",@"",@"",@"",@"",@"",@"CW928",@"Business - Human Resource Management",@"Business - Human…",@"IT Carlow ",@"290",@"295",@"285",@"",@"",@"",@"",@"",@"",@"CW938",@"Business with Law",@"Business with Law",@"IT Carlow ",@"290",@"315",@"320",@"",@"",@"",@"",@"",@"",@"CW948",@"Accounting",@"Accounting",@"IT Carlow ",@"335",@"300",@"315",@"",@"",@"",@"",@"",@"",@"CR105",@"Chemical and Biopharmaceutical Engineering",@"Chemical and Biop…",@"Cork IT",@"360",@"335",@"395",@"",@"",@"",@"",@"",@"",@"CR106",@"Software Development",@"Software Developm…",@"Cork IT",@"300",@"300",@"290",@"",@"",@"",@"",@"",@"",@"CR108",@"Mechanical Engineering",@"Mechanical Engine…",@"Cork IT",@"340",@"340",@"345",@"",@"",@"",@"",@"",@"",@"CR109",@"Structural Engineering",@"Structural Engine…",@"Cork IT",@"400",@"",@"380",@"",@"",@"",@"",@"",@"",@"CR112",@"Multimedia",@"Multimedia",@"Cork IT",@"350",@"365",@"390",@"",@"",@"",@"",@"",@"",@"CR116",@"Software Development and Computer Networking",@"Software Developm…",@"Cork IT",@"305",@"305",@"290",@"",@"",@"",@"",@"",@"",@"CR121",@"Music at CIT - Cork School of Music",@"Music at CIT - Co…",@"Cork IT",@"700",@"630",@"",@"(**) Matriculated candidates are considered but admission is on the basis of performance in the music test and interview.",@"",@"",@"",@"",@"",@"CR125",@"Popular Music: Electric Bass Guitar at CIT Cork School of Mu",@"Popular Music: El…",@"Cork IT",@"615",@"",@"",@"(**) Matriculated candidates are considered but admission is on the basis of performance in the music test and interview.",@"",@"",@"",@"",@"",@"CR126",@"Popular Music: Drums at CIT Cork School of Music",@"Popular Music: Dr…",@"Cork IT",@"755",@"",@"",@"(**) Matriculated candidates are considered but admission is on the basis of performance in the music test and interview.",@"",@"",@"",@"",@"",@"CR127",@"Popular Music: Electric Guitar at CIT Cork School of Music",@"Popular Music: El…",@"Cork IT",@"795",@"",@"",@"(**) Matriculated candidates are considered but admission is on the basis of performance in the music test and interview.",@"",@"",@"",@"",@"",@"CR128",@"Popular Music: Keyboards at CIT Cork School of Music",@"Popular Music: Ke…",@"Cork IT",@"720",@"",@"",@"(**) Matriculated candidates are considered but admission is on the basis of performance in the music test and interview.",@"",@"",@"",@"",@"",@"CR129",@"Popular Music: Voice at CIT Cork School of Music",@"Popular Music: Vo…",@"Cork IT",@"795",@"",@"",@"(**) Matriculated candidates are considered but admission is on the basis of performance in the music test and interview.",@"",@"",@"",@"",@"",@"CR150",@"Business Information Systems",@"Business Informat…",@"Cork IT",@"335",@"315",@"315",@"",@"",@"",@"",@"",@"",@"CR210",@"Contemporary Applied Art",@"Contemporary Appl…",@"Cork IT",@"1035",@"685",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"CR220",@"Fine Art at CIT Crawford College of Art and Design",@"Fine Art at CIT C…",@"Cork IT",@"535",@"600",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"CR305",@"Physical Sciences (Level 8 - Common Entry)",@"Physical Sciences…",@"Cork IT",@"310",@"320",@"",@"",@"",@"",@"",@"",@"",@"CR310",@"IT Management",@"IT Management",@"Cork IT",@"290",@"290",@"290",@"",@"",@"",@"",@"",@"",@"CR312",@"Web Development",@"Web Development",@"Cork IT",@"295",@"295",@"295",@"",@"",@"",@"",@"",@"",@"CR320",@"Biomedical Science - Joint CIT and UCC programme",@"Biomedical Scienc…",@"Cork IT",@"520",@"520",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"CR325",@"Pharmaceutical Biotechnology",@"Pharmaceutical Bi…",@"Cork IT",@"315",@"300",@"285",@"",@"",@"",@"",@"",@"",@"CR330",@"Herbal Science",@"Herbal Science",@"Cork IT",@"290",@"265",@"250",@"",@"",@"",@"",@"",@"",@"CR333",@"Nutrition and Health Science",@"Nutrition and Hea…",@"Cork IT",@"345",@"340",@"320",@"",@"",@"",@"",@"",@"",@"CR340",@"Analytical Chemistry with Quality Assurance",@"Analytical Chemis…",@"Cork IT",@"350",@"295",@"290",@"",@"",@"",@"",@"",@"",@"CR360",@"Instrument Engineering",@"Instrument Engine…",@"Cork IT",@"330",@"320",@"320",@"",@"",@"",@"",@"",@"",@"CR365",@"Environmental Science and Sustainable Technology",@"Environmental Sci…",@"Cork IT",@"300",@"310",@"330",@"",@"",@"",@"",@"",@"",@"CR400",@"Accounting",@"Accounting",@"Cork IT",@"330",@"325",@"355",@"",@"",@"",@"",@"",@"",@"CR420",@"Marketing",@"Marketing",@"Cork IT",@"285",@"295",@"295",@"",@"",@"",@"",@"",@"",@"CR500",@"Engineering (Common Entry)",@"Engineering (Comm…",@"Cork IT",@"345",@"310",@"",@"",@"",@"",@"",@"",@"",@"CR510",@"Sustainable Energy",@"Sustainable Energ…",@"Cork IT",@"305",@"300",@"330",@"",@"",@"",@"",@"",@"",@"CR520",@"Biomedical Engineering",@"Biomedical Engine…",@"Cork IT",@"440",@"390",@"330",@"",@"",@"",@"",@"",@"",@"CR522",@"Building Energy Systems",@"Building Energy S…",@"Cork IT",@"300",@"260",@"",@"",@"",@"",@"",@"",@"",@"CR560",@"Architectural Technology",@"Architectural Tec…",@"Cork IT",@"285",@"285",@"320",@"",@"",@"",@"",@"",@"",@"CR565",@"Interior Architecture",@"Interior Architec…",@"Cork IT",@"275",@"280",@"300",@"",@"",@"",@"",@"",@"",@"CR570",@"Quantity Surveying",@"Quantity Surveyin…",@"Cork IT",@"275",@"280",@"285",@"",@"",@"",@"",@"",@"",@"CR572",@"Construction Management",@"Construction Mana…",@"Cork IT",@"245",@"255",@"250",@"",@"",@"",@"",@"",@"",@"CR580",@"Electrical Power Systems",@"Electrical Power…",@"Cork IT",@"315",@"305",@"310",@"",@"",@"",@"",@"",@"",@"CR590",@"Electronic Systems Engineering",@"Electronic System…",@"Cork IT",@"300",@"330",@"300",@"",@"",@"",@"",@"",@"",@"CR600",@"Visual Communications",@"Visual Communicat…",@"Cork IT",@"485",@"595",@"550",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"CR660",@"Tourism",@"Tourism",@"Cork IT",@"250",@"260",@"260",@"",@"",@"",@"",@"",@"",@"CR700",@"Theatre and Drama Studies at CIT Cork School of Music",@"Theatre and Drama…",@"Cork IT",@"720",@"685",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"RC001",@"Medicine - (Undergraduate Entry)",@"Medicine - (Under…",@"Royal college of Surgeons",@"741",@"740",@"732",@"(*) Not all on this points score were offered places; (#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"RC004",@"Physiotherapy",@"Physiotherapy",@"Royal college of Surgeons",@"525",@"535",@"530",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"RC005",@"Pharmacy",@"Pharmacy",@"Royal college of Surgeons",@"555",@"555",@"535",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"RC101",@"Medicine - (Graduate Entry)",@"Medicine - (Gradu…",@"Royal college of Surgeons",@"57",@"59",@"",@"(*) Not all on this points score were offered places; (#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DN100",@"Architecture",@"Architecture",@"University College Dublin",@"450",@"475",@"465",@"",@"",@"",@"",@"",@"",@"DN120",@"Landscape Architecture",@"Landscape Archite…",@"University College Dublin",@"360",@"345",@"360",@"",@"",@"",@"",@"",@"",@"DN140",@"Structural Engineering with Architecture",@"Structural Engine…",@"University College Dublin",@"400",@"425",@"410",@"",@"",@"",@"",@"",@"",@"DN150",@"Engineering",@"Engineering",@"University College Dublin",@"475",@"460",@"430",@"",@"",@"",@"",@"",@"",@"DN200",@"Science",@"Science",@"University College Dublin",@"505",@"500",@"455",@"",@"",@"",@"",@"",@"",@"DN201",@"Computer Science",@"Computer Science",@"University College Dublin",@"470",@"470",@"410",@"",@"",@"",@"",@"",@"",@"DN210",@"Archaeology and Geology",@"Archaeology and G…",@"University College Dublin",@"305",@"350",@"360",@"",@"",@"",@"",@"",@"",@"DN230",@"Actuarial and Financial Studies",@"Actuarial and Fin…",@"University College Dublin",@"560",@"560",@"530",@"",@"",@"",@"",@"",@"",@"DN250",@"Agricultural Science",@"Agricultural Scie…",@"University College Dublin",@"455",@"445",@"430",@"",@"",@"",@"",@"",@"",@"DN251",@"Animal Science - Equine",@"Animal Science -…",@"University College Dublin",@"445",@"440",@"420",@"",@"",@"",@"",@"",@"",@"DN252",@"Dairy Business",@"Dairy Business",@"University College Dublin",@"440",@"430",@"405",@"",@"",@"",@"",@"",@"",@"DN261",@"Food Science",@"Food Science",@"University College Dublin",@"470",@"455",@"430",@"",@"",@"",@"",@"",@"",@"DN262",@"Human Nutrition",@"Human Nutrition",@"University College Dublin",@"525",@"525",@"520",@"",@"",@"",@"",@"",@"",@"DN271",@"Forestry",@"Forestry",@"University College Dublin",@"385",@"350",@"360",@"",@"",@"",@"",@"",@"",@"DN272",@"Horticulture, Landscape and Sportsturf Management",@"Horticulture, Lan…",@"University College Dublin",@"325",@"335",@"",@"",@"",@"",@"",@"",@"",@"DN300",@"Veterinary Medicine - Undergraduate entry",@"Veterinary Medici…",@"University College Dublin",@"575",@"580",@"560",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"DN301",@"Veterinary Medicine - Graduate Entry",@"Veterinary Medici…",@"University College Dublin",@"",@"",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DN310",@"Veterinary Nursing",@"Veterinary Nursin…",@"University College Dublin",@"460",@"470",@"445",@"",@"",@"",@"",@"",@"",@"DN400",@"Medicine - Undergraduate Entry",@"Medicine - Underg…",@"University College Dublin",@"747",@"745",@"735",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DN401",@"Medicine - Graduate Entry",@"Medicine - Gradua…",@"University College Dublin",@"57",@"57",@"58",@"(*) Not all on this points score were offered places; (#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DN410",@"Radiography",@"Radiography",@"University College Dublin",@"530",@"555",@"535",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"DN420",@"Physiotherapy",@"Physiotherapy",@"University College Dublin",@"545",@"550",@"535",@"",@"",@"",@"",@"",@"",@"DN425",@"Health and Performance Science",@"Health and Perfor…",@"University College Dublin",@"490",@"490",@"465",@"",@"",@"",@"",@"",@"",@"DN430",@"Sport and Exercise Management",@"Sport and Exercis…",@"University College Dublin",@"430",@"425",@"405",@"",@"",@"",@"",@"",@"",@"DN440",@"Biomedical, Health and Life Sciences",@"Biomedical, Healt…",@"University College Dublin",@"560",@"555",@"",@"",@"",@"",@"",@"",@"",@"DN450",@"General Nursing",@"General Nursing",@"University College Dublin",@"425",@"420",@"415",@"",@"",@"",@"",@"",@"",@"DN451",@"Children`s and General Nursing (Integrated)",@"Children`s and Ge…",@"University College Dublin",@"490",@"490",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"DN452",@"Midwifery",@"Midwifery",@"University College Dublin",@"490",@"470",@"455",@"",@"",@"",@"",@"",@"",@"DN453",@"Psychiatric Nursing",@"Psychiatric Nursi…",@"University College Dublin",@"415",@"410",@"395",@"",@"",@"",@"",@"",@"",@"DN460",@"Mature Applicants General Nursing",@"Mature Applicants…",@"University College Dublin",@"552",@"223",@"218",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DN461",@"Mature Apps Children`s & General Nurs(Integrated)",@"Mature Apps Child…",@"University College Dublin",@"572",@"233",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DN462",@"Mature Applicants Midwifery",@"Mature Applicants…",@"University College Dublin",@"575",@"235",@"226",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DN463",@"Mature Applicants Psychiatric Nursing",@"Mature Applicants…",@"University College Dublin",@"549",@"216",@"212",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DN500",@"BA Degree - joint honours (full-time)",@"BA Degree - joint…",@"University College Dublin",@"335",@"350",@"",@"",@"",@"",@"",@"",@"",@"DN501",@"BA Degree - joint honours (part-time day)",@"BA Degree - joint…",@"University College Dublin",@"335",@"350",@"",@"",@"",@"",@"",@"",@"",@"DN510",@"Economics",@"Economics",@"University College Dublin",@"465",@"450",@"440",@"",@"",@"",@"",@"",@"",@"DN511",@"English",@"English",@"University College Dublin",@"480",@"465",@"465",@"",@"",@"",@"",@"",@"",@"DN512",@"English with Drama",@"English with Dram…",@"University College Dublin",@"330",@"350",@"355",@"",@"",@"",@"",@"",@"",@"DN513",@"English with Film",@"English with Film",@"University College Dublin",@"410",@"405",@"415",@"",@"",@"",@"",@"",@"",@"DN514",@"Planning, Geography and Environment",@"Planning, Geograp…",@"University College Dublin",@"345",@"330",@"",@"",@"",@"",@"",@"",@"",@"DN515",@"History",@"History",@"University College Dublin",@"420",@"405",@"440",@"",@"",@"",@"",@"",@"",@"DN517",@"Music",@"Music",@"University College Dublin",@"335",@"330",@"330",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DN518",@"Philosophy",@"Philosophy",@"University College Dublin",@"330",@"330",@"390",@"",@"",@"",@"",@"",@"",@"DN519",@"Psychology",@"Psychology",@"University College Dublin",@"505",@"515",@"510",@"",@"",@"",@"",@"",@"",@"DN531",@"International French",@"International Fre…",@"University College Dublin",@"365",@"330",@"335",@"",@"",@"",@"",@"",@"",@"DN532",@"International German",@"International Ger…",@"University College Dublin",@"370",@"330",@"335",@"",@"",@"",@"",@"",@"",@"DN533",@"International Spanish",@"International Spa…",@"University College Dublin",@"415",@"390",@"375",@"",@"",@"",@"",@"",@"",@"DN541",@"International Languages",@"International Lan…",@"University College Dublin",@"465",@"440",@"410",@"",@"",@"",@"",@"",@"",@"DN550",@"Social Science",@"Social Science",@"University College Dublin",@"410",@"405",@"390",@"",@"",@"",@"",@"",@"",@"DN600",@"Law",@"Law",@"University College Dublin",@"500",@"495",@"",@"",@"",@"",@"",@"",@"",@"DN610",@"Business and Law",@"Business and Law",@"University College Dublin",@"510",@"495",@"480",@"",@"",@"",@"",@"",@"",@"DN615",@"BCL Maîtrise",@"BCL Maîtrise",@"University College Dublin",@"550",@"525",@"",@"",@"",@"",@"",@"",@"", @"DN616",@"Law with French Law (BCL)",@"Law with French L…",@"University College Dublin",@"565",@"560",@"",@"",@"",@"",@"",@"",@"",@"DN650",@"Commerce",@"Commerce",@"University College Dublin",@"475",@"465",@"445",@"",@"",@"",@"",@"",@"",@"DN660",@"Commerce International",@"Commerce Internat…",@"University College Dublin",@"505",@"495",@"465",@"",@"",@"",@"",@"",@"",@"DN671",@"Economics and Finance",@"Economics and Fin…",@"University College Dublin",@"560",@"540",@"480",@"",@"",@"",@"",@"",@"",@"DK810",@"Accounting and Finance",@"Accounting and Fi…",@"Dundalk IT",@"300",@"300",@"300",@"",@"",@"",@"",@"",@"",@"DK812",@"Marketing",@"Marketing",@"Dundalk IT",@"305",@"300",@"305",@"",@"",@"",@"",@"",@"",@"DK815",@"Public Relations and Online Communication",@"Public Relations…",@"Dundalk IT",@"300",@"300",@"300",@"",@"",@"",@"",@"",@"",@"DK816",@"Business Studies",@"Business Studies",@"Dundalk IT",@"300",@"300",@"300",@"",@"",@"",@"",@"",@"",@"DK820",@"Computing in Games Development",@"Computing in Game…",@"Dundalk IT",@"325",@"340",@"335",@"",@"",@"",@"",@"",@"",@"DK821",@"Computing",@"Computing",@"Dundalk IT",@"300",@"300",@"300",@"",@"",@"",@"",@"",@"",@"DK830",@"Building Surveying",@"Building Surveyin…",@"Dundalk IT",@"305",@"300",@"300",@"",@"",@"",@"",@"",@"",@"DK860",@"Applied Music",@"Applied Music",@"Dundalk IT",@"500",@"500",@"430",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DK861",@"Humanities",@"Humanities",@"Dundalk IT",@"310",@"300",@"300",@"",@"",@"",@"",@"",@"",@"DK862",@"Social Care",@"Social Care",@"Dundalk IT",@"330",@"345",@"335",@"",@"",@"",@"",@"",@"",@"DK870",@"General Nursing",@"General Nursing",@"Dundalk IT",@"400",@"405",@"390",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"DK871",@"Mature Applicants General Nursing",@"Mature Applicants…",@"Dundalk IT",@"574",@"223",@"225",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DK872",@"Intellectual Disability Nursing",@"Intellectual Disa…",@"Dundalk IT",@"365",@"350",@"345",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"DK873",@"Mature Applicants Intellectual Disability Nursing",@"Mature Applicants…",@"Dundalk IT",@"521",@"209",@"210",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DK874",@"Psychiatric Nursing",@"Psychiatric Nursi…",@"Dundalk IT",@"370",@"375",@"350",@"",@"",@"",@"",@"",@"",@"DK875",@"Mature Applicants Psychiatric Nursing",@"Mature Applicants…",@"Dundalk IT",@"544",@"214",@"213",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DK876",@"Early Childhood Studies",@"Early Childhood S…",@"Dundalk IT",@"315",@"330",@"350",@"",@"",@"",@"",@"",@"",@"DK877",@"Midwifery",@"Midwifery",@"Dundalk IT",@"400",@"415",@"390",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"DK878",@"Mature Applicants Midwifery",@"Mature Applicants…",@"Dundalk IT",@"583",@"229",@"236",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DK880",@"Health and Physical Activity",@"Health and Physic…",@"Dundalk IT",@"355",@"330",@"370",@"",@"",@"",@"",@"",@"",@"DK890",@"Interactive Applications Design and Development",@"Interactive Appli…",@"Dundalk IT",@"300",@"",@"",@"",@"",@"",@"",@"",@"",@"CK101",@"Arts",@"Arts",@"University College Cork",@"330",@"330",@"345",@"",@"",@"",@"",@"",@"",@"CK102",@"Social Science",@"Social Science",@"University College Cork",@"380",@"390",@"385",@"",@"",@"",@"",@"",@"",@"CK103",@"Music",@"Music",@"University College Cork",@"400",@"370",@"375",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"CK104",@"Arts with Music",@"Arts with Music",@"University College Cork",@"340",@"335",@"410",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"CK105",@"Film and Screen Media",@"Film and Screen M…",@"University College Cork",@"420",@"",@"",@"",@"",@"",@"",@"",@"",@"CK106",@"Applied Psychology",@"Applied Psycholog…",@"University College Cork",@"500",@"510",@"500",@"",@"",@"",@"",@"",@"",@"CK107",@"Geography and Archaeology",@"Geography and Arc…",@"University College Cork",@"355",@"",@"",@"",@"",@"",@"",@"",@"",@"CK108",@"Arts International",@"Arts Internationa…",@"University College Cork",@"430",@"",@"",@"",@"",@"",@"",@"",@"",@"CK111",@"Early Years and Childhood Studies",@"Early Years and C…",@"University College Cork",@"395",@"395",@"400",@"",@"",@"",@"",@"",@"",@"CK112",@"Drama and Theatre Studies",@"Drama and Theatre…",@"University College Cork",@"375",@"355",@"400",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"CK114",@"Social Science (Youth & Community Work) - Mature App`s only",@"Social Science (Y…",@"University College Cork",@"",@"999",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"CK115",@"Social Work - Mature Applicants only",@"Social Work - Mat…",@"University College Cork",@"",@"999",@"0",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"CK116",@"Sports Studies and Physical Education",@"Sports Studies an…",@"University College Cork",@"485",@"475",@"480",@"",@"",@"",@"",@"",@"",@"CK201",@"Commerce",@"Commerce",@"University College Cork",@"435",@"430",@"420",@"",@"",@"",@"",@"",@"",@"CK202",@"Accounting",@"Accounting",@"University College Cork",@"445",@"430",@"425",@"",@"",@"",@"",@"",@"",@"CK203",@"Business Information Systems",@"Business Informat…",@"University College Cork",@"440",@"410",@"400",@"",@"",@"",@"",@"",@"",@"CK204",@"Finance",@"Finance",@"University College Cork",@"475",@"420",@"430",@"",@"",@"",@"",@"",@"",@"CK205",@"Commerce (International) with French",@"Commerce (Interna…",@"University College Cork",@"470",@"485",@"500",@"",@"",@"",@"",@"",@"",@"CK206",@"Commerce (International) with German",@"Commerce (Interna…",@"University College Cork",@"460",@"405",@"370",@"",@"",@"",@"",@"",@"",@"CK207",@"Commerce (International) with Italian",@"Commerce (Interna…",@"University College Cork",@"395",@"385",@"350",@"",@"",@"",@"",@"",@"",@"CK208",@"Commerce (International) with Hispanic Studies",@"Commerce (Interna…",@"University College Cork",@"435",@"430",@"420",@"",@"",@"",@"",@"",@"",@"CK209",@"Commerce (International) with Irish",@"Commerce (Interna…",@"University College Cork",@"480",@"430",@"440",@"",@"",@"",@"",@"",@"",@"CK210",@"Government",@"Government",@"University College Cork",@"330",@"330",@"335",@"",@"",@"",@"",@"",@"",@"CK211",@"Commerce (International) with Chinese Studies",@"Commerce (Interna…",@"University College Cork",@"370",@"355",@"360",@"",@"",@"",@"",@"",@"",@"CK301",@"Law",@"Law",@"University College Cork",@"475",@"470",@"480",@"",@"",@"",@"",@"",@"",@"CK302",@"Law and French",@"Law and French",@"University College Cork",@"510",@"500",@"535",@"",@"",@"",@"",@"",@"",@"CK304",@"Law and Irish",@"Law and Irish",@"University College Cork",@"495",@"525",@"500",@"",@"",@"",@"",@"",@"",@"CK305",@"Law (Clinical)",@"Law (Clinical)",@"University College Cork",@"510",@"530",@"520",@"",@"",@"",@"",@"",@"",@"CK306",@"Law (International)",@"Law (Internationa…",@"University College Cork",@"540",@"550",@"545",@"",@"",@"",@"",@"",@"",@"CK401",@"Computer Science",@"Computer Science",@"University College Cork",@"425",@"340",@"330",@"",@"",@"",@"",@"",@"",@"CK402",@"Biological and Chemical Sciences",@"Biological and Ch…",@"University College Cork",@"440",@"410",@"400",@"",@"",@"",@"",@"",@"",@"CK404",@"Biological, Earth and Environmental Science",@"Biological, Earth…",@"University College Cork",@"400",@"390",@"380",@"",@"",@"",@"",@"",@"",@"CK405",@"Genetics",@"Genetics",@"University College Cork",@"475",@"465",@"460",@"",@"",@"",@"",@"",@"",@"CK406",@"Chemical Sciences",@"Chemical Sciences",@"University College Cork",@"400",@"380",@"360",@"",@"",@"",@"",@"",@"",@"CK407",@"Mathematical Sciences",@"Mathematical Scie…",@"University College Cork",@"525",@"520",@"515",@"",@"",@"",@"",@"",@"",@"CK408",@"Physics and Astrophysics",@"Physics and Astro…",@"University College Cork",@"500",@"460",@"445",@"",@"",@"",@"",@"",@"",@"CK502",@"Food Marketing and Entrepreneurship",@"Food Marketing an…",@"University College Cork",@"440",@"435",@"420",@"",@"",@"",@"",@"",@"",@"CK504",@"Nutritional Sciences",@"Nutritional Scien…",@"University College Cork",@"500",@"490",@"490",@"",@"",@"",@"",@"",@"",@"CK505",@"Food Science",@"Food Science",@"University College Cork",@"435",@"405",@"365",@"",@"",@"",@"",@"",@"",@"CK506",@"International Development and Food Policy",@"International Dev…",@"University College Cork",@"335",@"335",@"350",@"",@"",@"",@"",@"",@"",@"CK601",@"Process and Chemical Engineering",@"Process and Chemi…",@"University College Cork",@"495",@"405",@"440",@"",@"",@"",@"",@"",@"",@"CK602",@"Civil and Environmental Engineering",@"Civil and Environ…",@"University College Cork",@"390",@"395",@"405",@"",@"",@"",@"",@"",@"",@"CK603",@"Energy Engineering",@"Energy Engineerin…",@"University College Cork",@"400",@"400",@"465",@"",@"",@"",@"",@"",@"",@"CK605",@"Electrical and Electronic Engineering",@"Electrical and El…",@"University College Cork",@"395",@"410",@"405",@"",@"",@"",@"",@"",@"",@"CK606",@"Architecture - Joint UCC and CIT programme",@"Architecture - Jo…",@"University College Cork",@"400",@"400",@"420",@"",@"",@"",@"",@"",@"",@"CK701",@"Medicine - (Undergraduate Entry)",@"Medicine - (Under…",@"University College Cork",@"742",@"738",@"733",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"CK702",@"Dentistry",@"Dentistry",@"University College Cork",@"570",@"575",@"570",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"CK703",@"Pharmacy",@"Pharmacy",@"University College Cork",@"565",@"565",@"545",@"",@"",@"",@"",@"",@"",@"CK704",@"Occupational Therapy",@"Occupational Ther…",@"University College Cork",@"525",@"530",@"515",@"",@"",@"",@"",@"",@"",@"CK705",@"Speech and Language Therapy",@"Speech and Langua…",@"University College Cork",@"510",@"525",@"520",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"CK706",@"Public Health",@"Public Health",@"University College Cork",@"385",@"375",@"",@"",@"",@"",@"",@"",@"",@"CK710",@"General Nursing",@"General Nursing",@"University College Cork",@"450",@"450",@"440",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"CK711",@"Mature Applicants General Nursing",@"Mature Applicants…",@"University College Cork",@"562",@"229",@"231",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"CK712",@"Children`s and General Nursing (Integrated)",@"Children`s and Ge…",@"University College Cork",@"520",@"525",@"500",@"",@"",@"",@"",@"",@"",@"CK713",@"Mature Applicants Children`s and General Nursing (Integrated)",@"Mature Applicants…",@"University College Cork",@"578",@"232",@"244",@"(*) Not all on this points score were offered places; (#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"CK720",@"Psychiatric Nursing",@"Psychiatric Nursi…",@"University College Cork",@"430",@"430",@"415",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"CK721",@"Mature Applicants Psychiatric Nursing",@"Mature Applicants…",@"University College Cork",@"546",@"220",@"219",@"(*) Not all on this points score were offered places; (#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"CK730",@"Intellectual Disability Nursing",@"Intellectual Disa…",@"University College Cork",@"425",@"425",@"410",@"",@"",@"",@"",@"",@"",@"CK731",@"Mature Applicants Intellectual Disability Nursing",@"Mature Applicants…",@"University College Cork",@"511",@"206",@"217",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"CK740",@"Midwifery",@"Midwifery",@"University College Cork",@"445",@"455",@"455",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"CK741",@"Mature Applicants Midwifery",@"Mature Applicants…",@"University College Cork",@"570",@"233",@"230",@"(*) Not all on this points score were offered places; (#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"CK791",@"Medicine - (Graduate Entry)",@"Medicine - (Gradu…",@"University College Cork",@"54",@"55",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"AH001",@"Theology and Philosophy",@"Theology and Phil…",@"All Hallows",@"250",@"250",@"270",@"",@"",@"",@"",@"",@"",@"AH002",@"Theology and Psychology",@"Theology and Psyc…",@"All Hallows",@"310",@"315",@"340",@"",@"",@"",@"",@"",@"",@"AH003",@"Theology and English Literature",@"Theology and Engl…",@"All Hallows",@"290",@"295",@"300",@"",@"",@"",@"",@"",@"",@"AC120",@"International Business",@"International Bus…",@"American College",@"285",@"295",@"280",@"",@"",@"",@"",@"",@"",@"AC121",@"Accounting and Finance",@"Accounting and Fi…",@"American College",@"300",@"275",@"335",@"",@"",@"",@"",@"",@"",@"AC137",@"Liberal Arts",@"Liberal Arts",@"American College",@"200",@"280",@"",@"",@"",@"",@"",@"",@"",@"CE001",@"Education - Primary Teaching",@"Education - Prima…",@"Church of Ireland College",@"405",@"435",@"390",@"(***) Applicants are ranked as for other courses but the final decision depends on performance in interview.",@"",@"",@"",@"",@"",@"CM001",@"Education - Primary Teaching",@"Education - Prima…",@"Marino Institute of Technology",@"460",@"465",@"465",@"",@"",@"",@"",@"",@"",@"CM002",@"Education - Primary Teaching - Gaeltacht Applicants",@"Education - Prima…",@"Marino Institute of Technology",@"",@"435",@"425",@"",@"",@"",@"",@"",@"",@"CM010",@"Education Studies",@"Education Studies",@"Marino Institute of Technology",@"310",@"310",@"",@"",@"",@"",@"",@"",@"",@"DB512",@"Business",@"Business",@"Dublin Business School",@"235",@"220",@"230",@"",@"",@"",@"",@"",@"",@"DB514",@"Business (Law stream)",@"Business (Law str…",@"Dublin Business School",@"255",@"195",@"215",@"",@"",@"",@"",@"",@"",@"DB515",@"Business (Human Resource Management stream)",@"Business (Human R…",@"Dublin Business School",@"275",@"305",@"210",@"",@"",@"",@"",@"",@"",@"DB516",@"Financial Services",@"Financial Service…",@"Dublin Business School",@"260",@"235",@"245",@"",@"",@"",@"",@"",@"",@"DB517",@"Marketing (Event Management stream)",@"Marketing (Event…",@"Dublin Business School",@"240",@"235",@"255",@"",@"",@"",@"",@"",@"",@"DB518",@"Marketing (Digital Media stream)",@"Marketing (Digita…",@"Dublin Business School",@"295",@"205",@"",@"",@"",@"",@"",@"",@"",@"DB520",@"Business (work placement stream)",@"Business (work pl…",@"Dublin Business School",@"285",@"255",@"",@"",@"",@"",@"",@"",@"",@"DB521",@"Accounting and Finance",@"Accounting and Fi…",@"Dublin Business School",@"275",@"230",@"235",@"",@"",@"",@"",@"",@"",@"DB524",@"Business Information Systems",@"Business Informat…",@"Dublin Business School",@"415",@"",@"",@"",@"",@"",@"",@"",@"",@"DB525",@"Marketing (Digital Media and Cloud Computing stream)",@"Marketing (Digita…",@"Dublin Business School",@"225",@"260",@"",@"",@"",@"",@"",@"",@"",@"DB526",@"Business Information Systems (Cloud Computing stream)",@"Business Informat…",@"Dublin Business School",@"245",@"285",@"",@"",@"",@"",@"",@"",@"",@"DB531",@"Marketing",@"Marketing",@"Dublin Business School",@"255",@"100",@"240",@"",@"",@"",@"",@"",@"",@"DB553",@"Film, Literature and Drama",@"Film, Literature…",@"Dublin Business School",@"260",@"250",@"",@"",@"",@"",@"",@"",@"",@"DB561",@"Arts (General)",@"Arts (General)",@"Dublin Business School",@"245",@"210",@"240",@"",@"",@"",@"",@"",@"",@"DB562",@"Psychology",@"Psychology",@"Dublin Business School",@"200",@"235",@"215",@"",@"",@"",@"",@"",@"",@"DB565",@"Journalism",@"Journalism",@"Dublin Business School",@"205",@"210",@"240",@"",@"",@"",@"",@"",@"",@"DB566",@"Social Science",@"Social Science",@"Dublin Business School",@"255",@"225",@"205",@"",@"",@"",@"",@"",@"",@"DB567",@"Film Studies",@"Film Studies",@"Dublin Business School",@"225",@"220",@"240",@"",@"",@"",@"",@"",@"",@"DB568",@"Law",@"Law",@"Dublin Business School",@"250",@"230",@"205",@"",@"",@"",@"",@"",@"",@"DB569",@"Business (Psychology stream)",@"Business (Psychol…",@"Dublin Business School",@"290",@"235",@"",@"",@"",@"",@"",@"",@"",@"BN101",@"Business",@"Business",@"IT Blanchardstown",@"215",@"210",@"210",@"",@"",@"",@"",@"",@"",@"BN103",@"Business and Information Technology",@"Business and Info…",@"IT Blanchardstown",@"225",@"210",@"250",@"",@"",@"",@"",@"",@"",@"BN104",@"Computing (Information Technology)",@"Computing (Inform…",@"IT Blanchardstown",@"235",@"215",@"220",@"",@"",@"",@"",@"",@"",@"BN107",@"Applied Social Studies in Social Care",@"Applied Social St…",@"IT Blanchardstown",@"330",@"360",@"355",@"",@"",@"",@"",@"",@"",@"BN110",@"International Business",@"International Bus…",@"IT Blanchardstown",@"230",@"255",@"235",@"",@"",@"",@"",@"",@"",@"BN111",@"Sports Management and Coaching",@"Sports Management…",@"IT Blanchardstown",@"335",@"320",@"345",@"",@"",@"",@"",@"",@"",@"BN112",@"Creative Digital Media",@"Creative Digital…",@"IT Blanchardstown",@"305",@"310",@"320",@"",@"",@"",@"",@"",@"",@"BN113",@"Horticulture",@"Horticulture",@"IT Blanchardstown",@"215",@"225",@"255",@"",@"",@"",@"",@"",@"",@"BN114",@"Accounting and Finance",@"Accounting and Fi…",@"IT Blanchardstown",@"230",@"",@"",@"",@"",@"",@"",@"",@"",@"BN115",@"Social and Community Development",@"Social and Commun…",@"IT Blanchardstown",@"300",@"310",@"315",@"",@"",@"",@"",@"",@"",@"BN117",@"Computer Engineering in Mobile Systems",@"Computer Engineer…",@"IT Blanchardstown",@"210",@"240",@"205",@"",@"",@"",@"",@"",@"",@"BN118",@"Early Childhood Care and Education",@"Early Childhood C…",@"IT Blanchardstown",@"340",@"330",@"",@"",@"",@"",@"",@"",@"",@"BN120",@"Information Security and Digital Forensics",@"Information Secur…",@"IT Blanchardstown",@"240",@"",@"",@"",@"",@"",@"",@"",@"",@"BN121",@"Mechatronic Engineering",@"Mechatronic Engin…",@"IT Blanchardstown",@"205",@"205",@"200",@"",@"",@"",@"",@"",@"",@"GA181",@"Accounting",@"Accounting",@"Galway - Mayo IT",@"265",@"265",@"285",@"",@"",@"",@"",@"",@"",@"GA182",@"Business",@"Business",@"Galway - Mayo IT",@"300",@"240",@"260",@"",@"",@"",@"",@"",@"",@"GA183",@"Information Systems Management",@"Information Syste…",@"Galway - Mayo IT",@"285",@"",@"",@"",@"",@"",@"",@"",@"",@"GA281",@"Film and Documentary",@"Film and Document…",@"Galway - Mayo IT",@"305",@"320",@"",@"",@"",@"",@"",@"",@"",@"GA282",@"Heritage Studies",@"Heritage Studies",@"Galway - Mayo IT",@"245",@"225",@"235",@"",@"",@"",@"",@"",@"",@"GA380",@"Hotel and Catering Management",@"Hotel and Caterin…",@"Galway - Mayo IT",@"200",@"230",@"235",@"",@"",@"",@"",@"",@"",@"GA480",@"Construction Management",@"Construction Mana…",@"Galway - Mayo IT",@"215",@"240",@"210",@"",@"",@"",@"",@"",@"",@"GA482",@"Construction Economics and Quantity Surveying",@"Construction Econ…",@"Galway - Mayo IT",@"260",@"140",@"140",@"",@"",@"",@"",@"",@"",@"GA483",@"Architectural Technology",@"Architectural Tec…",@"Galway - Mayo IT",@"205",@"155",@"180",@"",@"",@"",@"",@"",@"",@"GA484",@"Civil Engineering",@"Civil Engineering",@"Galway - Mayo IT",@"245",@"165",@"180",@"",@"",@"",@"",@"",@"",@"GA680",@"Mechanical Engineering",@"Mechanical Engine…",@"Galway - Mayo IT",@"315",@"305",@"325",@"",@"",@"",@"",@"",@"",@"GA681",@"Energy Engineering",@"Energy Engineerin…",@"Galway - Mayo IT",@"260",@"250",@"320",@"",@"",@"",@"",@"",@"",@"GA780",@"Applied Freshwater and Marine Biology",@"Applied Freshwate…",@"Galway - Mayo IT",@"370",@"375",@"340",@"",@"",@"",@"",@"",@"",@"GA781",@"Applied Biology and Biopharmaceutical Science",@"Applied Biology a…",@"Galway - Mayo IT",@"360",@"375",@"330",@"",@"",@"",@"",@"",@"",@"GA782",@"Chemical and Pharmaceutical Science",@"Chemical and Phar…",@"Galway - Mayo IT",@"310",@"310",@"310",@"",@"",@"",@"",@"",@"",@"GA783",@"Physics and Instrumentation",@"Physics and Instr…",@"Galway - Mayo IT",@"325",@"290",@"265",@"",@"",@"",@"",@"",@"",@"GA784",@"Science (Undenominated)",@"Science (Undenomi…",@"Galway - Mayo IT",@"350",@"360",@"330",@"",@"",@"",@"",@"",@"",@"GA785",@"Medical Science",@"Medical Science",@"Galway - Mayo IT",@"410",@"390",@"390",@"",@"",@"",@"",@"",@"",@"GA786",@"Forensic Science and Analysis",@"Forensic Science…",@"Galway - Mayo IT",@"355",@"380",@"380",@"",@"",@"",@"",@"",@"", @"GA880",@"General Nursing (Castlebar)",@"General Nursing (…",@"Galway - Mayo IT",@"405",@"405",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"GA881",@"Mature Applicants General Nursing (Castlebar)",@"Mature Applicants…",@"Galway - Mayo IT",@"562",@"224",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"GA882",@"Psychiatric Nursing (Castlebar)",@"Psychiatric Nursi…",@"Galway - Mayo IT",@"370",@"375",@"",@"",@"",@"",@"",@"",@"",@"GA883",@"Mature Applicants Psychiatric Nursing (Castlebar)",@"Mature Applicants…",@"Galway - Mayo IT",@"537",@"220",@"",@"(*) Not all on this points score were offered places; (#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"GA884",@"Digital Media and Society",@"Digital Media and…",@"Galway - Mayo IT",@"255",@"",@"",@"",@"",@"",@"",@"",@"",@"GA980",@"Design and Technology Education (Letterfrack)",@"Design and Techno…",@"Galway - Mayo IT",@"420",@"425",@"",@"",@"",@"",@"",@"",@"",@"GA981",@"Furniture Design and Manufacture (Letterfrack)",@"Furniture Design…",@"Galway - Mayo IT",@"365",@"",@"",@"",@"",@"",@"",@"",@"",@"GA982",@"Furniture and Wood Technology (Letterfrack)",@"Furniture and Woo…",@"Galway - Mayo IT",@"360",@"",@"",@"",@"",@"",@"",@"",@"",@"GY101",@"Arts",@"Arts",@"NUI - Galway",@"300",@"300",@"340",@"",@"",@"",@"",@"",@"",@"GY103",@"Arts (Public and Social Policy)",@"Arts (Public and…",@"NUI - Galway",@"320",@"300",@"315",@"",@"",@"",@"",@"",@"",@"GY104",@"Arts (Psychology)",@"Arts (Psychology)",@"NUI - Galway",@"530",@"525",@"525",@"",@"",@"",@"",@"",@"",@"GY105",@"Arts (History)",@"Arts (History)",@"NUI - Galway",@"305",@"320",@"",@"",@"",@"",@"",@"",@"",@"GY106",@"Na Dána (Cumarsáid)",@"Na Dána (Cumarsái…",@"NUI - Galway",@"300",@"350",@"325",@"",@"",@"",@"",@"",@"",@"GY107",@"Na Dána (Gaeilge agus Léann an Aistriúcháin)",@"Na Dána (Gaeilge…",@"NUI - Galway",@"345",@"345",@"",@"",@"",@"",@"",@"",@"",@"GY109",@"Arts (Mathematics and Education)",@"Arts (Mathematics…",@"NUI - Galway",@"365",@"405",@"420",@"",@"",@"",@"",@"",@"",@"GY110",@"Arts with Children`s Studies",@"Arts with Childre…",@"NUI - Galway",@"420",@"420",@"",@"",@"",@"",@"",@"",@"",@"GY111",@"Arts with Creative Writing",@"Arts with Creativ…",@"NUI - Galway",@"470",@"490",@"505",@"",@"",@"",@"",@"",@"",@"GY112",@"Arts with Film Studies",@"Arts with Film St…",@"NUI - Galway",@"385",@"390",@"450",@"",@"",@"",@"",@"",@"",@"GY113",@"Arts with Human Rights",@"Arts with Human R…",@"NUI - Galway",@"430",@"425",@"470",@"",@"",@"",@"",@"",@"",@"GY114",@"Arts with Irish Studies",@"Arts with Irish S…",@"NUI - Galway",@"310",@"300",@"415",@"",@"",@"",@"",@"",@"",@"GY115",@"Arts with Performing Arts Studies",@"Arts with Perform…",@"NUI - Galway",@"400",@"410",@"465",@"",@"",@"",@"",@"",@"",@"GY117",@"Arts with Latin American Studies",@"Arts with Latin A…",@"NUI - Galway",@"385",@"305",@"335",@"",@"",@"",@"",@"",@"",@"GY118",@"Arts (Drama, Theatre and Performance Studies)",@"Arts (Drama, Thea…",@"NUI - Galway",@"450",@"450",@"",@"",@"",@"",@"",@"",@"",@"GY119",@"Arts with Journalism",@"Arts with Journal…",@"NUI - Galway",@"480",@"",@"",@"",@"",@"",@"",@"",@"",@"GY120",@"Arts (Youth and Family Studies) at St Angela`s College",@"Arts (Youth and F…",@"NUI - Galway",@"300",@"300",@"",@"",@"",@"",@"",@"",@"",@"GY201",@"Commerce",@"Commerce",@"NUI - Galway",@"375",@"340",@"360",@"",@"",@"",@"",@"",@"",@"GY202",@"Commerce (International) with French",@"Commerce (Interna…",@"NUI - Galway",@"525",@"495",@"475",@"",@"",@"",@"",@"",@"",@"GY203",@"Commerce (International) with German",@"Commerce (Interna…",@"NUI - Galway",@"450",@"405",@"400",@"",@"",@"",@"",@"",@"",@"GY204",@"Commerce (International) with Spanish",@"Commerce (Interna…",@"NUI - Galway",@"460",@"410",@"380",@"",@"",@"",@"",@"",@"",@"GY206",@"Business Information Systems",@"Business Informat…",@"NUI - Galway",@"400",@"370",@"355",@"",@"",@"",@"",@"",@"",@"GY207",@"Commerce (Accounting)",@"Commerce (Account…",@"NUI - Galway",@"440",@"420",@"420",@"",@"",@"",@"",@"",@"",@"GY250",@"Corporate Law",@"Corporate Law",@"NUI - Galway",@"355",@"340",@"385",@"",@"",@"",@"",@"",@"",@"GY251",@"Civil Law",@"Civil Law",@"NUI - Galway",@"415",@"405",@"450",@"",@"",@"",@"",@"",@"",@"GY301",@"Science",@"Science",@"NUI - Galway",@"395",@"380",@"370",@"",@"",@"",@"",@"",@"",@"GY303",@"Biomedical Science",@"Biomedical Scienc…",@"NUI - Galway",@"540",@"540",@"515",@"",@"",@"",@"",@"",@"",@"GY304",@"Biotechnology",@"Biotechnology",@"NUI - Galway",@"465",@"445",@"415",@"",@"",@"",@"",@"",@"",@"GY308",@"Environmental Science",@"Environmental Sci…",@"NUI - Galway",@"400",@"375",@"385",@"",@"",@"",@"",@"",@"",@"GY309",@"Financial Mathematics and Economics",@"Financial Mathema…",@"NUI - Galway",@"450",@"430",@"430",@"",@"",@"",@"",@"",@"",@"GY310",@"Marine Science",@"Marine Science",@"NUI - Galway",@"410",@"400",@"400",@"",@"",@"",@"",@"",@"",@"GY313",@"Health and Safety Systems",@"Health and Safety…",@"NUI - Galway",@"305",@"345",@"350",@"",@"",@"",@"",@"",@"",@"GY314",@"Earth and Ocean Sciences",@"Earth and Ocean S…",@"NUI - Galway",@"380",@"380",@"365",@"",@"",@"",@"",@"",@"",@"GY318",@"Biopharmaceutical Chemistry",@"Biopharmaceutical…",@"NUI - Galway",@"505",@"495",@"415",@"",@"",@"",@"",@"",@"",@"GY319",@"Mathematical Science",@"Mathematical Scie…",@"NUI - Galway",@"485",@"485",@"455",@"",@"",@"",@"",@"",@"",@"GY320",@"Physics(options in Applied/Astrophysics/Biomedical/Theoretic",@"Physics(options i…",@"NUI - Galway",@"400",@"",@"",@"",@"",@"",@"",@"",@"",@"GY350",@"Computer Science and Information Technology",@"Computer Science…",@"NUI - Galway",@"420",@"415",@"390",@"",@"",@"",@"",@"",@"",@"GY401",@"Engineering (Undenominated)",@"Engineering (Unde…",@"NUI - Galway",@"400",@"430",@"400",@"",@"",@"",@"",@"",@"",@"GY402",@"Civil Engineering",@"Civil Engineering",@"NUI - Galway",@"400",@"430",@"400",@"",@"",@"",@"",@"",@"",@"GY405",@"Mechanical Engineering",@"Mechanical Engine…",@"NUI - Galway",@"400",@"425",@"435",@"",@"",@"",@"",@"",@"",@"GY406",@"Electronic and Computer Engineering",@"Electronic and Co…",@"NUI - Galway",@"435",@"445",@"405",@"",@"",@"",@"",@"",@"",@"GY408",@"Biomedical Engineering",@"Biomedical Engine…",@"NUI - Galway",@"405",@"430",@"425",@"",@"",@"",@"",@"",@"",@"GY410",@"Project and Construction Management",@"Project and Const…",@"NUI - Galway",@"355",@"325",@"315",@"",@"",@"",@"",@"",@"",@"GY413",@"Energy Systems Engineering",@"Energy Systems En…",@"NUI - Galway",@"440",@"430",@"410",@"",@"",@"",@"",@"",@"",@"GY414",@"Electrical and Electronic Engineering",@"Electrical and El…",@"NUI - Galway",@"515",@"455",@"445",@"",@"",@"",@"",@"",@"",@"GY501",@"Medicine (5-year/6-year course and 8-year embedded PhD option)",@"Medicine (5-year/…",@"NUI - Galway",@"739",@"736",@"728",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"GY502",@"Occupational Therapy",@"Occupational Ther…",@"NUI - Galway",@"520",@"520",@"505",@"",@"",@"",@"",@"",@"",@"GY503",@"Speech and Language Therapy",@"Speech and Langua…",@"NUI - Galway",@"520",@"520",@"510",@"",@"",@"",@"",@"",@"",@"GY504",@"Podiatry",@"Podiatry",@"NUI - Galway",@"470",@"460",@"450",@"",@"",@"",@"",@"",@"",@"GY515",@"General Nursing (Galway and Portiuncula)",@"General Nursing (…",@"NUI - Galway",@"450",@"455",@"445",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"GY516",@"Psychiatric Nursing",@"Psychiatric Nursi…",@"NUI - Galway",@"410",@"410",@"395",@"",@"",@"",@"",@"",@"",@"GY517",@"Midwifery",@"Midwifery",@"NUI - Galway",@"450",@"450",@"420",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"GY525",@"Mature Applicants General Nursing (Galway and Portiuncula)",@"Mature Applicants…",@"NUI - Galway",@"575",@"233",@"228",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"GY526",@"Mature Applicants Psychiatric Nursing",@"Mature Applicants…",@"NUI - Galway",@"548",@"224",@"221",@"(*) Not all on this points score were offered places; (#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"GY527",@"Mature Applicants Midwifery",@"Mature Applicants…",@"NUI - Galway",@"593",@"243",@"228",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"TH002",@"Education (Joint Honours) - Business Studies and Accounting",@"Education (Joint…",@"St Patricks - Thurles",@"335",@"",@"",@"",@"",@"",@"",@"",@"",@"TH003",@"Education (Joint Honours) - Business Studies and Religious Studies",@"Education (Joint…",@"St Patricks - Thurles",@"330",@"",@"",@"",@"",@"",@"",@"",@"",@"TH004",@"Education (Joint Honours) - Irish and Religious Studies",@"Education (Joint…",@"St Patricks - Thurles",@"340",@"350",@"",@"",@"",@"",@"",@"",@"",@"TH005",@"Education (Joint Honours) - Irish and Business Studies",@"Education (Joint…",@"St Patricks - Thurles",@"365",@"",@"",@"",@"",@"",@"",@"",@"",@"DC110",@"Business Studies International",@"Business Studies…",@"Dublin City University",@"445",@"415",@"400",@"",@"",@"",@"",@"",@"",@"DC111",@"Business Studies",@"Business Studies",@"Dublin City University",@"440",@"425",@"420",@"",@"",@"",@"",@"",@"",@"DC112",@"Global Business (French)",@"Global Business (…",@"Dublin City University",@"490",@"480",@"430",@"",@"",@"",@"",@"",@"",@"DC113",@"Global Business (German)",@"Global Business (…",@"Dublin City University",@"430",@"405",@"360",@"",@"",@"",@"",@"",@"",@"DC114",@"Global Business (Spanish)",@"Global Business (…",@"Dublin City University",@"445",@"405",@"405",@"",@"",@"",@"",@"",@"",@"DC115",@"Accounting and Finance",@"Accounting and Fi…",@"Dublin City University",@"460",@"450",@"425",@"",@"",@"",@"",@"",@"",@"DC116",@"Global Business (USA)",@"Global Business (…",@"Dublin City University",@"545",@"550",@"530",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"DC117",@"Aviation Management/ AM with Pilot Studies",@"Aviation Manageme…",@"Dublin City University",@"440",@"425",@"",@"",@"",@"",@"",@"",@"",@"DC118",@"Gnó agus Gaeilge/Business and Irish",@"Gnó agus Gaeilge/…",@"Dublin City University",@"340",@"340",@"330",@"",@"",@"",@"",@"",@"",@"DC120",@"Enterprise Computing",@"Enterprise Comput…",@"Dublin City University",@"370",@"350",@"330",@"",@"",@"",@"",@"",@"",@"DC121",@"Computer Applications",@"Computer Applicat…",@"Dublin City University",@"405",@"390",@"340",@"",@"",@"",@"",@"",@"",@"DC122",@"Computational Problem-Solving and Software Development",@"Computational Pro…",@"Dublin City University",@"430",@"",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DC126",@"Actuarial Mathematics",@"Actuarial Mathema…",@"Dublin City University",@"515",@"515",@"480",@"",@"",@"",@"",@"",@"",@"DC127",@"Actuarial Financial and Mathematical Sciences (common entry)",@"Actuarial Financi…",@"Dublin City University",@"430",@"450",@"",@"",@"",@"",@"",@"",@"",@"DC131",@"Communication Studies",@"Communication Stu…",@"Dublin City University",@"410",@"425",@"440",@"",@"",@"",@"",@"",@"",@"DC132",@"Journalism",@"Journalism",@"Dublin City University",@"435",@"410",@"440",@"",@"",@"",@"",@"",@"",@"DC133",@"Multimedia",@"Multimedia",@"Dublin City University",@"425",@"430",@"420",@"",@"",@"",@"",@"",@"",@"DC155",@"Applied Language and Translation Studies",@"Applied Language…",@"Dublin City University",@"360",@"350",@"",@"",@"",@"",@"",@"",@"",@"DC156",@"Languages for International Comm. - English Stream - non-nat",@"Languages for Int…",@"Dublin City University",@"490",@"",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DC161",@"Analytical Science",@"Analytical Scienc…",@"Dublin City University",@"460",@"460",@"425",@"",@"",@"",@"",@"",@"",@"DC162",@"Chemical and Pharmaceutical Sciences",@"Chemical and Phar…",@"Dublin City University",@"475",@"470",@"425",@"",@"",@"",@"",@"",@"",@"DC166",@"Environmental Science and Health",@"Environmental Sci…",@"Dublin City University",@"435",@"405",@"380",@"",@"",@"",@"",@"",@"",@"DC167",@"Physics with Astronomy",@"Physics with Astr…",@"Dublin City University",@"410",@"415",@"370",@"",@"",@"",@"",@"",@"",@"DC168",@"Genetics and Cell Biology",@"Genetics and Cell…",@"Dublin City University",@"495",@"485",@"455",@"",@"",@"",@"",@"",@"",@"DC170",@"Horticulture",@"Horticulture",@"Dublin City University",@"350",@"380",@"375",@"",@"",@"",@"",@"",@"",@"DC171",@"Applied Physics",@"Applied Physics",@"Dublin City University",@"405",@"410",@"360",@"",@"",@"",@"",@"",@"",@"DC173",@"Physics with Biomedical Sciences",@"Physics with Biom…",@"Dublin City University",@"420",@"415",@"420",@"",@"",@"",@"",@"",@"",@"DC181",@"Biotechnology",@"Biotechnology",@"Dublin City University",@"470",@"465",@"435",@"",@"",@"",@"",@"",@"",@"DC191",@"Electronic Engineering",@"Electronic Engine…",@"Dublin City University",@"390",@"380",@"330",@"",@"",@"",@"",@"",@"",@"DC192",@"Information and Communications Engineering",@"Information and C…",@"Dublin City University",@"410",@"425",@"380",@"",@"",@"",@"",@"",@"",@"DC193",@"Mechatronic Engineering",@"Mechatronic Engin…",@"Dublin City University",@"400",@"380",@"370",@"",@"",@"",@"",@"",@"",@"DC195",@"Mechanical and Manufacturing Engineering",@"Mechanical and Ma…",@"Dublin City University",@"390",@"345",@"345",@"",@"",@"",@"",@"",@"",@"DC196",@"Manufacturing Engineering with Business Studies",@"Manufacturing Eng…",@"Dublin City University",@"375",@"330",@"300",@"",@"",@"",@"",@"",@"",@"DC197",@"Biomedical Engineering",@"Biomedical Engine…",@"Dublin City University",@"380",@"380",@"320",@"",@"",@"",@"",@"",@"",@"DC199",@"Digital Media Engineering",@"Digital Media Eng…",@"Dublin City University",@"385",@"350",@"410",@"",@"",@"",@"",@"",@"",@"DC200",@"Common Entry into Engineering (Undenominated Entry)",@"Common Entry into…",@"Dublin City University",@"390",@"370",@"300",@"",@"",@"",@"",@"",@"",@"DC201",@"Common Entry into Science (Undenominated Entry)",@"Common Entry into…",@"Dublin City University",@"450",@"435",@"400",@"",@"",@"",@"",@"",@"",@"DC202",@"Sport Science and Health",@"Sport Science and…",@"Dublin City University",@"485",@"475",@"455",@"",@"",@"",@"",@"",@"",@"DC203",@"Science Education",@"Science Education",@"Dublin City University",@"420",@"440",@"440",@"",@"",@"",@"",@"",@"",@"DC204",@"Athletic Therapy and Training",@"Athletic Therapy…",@"Dublin City University",@"510",@"520",@"500",@"",@"",@"",@"",@"",@"",@"DC205",@"Physical Education with Biology",@"Physical Educatio…",@"Dublin City University",@"490",@"505",@"485",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"DC206",@"Physical Education with Mathematics",@"Physical Educatio…",@"Dublin City University",@"490",@"500",@"",@"",@"",@"",@"",@"",@"",@"DC208",@"Psychology",@"Psychology",@"Dublin City University",@"500",@"500",@"490",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"DC209",@"Health and Society",@"Health and Societ…",@"Dublin City University",@"420",@"430",@"405",@"",@"",@"",@"",@"",@"",@"DC215",@"General Nursing",@"General Nursing",@"Dublin City University",@"445",@"440",@"435",@"",@"",@"",@"",@"",@"",@"DC216",@"Psychiatric Nursing",@"Psychiatric Nursi…",@"Dublin City University",@"400",@"390",@"375",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"DC217",@"Intellectual Disability Nursing",@"Intellectual Disa…",@"Dublin City University",@"395",@"395",@"370",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"DC218",@"Children`s and General Nursing (Integrated)",@"Children`s and Ge…",@"Dublin City University",@"485",@"495",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"DC225",@"Mature Applicants General Nursing",@"Mature Applicants…",@"Dublin City University",@"559",@"225",@"226",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DC226",@"Mature Applicants Psychiatric Nursing",@"Mature Applicants…",@"Dublin City University",@"530",@"216",@"206",@"(*) Not all on this points score were offered places; (#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DC227",@"Mature Applicants Intellectual Disability Nursing",@"Mature Applicants…",@"Dublin City University",@"510",@"210",@"202",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DC228",@"Mature Applicants Children`s and General Nursing (Integrated",@"Mature Applicants…",@"Dublin City University",@"574",@"241",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DC230",@"Economics, Politics and Law",@"Economics, Politi…",@"Dublin City University",@"390",@"390",@"",@"",@"",@"",@"",@"",@"",@"DC231",@"International Relations",@"International Rel…",@"Dublin City University",@"380",@"390",@"405",@"",@"",@"",@"",@"",@"",@"DC232",@"Law and Society (BCL)",@"Law and Society (…",@"Dublin City University",@"415",@"410",@"440",@"",@"",@"",@"",@"",@"",@"DC235",@"Education and Training",@"Education and Tra…",@"Dublin City University",@"315",@"320",@"330",@"",@"",@"",@"",@"",@"",@"DC238",@"Contemporary Culture and Society",@"Contemporary Cult…",@"Dublin City University",@"325",@"335",@"350",@"",@"",@"",@"",@"",@"",@"DC239",@"Gaeilge agus Iriseoireacht/Irish and Journalism",@"Gaeilge agus Iris…",@"Dublin City University",@"440",@"470",@"465",@"",@"",@"",@"",@"",@"",@"DC240",@"Marketing, Innovation and Technology",@"Marketing, Innova…",@"Dublin City University",@"445",@"430",@"",@"",@"",@"",@"",@"",@"",@"DC251",@"Arts - Joint Honours Programme (Law and Politics)",@"Arts - Joint Hono…",@"Dublin City University",@"400",@"",@"",@"",@"",@"",@"",@"",@"",@"DC252",@"Arts - Joint Honours Programme (Law and Irish)",@"Arts - Joint Hono…",@"Dublin City University",@"425",@"",@"",@"",@"",@"",@"",@"",@"",@"DC253",@"Arts - Joint Honours Programme (Law and French)",@"Arts - Joint Hono…",@"Dublin City University",@"420",@"",@"",@"",@"",@"",@"",@"",@"",@"DC258",@"Arts - Joint Honours Programme (Law and Media Studies)",@"Arts - Joint Hono…",@"Dublin City University",@"400",@"",@"",@"",@"",@"",@"",@"",@"",@"DC260",@"Arts - Joint Honours Programme (Politics and French)",@"Arts - Joint Hono…",@"Dublin City University",@"400",@"",@"",@"",@"",@"",@"",@"",@"",@"DC265",@"Arts - Joint Honours Programme (Politics and Media Studies)",@"Arts - Joint Hono…",@"Dublin City University",@"400",@"",@"",@"",@"",@"",@"",@"",@"",@"DC266",@"Arts - Joint Honours Programme (Irish and French)",@"Arts - Joint Hono…",@"Dublin City University",@"450",@"",@"",@"",@"",@"",@"",@"",@"",@"DC271",@"Arts - Joint Honours Programme (Media Studies and Irish)",@"Arts - Joint Hono…",@"Dublin City University",@"400",@"",@"",@"",@"",@"",@"",@"",@"",@"DC272",@"Arts - Joint Honours Programme (Media Studies and French)",@"Arts - Joint Hono…",@"Dublin City University",@"410",@"",@"",@"",@"",@"",@"",@"",@"",@"DC277",@"Arts - Joint Honours Programme (Law with International Lang)",@"Arts - Joint Hono…",@"Dublin City University",@"430",@"",@"",@"",@"",@"",@"",@"",@"",@"DC278",@"Arts - Joint Honours Programme (Politics with International Lang)",@"Arts - Joint Hono…",@"Dublin City University",@"405",@"",@"",@"",@"",@"",@"",@"",@"",@"DC279",@"Arts - Joint Honours Programme (Media Studies with Intl. Lang)",@"Arts - Joint Hono…",@"Dublin City University",@"400",@"",@"",@"",@"",@"",@"",@"",@"",@"DC280",@"Arts - Joint Honours Programme (Irish with International Lang)",@"Arts - Joint Hono…",@"Dublin City University",@"410",@"",@"",@"",@"",@"",@"",@"",@"",@"GC203",@"Law (Cork)",@"Law (Cork)",@"Griffith College Dublin, Cork and Limerick",@"",@"315",@"300",@"",@"",@"",@"",@"",@"",@"GC204",@"Business and Law (Cork)",@"Business and Law…",@"Griffith College Dublin, Cork and Limerick",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"GC300",@"Business Studies (Limerick)",@"Business Studies…",@"Griffith College Dublin, Cork and Limerick",@"300",@"",@"",@"",@"",@"",@"",@"",@"",@"GC301",@"Accounting and Finance (Limerick)",@"Accounting and Fi…",@"Griffith College Dublin, Cork and Limerick",@"230",@"",@"",@"AQA",@"",@"",@"",@"",@"",@"GC400",@"Business Studies (Dublin)",@"Business Studies…",@"Griffith College Dublin, Cork and Limerick",@"240",@"275",@"270",@"",@"",@"",@"",@"",@"",@"GC401",@"Accounting and Finance (Dublin)",@"Accounting and Fi…",@"Griffith College Dublin, Cork and Limerick",@"235",@"260",@"260",@"",@"",@"",@"",@"",@"",@"GC403",@"Law (Dublin)",@"Law (Dublin)",@"Griffith College Dublin, Cork and Limerick",@"305",@"305",@"300",@"",@"",@"",@"",@"",@"",@"GC404",@"Business and Law (Dublin)",@"Business and Law…",@"Griffith College Dublin, Cork and Limerick",@"255",@"250",@"265",@"",@"",@"",@"",@"",@"",@"GC405",@"International Hospitality Management (Dublin)",@"International Hos…",@"Griffith College Dublin, Cork and Limerick",@"260",@"210",@"260",@"",@"",@"",@"",@"",@"",@"GC430",@"Computing Science (Dublin)",@"Computing Science…",@"Griffith College Dublin, Cork and Limerick",@"240",@"190",@"205",@"",@"",@"",@"",@"",@"",@"GC450",@"Journalism and Visual Media (Dublin)",@"Journalism and Vi…",@"Griffith College Dublin, Cork and Limerick",@"230",@"215",@"205",@"",@"",@"",@"",@"",@"", @"GC455",@"Music Production (Dublin) - Interview",@"Music Production…",@"Griffith College Dublin, Cork and Limerick",@"285",@"",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"GC489",@"Interior Architecture (Dublin)",@"Interior Architec…",@"Griffith College Dublin, Cork and Limerick",@"260",@"220",@"260",@"",@"",@"",@"",@"",@"",@"GC494",@"Fashion Design (Dublin) - Portfolio",@"Fashion Design (D…",@"Griffith College Dublin, Cork and Limerick",@"270",@"255",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"BY301",@"Business",@"Business",@"Institute of Business and Technology Swords",@"777",@"21",@"",@"",@"",@"",@"",@"",@"",@"MD201",@"Education, Religion and English second level teaching",@"Education, Religi…",@"Mater Dei",@"395",@"415",@"",@"",@"",@"",@"",@"",@"",@"MD301",@"Education, Religion and History second level teaching",@"Education, Religi…",@"Mater Dei",@"385",@"385",@"",@"",@"",@"",@"",@"",@"",@"MD401",@"Education, Religion and Music second level teaching",@"Education, Religi…",@"Mater Dei",@"390",@"370",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"MD500",@"Arts - Irish Studies and Religious Studies",@"Arts - Irish Stud…",@"Mater Dei",@"280",@"265",@"320",@"",@"",@"",@"",@"",@"",@"AD101",@"Art and Design (1st Year Common Entry)",@"Art and Design (1…",@"National College of Art and Design",@"",@"",@"",@"(#) Test / Interview / Portfolio; Matriculate",@"",@"",@"",@"",@"",@"AD202",@"Design or Fine Art and Education second level teaching",@"Design or Fine Ar…",@"National College of Art and Design",@"",@"",@"",@"(#) Test / Interview / Portfolio; Matriculate",@"",@"",@"",@"",@"",@"AD212",@"Product Design",@"Product Design",@"National College of Art and Design",@"",@"",@"",@"(#) Test / Interview / Portfolio; Matriculate",@"",@"",@"",@"",@"",@"AD215",@"Visual Culture",@"Visual Culture",@"National College of Art and Design",@"360",@"",@"",@"",@"",@"",@"",@"",@"",@"LM020",@"Law and Accounting",@"Law and Accountin…",@"University of Limerick",@"420",@"415",@"430",@"",@"",@"",@"",@"",@"",@"LM022",@"Politics and International Relations",@"Politics and Inte…",@"University of Limerick",@"350",@"335",@"360",@"",@"",@"",@"",@"",@"",@"LM023",@"Health Informatics",@"Health Informatic…",@"University of Limerick",@"365",@"340",@"330",@"",@"",@"",@"",@"",@"",@"LM029",@"Law Plus",@"Law Plus",@"University of Limerick",@"405",@"405",@"440",@"",@"",@"",@"",@"",@"",@"LM030",@"Irish Music and Dance",@"Irish Music and D…",@"University of Limerick",@"350",@"330",@"300",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"LM031",@"Voice and Dance",@"Voice and Dance",@"University of Limerick",@"330",@"270",@"300",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"LM032",@"Arts (Joint Honours)",@"Arts (Joint Honou…",@"University of Limerick",@"435",@"415",@"450",@"",@"",@"",@"",@"",@"",@"LM033",@"New Media and English",@"New Media and Eng…",@"University of Limerick",@"355",@"340",@"375",@"",@"",@"",@"",@"",@"",@"LM035",@"English and History",@"English and Histo…",@"University of Limerick",@"325",@"340",@"385",@"",@"",@"",@"",@"",@"",@"LM036",@"Economics and Sociology",@"Economics and Soc…",@"University of Limerick",@"325",@"320",@"330",@"",@"",@"",@"",@"",@"",@"LM037",@"Economics and Mathematical Sciences",@"Economics and Mat…",@"University of Limerick",@"375",@"380",@"510",@"",@"",@"",@"",@"",@"",@"LM038",@"Psychology and Sociology",@"Psychology and So…",@"University of Limerick",@"495",@"495",@"485",@"",@"",@"",@"",@"",@"",@"LM039",@"Journalism and New Media",@"Journalism and Ne…",@"University of Limerick",@"410",@"380",@"430",@"",@"",@"",@"",@"",@"",@"LM040",@"European Studies",@"European Studies",@"University of Limerick",@"355",@"340",@"375",@"",@"",@"",@"",@"",@"",@"LM041",@"Politics and Public Administration",@"Politics and Publ…",@"University of Limerick",@"330",@"310",@"",@"",@"",@"",@"",@"",@"",@"LM043",@"International Insurance and European Studies",@"International Ins…",@"University of Limerick",@"320",@"315",@"315",@"",@"",@"",@"",@"",@"",@"LM044",@"Applied Languages",@"Applied Languages",@"University of Limerick",@"440",@"405",@"460",@"",@"",@"",@"",@"",@"",@"LM045",@"Language and Literature",@"Language and Lite…",@"University of Limerick",@"340",@"340",@"",@"",@"",@"",@"",@"",@"",@"LM046",@"History Politics Sociology and Social Studies",@"History Politics…",@"University of Limerick",@"320",@"320",@"",@"",@"",@"",@"",@"",@"",@"LM048",@"Irish and New Media/An Ghaeilge agus na Meáin Úra",@"Irish and New Med…",@"University of Limerick",@"355",@"340",@"",@"",@"",@"",@"",@"",@"",@"LM050",@"Business Studies",@"Business Studies",@"University of Limerick",@"410",@"375",@"390",@"",@"",@"",@"",@"",@"",@"LM051",@"Computer Systems",@"Computer Systems",@"University of Limerick",@"360",@"325",@"340",@"",@"",@"",@"",@"",@"",@"LM052",@"Business Studies and a Modern Language (French)",@"Business Studies…",@"University of Limerick",@"420",@"365",@"",@"",@"",@"",@"",@"",@"",@"LM053",@"Business Studies and a Modern Language (German)",@"Business Studies…",@"University of Limerick",@"430",@"375",@"",@"",@"",@"",@"",@"",@"",@"LM055",@"Business Studies and a Modern Language (Japanese)",@"Business Studies…",@"University of Limerick",@"400",@"375",@"",@"",@"",@"",@"",@"",@"",@"LM056",@"International Business",@"International Bus…",@"University of Limerick",@"460",@"430",@"",@"",@"",@"",@"",@"",@"",@"LM058",@"Financial Mathematics",@"Financial Mathema…",@"University of Limerick",@"430",@"420",@"395",@"",@"",@"",@"",@"",@"",@"LM060",@"Mathematical Science",@"Mathematical Scie…",@"University of Limerick",@"380",@"350",@"360",@"",@"",@"",@"",@"",@"",@"LM061",@"Pharmaceutical and Industrial Chemistry",@"Pharmaceutical an…",@"University of Limerick",@"395",@"380",@"370",@"",@"",@"",@"",@"",@"",@"LM063",@"Technology Management",@"Technology Manage…",@"University of Limerick",@"300",@"320",@"",@"",@"",@"",@"",@"",@"",@"LM064",@"Industrial Biochemistry",@"Industrial Bioche…",@"University of Limerick",@"360",@"370",@"380",@"",@"",@"",@"",@"",@"",@"LM065",@"Applied Physics",@"Applied Physics",@"University of Limerick",@"365",@"370",@"385",@"",@"",@"",@"",@"",@"",@"LM066",@"Environmental Science",@"Environmental Sci…",@"University of Limerick",@"355",@"360",@"365",@"",@"",@"",@"",@"",@"",@"LM067",@"Wood Science and Technology",@"Wood Science and…",@"University of Limerick",@"300",@"300",@"305",@"",@"",@"",@"",@"",@"",@"LM068",@"Food Science and Health",@"Food Science and…",@"University of Limerick",@"375",@"350",@"360",@"",@"",@"",@"",@"",@"",@"LM071",@"Biomedical Engineering",@"Biomedical Engine…",@"University of Limerick",@"420",@"420",@"415",@"",@"",@"",@"",@"",@"",@"LM073",@"Mechanical Engineering",@"Mechanical Engine…",@"University of Limerick",@"420",@"400",@"400",@"",@"",@"",@"",@"",@"",@"LM074",@"Computer Aided Engineering and Design",@"Computer Aided En…",@"University of Limerick",@"450",@"495",@"410",@"",@"",@"",@"",@"",@"",@"LM076",@"Product Design and Technology",@"Product Design an…",@"University of Limerick",@"375",@"350",@"370",@"",@"",@"",@"",@"",@"",@"LM077",@"Aeronautical Engineering",@"Aeronautical Engi…",@"University of Limerick",@"425",@"415",@"410",@"",@"",@"",@"",@"",@"",@"LM080",@"Electronics",@"Electronics",@"University of Limerick",@"330",@"300",@"310",@"",@"",@"",@"",@"",@"",@"LM082",@"Construction Management and Engineering",@"Construction Mana…",@"University of Limerick",@"330",@"315",@"360",@"",@"",@"",@"",@"",@"",@"LM083",@"Mobile Communications and Security",@"Mobile Communicat…",@"University of Limerick",@"355",@"320",@"345",@"",@"",@"",@"",@"",@"",@"LM085",@"Civil Engineering",@"Civil Engineering",@"University of Limerick",@"425",@"415",@"400",@"",@"",@"",@"",@"",@"",@"LM087",@"Energy",@"Energy",@"University of Limerick",@"380",@"380",@"400",@"",@"",@"",@"",@"",@"",@"LM088",@"Mathematics and Physics",@"Mathematics and P…",@"University of Limerick",@"480",@"535",@"390",@"",@"",@"",@"",@"",@"",@"LM089",@"Sport and Exercise Sciences",@"Sport and Exercis…",@"University of Limerick",@"480",@"455",@"445",@"",@"",@"",@"",@"",@"",@"LM090",@"Physical Education with concurrent Teacher Education",@"Physical Educatio…",@"University of Limerick",@"495",@"490",@"495",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"LM092",@"Science with concurrent Teacher Ed. (Bio. Sciences with Phys or Chem)",@"Science with conc…",@"University of Limerick",@"435",@"440",@"465",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"LM093",@"Equine Science",@"Equine Science",@"University of Limerick",@"325",@"340",@"335",@"",@"",@"",@"",@"",@"",@"LM094",@"Materials and Architectural Technology with concurrent Teacher ed",@"Materials and Arc…",@"University of Limerick",@"440",@"440",@"",@"",@"",@"",@"",@"",@"",@"LM095",@"Materials and Engineering Technology with concurrent Teacher ed",@"Materials and Eng…",@"University of Limerick",@"395",@"405",@"430",@"",@"",@"",@"",@"",@"",@"LM096",@"Science with concurrent Teacher Education (Physics and Chem)",@"Science with conc…",@"University of Limerick",@"420",@"380",@"425",@"",@"",@"",@"",@"",@"",@"LM099",@"Architecture",@"Architecture",@"University of Limerick",@"375",@"380",@"400",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"LM100",@"Physiotherapy",@"Physiotherapy",@"University of Limerick",@"555",@"550",@"560",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"LM101",@"Medicine - Graduate Entry",@"Medicine - Gradua…",@"University of Limerick",@"53",@"53",@"54",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"LM102",@"Psychology",@"Psychology",@"University of Limerick",@"510",@"510",@"515",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"LM110",@"Computer Games Development",@"Computer Games De…",@"University of Limerick",@"340",@"320",@"",@"",@"",@"",@"",@"",@"",@"LM113",@"Digital Media Design",@"Digital Media Des…",@"University of Limerick",@"300",@"305",@"335",@"",@"",@"",@"",@"",@"",@"LM114",@"Music, Media and Performance Technology",@"Music, Media and…",@"University of Limerick",@"335",@"345",@"",@"",@"",@"",@"",@"",@"",@"LM115",@"Chemical and Biochemical Engineering",@"Chemical and Bioc…",@"University of Limerick",@"420",@"480",@"400",@"",@"",@"",@"",@"",@"",@"LM116",@"Engineering (Choice)",@"Engineering (Choi…",@"University of Limerick",@"400",@"390",@"395",@"",@"",@"",@"",@"",@"",@"LM117",@"Science (Choice)",@"Science (Choice)",@"University of Limerick",@"360",@"360",@"380",@"",@"",@"",@"",@"",@"",@"LM118",@"Electronic and Computer Engineering",@"Electronic and Co…",@"University of Limerick",@"395",@"390",@"405",@"",@"",@"",@"",@"",@"",@"LM119",@"Design and Manufacture",@"Design and Manufa…",@"University of Limerick",@"445",@"440",@"",@"",@"",@"",@"",@"",@"",@"LM150",@"General Nursing",@"General Nursing",@"University of Limerick",@"445",@"450",@"445",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"LM151",@"Mature Applicants General Nursing",@"Mature Applicants…",@"University of Limerick",@"584",@"235",@"234",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"LM152",@"Mental Health Nursing",@"Mental Health Nur…",@"University of Limerick",@"425",@"415",@"425",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"LM153",@"Mature Applicants Mental Health Nursing",@"Mature Applicants…",@"University of Limerick",@"569",@"224",@"220",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"LM154",@"Intellectual Disability Nursing",@"Intellectual Disa…",@"University of Limerick",@"430",@"415",@"400",@"",@"",@"",@"",@"",@"",@"LM155",@"Mature Applicants Intellectual Disability Nursing",@"Mature Applicants…",@"University of Limerick",@"537",@"220",@"215",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"LM156",@"Midwifery",@"Midwifery",@"University of Limerick",@"435",@"450",@"445",@"",@"",@"",@"",@"",@"",@"LM157",@"Mature Applicants Midwifery",@"Mature Applicants…",@"University of Limerick",@"609",@"234",@"230",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"LC110",@"Art and Design",@"Art and Design",@"Limerick IT",@"613",@"607",@"701",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"LC223",@"Law and Taxation",@"Law and Taxation",@"Limerick IT",@"325",@"305",@"305",@"",@"",@"",@"",@"",@"",@"LC224",@"Business (Accounting/Finance)",@"Business (Account…",@"Limerick IT",@"315",@"330",@"335",@"",@"",@"",@"",@"",@"",@"LC225",@"Business (Marketing and Management)",@"Business (Marketi…",@"Limerick IT",@"300",@"320",@"335",@"",@"",@"",@"",@"",@"",@"LC226",@"Entrepreneurship",@"Entrepreneurship",@"Limerick IT",@"295",@"",@"",@"",@"",@"",@"",@"",@"",@"LC231",@"Business Technology (Information Systems)",@"Business Technolo…",@"Limerick IT",@"240",@"",@"",@"",@"",@"",@"",@"",@"",@"LC233",@"Software Development",@"Software Developm…",@"Limerick IT",@"255",@"330",@"320",@"",@"",@"",@"",@"",@"",@"LC234",@"Multimedia Programming and Design",@"Multimedia Progra…",@"Limerick IT",@"270",@"295",@"295",@"",@"",@"",@"",@"",@"",@"LC236",@"Internet Systems Development",@"Internet Systems…",@"Limerick IT",@"333",@"240",@"250",@"",@"",@"",@"",@"",@"",@"LC239",@"Computer Networks and Systems Management",@"Computer Networks…",@"Limerick IT",@"275",@"270",@"",@"",@"",@"",@"",@"",@"",@"LC241",@"Construction Management",@"Construction Mana…",@"Limerick IT",@"225",@"215",@"250",@"",@"",@"",@"",@"",@"",@"LC242",@"Property Valuation and Management",@"Property Valuatio…",@"Limerick IT",@"260",@"275",@"",@"",@"",@"",@"",@"",@"",@"LC243",@"Quantity Surveying",@"Quantity Surveyin…",@"Limerick IT",@"245",@"290",@"310",@"",@"",@"",@"",@"",@"",@"LC252",@"Civil Engineering Management",@"Civil Engineering…",@"Limerick IT",@"255",@"255",@"275",@"",@"",@"",@"",@"",@"",@"LC265",@"Pharmaceutical and Forensic Analysis",@"Pharmaceutical an…",@"Limerick IT",@"370",@"360",@"330",@"",@"",@"",@"",@"",@"",@"LC266",@"Drug and Medicinal Product Analysis",@"Drug and Medicina…",@"Limerick IT",@"270",@"290",@"285",@"",@"",@"",@"",@"",@"",@"LC292",@"Applied Social Studies (Social Care)",@"Applied Social St…",@"Limerick IT",@"330",@"355",@"360",@"",@"",@"",@"",@"",@"",@"LC293",@"Business with Tourism",@"Business with Tou…",@"Limerick IT",@"270",@"245",@"270",@"",@"",@"",@"",@"",@"",@"LC294",@"Business with Event Management",@"Business with Eve…",@"Limerick IT",@"300",@"340",@"350",@"",@"",@"",@"",@"",@"",@"LC295",@"Business with Sports Management",@"Business with Spo…",@"Limerick IT",@"300",@"330",@"335",@"",@"",@"",@"",@"",@"",@"LC407",@"Social and Community Studies (Thurles)",@"Social and Commun…",@"Limerick IT",@"200",@"245",@"",@"",@"",@"",@"",@"",@"",@"LC408",@"Environmental and Natural Resource Management (Thurles)",@"Environmental and…",@"Limerick IT",@"255",@"270",@"",@"",@"",@"",@"",@"",@"",@"LC410",@"Accounting and Finance (Thurles)",@"Accounting and Fi…",@"Limerick IT",@"335",@"305",@"",@"",@"",@"",@"",@"",@"",@"DT001",@"Product Design",@"Product Design",@"Dublin Institute of Technology",@"400",@"395",@"370",@"",@"",@"",@"",@"",@"",@"DT021",@"Electrical and Electronic Engineering",@"Electrical and El…",@"Dublin Institute of Technology",@"385",@"393",@"",@"",@"",@"",@"",@"",@"",@"DT023",@"Manufacturing and Design Engineering",@"Manufacturing and…",@"Dublin Institute of Technology",@"290",@"315",@"305",@"",@"",@"",@"",@"",@"",@"DT025",@"Engineering - Common 1st Year",@"Engineering - Com…",@"Dublin Institute of Technology",@"350",@"365",@"340",@"",@"",@"",@"",@"",@"",@"DT028",@"Transport Operations and Technology",@"Transport Operati…",@"Dublin Institute of Technology",@"270",@"270",@"255",@"",@"",@"",@"",@"",@"",@"DT081",@"Computer and Communications Engineering",@"Computer and Comm…",@"Dublin Institute of Technology",@"375",@"370",@"320",@"",@"",@"",@"",@"",@"",@"DT101",@"Architecture",@"Architecture",@"Dublin Institute of Technology",@"520",@"545",@"525",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DT106",@"Planning and Environmental Management",@"Planning and Envi…",@"Dublin Institute of Technology",@"260",@"275",@"270",@"",@"",@"",@"",@"",@"",@"DT110",@"Property Economics (Valuation Surveying)",@"Property Economic…",@"Dublin Institute of Technology",@"300",@"275",@"305",@"",@"",@"",@"",@"",@"",@"DT111",@"Construction Economics and Management (Quantity Surveying)",@"Construction Econ…",@"Dublin Institute of Technology",@"275",@"270",@"285",@"",@"",@"",@"",@"",@"",@"DT112",@"Geomatics (Surveying and Mapping)",@"Geomatics (Survey…",@"Dublin Institute of Technology",@"270",@"270",@"290",@"",@"",@"",@"",@"",@"",@"DT117",@"Construction Management",@"Construction Mana…",@"Dublin Institute of Technology",@"260",@"260",@"270",@"",@"",@"",@"",@"",@"",@"DT175",@"Architectural Technology",@"Architectural Tec…",@"Dublin Institute of Technology",@"300",@"300",@"320",@"",@"",@"",@"",@"",@"",@"DT201",@"Science (General Entry)",@"Science (General…",@"Dublin Institute of Technology",@"405",@"",@"",@"",@"",@"",@"",@"",@"",@"DT203",@"Forensic and Environmental Chemistry",@"Forensic and Envi…",@"Dublin Institute of Technology",@"340",@"325",@"",@"",@"",@"",@"",@"",@"",@"DT204",@"Biomedical Science",@"Biomedical Scienc…",@"Dublin Institute of Technology",@"495",@"480",@"430",@"",@"",@"",@"",@"",@"",@"DT205",@"Mathematical Sciences",@"Mathematical Scie…",@"Dublin Institute of Technology",@"265",@"285",@"255",@"",@"",@"",@"",@"",@"",@"DT211",@"Computing",@"Computing",@"Dublin Institute of Technology",@"375",@"350",@"320",@"",@"",@"",@"",@"",@"",@"DT220",@"Industrial Mathematics",@"Industrial Mathem…",@"Dublin Institute of Technology",@"270",@"275",@"290",@"",@"",@"",@"",@"",@"",@"DT221",@"Physics with Energy and Environment",@"Physics with Ener…",@"Dublin Institute of Technology",@"310",@"",@"",@"",@"",@"",@"",@"",@"",@"DT222",@"Physics Technology",@"Physics Technolog…",@"Dublin Institute of Technology",@"320",@"320",@"305",@"",@"",@"",@"",@"",@"",@"DT223",@"Human Nutrition and Dietetics",@"Human Nutrition a…",@"Dublin Institute of Technology",@"545",@"555",@"535",@"",@"",@"",@"",@"",@"",@"DT224",@"Optometry",@"Optometry",@"Dublin Institute of Technology",@"495",@"525",@"495",@"",@"",@"",@"",@"",@"",@"DT225",@"Public Health Nutrition",@"Public Health Nut…",@"Dublin Institute of Technology",@"385",@"",@"",@"",@"",@"",@"",@"",@"",@"DT227",@"Science with Nanotechnology",@"Science with Nano…",@"Dublin Institute of Technology",@"350",@"375",@"325",@"",@"",@"",@"",@"",@"",@"DT228",@"Computer Science",@"Computer Science",@"Dublin Institute of Technology",@"405",@"400",@"350",@"",@"",@"",@"",@"",@"",@"DT229",@"Clinical Measurement Science",@"Clinical Measurem…",@"Dublin Institute of Technology",@"450",@"440",@"",@"",@"",@"",@"",@"",@"",@"DT235",@"Physics with Medical Physics and Bioengineering",@"Physics with Medi…",@"Dublin Institute of Technology",@"325",@"325",@"320",@"",@"",@"",@"",@"",@"",@"DT299",@"Chemical Sciences with Medicinal Chemistry",@"Chemical Sciences…",@"Dublin Institute of Technology",@"395",@"390",@"335",@"",@"",@"",@"",@"",@"",@"DT321",@"Business and Law",@"Business and Law",@"Dublin Institute of Technology",@"430",@"400",@"",@"",@"",@"",@"",@"",@"",@"DT341",@"Marketing",@"Marketing",@"Dublin Institute of Technology",@"380",@"375",@"370",@"",@"",@"",@"",@"",@"",@"DT343",@"Retail and Services Management",@"Retail and Servic…",@"Dublin Institute of Technology",@"330",@"330",@"325",@"",@"",@"",@"",@"",@"",@"DT354",@"Business Computing",@"Business Computin…",@"Dublin Institute of Technology",@"365",@"340",@"350",@"",@"",@"",@"",@"",@"",@"DT358",@"Logistics and Supply Chain Management",@"Logistics and Sup…",@"Dublin Institute of Technology",@"300",@"290",@"285",@"",@"",@"",@"",@"",@"",@"DT365",@"Business and Management",@"Business and Mana…",@"Dublin Institute of Technology",@"415",@"400",@"400",@"",@"",@"",@"",@"",@"",@"DT366",@"Accounting and Finance",@"Accounting and Fi…",@"Dublin Institute of Technology",@"400",@"380",@"385",@"",@"",@"",@"",@"",@"",@"DT398",@"Human Resource Management",@"Human Resource Ma…",@"Dublin Institute of Technology",@"345",@"340",@"335",@"",@"",@"",@"",@"",@"",@"DT399",@"Economics and Finance",@"Economics and Fin…",@"Dublin Institute of Technology",@"385",@"385",@"385",@"",@"",@"",@"",@"",@"",@"DT401",@"International Hospitality Management",@"International Hos…",@"Dublin Institute of Technology",@"300",@"295",@"280",@"",@"",@"",@"",@"",@"",@"DT407",@"Culinary Arts",@"Culinary Arts",@"Dublin Institute of Technology",@"370",@"370",@"385",@"",@"",@"",@"",@"",@"",@"DT412",@"Tourism Marketing",@"Tourism Marketing",@"Dublin Institute of Technology",@"290",@"250",@"250",@"",@"",@"",@"",@"",@"",@"DT413",@"Event Management",@"Event Management",@"Dublin Institute of Technology",@"365",@"380",@"380",@"",@"",@"",@"",@"",@"", @"DT416",@"Culinary Entrepreneurship",@"Culinary Entrepre…",@"Dublin Institute of Technology",@"350",@"335",@"315",@"",@"",@"",@"",@"",@"",@"DT417",@"Bar Studies (Management and Entrepreneurship)",@"Bar Studies (Mana…",@"Dublin Institute of Technology",@"300",@"285",@"290",@"",@"",@"",@"",@"",@"",@"DT420",@"Nutraceuticals in Health and Nutrition",@"Nutraceuticals in…",@"Dublin Institute of Technology",@"405",@"400",@"355",@"",@"",@"",@"",@"",@"",@"DT421",@"Food Innovation",@"Food Innovation",@"Dublin Institute of Technology",@"330",@"280",@"270",@"",@"",@"",@"",@"",@"",@"DT422",@"Pharmaceutical Healthcare",@"Pharmaceutical He…",@"Dublin Institute of Technology",@"365",@"345",@"315",@"",@"",@"",@"",@"",@"",@"DT491",@"Environmental Health",@"Environmental Hea…",@"Dublin Institute of Technology",@"325",@"325",@"330",@"",@"",@"",@"",@"",@"",@"DT501",@"Music",@"Music",@"Dublin Institute of Technology",@"341",@"317",@"343",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DT504",@"Film and Broadcasting",@"Film and Broadcas…",@"Dublin Institute of Technology",@"460",@"460",@"420",@"",@"",@"",@"",@"",@"",@"DT505",@"Film and Broadcasting with a Language",@"Film and Broadcas…",@"Dublin Institute of Technology",@"450",@"415",@"380",@"",@"",@"",@"",@"",@"",@"DT506",@"Commercial Modern Music",@"Commercial Modern…",@"Dublin Institute of Technology",@"900",@"435",@"305",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DT517",@"English Studies & Languages",@"English Studies &…",@"Dublin Institute of Technology",@"310",@"",@"",@"",@"",@"",@"",@"",@"",@"DT518",@"Languages and International Tourism (French)",@"Languages and Int…",@"Dublin Institute of Technology",@"310",@"310",@"",@"",@"",@"",@"",@"",@"",@"DT519",@"Languages and International Tourism (German)",@"Languages and Int…",@"Dublin Institute of Technology",@"300",@"320",@"",@"",@"",@"",@"",@"",@"",@"DT520",@"Languages and International Tourism (Spanish)",@"Languages and Int…",@"Dublin Institute of Technology",@"310",@"305",@"",@"",@"",@"",@"",@"",@"",@"DT529",@"Drama (Performance)",@"Drama (Performanc…",@"Dublin Institute of Technology",@"370",@"360",@"405",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DT532",@"Law (LL.B)",@"Law (LL.B)",@"Dublin Institute of Technology",@"385",@"350",@"",@"",@"",@"",@"",@"",@"",@"DT533",@"Visual and Critical Studies",@"Visual and Critic…",@"Dublin Institute of Technology",@"300",@"300",@"310",@"",@"",@"",@"",@"",@"",@"DT544",@"Design - Interior and Furniture",@"Design - Interior…",@"Dublin Institute of Technology",@"580",@"465",@"505",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DT545",@"Design - Visual Communication",@"Design - Visual C…",@"Dublin Institute of Technology",@"720",@"655",@"735",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DT546",@"Fine Art",@"Fine Art",@"Dublin Institute of Technology",@"715",@"715",@"840",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DT553",@"Journalism with a Language",@"Journalism with a…",@"Dublin Institute of Technology",@"340",@"330",@"360",@"",@"",@"",@"",@"",@"",@"DT555",@"International Business and Languages - (French)",@"International Bus…",@"Dublin Institute of Technology",@"380",@"380",@"395",@"",@"",@"",@"",@"",@"",@"DT556",@"International Business and Languages - (German)",@"International Bus…",@"Dublin Institute of Technology",@"370",@"340",@"325",@"",@"",@"",@"",@"",@"",@"DT557",@"International Business and Languages - (Spanish)",@"International Bus…",@"Dublin Institute of Technology",@"375",@"365",@"370",@"",@"",@"",@"",@"",@"",@"DT558",@"International Business and Languages (English - non-native speakers)",@"International Bus…",@"Dublin Institute of Technology",@"425",@"310",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DT559",@"Photography",@"Photography",@"Dublin Institute of Technology",@"555",@"560",@"635",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DT564",@"International Business and Languages - (Italian)",@"International Bus…",@"Dublin Institute of Technology",@"310",@"310",@"330",@"",@"",@"",@"",@"",@"",@"DT565",@"Chinese and International Business",@"Chinese and Inter…",@"Dublin Institute of Technology",@"350",@"345",@"345",@"",@"",@"",@"",@"",@"",@"DT571",@"Social Care",@"Social Care",@"Dublin Institute of Technology",@"395",@"410",@"400",@"",@"",@"",@"",@"",@"",@"DT572",@"Early Childhood Education",@"Early Childhood E…",@"Dublin Institute of Technology",@"420",@"435",@"410",@"",@"",@"",@"",@"",@"",@"DT582",@"Journalism",@"Journalism",@"Dublin Institute of Technology",@"405",@"400",@"415",@"",@"",@"",@"",@"",@"",@"DT596",@"Print and Digital Media Technology Management",@"Print and Digital…",@"Dublin Institute of Technology",@"235",@"185",@"",@"",@"",@"",@"",@"",@"",@"DT597",@"Creative and Cultural Industries",@"Creative and Cult…",@"Dublin Institute of Technology",@"365",@"365",@"",@"",@"",@"",@"",@"",@"",@"DL041",@"Animation",@"Animation",@"Dun Laoghaire IADT",@"755",@"835",@"850",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DL042",@"Photography",@"Photography",@"Dun Laoghaire IADT",@"665",@"715",@"725",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DL043",@"Visual Communications",@"Visual Communicat…",@"Dun Laoghaire IADT",@"660",@"669",@"695",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DL044",@"Visual Arts Practice (Fine Art)",@"Visual Arts Pract…",@"Dun Laoghaire IADT",@"525",@"550",@"565",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DL045",@"Film and Television Production",@"Film and Televisi…",@"Dun Laoghaire IADT",@"815",@"860",@"900",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DL046",@"Modelmaking, Design and Digital Effects",@"Modelmaking, Desi…",@"Dun Laoghaire IADT",@"555",@"665",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DL047",@"Design for Stage and Screen (Production Design)",@"Design for Stage…",@"Dun Laoghaire IADT",@"745",@"660",@"630",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DL048",@"Design for Stage and Screen (Costume Design)",@"Design for Stage…",@"Dun Laoghaire IADT",@"685",@"875",@"860",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DL049",@"Design for Stage and Screen (Makeup Design)",@"Design for Stage…",@"Dun Laoghaire IADT",@"785",@"950",@"860",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DL141",@"Applied Psychology",@"Applied Psycholog…",@"Dun Laoghaire IADT",@"380",@"385",@"380",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"DL143",@"Multimedia Systems/Web Engineering",@"Multimedia System…",@"Dun Laoghaire IADT",@"290",@"310",@"290",@"",@"",@"",@"",@"",@"",@"DL241",@"English, Media and Cultural Studies",@"English, Media an…",@"Dun Laoghaire IADT",@"300",@"305",@"",@"",@"",@"",@"",@"",@"",@"DL242",@"Business Studies and Arts Management",@"Business Studies…",@"Dun Laoghaire IADT",@"205",@"290",@"325",@"",@"",@"",@"",@"",@"",@"DL245",@"Business Studies - Entrepreneurship and Management",@"Business Studies…",@"Dun Laoghaire IADT",@"265",@"210",@"",@"",@"",@"",@"",@"",@"",@"IC001",@"Journalism",@"Journalism",@"Independent Colleges Dublin ",@"215",@"240",@"260",@"",@"",@"",@"",@"",@"",@"IC004",@"Business Studies",@"Business Studies",@"Independent Colleges Dublin ",@"265",@"250",@"328",@"",@"",@"",@"",@"",@"",@"IC005",@"Accounting and Finance",@"Accounting and Fi…",@"Independent Colleges Dublin ",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"IC007",@"Marketing",@"Marketing",@"Independent Colleges Dublin ",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"ID001",@"Accounting and Finance",@"Accounting and Fi…",@"ICD Business School",@"280",@"16",@"",@"",@"",@"",@"",@"",@"",@"ID002",@"Business Studies",@"Business Studies",@"ICD Business School",@"",@"18",@"",@"",@"",@"",@"",@"",@"",@"ID003",@"Business Studies with Chinese",@"Business Studies…",@"ICD Business School",@"",@"12",@"",@"",@"",@"",@"",@"",@"",@"NC003",@"Computing",@"Computing",@"National College of Ireland",@"270",@"320",@"270",@"",@"",@"",@"",@"",@"",@"NC004",@"Business Information Systems",@"Business Informat…",@"National College of Ireland",@"265",@"325",@"275",@"",@"",@"",@"",@"",@"",@"NC005",@"Human Resource Management",@"Human Resource Ma…",@"National College of Ireland",@"275",@"290",@"290",@"",@"",@"",@"",@"",@"",@"NC006",@"Accounting",@"Accounting",@"National College of Ireland",@"325",@"340",@"340",@"",@"",@"",@"",@"",@"",@"NC009",@"Business",@"Business",@"National College of Ireland",@"270",@"280",@"290",@"",@"",@"",@"",@"",@"",@"NC010",@"Psychology",@"Psychology",@"National College of Ireland",@"210",@"",@"",@"AQA",@"",@"",@"",@"",@"",@"NC020",@"Marketing Practice",@"Marketing Practic…",@"National College of Ireland",@"245",@"",@"",@"",@"",@"",@"",@"",@"",@"LC413",@"Business (Thurles)",@"Business (Thurles…",@"Limerick IT",@"350",@"265",@"",@"",@"",@"",@"",@"",@"",@"LC415",@"Computing - Software Development (Thurles)",@"Computing - Softw…",@"Limerick IT",@"200",@"250",@"",@"",@"",@"",@"",@"",@"",@"LC418",@"Computing - Games Design and Development (Thurles)",@"Computing - Games…",@"Limerick IT",@"260",@"245",@"",@"",@"",@"",@"",@"",@"",@"LC420",@"Computing - Smart Energy Systems (Thurles)",@"Computing - Smart…",@"Limerick IT",@"",@"260",@"",@"",@"",@"",@"",@"",@"",@"LC422",@"Sports Strength and Conditioning (Thurles)",@"Sports Strength a…",@"Limerick IT",@"300",@"310",@"",@"",@"",@"",@"",@"",@"",@"LC513",@"Business (Clonmel)",@"Business (Clonmel…",@"Limerick IT",@"275",@"315",@"",@"",@"",@"",@"",@"",@"",@"LC517",@"Creative Multimedia (Clonmel)",@"Creative Multimed…",@"Limerick IT",@"225",@"305",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"LC518",@"Digital Animation Production (Clonmel)",@"Digital Animation…",@"Limerick IT",@"550",@"527",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"LY108",@"Business - Accounting",@"Business - Accoun…",@"Letterkenny IT",@"280",@"275",@"270",@"",@"",@"",@"",@"",@"",@"LY118",@"Business",@"Business",@"Letterkenny IT",@"285",@"265",@"",@"",@"",@"",@"",@"",@"",@"LY208",@"Law",@"Law",@"Letterkenny IT",@"230",@"",@"",@"",@"",@"",@"",@"",@"",@"LY218",@"Business - with Irish/French/Spanish/German",@"Business - with I…",@"Letterkenny IT",@"220",@"250",@"",@"",@"",@"",@"",@"",@"",@"LY228",@"Sports Coaching and Performance",@"Sports Coaching a…",@"Letterkenny IT",@"240",@"265",@"",@"",@"",@"",@"",@"",@"",@"LY308",@"Destination Tourism with Marketing at Killybegs",@"Destination Touri…",@"Letterkenny IT",@"295",@"",@"",@"",@"",@"",@"",@"",@"",@"LY408",@"Design - Visual Communication",@"Design - Visual C…",@"Letterkenny IT",@"240",@"225",@"",@"",@"",@"",@"",@"",@"",@"LY508",@"Fire Safety Engineering",@"Fire Safety Engin…",@"Letterkenny IT",@"230",@"270",@"",@"",@"",@"",@"",@"",@"",@"LY708",@"Applied Computing",@"Applied Computing",@"Letterkenny IT",@"245",@"250",@"250",@"",@"",@"",@"",@"",@"",@"LY718",@"Computing with Cloud and Green Information Technology",@"Computing with Cl…",@"Letterkenny IT",@"245",@"290",@"",@"",@"",@"",@"",@"",@"",@"LY908",@"General Nursing",@"General Nursing",@"Letterkenny IT",@"400",@"400",@"385",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"LY918",@"Psychiatric Nursing",@"Psychiatric Nursi…",@"Letterkenny IT",@"365",@"375",@"350",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"LY928",@"Intellectual Disability Nursing",@"Intellectual Disa…",@"Letterkenny IT",@"365",@"365",@"345",@"",@"",@"",@"",@"",@"",@"LY938",@"Mature Applicants General Nursing",@"Mature Applicants…",@"Letterkenny IT",@"559",@"228",@"221",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"LY948",@"Mature Applicants Psychiatric Nursing",@"Mature Applicants…",@"Letterkenny IT",@"555",@"216",@"219",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"LY958",@"Mature Applicants Intellectual Disability Nursing",@"Mature Applicants…",@"Letterkenny IT",@"525",@"202",@"219",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"LY968",@"Early Childhood Care, Health and Education",@"Early Childhood C…",@"Letterkenny IT",@"270",@"315",@"",@"",@"",@"",@"",@"",@"",@"MI004",@"Liberal Arts",@"Liberal Arts",@"Letterkenny IT",@"345",@"370",@"390",@"",@"",@"",@"",@"",@"",@"MI005",@"Education - Primary Teaching",@"Education - Prima…",@"Letterkenny IT",@"465",@"465",@"470",@"",@"",@"",@"",@"",@"",@"MI006",@"Education - Primary Teaching - Gaeltacht Applicants",@"Education - Prima…",@"Letterkenny IT",@"425",@"430",@"430",@"",@"",@"",@"",@"",@"",@"MI007",@"Early Childhood Care and Education",@"Early Childhood C…",@"Letterkenny IT",@"365",@"370",@"365",@"",@"",@"",@"",@"",@"",@"MI008",@"Education and Psychology - Primary Teaching",@"Education and Psy…",@"Letterkenny IT",@"560",@"555",@"545",@"",@"",@"",@"",@"",@"",@"CI101",@"Counselling and Psychotherapy",@"Counselling and P…",@"National Counselling and Psychotherapy Institute",@"265",@"260",@"245",@"",@"",@"",@"",@"",@"",@"MU001",@"Theology and Arts",@"Theology and Arts",@"ST Patricks (Pontifical)-Maynooth",@"310",@"315",@"325",@"",@"",@"",@"",@"",@"",@"MU002",@"Theology",@"Theology",@"ST Patricks (Pontifical)-Maynooth",@"325",@"315",@"320",@"",@"",@"",@"",@"",@"",@"MH001",@"Education - Primary Teaching",@"Education - Prima…",@"NUI - Maynooth",@"495",@"465",@"",@"",@"",@"",@"",@"",@"",@"MH002",@"Education - Primary Teaching - Gaeltacht Applicants",@"Education - Prima…",@"NUI - Maynooth",@"",@"425",@"",@"",@"",@"",@"",@"",@"",@"MH003",@"Early Childhood - Teaching and Learning (part-time)",@"Early Childhood -…",@"NUI - Maynooth",@"365",@"350",@"",@"",@"",@"",@"",@"",@"",@"MH101",@"Arts",@"Arts",@"NUI - Maynooth",@"355",@"365",@"375",@"",@"",@"",@"",@"",@"",@"MH102",@"Music Technology",@"Music Technology",@"NUI - Maynooth",@"385",@"405",@"400",@"",@"",@"",@"",@"",@"",@"MH103",@"Music",@"Music",@"NUI - Maynooth",@"",@"",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"MH104",@"Mathematics",@"Mathematics",@"NUI - Maynooth",@"485",@"535",@"510",@"",@"",@"",@"",@"",@"",@"MH106",@"Psychology",@"Psychology",@"NUI - Maynooth",@"505",@"515",@"505",@"",@"",@"",@"",@"",@"",@"MH107",@"Social Science",@"Social Science",@"NUI - Maynooth",@"400",@"410",@"390",@"",@"",@"",@"",@"",@"",@"MH108",@"European Studies",@"European Studies",@"NUI - Maynooth",@"395",@"395",@"385",@"",@"",@"",@"",@"",@"",@"MH109",@"Media Studies",@"Media Studies",@"NUI - Maynooth",@"450",@"450",@"445",@"",@"",@"",@"",@"",@"",@"MH110",@"Digital Media",@"Digital Media",@"NUI - Maynooth",@"350",@"350",@"365",@"",@"",@"",@"",@"",@"",@"MH111",@"Anthropology",@"Anthropology",@"NUI - Maynooth",@"375",@"375",@"370",@"",@"",@"",@"",@"",@"",@"MH112",@"Politics",@"Politics",@"NUI - Maynooth",@"350",@"350",@"350",@"",@"",@"",@"",@"",@"",@"MH113",@"History",@"History",@"NUI - Maynooth",@"400",@"400",@"400",@"",@"",@"",@"",@"",@"",@"MH114",@"English",@"English",@"NUI - Maynooth",@"430",@"450",@"440",@"",@"",@"",@"",@"",@"",@"MH115",@"Law (BCL) and Arts",@"Law (BCL) and Art…",@"NUI - Maynooth",@"450",@"460",@"450",@"",@"",@"",@"",@"",@"",@"MH116",@"Community and Youth Work - Full Time",@"Community and You…",@"NUI - Maynooth",@"",@"",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"MH117",@"Community and Youth Work - Part-Time In-service",@"Community and You…",@"NUI - Maynooth",@"",@"",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"MH119",@"Law (LLB)",@"Law (LLB)",@"NUI - Maynooth",@"460",@"475",@"460",@"",@"",@"",@"",@"",@"",@"MH120",@"Philosophy, Politics and Economics (PPE)",@"Philosophy, Polit…",@"NUI - Maynooth",@"400",@"410",@"",@"",@"",@"",@"",@"",@"",@"MH121",@"International Development",@"International Dev…",@"NUI - Maynooth",@"360",@"",@"",@"",@"",@"",@"",@"",@"",@"MH140",@"Computer Science and Software Engineering (Arts)",@"Computer Science…",@"NUI - Maynooth",@"385",@"380",@"",@"",@"",@"",@"",@"",@"",@"MH201",@"Science",@"Science",@"NUI - Maynooth",@"410",@"415",@"375",@"",@"",@"",@"",@"",@"",@"MH202",@"Biotechnology",@"Biotechnology",@"NUI - Maynooth",@"425",@"415",@"380",@"",@"",@"",@"",@"",@"",@"MH203",@"Computer Science and Software Engineering (Science Entry)",@"Computer Science…",@"NUI - Maynooth",@"405",@"400",@"355",@"",@"",@"",@"",@"",@"",@"MH204",@"Physics with Astrophysics",@"Physics with Astr…",@"NUI - Maynooth",@"445",@"440",@"410",@"",@"",@"",@"",@"",@"",@"MH206",@"Theoretical Physics and Mathematics",@"Theoretical Physi…",@"NUI - Maynooth",@"570",@"505",@"520",@"",@"",@"",@"",@"",@"",@"MH208",@"Biological and Biomedical Sciences",@"Biological and Bi…",@"NUI - Maynooth",@"460",@"455",@"435",@"",@"",@"",@"",@"",@"",@"MH209",@"Psychology (through Science)",@"Psychology (throu…",@"NUI - Maynooth",@"470",@"455",@"465",@"",@"",@"",@"",@"",@"",@"MH210",@"Pharmaceutical and Biomedical Chemistry",@"Pharmaceutical an…",@"NUI - Maynooth",@"435",@"445",@"400",@"",@"",@"",@"",@"",@"",@"MH211",@"Multimedia, Mobile and Web development",@"Multimedia, Mobil…",@"NUI - Maynooth",@"360",@"360",@"355",@"",@"",@"",@"",@"",@"",@"MH212",@"Science Education",@"Science Education",@"NUI - Maynooth",@"465",@"500",@"470",@"",@"",@"",@"",@"",@"",@"MH213",@"Mathematics Education",@"Mathematics Educa…",@"NUI - Maynooth",@"445",@"495",@"",@"",@"",@"",@"",@"",@"",@"MH214",@"Computational Thinking (Comp Science, Mathematics and Philosophy)",@"Computational Thi…",@"NUI - Maynooth",@"520",@"500",@"",@"",@"",@"",@"",@"",@"",@"MH301",@"Electronic Engineering with Computers",@"Electronic Engine…",@"NUI - Maynooth",@"390",@"395",@"350",@"",@"",@"",@"",@"",@"",@"MH302",@"Electronic Engineering",@"Electronic Engine…",@"NUI - Maynooth",@"360",@"320",@"335",@"",@"",@"",@"",@"",@"",@"MH303",@"Electronic Engineering with Communications",@"Electronic Engine…",@"NUI - Maynooth",@"355",@"335",@"350",@"",@"",@"",@"",@"",@"",@"MH304",@"Common entry to Computer, Electronic and Communications Engineering",@"Common entry to C…",@"NUI - Maynooth",@"380",@"390",@"",@"",@"",@"",@"",@"",@"",@"MH305",@"Product Design",@"Product Design",@"NUI - Maynooth",@"330",@"350",@"",@"",@"",@"",@"",@"",@"",@"MH401",@"Finance",@"Finance",@"NUI - Maynooth",@"360",@"360",@"350",@"",@"",@"",@"",@"",@"",@"MH403",@"Accounting and Finance",@"Accounting and Fi…",@"NUI - Maynooth",@"400",@"395",@"",@"",@"",@"",@"",@"",@"",@"MH404",@"Business and Management",@"Business and Mana…",@"NUI - Maynooth",@"430",@"425",@"420",@"",@"",@"",@"",@"",@"",@"MH405",@"Equine Business",@"Equine Business",@"NUI - Maynooth",@"355",@"380",@"360",@"",@"",@"",@"",@"",@"",@"MH406",@"Law and Business",@"Law and Business",@"NUI - Maynooth",@"450",@"460",@"450",@"",@"",@"",@"",@"",@"",@"MH407",@"Business and Accounting",@"Business and Acco…",@"NUI - Maynooth",@"400",@"395",@"380",@"",@"",@"",@"",@"",@"",@"MH408",@"International Finance and Economics",@"International Fin…",@"NUI - Maynooth",@"420",@"420",@"410",@"",@"",@"",@"",@"",@"",@"MH410",@"Marketing",@"Marketing",@"NUI - Maynooth",@"400",@"400",@"",@"",@"",@"",@"",@"",@"",@"MH411",@"Entrepreneurship",@"Entrepreneurship",@"NUI - Maynooth",@"355",@"355",@"",@"",@"",@"",@"",@"",@"",@"MH901",@"Arts (Kilkenny Campus - first year only)",@"Arts (Kilkenny Ca…",@"NUI - Maynooth",@"305",@"",@"",@"",@"",@"",@"",@"",@"",@"SN001",@"Business Studies in International Hotel Management",@"Business Studies…",@"Shannon College of Hotel Mgt",@"471",@"471",@"476",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"SN002",@"Commerce (Year 4 in NUI",@"Commerce (Year 4…",@"Shannon College of Hotel Mgt",@"621",@"625",@"621",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"TA021",@"European Studies",@"European Studies",@"IT Tallaght",@"210",@"215",@"180",@"",@"",@"",@"",@"",@"",@"TA022",@"Creative Digital Media",@"Creative Digital…",@"IT Tallaght",@"325",@"350",@"350",@"",@"",@"",@"",@"",@"",@"TA023",@"Advertising and Marketing Communications",@"Advertising and M…",@"IT Tallaght",@"205",@"230",@"235",@"(v) New competition for Available/Vacant Places",@"",@"",@"",@"",@"",@"TA025",@"Social Care Practice",@"Social Care Pract…",@"IT Tallaght",@"325",@"350",@"335",@"",@"",@"",@"",@"",@"", @"TA026",@"International Hospitality and Tourism Management",@"International Hos…",@"IT Tallaght",@"235",@"245",@"255",@"",@"",@"",@"",@"",@"",@"TA121",@"Accounting and Finance",@"Accounting and Fi…",@"IT Tallaght",@"230",@"230",@"265",@"",@"",@"",@"",@"",@"",@"TA122",@"Management",@"Management",@"IT Tallaght",@"205",@"245",@"230",@"",@"",@"",@"",@"",@"",@"TA123",@"Marketing Management",@"Marketing Managem…",@"IT Tallaght",@"220",@"200",@"225",@"",@"",@"",@"",@"",@"",@"TA221",@"Electronic Engineering",@"Electronic Engine…",@"IT Tallaght",@"230",@"255",@"230",@"",@"",@"",@"",@"",@"",@"TA222",@"Mechanical Engineering",@"Mechanical Engine…",@"IT Tallaght",@"255",@"245",@"255",@"",@"",@"",@"",@"",@"",@"TA223",@"Energy Systems Engineering",@"Energy Systems En…",@"IT Tallaght",@"260",@"245",@"305",@"",@"",@"",@"",@"",@"",@"TA321",@"Pharmaceutical Science",@"Pharmaceutical Sc…",@"IT Tallaght",@"360",@"345",@"325",@"",@"",@"",@"",@"",@"",@"TA322",@"Computing",@"Computing",@"IT Tallaght",@"300",@"320",@"290",@"",@"",@"",@"",@"",@"",@"TA323",@"Information Technology Management",@"Information Techn…",@"IT Tallaght",@"245",@"270",@"225",@"",@"",@"",@"",@"",@"",@"TA326",@"DNA and Forensic Science",@"DNA and Forensic…",@"IT Tallaght",@"370",@"370",@"360",@"",@"",@"",@"",@"",@"",@"TA327",@"Sports Science and Health",@"Sports Science an…",@"IT Tallaght",@"400",@"390",@"375",@"",@"",@"",@"",@"",@"",@"PD101",@"Education - Primary Teaching",@"Education - Prima…",@"St Patricks Drumcondra",@"460",@"470",@"475",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"PD102",@"Education - Primary Teaching - Gaeltacht Applicants",@"Education - Prima…",@"St Patricks Drumcondra",@"425",@"430",@"440",@"",@"",@"",@"",@"",@"",@"PD103",@"Arts/Humanities",@"Arts/Humanities",@"St Patricks Drumcondra",@"385",@"390",@"420",@"",@"",@"",@"",@"",@"",@"TR002",@"Music",@"Music",@"Trinity College Dublin",@"405",@"420",@"420",@"(**) Matriculated candidates are considered but admission is on the basis of performance in the music test and interview.",@"",@"",@"",@"",@"",@"TR003",@"History",@"History",@"Trinity College Dublin",@"465",@"485",@"445",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR004",@"Law",@"Law",@"Trinity College Dublin",@"530",@"525",@"505",@"",@"",@"",@"",@"",@"",@"TR005",@"Philosophy",@"Philosophy",@"Trinity College Dublin",@"435",@"455",@"430",@"",@"",@"",@"",@"",@"",@"TR006",@"Psychology",@"Psychology",@"Trinity College Dublin",@"560",@"565",@"545",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR007",@"Clinical Speech and Language Studies",@"Clinical Speech a…",@"Trinity College Dublin",@"525",@"535",@"520",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR008",@"World Religions and Theology",@"World Religions a…",@"Trinity College Dublin",@"380",@"365",@"345",@"",@"",@"",@"",@"",@"",@"TR009",@"Music Education",@"Music Education",@"Trinity College Dublin",@"405",@"525",@"450",@"(**) Matriculated candidates are considered but admission is on the basis of performance in the music test and interview.",@"",@"",@"",@"",@"",@"TR012",@"History and Political Science",@"History and Polit…",@"Trinity College Dublin",@"510",@"515",@"505",@"",@"",@"",@"",@"",@"",@"TR015",@"Philosophy, Political Science, Economics and Sociology",@"Philosophy, Polit…",@"Trinity College Dublin",@"530",@"535",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR016",@"Deaf Studies",@"Deaf Studies",@"Trinity College Dublin",@"390",@"395",@"385",@"",@"",@"",@"",@"",@"",@"TR017",@"Law and Business",@"Law and Business",@"Trinity College Dublin",@"570",@"565",@"555",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR018",@"Law and French",@"Law and French",@"Trinity College Dublin",@"560",@"565",@"550",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR019",@"Law and German",@"Law and German",@"Trinity College Dublin",@"515",@"525",@"495",@"",@"",@"",@"",@"",@"",@"TR020",@"Law and Political Science",@"Law and Political…",@"Trinity College Dublin",@"570",@"575",@"560",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR021",@"Classics",@"Classics",@"Trinity College Dublin",@"465",@"390",@"405",@"",@"",@"",@"",@"",@"",@"TR022",@"Early and Modern Irish",@"Early and Modern…",@"Trinity College Dublin",@"365",@"375",@"350",@"",@"",@"",@"",@"",@"",@"TR023",@"English Studies",@"English Studies",@"Trinity College Dublin",@"515",@"510",@"495",@"",@"",@"",@"",@"",@"",@"TR024",@"European Studies",@"European Studies",@"Trinity College Dublin",@"535",@"545",@"530",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR025",@"Drama and Theatre Studies",@"Drama and Theatre…",@"Trinity College Dublin",@"450",@"510",@"455",@"(***) Applicants are ranked as for other courses but the final decision depends on performance in interview.",@"",@"",@"",@"",@"",@"TR027",@"Irish Studies",@"Irish Studies",@"Trinity College Dublin",@"420",@"400",@"375",@"",@"",@"",@"",@"",@"",@"TR028",@"Ancient and Medieval History and Culture",@"Ancient and Medie…",@"Trinity College Dublin",@"425",@"405",@"415",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR029",@"Political Science and Geography",@"Political Science…",@"Trinity College Dublin",@"445",@"435",@"475",@"",@"",@"",@"",@"",@"",@"TR030",@"Catholic Theological Studies",@"Catholic Theologi…",@"Trinity College Dublin",@"290",@"",@"",@"",@"",@"",@"",@"",@"",@"TR031",@"Mathematics",@"Mathematics",@"Trinity College Dublin",@"520",@"535",@"485",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR032",@"Integrated Engineering",@"Integrated Engine…",@"Trinity College Dublin",@"455",@"465",@"400",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR033",@"Computer Science",@"Computer Science",@"Trinity College Dublin",@"460",@"450",@"385",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR034",@"Management Science and Information Systems Studies",@"Management Scienc…",@"Trinity College Dublin",@"480",@"455",@"385",@"",@"",@"",@"",@"",@"",@"TR035",@"Theoretical Physics",@"Theoretical Physi…",@"Trinity College Dublin",@"490",@"540",@"490",@"",@"",@"",@"",@"",@"",@"TR038",@"Integrated Engineering with Management",@"Integrated Engine…",@"Trinity College Dublin",@"450",@"435",@"380",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR039",@"Computer Science and Language",@"Computer Science…",@"Trinity College Dublin",@"525",@"490",@"",@"",@"",@"",@"",@"",@"",@"TR051",@"Medicine",@"Medicine",@"Trinity College Dublin",@"748",@"746",@"739",@"(*) Not all on this points score were offered places; (#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"TR052",@"Dental Science",@"Dental Science",@"Trinity College Dublin",@"575",@"590",@"570",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR053",@"Physiotherapy",@"Physiotherapy",@"Trinity College Dublin",@"535",@"550",@"535",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR054",@"Occupational Therapy",@"Occupational Ther…",@"Trinity College Dublin",@"505",@"510",@"500",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR055",@"Radiation Therapy",@"Radiation Therapy",@"Trinity College Dublin",@"530",@"535",@"515",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR056",@"Human Health and Disease",@"Human Health and…",@"Trinity College Dublin",@"530",@"540",@"520",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR071",@"Science",@"Science",@"Trinity College Dublin",@"505",@"500",@"470",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR072",@"Pharmacy",@"Pharmacy",@"Trinity College Dublin",@"565",@"565",@"545",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR073",@"Human Genetics",@"Human Genetics",@"Trinity College Dublin",@"560",@"560",@"535",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR074",@"Chemistry with Molecular Modelling",@"Chemistry with Mo…",@"Trinity College Dublin",@"470",@"490",@"430",@"",@"",@"",@"",@"",@"",@"TR075",@"Medicinal Chemistry",@"Medicinal Chemist…",@"Trinity College Dublin",@"535",@"535",@"500",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR076",@"Nanoscience, Physics and Chemistry of Advanced Materials",@"Nanoscience, Phys…",@"Trinity College Dublin",@"570",@"515",@"475",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR077",@"Earth Sciences",@"Earth Sciences",@"Trinity College Dublin",@"490",@"480",@"460",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR081",@"Business, Economic and Social Studies (BESS)",@"Business, Economi…",@"Trinity College Dublin",@"495",@"490",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR082",@"Computer Science and Business",@"Computer Science…",@"Trinity College Dublin",@"465",@"465",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR083",@"Sociology and Social Policy",@"Sociology and Soc…",@"Trinity College Dublin",@"455",@"415",@"435",@"",@"",@"",@"",@"",@"",@"TR084",@"Social Studies (Social Work)",@"Social Studies (S…",@"Trinity College Dublin",@"460",@"465",@"465",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR085",@"Business Studies and French",@"Business Studies…",@"Trinity College Dublin",@"550",@"515",@"510",@"",@"",@"",@"",@"",@"",@"TR086",@"Business Studies and German",@"Business Studies…",@"Trinity College Dublin",@"485",@"480",@"450",@"",@"",@"",@"",@"",@"",@"TR087",@"Business Studies and Russian",@"Business Studies…",@"Trinity College Dublin",@"470",@"475",@"410",@"",@"",@"",@"",@"",@"",@"TR089",@"Business Studies and Polish",@"Business Studies…",@"Trinity College Dublin",@"470",@"415",@"390",@"",@"",@"",@"",@"",@"",@"TR090",@"Business Studies and Spanish",@"Business Studies…",@"Trinity College Dublin",@"510",@"505",@"475",@"",@"",@"",@"",@"",@"",@"TR091",@"General Nursing (Meath and St James`s)",@"General Nursing (…",@"Trinity College Dublin",@"420",@"420",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR092",@"Mature Applicants General Nursing (Meath and St James`s)",@"Mature Applicants…",@"Trinity College Dublin",@"560",@"227",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"TR093",@"General Nursing (Adelaide School of Nursing)",@"General Nursing (…",@"Trinity College Dublin",@"420",@"400",@"395",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"TR094",@"Mature Applicants General Nursing (Adelaide Sch. of Nursing)",@"Mature Applicants…",@"Trinity College Dublin",@"506",@"216",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"TR095",@"Psychiatric Nursing",@"Psychiatric Nursi…",@"Trinity College Dublin",@"400",@"395",@"370",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR096",@"Mature Applicants Psychiatric Nursing",@"Mature Applicants…",@"Trinity College Dublin",@"522",@"212",@"203",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"TR097",@"Intellectual Disability Nursing",@"Intellectual Disa…",@"Trinity College Dublin",@"390",@"395",@"375",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR098",@"Mature Applicants Intellectual Disability Nursing",@"Mature Applicants…",@"Trinity College Dublin",@"502",@"203",@"188",@"(*) Not all on this points score were offered places; (#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"TR911",@"Children`s and General Nursing (Integrated)",@"Children`s and Ge…",@"Trinity College Dublin",@"505",@"490",@"480",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR912",@"Mature Applicants Children`s and General Nursing (Integrated",@"Mature Applicants…",@"Trinity College Dublin",@"578",@"230",@"232",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"TR913",@"Midwifery",@"Midwifery",@"Trinity College Dublin",@"445",@"460",@"445",@"",@"",@"",@"",@"",@"",@"TR914",@"Mature Applicants Midwifery",@"Mature Applicants…",@"Trinity College Dublin",@"574",@"233",@"224",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"ZX0001",@"TCD two-subject moderatorship (TSM) minimum entry levels",@"TCD two-subject m…",@"Trinity College Dublin",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"ZX0002",@"Ancient history and archaeology:",@"Ancient history a…",@"Trinity College Dublin",@"400 – 535",@"",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"ZX0003",@"Classical civilisation:",@"Classical civilis…",@"Trinity College Dublin",@"400 – 535",@"",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"ZX0004",@"Drama studies:",@"Drama studies:",@"Trinity College Dublin",@"435 – 535",@"",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"ZX0005",@"Early Irish:",@"Early Irish:",@"Trinity College Dublin",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"ZX0006",@"Economics:",@"Economics:",@"Trinity College Dublin",@"495 - 580",@"",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"ZX0007",@"English Literature:",@"English Literatur…",@"Trinity College Dublin",@"535 - 580",@"",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"ZX0008",@"Film studies:",@"Film studies:",@"Trinity College Dublin",@"490 - 535",@"",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"ZX0009",@"French:",@"French:",@"Trinity College Dublin",@"480 - 580",@"",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"ZX0010",@"Geography:",@"Geography:",@"Trinity College Dublin",@"450 - 580",@"",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"ZX0011",@"German:",@"German:",@"Trinity College Dublin",@"455 – 575",@"",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"ZX0012",@"Greek:",@"Greek:",@"Trinity College Dublin",@"445 – 535",@"",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"ZX0013",@"History:",@"History:",@"Trinity College Dublin",@"530 - 535",@"",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"ZX0014",@"History of art and architecture:",@"History of art an…",@"Trinity College Dublin",@"445 - 535",@"",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"ZX0015",@"Italian:",@"Italian:",@"Trinity College Dublin",@"425 – 580",@"",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"ZX0016",@"Jewish and Islamic civilisations:",@"Jewish and Islami…",@"Trinity College Dublin",@"415 – 580",@"",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"ZX0017",@"Latin:",@"Latin:",@"Trinity College Dublin",@"525 – 535",@"",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"ZX0018",@"Mathematics:",@"Mathematics:",@"Trinity College Dublin",@"575 - 580",@"",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"ZX0019",@"Modern Irish:",@"Modern Irish:",@"Trinity College Dublin",@"425 – 535",@"",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"ZX0020",@"Music:",@"Music:",@"Trinity College Dublin",@"490 - 580",@"",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"ZX0021",@"Philosophy:",@"Philosophy:",@"Trinity College Dublin",@"450 – 580",@"",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"ZX0022",@"Psychology:",@"Psychology:",@"Trinity College Dublin",@"580",@"",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"ZX0023",@"Russian:",@"Russian:",@"Trinity College Dublin",@"435 – 535",@"",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"ZX0024",@"Sociology:",@"Sociology:",@"Trinity College Dublin",@"445 - 580",@"",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"ZX0025",@"Spanish:",@"Spanish:",@"Trinity College Dublin",@"475 - 535",@"",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"ZX0026",@"World religions and theology:",@"World religions a…",@"Trinity College Dublin",@"400 – 580",@"",@"",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"AS001",@"Home Economics with Biology - second level teaching",@"Home Economics wi…",@"St Angelas - Sligo",@"480",@"500",@"500",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"AS002",@"Home Economics with Religious Education - second level teach",@"Home Economics wi…",@"St Angelas - Sligo",@"435",@"450",@"470",@"",@"",@"",@"",@"",@"",@"AS003",@"Home Economics with Irish - second level teaching",@"Home Economics wi…",@"St Angelas - Sligo",@"455",@"480",@"455",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"AS004",@"Home Economics with Economics - second level teaching",@"Home Economics wi…",@"St Angelas - Sligo",@"440",@"450",@"",@"",@"",@"",@"",@"",@"",@"AS051",@"Food and Business Management",@"Food and Business…",@"St Angelas - Sligo",@"220",@"270",@"305",@"",@"",@"",@"",@"",@"",@"AS052",@"Health and Disability Studies",@"Health and Disabi…",@"St Angelas - Sligo",@"235",@"210",@"250",@"",@"",@"",@"",@"",@"",@"AS053",@"Textiles, Fashion and Design with Business Management",@"Textiles, Fashion…",@"St Angelas - Sligo",@"240",@"",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"AS110",@"General Nursing",@"General Nursing",@"St Angelas - Sligo",@"405",@"410",@"400",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"AS111",@"Mature Applicants General Nursing",@"Mature Applicants…",@"St Angelas - Sligo",@"578",@"230",@"234",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"AS130",@"Intellectual Disability Nursing",@"Intellectual Disa…",@"St Angelas - Sligo",@"365",@"375",@"365",@"",@"",@"",@"",@"",@"",@"AS131",@"Mature Applicants Intellectual Disability Nursing",@"Mature Applicants…",@"St Angelas - Sligo",@"504",@"212",@"214",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"SG141",@"Business",@"Business",@"IT Sligo",@"215",@"210",@"240",@"(v) New competition for Available/Vacant Places",@"",@"",@"",@"",@"",@"SG146",@"Accounting",@"Accounting",@"IT Sligo",@"270",@"220",@"200",@"",@"",@"",@"",@"",@"",@"SG241",@"Performing Arts",@"Performing Arts",@"IT Sligo",@"265",@"255",@"310",@"",@"",@"",@"",@"",@"",@"SG242",@"Early Childhood Education",@"Early Childhood E…",@"IT Sligo",@"285",@"320",@"325",@"",@"",@"",@"",@"",@"",@"SG243",@"Social Care Practice",@"Social Care Pract…",@"IT Sligo",@"300",@"345",@"",@"",@"",@"",@"",@"",@"",@"SG245",@"Creative Design",@"Creative Design",@"IT Sligo",@"210",@"220",@"",@"",@"",@"",@"",@"",@"",@"SG345",@"Interior Architecture",@"Interior Architec…",@"IT Sligo",@"225",@"235",@"220",@"",@"",@"",@"",@"",@"",@"SG441",@"Environmental Science",@"Environmental Sci…",@"IT Sligo",@"290",@"260",@"320",@"",@"",@"",@"",@"",@"",@"SG442",@"Occupational Safety and Health",@"Occupational Safe…",@"IT Sligo",@"340",@"280",@"310",@"",@"",@"",@"",@"",@"",@"SG445",@"Pharmaceutical Science with Drug Development",@"Pharmaceutical Sc…",@"IT Sligo",@"300",@"280",@"280",@"",@"",@"",@"",@"",@"",@"SG446",@"Applied Archaeology",@"Applied Archaeolo…",@"IT Sligo",@"255",@"295",@"310",@"(v) New competition for Available/Vacant Places",@"",@"",@"",@"",@"",@"SG448",@"Forensic Investigation and Analysis",@"Forensic Investig…",@"IT Sligo",@"270",@"295",@"335",@"",@"",@"",@"",@"",@"",@"SG449",@"Medical Biotechnology",@"Medical Biotechno…",@"IT Sligo",@"280",@"260",@"300",@"",@"",@"",@"",@"",@"",@"TL800",@"Social Media and Web Technologies",@"Social Media and…",@"IT Tralee",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"TL801",@"Interactive Multimedia",@"Interactive Multi…",@"IT Tralee",@"285",@"290",@"290",@"",@"",@"",@"",@"",@"",@"TL802",@"TV, Radio and New Media Broadcasting",@"TV, Radio and New…",@"IT Tralee",@"315",@"",@"",@"",@"",@"",@"",@"",@"",@"TL803",@"Music Technology",@"Music Technology",@"IT Tralee",@"270",@"305",@"305",@"",@"",@"",@"",@"",@"",@"TL804",@"Creative Writing for Digital Media",@"Creative Writing…",@"IT Tralee",@"295",@"",@"",@"",@"",@"",@"",@"",@"",@"TL805",@"Information Systems Management",@"Information Syste…",@"IT Tralee",@"370",@"",@"",@"",@"",@"",@"",@"",@"",@"TL811",@"Computing with Games Development",@"Computing with Ga…",@"IT Tralee",@"320",@"320",@"300",@"",@"",@"",@"",@"",@"",@"TL812",@"Computing with Multimedia",@"Computing with Mu…",@"IT Tralee",@"305",@"310",@"295",@"",@"",@"",@"",@"",@"",@"TL814",@"Computing with Mobile App Development",@"Computing with Mo…",@"IT Tralee",@"375",@"",@"",@"",@"",@"",@"",@"",@"",@"TL820",@"Travel and Tourism Management",@"Travel and Touris…",@"IT Tralee",@"340",@"295",@"310",@"",@"",@"",@"",@"",@"",@"TL821",@"Adventure Tourism Management",@"Adventure Tourism…",@"IT Tralee",@"285",@"305",@"310",@"",@"",@"",@"",@"",@"",@"TL822",@"Hotel Management",@"Hotel Management",@"IT Tralee",@"355",@"",@"",@"",@"",@"",@"",@"",@"",@"TL831",@"Business Studies (options: Accounting or Agribusiness or Mar",@"Business Studies…",@"IT Tralee",@"305",@"",@"",@"",@"",@"",@"",@"",@"",@"TL833",@"International Business",@"International Bus…",@"IT Tralee",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"TL850",@"Field Biology and Wildlife Tourism",@"Field Biology and…",@"IT Tralee",@"305",@"",@"",@"",@"",@"",@"",@"",@"",@"TL851",@"Wildlife Biology",@"Wildlife Biology",@"IT Tralee",@"300",@"300",@"325",@"",@"",@"",@"",@"",@"",@"TL853",@"Pharmaceutical Analysis with Forensics",@"Pharmaceutical An…",@"IT Tralee",@"",@"",@"325",@"",@"",@"",@"",@"",@"",@"TL854",@"Pharmaceutical Analysis with Environmental Science",@"Pharmaceutical An…",@"IT Tralee",@"",@"",@"240",@"",@"",@"",@"",@"",@"",@"TL871",@"Health and Leisure",@"Health and Leisur…",@"IT Tralee",@"365",@"295",@"355",@"",@"",@"",@"",@"",@"",@"TL872",@"Health and Leisure with Massage",@"Health and Leisur…",@"IT Tralee",@"355",@"300",@"335",@"",@"",@"",@"",@"",@"", @"TL880",@"Early Childhood Care and Education",@"Early Childhood C…",@"IT Tralee",@"315",@"335",@"355",@"",@"",@"",@"",@"",@"",@"TL890",@"General Nursing",@"General Nursing",@"IT Tralee",@"415",@"435",@"410",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TL891",@"Mental Health Nursing",@"Mental Health Nur…",@"IT Tralee",@"380",@"410",@"400",@"",@"",@"",@"",@"",@"",@"TL892",@"Mature Applicants General Nursing",@"Mature Applicants…",@"IT Tralee",@"580",@"222",@"230",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"TL893",@"Mature Applicants Mental Health Nursing",@"Mature Applicants…",@"IT Tralee",@"563",@"217",@"217",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"WD025",@"Construction Management and Engineering",@"Construction Mana…",@"Waterford Institute of Technology",@"290",@"295",@"",@"",@"",@"",@"",@"",@"",@"WD027",@"Music",@"Music",@"Waterford Institute of Technology",@"305",@"305",@"310",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"WD028",@"Applied Computing",@"Applied Computing",@"Waterford Institute of Technology",@"300",@"295",@"300",@"",@"",@"",@"",@"",@"",@"WD048",@"Business",@"Business",@"Waterford Institute of Technology",@"290",@"300",@"300",@"",@"",@"",@"",@"",@"",@"WD049",@"Business with French",@"Business with Fre…",@"Waterford Institute of Technology",@"310",@"325",@"",@"",@"",@"",@"",@"",@"",@"WD080",@"Business with German",@"Busin ess with Ger…",@"Waterford Institute of Technology",@"330",@"305",@"",@"",@"",@"",@"",@"",@"",@"WD084",@"Accounting",@"Accounting",@"Waterford Institute of Technology",@"305",@"305",@"300",@"",@"",@"",@"",@"",@"",@"WD085",@"Mechanical and Manufacturing Engineering",@"Mechanical and Ma…",@"Waterford Institute of Technology",@"290",@"280",@"280",@"",@"",@"",@"",@"",@"",@"WD086",@"Electronic Engineering",@"Electronic Engine…",@"Waterford Institute of Technology",@"370",@"355",@"345",@"",@"",@"",@"",@"",@"",@"WD091",@"Hospitality Management",@"Hospitality Manag…",@"Waterford Institute of Technology",@"265",@"270",@"280",@"",@"",@"",@"",@"",@"",@"WD095",@"Marketing with Advertising and Online Media",@"Marketing with Ad…",@"Waterford Institute of Technology",@"290",@"285",@"",@"",@"",@"",@"",@"",@"",@"WD116",@"General Nursing",@"General Nursing",@"Waterford Institute of Technology",@"420",@"425",@"420",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"WD117",@"Psychiatric Nursing",@"Psychiatric Nursi…",@"Waterford Institute of Technology",@"390",@"395",@"380",@"",@"",@"",@"",@"",@"",@"WD120",@"Intellectual Disability Nursing",@"Intellectual Disa…",@"Waterford Institute of Technology",@"385",@"380",@"385",@"",@"",@"",@"",@"",@"",@"WD124",@"Health Promotion",@"Health Promotion",@"Waterford Institute of Technology",@"300",@"300",@"315",@"",@"",@"",@"",@"",@"",@"WD125",@"Exercise and Health Studies",@"Exercise and Heal…",@"Waterford Institute of Technology",@"295",@"300",@"300",@"",@"",@"",@"",@"",@"",@"WD134",@"International Business",@"International Bus…",@"Waterford Institute of Technology",@"315",@"310",@"300",@"",@"",@"",@"",@"",@"",@"WD135",@"Applied Social Studies in Social Care",@"Applied Social St…",@"Waterford Institute of Technology",@"340",@"355",@"355",@"",@"",@"",@"",@"",@"",@"WD137",@"Design Visual Communications",@"Design Visual Com…",@"Waterford Institute of Technology",@"300",@"305",@"300",@"",@"",@"",@"",@"",@"",@"WD140",@"Law",@"Law",@"Waterford Institute of Technology",@"290",@"295",@"300",@"",@"",@"",@"",@"",@"",@"WD144",@"Architecture",@"Architecture",@"Waterford Institute of Technology",@"300",@"335",@"400",@"",@"",@"",@"",@"",@"",@"WD147",@"Pharmaceutical Science",@"Pharmaceutical Sc…",@"Waterford Institute of Technology",@"355",@"315",@"325",@"",@"",@"",@"",@"",@"",@"WD148",@"Tourism Marketing",@"Tourism Marketing",@"Waterford Institute of Technology",@"285",@"285",@"295",@"",@"",@"",@"",@"",@"",@"WD149",@"Early Childhood Studies",@"Early Childhood S…",@"Waterford Institute of Technology",@"330",@"345",@"340",@"",@"",@"",@"",@"",@"",@"WD150",@"Criminal Justice Studies",@"Criminal Justice…",@"Waterford Institute of Technology",@"300",@"310",@"315",@"",@"",@"",@"",@"",@"",@"WD152",@"Visual Art",@"Visual Art",@"Waterford Institute of Technology",@"320",@"310",@"",@"",@"",@"",@"",@"",@"",@"WD160",@"Finance and Investment",@"Finance and Inves…",@"Waterford Institute of Technology",@"325",@"325",@"340",@"",@"",@"",@"",@"",@"",@"WD161",@"Computer Forensics and Security",@"Computer Forensic…",@"Waterford Institute of Technology",@"275",@"290",@"",@"",@"",@"",@"",@"",@"",@"WD162",@"Quantity Surveying",@"Quantity Surveyin…",@"Waterford Institute of Technology",@"300",@"290",@"300",@"",@"",@"",@"",@"",@"",@"WD163",@"Psychology",@"Psychology",@"Waterford Institute of Technology",@"390",@"385",@"380",@"",@"",@"",@"",@"",@"",@"WD168",@"Entertainment Systems",@"Entertainment Sys…",@"Waterford Institute of Technology",@"280",@"290",@"",@"",@"",@"",@"",@"",@"",@"WD171",@"Sustainable Energy Engineering",@"Sustainable Energ…",@"Waterford Institute of Technology",@"290",@"300",@"300",@"",@"",@"",@"",@"",@"",@"WD179",@"Business with Irish",@"Business with Iri…",@"Waterford Institute of Technology",@"400",@"365",@"",@"",@"",@"",@"",@"",@"",@"WD180",@"Physics for Modern Technology",@"Physics for Moder…",@"Waterford Institute of Technology",@"375",@"345",@"",@"",@"",@"",@"",@"",@"",@"WD186",@"Sports Coaching and Performance",@"Sports Coaching a…",@"Waterford Institute of Technology",@"360",@"",@"",@"",@"",@"",@"",@"",@"",@"WD187",@"Social Science",@"Social Science",@"Waterford Institute of Technology",@"300",@"",@"",@"",@"",@"",@"",@"",@"",@"WD200",@"Arts",@"Arts",@"Waterford Institute of Technology",@"275",@"285",@"290",@"",@"",@"",@"",@"",@"",@"WD816",@"Mature Applicants General Nursing",@"Mature Applicants…",@"Waterford Institute of Technology",@"582",@"234",@"232",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"WD817",@"Mature Applicants Psychiatric Nursing",@"Mature Applicants…",@"Waterford Institute of Technology",@"557",@"223",@"224",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"WD820",@"Mature Applicants Intellectual Disability Nursing",@"Mature Applicants…",@"Waterford Institute of Technology",@"537",@"217",@"220",@"(*) Not all on this points score were offered places; (#) Test / Interview / Portfolio",@"",@"",@"",@"",@"", nil];

    
}



-(void) InitializeVars
{
    
    for(UIButton *courses  in courseArray)
        [courses setTitle: @"" forState:UIControlStateNormal];
    
    for(UILabel *pts_2012  in pts_2012Array)
        pts_2012.text =nil;
    
    for(UILabel *pts_2011  in pts_2011Array)
        pts_2011.text =nil;
    
    for(UILabel *pts_2010  in pts_2010Array)
        pts_2010.text =nil;
    
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
    
    
    full_course_name   =[self getAllRowsFromTableNamed : @"CAO_collegeLevelGenData_oldData" sortBy : name];
    quota_reached_exist=[self getFirstExtraInfoFromTableNamed : @"CAO_collegeLevelGenData_oldData" sortBy : name];
    music_test_interview=[self getSecondExtraInfoFromTableNamed : @"CAO_collegeLevelGenData_oldData" sortBy : name];
    Interview=[self getThirdExtraInfoFromTableNamed : @"CAO_collegeLevelGenData_oldData" sortBy : name];
    testInterviewPortfolio=[self getFourthExtraInfoFromTableNamed : @"CAO_collegeLevelGenData_oldData" sortBy : name];
    AQA=[self getFifthExtraInfoFromTableNamed : @"CAO_collegeLevelGenData_oldData" sortBy : name];
    VacantPlaces=[self getSixthExtraInfoFromTableNamed : @"CAO_collegeLevelGenData_oldData" sortBy : name];
    
   
    NSString *extraStuff_2 = @"\n Unique course code :";
    NSString *extraStuff_3 = [extraStuff_2 stringByAppendingString:name];
    
    
    NSString *extraStuff_3_new = [extraStuff_3 stringByAppendingString:  @"\n"];
    
    NSString *extraStuff_4 = [ extraStuff_3_new stringByAppendingString: quota_reached_exist];
    
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
    
    //assign a larger font to main msg. body
    [extraStuff_14 sizeWithFont:[UIFont boldSystemFontOfSize:15.0]];
    


    alertMsg = [[UIAlertView alloc] initWithTitle:full_course_name//@"Additional Info."
                
                  message: extraStuff_14
                  delegate:nil cancelButtonTitle:@"OK I get it ! :)"
                  otherButtonTitles:nil];
    
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
    
    return[documentsDir stringByAppendingPathComponent:@"cao_db_RealLevel8Data_2.sql"];
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
    
    else{
        
        NSLog(@"opened database fine !");
    }
    
    
}



-(void) createTableOneNamed:(NSString *) tableNameOne withField1:(NSString *)   field1  withField2:(NSString *)   field2
                 withField3:(NSString *)  field3      withField4:(NSString *)   field4  withField5:(NSString *)   field5
                 withField6:(NSString *)  field6      withField7:(NSString *)   field7  withField8:(NSString *)   field8
                 withField9:(NSString *)  field9      withField10:(NSString *)  field10 withField11:(NSString *)  field11
                 withField12:(NSString *) field12     withField13:(NSString *)  field13
{
    
    char *err;
    NSString *sql_1 = [NSString stringWithFormat:
                       @"CREATE TABLE IF NOT EXISTS '%@' ('%@' TEXT PRIMARY KEY,'%@' REAL,'%@' REAL,'%@' REAL,'%@' REAL,'%@' REAL,'%@' REAL,'%@' REAL,'%@' REAL,'%@' REAL,'%@' REAL,'%@' REAL,'%@' REAL);"
                       ,tableNameOne,field1, field2,field3,field4, field5,field6,field7,field8,field9,field10,field11,field12,field13];
    
    
    if(sqlite3_exec(db,[sql_1 UTF8String],NULL,NULL, &err) != SQLITE_OK)
    {
        sqlite3_close(db);
        NSAssert(0,@"Tabled failed to create.");
    }
    
    else
    {
        NSLog(@"created Table !!! ");
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
                      field13Value: (NSString *) field13Value
{
    NSString *sql_1 =[NSString stringWithFormat:
                      @"INSERT OR REPLACE INTO '%@' ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@') VALUES ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@');",
                      tableName,field1,field2,field3,field4,field5,field6,field7,field8,field9,field10,field11,field12,field13,field1Value,field2Value,field3Value,field4Value,field5Value,field6Value,field7Value,field8Value,field9Value,field10Value,field11Value,field12Value,field13Value];
    
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
    
    else{
        
        NSLog(@"updating row fine ");
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

            answer = [[NSString alloc] initWithUTF8String : field2];
        }
        
        //---delete the compiled statement from memory---
        sqlite3_finalize(statement_1);
        
    }
    
    return answer;
}




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

            NSLog(@"in 'getFirst");
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

            NSLog(@"in 'getSecond'");
            
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
            
            NSLog(@"in 'getThird'");
            
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
            
            NSLog(@"in 'getFourth'");
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
            
            NSLog(@"in 'getFifth'");
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

            NSLog(@"in 'getSixth'");
        }
        
        //---delete the compiled statement from memory---
        sqlite3_finalize(statement_1);
        
    }
    
    NSLog(@" got to return statement - in 'getSixth'");

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

            NSLog(@"in 'getSeventh'");
        }
        
        //---delete the compiled statement from memory---
        sqlite3_finalize(statement_1);
        
    }
    
    return sol6;
}



@end







