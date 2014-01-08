//
//  CollegeLevelDetailViewController.m
//  NavigateTables
//
//  Created by EventHorizon on 02/06/2013.
//  Copyright (c) 2013 EventHorizon. All rights reserved.
//


#import "BIDCollegeLevelDetailViewController.h"
#define SIZE 10
#define COLLEGE_NUM 7
#define MAX_COURSE_NUM 50
#define FIELD_NUM 5


/*
struct cao_entry{
    
    const char *college;
    NSArray *course;
    
};
*/


/*      test      */

const char *institutions[COLLEGE_NUM+1][1]={{"NUIG"},{"UCD"},{"TCD"},{"UCC"},{"DIT"},{"CIT"},{"DCU"},{'\0'}};
const int lengths[COLLEGE_NUM+1]={32,108,96,96,96,96,96,1};

//struct cao_entry entryA[MAX_COURSE_NUM+1];


/*      test      */


@interface BIDCollegeLevelDetailViewController ()
{
        sqlite3 *db;
}

@end

@implementation BIDCollegeLevelDetailViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    
    return self;
}




- (void)viewDidLoad
{
    [super viewDidLoad];

    [scroller setScrollEnabled:YES];
    [scroller setContentSize:CGSizeMake(520,1080)];
    
    [self.view addSubview:scroller];
    
    heading.font = [UIFont boldSystemFontOfSize:16];
    year_1.font = [UIFont boldSystemFontOfSize:16];
    year_2.font = [UIFont boldSystemFontOfSize:16];
    year_3.font = [UIFont boldSystemFontOfSize:16];
    

    
    course_1.font = [UIFont boldSystemFontOfSize:12];
    course_2.font = [UIFont boldSystemFontOfSize:12];
    course_3.font = [UIFont boldSystemFontOfSize:12];
    course_4.font = [UIFont boldSystemFontOfSize:12];
    course_5.font = [UIFont boldSystemFontOfSize:12];
    course_6.font = [UIFont boldSystemFontOfSize:12];
    course_7.font = [UIFont boldSystemFontOfSize:12];
    course_8.font = [UIFont boldSystemFontOfSize:12];
    course_9.font = [UIFont boldSystemFontOfSize:12];
    course_10.font = [UIFont boldSystemFontOfSize:12];
    course_11.font = [UIFont boldSystemFontOfSize:12];
    course_12.font = [UIFont boldSystemFontOfSize:12];
    //course_13.font = [UIFont boldSystemFontOfSize:12];
    //course_14.font = [UIFont boldSystemFontOfSize:12];
    
    
    
    points1_2012.font = [UIFont boldSystemFontOfSize:14];
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
    
    
    
    points1_2011.font = [UIFont boldSystemFontOfSize:14];
    points2_2011.font = [UIFont boldSystemFontOfSize:14];
    points3_2011.font = [UIFont boldSystemFontOfSize:14];
    points4_2011.font = [UIFont boldSystemFontOfSize:14];
    points5_2011.font = [UIFont boldSystemFontOfSize:14];
    points6_2011.font = [UIFont boldSystemFontOfSize:14];
    points7_2011.font = [UIFont boldSystemFontOfSize:14];
    points8_2011.font = [UIFont boldSystemFontOfSize:14];
    
    points1_2010.font = [UIFont boldSystemFontOfSize:14];
    points2_2010.font = [UIFont boldSystemFontOfSize:14];
    points3_2010.font = [UIFont boldSystemFontOfSize:14];
    points4_2010.font = [UIFont boldSystemFontOfSize:14];
    points5_2010.font = [UIFont boldSystemFontOfSize:14];
    points6_2010.font = [UIFont boldSystemFontOfSize:14];
    points7_2010.font = [UIFont boldSystemFontOfSize:14];
    points8_2010.font = [UIFont boldSystemFontOfSize:14];
       
    
    [self openDB];
    
   
    /*
     
   //NSLog(@"got to filling CAO entries \n");
    
    [self fillCAO_Entries];
    
   //NSLog(@"got PAST  filling CAO entries ");
    
    
    for(int j=0;j< MAX_COURSE_NUM;++j)
    {
        
        if(entryA[j].college == NULL){
            
            
            //NSLog(@"in C - check for terminating character -- brekaing out of main loop --j = %d \n",j);
            break;
        }
        
        
          //NSLog(@"got to assigning college Name -- j = %d \n",j);
        
        NSString *collegeName = [[NSString alloc] initWithUTF8String:entryA[j].college];
        
        [self createTableOneNamed : [[NSString alloc] initWithUTF8String: entryA[j].college] withField1: @"course" withField2: @"2012" withField3: @"2011" withField4: @"2010"];
        
        
       
        for(int i=0;i < lengths[j] ;i+=4)
        {
            
            //for(id obj in entryA[j].course)
            //{
            
            if([entryA[j].course objectAtIndex:i] == nil)
                break;
            
            NSString *courseName;
            NSString *lastYrPoints;
            NSString *lastTwoYrPoints;
            NSString *lastThreeYrPoints;
            
            //if([obj isMemberOfClass:[NSString class]])
            //{
            courseName =          [entryA[j].course objectAtIndex:i];
            lastYrPoints =      [entryA[j].course objectAtIndex:i+1];
            lastTwoYrPoints =   [entryA[j].course objectAtIndex:i+2];
            lastThreeYrPoints = [entryA[j].course objectAtIndex:i+3];
            
            //NSLog(@"lastThreeYrPoints was = %@ \n",lastThreeYrPoints);
            
            
            
            //}
            
            //NSLog(@"inserting records - %@,%@ ,%@ ,%@ into table named %@ \n",courseName,lastYrPoints,lastTwoYrPoints,lastThreeYrPoints,collegeName);
            
            [self insertRecordIntoTableNamed: collegeName withField1:@"course" field1Value:courseName
                                   andField2:@"2012" field2Value:lastYrPoints
                                   andField3:@"2011" field3Value:lastTwoYrPoints
                                   andField4:@"2010" field4Value:lastThreeYrPoints];
            
            //NSLog(@"about to print database\n");
            
            NSString *qsql_n = [NSString stringWithFormat: @"DUMP ? '%@' ? ",collegeName];
            sqlite3_stmt *statement_n;
            
            sqlite3_prepare(db, [qsql_n UTF8String],-1, &statement_n,nil);
            
            // }
            
        }
        
    }
     
     
    */

    //NSLog(@"past ,main for loop in viewDidLoad");
    
} 

-(void) viewWillAppear:(BOOL)animated;
{
    
        NSString *collegeSelection=self.title;
        NSString *qsql_1 = [NSString stringWithFormat: @"SELECT * FROM '%@' ",collegeSelection];
        NSString *strings[COLLEGE_NUM][FIELD_NUM];

              
        sqlite3_stmt *statement_1;
        
        //declare table values (points) here
        
        NSString *field1Str=nil;
        NSString *field2Str=nil;
        NSString *field3Str=nil;
        NSString *field4Str=nil;

    
        
        NSString *truncatedField2Str=nil;
        NSString *truncatedField3Str=nil;
        NSString *truncatedField4Str=nil;

        
         // NSLog(@" at if sql condition with k = %d \n",k);
        
        if(sqlite3_prepare(db, [qsql_1 UTF8String],-1, &statement_1,nil) == SQLITE_OK )
        {
            int k=0;
            
            
            while(sqlite3_step(statement_1) == SQLITE_ROW)
            {
                
                char *field1 = (char *) sqlite3_column_text(statement_1,0);
                //NSString *field1Str = [[NSString alloc] initWithUTF8String : field1];
                
                
                field1Str = [[NSString alloc] initWithUTF8String : field1];
                
                
                char *field2 = (char *) sqlite3_column_text(statement_1,1);
                //NSString *field2Str = [[NSString alloc] initWithUTF8String : field2];
                
                
                field2Str = [[NSString alloc] initWithUTF8String : field2];
                
                char *field3 = (char *) sqlite3_column_text(statement_1,2);
                //NSString *field3Str = [[NSString alloc] initWithUTF8String : field3];
                
                
                field3Str = [[NSString alloc] initWithUTF8String : field3];
                
                
                char *field4 = (char *) sqlite3_column_text(statement_1,3);
                
                field4Str = [[NSString alloc] initWithUTF8String : field4];
                
                
               // NSLog(@" After select and field4Str  = %@ \n",field4Str);
                
                

                truncatedField2Str = [field2Str substringToIndex:[field2Str length]-2];                
                truncatedField3Str = [field3Str substringToIndex:[field3Str length]-2];
               
                truncatedField4Str = [field4Str substringToIndex:[field4Str length]-2];
                
                strings[k][0]=field1Str;
                strings[k][1]=truncatedField2Str;
                strings[k][2]=truncatedField3Str;
                
                strings[k][3]=truncatedField4Str;
                
               // NSLog(@" strings[%d][0] = %@ \n",k,strings[k][0]);

    
                k++;
                            
            }//end while
            
            
            //---delete the compiled statement from memory---
            sqlite3_finalize(statement_1);
            
            
        }//end if

    
NSLog(@" got to assigning course names \n");
    
    course_1.text=strings[0][0];
    
    //NSLog(@" got PAST  assigning course name 1 \n");
    
    course_2.text=strings[1][0];
    
    //NSLog(@" got PAST  assigning course name 2 \n");
    
    course_3.text=strings[2][0];
    
    //NSLog(@" got PAST  assigning course name 3 \n");
    
    course_4.text=strings[3][0];
    
    //NSLog(@" got PAST  assigning course name 4 \n");
    
    course_5.text=strings[4][0];
    course_6.text=strings[5][0];
    course_7.text=strings[6][0];
    
    
    NSLog(@" got to assigning course name EIGHT  \n");
    
    //course_8.text=strings[7][0];
    //course_9.text=strings[8][0];
    //course_10.text=strings[9][0];
    //course_11.text=strings[10][0];
    //course_12.text=strings[11][0];
    //course_13.text=strings[12][0];
    //course_14.text=strings[13][0];
    
    
    NSLog(@" got PAST  assigning course names \n");
    
    
    points1_2012.text = strings[0][1];
    points1_2011.text = strings[0][2];
    points1_2010.text = strings[0][3];
    
    points2_2012.text = strings[1][1];
    points2_2011.text = strings[1][2];
    points2_2010.text = strings[1][3];
    
    points3_2012.text = strings[2][1];
    points3_2011.text = strings[2][2];
    points3_2010.text = strings[2][3];

    points4_2012.text = strings[3][1];
    points4_2011.text = strings[3][2];
    points4_2010.text = strings[3][3];
   
    points5_2012.text = strings[4][1];
    points5_2011.text = strings[4][2];
    points5_2010.text = strings[4][3];
    
    points6_2012.text = strings[5][1];
    points6_2011.text = strings[5][2];
    points6_2010.text = strings[5][3];
    
    points7_2012.text = strings[6][1];
    points7_2011.text = strings[6][2];
    points7_2010.text = strings[6][3];
    
     NSLog(@" got PAST  assignin POINTS \n");
    
    //points8_2012.text = strings[7][1];
    //points8_2011.text = strings[7][2];
    //points8_2010.text = strings[7][3];
    
    //points9_2012.text = strings[8][1];
    //points9_2011.text = strings[8][2];
    //points9_2010.text = strings[8][3];

    //points10_2012.text = strings[9][1];
    //points10_2011.text = strings[9][2];
    //points10_2010.text = strings[9][3];
    
    //points11_2012.text = strings[10][1];
    //points11_2011.text = strings[10][2];
    //points11_2010.text = strings[10][3];
    
    //points12_2012.text = strings[11][1];
    //points12_2011.text = strings[11][2];
    //points12_2010.text = strings[11][3];

}  //end function.


/*
-(void) fillCAO_Entries
{
    //fill CAO entry with data.
    
    
    for(int k =0 ;k < MAX_COURSE_NUM;++k)
    {
        
        entryA[k].college = institutions[k][0];
    
    }
    
    
    //hard - code college - course/ associated points arrays.
    
    entryA[0].course =[NSArray arrayWithObjects:
                       @"Arts",@"300",@"340",@"445", @"Arts(Public and Social policy)",@"315",@"340",@"445", @"Arts(Psychology)",@"525",@"525",@"445", @"Arts (History)",@"320",@"n/a",@"n/a", @"Na Dana (Cumarsaid)",@"350",@"325",@"455",@"Na Dana (Gaeilge agus Liann an Aistrizchain)",@"300",@"340",@"445", @"Arts (Mathematics and Education)",@"300",@"340",@"445",@"Arts (Mathematics and Education)",@"300",@"340",@"445",nil];
    
    
    
    entryA[1].course =[NSArray arrayWithObjects: @"Architecture",@"280",@"170",@"440",@"Landscape Architecture",@"380",@"570",@"140",@"Structural Engineering with Architecture",@"380",@"570",@"140",@"Engineering",@"380",@"570",@"140",@"Science",@"380",@"570",@"140",@"Computer Science",@"380",@"570",@"140",@"Archaeology and Geology",@"n/a.0",@"n/a.0",@"n/a.0",@"Actuarial and Financial Studies",@"280",@"170",@"440",@"Agricultural Science",@"780",@"170",@"440",@"Agricultural Science",@"280",@"170",@"440",
        @"Animal Science - Equine",@"280",@"170",@"135",@"Dairy Business",@"280",@"170",@"440",@"Food Science",@"280",@"170",@"420",@"Food Science",@"120",@"100",@"500",@"Forestry",@"350",@"360",@"320",
                       @"Nutritional Science",@"280",@"175",@"410",
                       @"Physics",@"280",@"170",@"440",@"Chemical Sciences",@"280",@"170",@"440",@"Genetics",@"280",@"170",@"440",
                       @"Electrical Engineering",@"280",@"170",@"440",@"Civil Engineering",@"280",@"170",@"440",@"Process Engineering",
                       @"290",@"170",@"270",@"Energy Engineering",@"150",@"250",@"550",@"Pharmacy",@"235",@"170",@"440",@"Environmental Science",@"265",@"170",@"445",@"Medicine",@"265",@"170",@"445",@"Economics",@"265",@"170",@"445",nil];

    
    
    entryA[2].course =[NSArray arrayWithObjects: @"Crap",@"280",@"170",@"440",@"Poos",@"380",@"570",@"140",@"Struct. Eng. w/Architecture",@"380",@"570",@"140",@"Engineering",@"380",@"570",@"140",@"Science",@"380",@"570",@"140",@"Computer Science",@"380",@"570",@"140",@"Accountancy",@"n/a.0",@"n/a.0",@"n/a.0",
                       @"Commerce",@"280",@"170",@"440",@"Law",@"280",@"170",@"440",@"Business Information Systems",@"280",@"170",@"440",
                       @"Finance",@"280",@"170",@"440",@"Food Science",@"280",@"170",@"420",@"Nutritional Science",@"280",@"175",@"410",
                       @"Physics",@"280",@"170",@"440",@"Chemical Sciences",@"280",@"170",@"440",@"Genetics",@"280",@"170",@"440",
                       @"Electrical Engineering",@"280",@"170",@"440",@"Civil Engineering",@"280",@"170",@"440",@"Process Engineering",
                       @"290",@"170",@"270",@"Energy Engineering",@"150",@"250",@"550",@"Pharmacy",@"235",@"170",@"440",@"Environmental Science",@"265",@"170",@"445",@"Medicine",@"265",@"170",@"445",@"Economics",@"265",@"170",@"445",nil];
  
    
    entryA[3].course =[NSArray arrayWithObjects: @"Arts",@"280",@"170",@"440",@"Landscape Architecture",@"380",@"570",@"140",@"Structural Engineering with Architecture",@"380",@"570",@"140",@"Engineering",@"380",@"570",@"140",@"Science",@"380",@"570",@"140",@"Computer Science",@"380",@"570",@"140",
                       @"Commerce",@"280",@"170",@"440",@"Law",@"280",@"170",@"440",@"Business Information Systems",@"280",@"170",@"440",
                       @"Finance",@"280",@"170",@"440",@"Food Science",@"280",@"170",@"420",@"Nutritional Science",@"280",@"175",@"410",
                       @"Physics",@"280",@"170",@"440",@"Chemical Sciences",@"280",@"170",@"440",@"Genetics",@"280",@"170",@"440",
                       @"Electrical Engineering",@"280",@"170",@"440",@"Civil Engineering",@"280",@"170",@"440",@"Process Engineering",
                       @"290",@"170",@"270",@"Energy Engineering",@"150",@"250",@"550",@"Pharmacy",@"235",@"170",@"440",@"Environmental Science",@"265",@"170",@"445",@"Medicine",@"265",@"170",@"445",@"Economics",@"265",@"170",@"445",@"Accountancy",@"280",@"340",@"190",nil];
    
    
    entryA[4].course =[NSArray arrayWithObjects: @"Arts",@"280",@"170",@"440",@"Landscape Architecture",@"380",@"570",@"140",@"Structural Engineering with Architecture",@"380",@"570",@"140",@"Engineering",@"380",@"570",@"140",@"Science",@"380",@"570",@"140",@"Computer Science",@"380",@"570",@"140",
                       @"Commerce",@"280",@"170",@"440",@"Law",@"280",@"170",@"440",@"Business Information Systems",@"280",@"170",@"440",
                       @"Finance",@"280",@"170",@"440",@"Food Science",@"280",@"170",@"420",@"Nutritional Science",@"280",@"175",@"410",
                       @"Physics",@"280",@"170",@"440",@"Chemical Sciences",@"280",@"170",@"440",@"Genetics",@"280",@"170",@"440",
                       @"Electrical Engineering",@"280",@"170",@"440",@"Civil Engineering",@"280",@"170",@"440",@"Process Engineering",
                       @"290",@"170",@"270",@"Energy Engineering",@"150",@"250",@"550",@"Pharmacy",@"235",@"170",@"440",@"Environmental Science",@"265",@"170",@"445",@"Medicine",@"265",@"170",@"445",@"Economics",@"265",@"170",@"445",@"Accountancy",@"280",@"340",@"190",nil];
    
    
    entryA[5].course =[NSArray arrayWithObjects: @"Arts",@"280",@"170",@"440",@"Landscape Architecture",@"380",@"570",@"140",@"Structural Engineering with Architecture",@"380",@"570",@"140",@"Engineering",@"380",@"570",@"140",@"Science",@"380",@"570",@"140",@"Computer Science",@"380",@"570",@"140",
                       @"Commerce",@"280",@"170",@"440",@"Law",@"280",@"170",@"440",@"Business Information Systems",@"280",@"170",@"440",
                       @"Finance",@"280",@"170",@"440",@"Food Science",@"280",@"170",@"420",@"Nutritional Science",@"280",@"175",@"410",
                       @"Physics",@"280",@"170",@"440",@"Chemical Sciences",@"280",@"170",@"440",@"Genetics",@"280",@"170",@"440",
                       @"Electrical Engineering",@"280",@"170",@"440",@"Civil Engineering",@"280",@"170",@"440",@"Process Engineering",
                       @"290",@"170",@"270",@"Energy Engineering",@"150",@"250",@"550",@"Pharmacy",@"235",@"170",@"440",@"Environmental Science",@"265",@"170",@"445",@"Medicine",@"265",@"170",@"445",@"Economics",@"265",@"170",@"445",@"Accountancy",@"280",@"340",@"190",nil];
    
    
    entryA[6].course =[NSArray arrayWithObjects: @"Arts",@"280",@"170",@"440",@"Landscape Architecture",@"380",@"570",@"140",@"Structural Engineering with Architecture",@"380",@"570",@"140",@"Engineering",@"380",@"570",@"140",@"Science",@"380",@"570",@"140",@"Computer Science",@"380",@"570",@"140",
                       @"Commerce",@"280",@"170",@"440",@"Law",@"280",@"170",@"440",@"Business Information Systems",@"280",@"170",@"440",
                       @"Finance",@"280",@"170",@"440",@"Food Science",@"280",@"170",@"420",@"Nutritional Science",@"280",@"175",@"410",
                       @"Physics",@"280",@"170",@"440",@"Chemical Sciences",@"280",@"170",@"440",@"Genetics",@"280",@"170",@"440",
                       @"Electrical Engineering",@"280",@"170",@"440",@"Civil Engineering",@"280",@"170",@"440",@"Process Engineering",
                       @"290",@"170",@"270",@"Energy Engineering",@"150",@"250",@"550",@"Pharmacy",@"235",@"170",@"440",@"Environmental Science",@"265",@"170",@"445",@"Medicine",@"265",@"170",@"445",@"Economics",@"265",@"170",@"445",@"Accountancy",@"280",@"340s",@"190",nil];
    
         


  	// Do any additional setup after loading the view.
}
*/


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
    
    
    return[documentsDir stringByAppendingPathComponent:@"cao_db_courseLevel.sql"];
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


-(void) createTableOneNamed:(NSString *) tableNameOne withField1:(NSString *)  field1 withField2:(NSString *) field2
                 withField3:(NSString *)  field3 withField4:(NSString *) field4
{
    
    char *err;
    NSString *sql_1 = [NSString stringWithFormat:
                       @"CREATE TABLE IF NOT EXISTS '%@' ('%@' TEXT PRIMARY KEY,'%@' REAL,'%@' REAL,'%@' REAL);"
                       ,tableNameOne,field1, field2,field3,field4];
    
    
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
                      field4Value: (NSString *) field4Value
{
    NSString *sql_1 =[NSString stringWithFormat:
                      @"INSERT OR REPLACE INTO '%@' ('%@','%@','%@','%@') VALUES ('%@','%@','%@','%@');",
                      tableName,field1,field2,field3,field4,field1Value,field2Value,field3Value,field4Value];
    
    char *err;
    
    if(sqlite3_exec(db,[sql_1 UTF8String],NULL,NULL, &err) != SQLITE_OK)
    {
        sqlite3_close(db);
        NSAssert(0,@"Error updating table.");
    }
    
}



-(void)getAllRowsFromTableNamed :(NSString *) tableName
{
    //retrieve rows
    NSString *qsql_1 = [NSString stringWithFormat: @"SELECT * FROM '%@'",tableName];
    sqlite3_stmt *statement_1;
    
    
    //NSLog(@"in getAllRowsFromTable function about to cazll sqlite cmd \n ");
    
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

            
            //NSString *str = [[NSString alloc] initWithFormat:@" \n \n %@ : %@ - %@ - %@  -%@ \n \n",tableName,field1Str,field2Str,truncatedtruncatedField3Str,field4Str];
            
            //NSLog(str);
            
        }
        
        //---delete the compiled statement from memory---
        sqlite3_finalize(statement_1);
        
    }
    
}




@end











