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
 other attributes besides just the button's label upon a button press.
 Further below, I have used the 'setter' here to assign the unique course code to each button -
 , then I have used the 'getter' func. in the 'namePressed' action method below to retrieve this
 and use it in the function 'getRowsFromAllTables' function to pick up any field I wish - including
 the full course name and display it in the pop-up method , which is in fact it's use here.
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



struct cao_entry entryA;
NSArray *courseArray;
NSArray *pts_2012Array;
NSArray *pts_2011Array;
NSArray *pts_2010Array;



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
    
    //put all UIButtons and UILabels in arrays for better storage/access purposes.
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
    
}

-(void) viewWillAppear:(BOOL)animated;
{
    //ensure scroll view resets after exiting and re-entering a view.
    [super viewWillAppear:animated];
    [self->scroller scrollRectToVisible:CGRectMake(0, 0, 1, 1)
                                                animated:NO];

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
            
            k++;
            
        }//end while
        
        college_course_counter=k;
        
        //---delete the compiled statement from memory---
        sqlite3_finalize(statement_1);
        
    }//end if
    
    for(int i=0;i<college_course_counter;i++)
    {
     
        [[courseArray objectAtIndex:i] setTitle: strings[i][0] forState:UIControlStateNormal];
        [[courseArray objectAtIndex:i] setAssign: strings[i][4]];
        
        ((UILabel *)[pts_2012Array objectAtIndex:i]).text = strings[i][1];
        ((UILabel *)[pts_2011Array objectAtIndex:i]).text = strings[i][2];
        ((UILabel *)[pts_2010Array objectAtIndex:i]).text = strings[i][3];
        
    }

    
    
}  //end function.


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
    
    NSLog(@"  -- - - - - - - - - --  in namePressed () function  :)  -  - - - -- - - - ");
    
    
    full_course_name   =[self getAllRowsFromTableNamed : @"CAO_collegeLevelGenData_oldData" sortBy : name];
    quota_reached_exist=[self getFirstExtraInfoFromTableNamed : @"CAO_collegeLevelGenData_oldData" sortBy : name];
    music_test_interview=[self getSecondExtraInfoFromTableNamed : @"CAO_collegeLevelGenData_oldData" sortBy : name];
    Interview=[self getThirdExtraInfoFromTableNamed : @"CAO_collegeLevelGenData_oldData" sortBy : name];
    testInterviewPortfolio=[self getFourthExtraInfoFromTableNamed : @"CAO_collegeLevelGenData_oldData" sortBy : name];
    AQA=[self getFifthExtraInfoFromTableNamed : @"CAO_collegeLevelGenData_oldData" sortBy : name];
    VacantPlaces=[self getSixthExtraInfoFromTableNamed : @"CAO_collegeLevelGenData_oldData" sortBy : name];
    
   
    NSString *extraStuff_2 = @"\n Unique course code :";
    NSString *extraStuff_3=nil;
    
    if([[name substringWithRange:NSMakeRange(0,2)] isEqual : @"ZX"])
        extraStuff_3 = [extraStuff_2 stringByAppendingString: @"N/A"];
    
    else
        extraStuff_3 = [extraStuff_2 stringByAppendingString:name];
    
    
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

    alertMsg = [[UIAlertView alloc] initWithTitle:full_course_name
                
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
        sqlite3_close(db);
        NSAssert(0,@"Database one failed to open.");
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

        }
        
        //---delete the compiled statement from memory---
        sqlite3_finalize(statement_1);
        
    }
    
    NSLog(@" got to return statement - in 'getSixth'");

    return sol5;
}


@end







