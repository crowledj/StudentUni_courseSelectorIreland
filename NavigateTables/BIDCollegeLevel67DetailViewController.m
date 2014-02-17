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
#define TABLE_FIELD_NUM 13
#define TABLE_ROW_NUM 451
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
NSArray *course_76Array;
NSArray *pts_2012_67Array;
NSArray *pts_2011_67Array;
NSArray *pts_2010_67Array;

/*      test      */


@interface BIDCollegeLevel67DetailViewController ()
{
    sqlite3 *db;
}

@end




@implementation BIDCollegeLevel67DetailViewController



- (void)viewDidLoad
{
    databaseName = @"college_simtest_data.sql";
    
    [super viewDidLoad];
    [scroller_1 setContentSize:CGSizeMake(320, 2539)];
    
    
    course_76Array = [[NSArray alloc] initWithObjects:course_2,course_3,course_4,course_5,course_6,course_7,course_8,course_9,course_10,course_11,course_12,
                      course_13,course_14,course_15,course_16,course_17,course_18,course_19,course_20,course_21,course_22,course_23,course_24,course_25,course_26,
                      course_27,course_28,course_29,course_30,course_31,course_32,course_33,course_34,course_35,course_36,course_37,course_38,course_39,course_40,
                      course_41,course_42,course_43,course_44,course_45,course_46,course_47,course_48,course_49,course_50,nil];
    
    
    
    
    pts_2012_67Array = [[NSArray alloc] initWithObjects:points2_2012,points3_2012,points4_2012,points5_2012,points6_2012,points7_2012,points8_2012,points9_2012,points10_2012,points11_2012,points12_2012,points13_2012,points14_2012,points15_2012,points16_2012,points17_2012,
                        points18_2012,points19_2012,points20_2012,points21_2012,points22_2012,points23_2012,points24_2012,points25_2012,points26_2012,
                        points27_2012,points28_2012,points29_2012,points30_2012,points31_2012,points32_2012,points33_2012,points34_2012,points35_2012,
                        points36_2012,points37_2012,points38_2012,points39_2012,points40_2012,points41_2012,points42_2012,points43_2012,points44_2012,
                        points45_2012,points46_2012,points47_2012,nil];
    
    
    pts_2011_67Array = [[NSArray alloc] initWithObjects:points2_2011,points3_2011,points4_2011,points5_2011,points6_2011,points7_2011,points8_2011,
                        points9_2011,points10_2011,points11_2011,points12_2011,points13_2011,points14_2011,points15_2011,points16_2011,points17_2011,
                        points18_2011,points19_2011,points20_2011,points21_2011,points22_2011,points23_2011,points24_2011,points25_2011,points26_2011,
                        points27_2011,points28_2011,points29_2011,points30_2011,points31_2011,points32_2011,points33_2011,points34_2011,points35_2011,
                        points36_2011,points37_2011,points38_2011,points39_2011,points40_2011,points41_2011,points42_2011,points43_2011,points44_2011,
                        points45_2011,points46_2011,points47_2011,nil];
    
    pts_2010_67Array = [[NSArray alloc] initWithObjects:points2_2010,points3_2010,points4_2010,points5_2010,points6_2010,points7_2010,points8_2010,
                        points9_2010,points10_2010,points11_2010,points12_2010,points13_2010,points14_2010,points15_2010,points16_2010,points17_2010,
                        points18_2010,points19_2010,points20_2010,points21_2010,points22_2010,points23_2010,points24_2010,points25_2010,points26_2010,
                        points27_2010,points28_2010,points29_2010,points30_2010,points31_2010,points32_2010,points33_2010,points34_2010,points35_2010,
                        points36_2010,points37_2010,points38_2010,points39_2010,points40_2010,points41_2010,points42_2010,points43_2010,points44_2010,
                        points45_2010,points46_2010,points47_2010,nil];
    
    
    heading.font= [UIFont boldSystemFontOfSize:16];
    year_1.font = [UIFont boldSystemFontOfSize:16];
    year_2.font = [UIFont boldSystemFontOfSize:16];
    year_3.font = [UIFont boldSystemFontOfSize:16];
    
    
    for(UIButton *courses  in course_76Array)
        courses.titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    
    for(UILabel *pts_2012  in pts_2012_67Array)
        pts_2012.font = [UIFont boldSystemFontOfSize:14];
    
    for(UILabel *pts_2011  in pts_2011_67Array)
        pts_2011.font = [UIFont boldSystemFontOfSize:14];
    
    for(UILabel *pts_2010  in pts_2010_67Array)
        pts_2010.font = [UIFont boldSystemFontOfSize:14];

}


-(void) viewWillAppear:(BOOL)animated;
{
    
    NSString *collegeSelection=self.title;
    NSString *mainTable=@"simTestTable";
    
    NSString *unique_code=nil;
    
    //check if database file has been saved to  the user's phone,if not coopy it over.
    NSString *qsql_1 = [NSString stringWithFormat: @"SELECT * FROM '%@' WHERE  college='%@'",mainTable,collegeSelection];
    NSString *strings[MAX_COURSE_NUM][FIELD_NUM];
    int college_course_counter=0;
    
    sqlite3_stmt *statement_1;
    
    //reset al previously set fields as on GUI.
    [self InitializeVars];
    
    
    NSString *field1Str=nil;
    NSString *field3Str=nil;
    NSString *field5Str=nil;
    NSString *field6Str=nil;
    NSString *field7Str=nil;

    NSString *truncatedField5Str=nil;
    NSString *truncatedField6Str=nil;
    NSString *truncatedField7Str=nil;

    
    if(sqlite3_open_v2([[self filePath] UTF8String],&(db),1,NULL) == SQLITE_OK) {
        
        if(sqlite3_prepare_v2(db, [qsql_1 UTF8String],-1, &statement_1,NULL) == SQLITE_OK )
        {
            int k=0;
            
            while(sqlite3_step(statement_1) == SQLITE_ROW)
            {
                
                char *field1 = (char *) sqlite3_column_text(statement_1,0);
                field1Str = [[NSString alloc] initWithUTF8String : field1];
                
                unique_code=field1Str;
            
                char *field3 = (char *) sqlite3_column_text(statement_1,2);
                field3Str = [[NSString alloc] initWithUTF8String : field3];
                
                char *field5 = (char *) sqlite3_column_text(statement_1,4);
                field5Str = [[NSString alloc] initWithUTF8String : field5];
                
                char *field6 = (char *) sqlite3_column_text(statement_1,5);
                field6Str = [[NSString alloc] initWithUTF8String : field6];
                
                char *field7 = (char *) sqlite3_column_text(statement_1,6);
                field7Str = [[NSString alloc] initWithUTF8String : field7];
                
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
        
    }//end sqlite_open if...
    
    for(int i=0;i<college_course_counter;i++)
    {
        
        [[course_76Array objectAtIndex:i] setTitle: strings[i][0] forState:UIControlStateNormal];
        [[course_76Array objectAtIndex:i] setAssign: strings[i][4]];
        
        ((UILabel *)[pts_2012_67Array objectAtIndex:i]).text = strings[i][1];
        ((UILabel *)[pts_2011_67Array objectAtIndex:i]).text = strings[i][2];
        
    }
    
}  //end function.



-(void) InitializeVars
{
    
    for(UIButton *courses  in course_76Array)
        [courses setTitle: @"" forState:UIControlStateNormal];
    
    for(UILabel *pts_2012  in pts_2012_67Array)
        pts_2012.text =nil;
    
    for(UILabel *pts_2011  in pts_2011_67Array)
        pts_2011.text =nil;
    
    for(UILabel *pts_2010  in pts_2010_67Array)
        pts_2010.text =nil;
    
}


-(IBAction)namePressed:(UIButton *)sender
{
    NSString *name = (NSString *)(sender.assign);
    
    UIAlertView *alertMsg=nil;
    NSString *full_course_name=nil;
    NSString *quota_reached_exist=nil;
    
    NSString *music_test_interview=nil;
    NSString *Interview=nil;
    NSString *testInterviewPortfolio=nil;
    NSString *AQA=nil;
    NSString *VacantPlaces=nil;
    
    
    full_course_name   =[self getAllRowsFromTableNamed : @"simTestTable" sortBy : name];
    quota_reached_exist=[self getFirstExtraInfoFromTableNamed : @"simTestTable" sortBy : name];
    music_test_interview=[self getSecondExtraInfoFromTableNamed : @"simTestTable" sortBy : name];
    Interview=[self getThirdExtraInfoFromTableNamed : @"simTestTable" sortBy : name];
    testInterviewPortfolio=[self getFourthExtraInfoFromTableNamed : @"simTestTable" sortBy : name];
    AQA=[self getFifthExtraInfoFromTableNamed : @"simTestTable" sortBy : name];
    VacantPlaces=[self getSixthExtraInfoFromTableNamed : @"simTestTable" sortBy : name];
    
    
    
    NSString *extraStuff_2 = @"\n Unique course code : ";
    NSString *extraStuff_3=[extraStuff_2 stringByAppendingString:name];
    
    
    NSString *extraStuff_3_new = [ extraStuff_3 stringByAppendingString:  @"\n"];
    NSString *extraStuff_4 = [extraStuff_3_new stringByAppendingString: quota_reached_exist];
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
    
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    NSString *dbPath = [[[NSBundle mainBundle] resourcePath ]stringByAppendingPathComponent:@"college_simtest_data2.sql"];
    
    BOOL success = [fileMgr fileExistsAtPath:dbPath];
    
    if(success)
        return dbPath;
    
    //return a nil string as error
    dbPath=nil;
    
    return dbPath;
}


//function to open the database
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
            char *field2 = (char *) sqlite3_column_text(statement_1,1);
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
            sol5 = [[NSString alloc] initWithUTF8String : field13];
        }
        
        //---delete the compiled statement from memory---
        sqlite3_finalize(statement_1);
        
    }
    
    return sol5;
}



@end







