

//  Created by EventHorizon on 14/04/2013.
//  Copyright (c) 2013 EventHorizon. All rights reserved.
//

#import "BIDContentDetailViewController.h"
#define SIZE 10
#define COLLEGE_NUM 7
#define MAX_COURSE_NUM 50
#define FIELD_NUM 3


/*
struct cao_entry{
    
    const char *college;
    NSArray *course;
    
};
*/

/*      test      */

const char *colleges[COLLEGE_NUM +1][2]={{"UCD"},{"DIT"},{"NUIG"},{"UCC"},{"TCD"},{"CIT"},{"DCU"},{'\0'}};
const int sizes[COLLEGE_NUM +1]={28,96,96,96,96,96,96,1};

//struct cao_entry entryA[COLLEGE_NUM +1];


/*      test      */


@interface BIDContentDetailViewController ()
{
    sqlite3 *db;
}

@end

@implementation BIDContentDetailViewController



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
    
    heading.font = [UIFont boldSystemFontOfSize:16];
    year_1.font = [UIFont boldSystemFontOfSize:16];
    year_2.font = [UIFont boldSystemFontOfSize:16];
    year_3.font = [UIFont boldSystemFontOfSize:16];
    
    college_1.font = [UIFont boldSystemFontOfSize:14];
    college_2.font = [UIFont boldSystemFontOfSize:14];
    college_3.font = [UIFont boldSystemFontOfSize:14];
    college_4.font = [UIFont boldSystemFontOfSize:14];
    college_5.font = [UIFont boldSystemFontOfSize:14];
    college_6.font = [UIFont boldSystemFontOfSize:14];
    college_7.font = [UIFont boldSystemFontOfSize:14];
    college_8.font = [UIFont boldSystemFontOfSize:14];
    
    points1_2012.font = [UIFont boldSystemFontOfSize:14];
    points2_2012.font = [UIFont boldSystemFontOfSize:14];
    points3_2012.font = [UIFont boldSystemFontOfSize:14];
    points4_2012.font = [UIFont boldSystemFontOfSize:14];
    points5_2012.font = [UIFont boldSystemFontOfSize:14];
    points6_2012.font = [UIFont boldSystemFontOfSize:14];
    points7_2012.font = [UIFont boldSystemFontOfSize:14];
    points8_2012.font = [UIFont boldSystemFontOfSize:14];

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
    
    
    //[self deleteDatabase(&db)];
    
    [self openDB];
   
    
    /*
    //NSLog(@"filling entries here \n");
    
    [self fillCAO_Entries];
    
    //NSLog(@"past filling entries here \n");
    
    
    for(int j=0;j< COLLEGE_NUM;++j)
    {
        
        if(entryA[j].college == NULL)
            break;
      
         NSLog(@"assigning college name -- j = %d \n",j);
        
        NSString *collegeName = [[NSString alloc] initWithUTF8String:entryA[j].college];
        
         NSLog(@"finished assigning college name --  creating table -- j = %d  \n",j);
        

        [self createTableOneNamed : [[NSString alloc] initWithUTF8String: entryA[j].college] withField1: @"course" withField2: @"2012" withField3: @"2011" withField4: @"2010"];
        
        
        for(int i=0;i < sizes[j] ;i+=4)
        {
            
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
            //}
            
            //NSLog(@"inserting records - %@,%@ ,%@ ,%@ into table named %@ \n",courseName,lastYrPoints,lastTwoYrPoints,lastThreeYrPoints,collegeName);
            
            
            [self insertRecordIntoTableNamed: collegeName withField1:@"course" field1Value:courseName
                                   andField2:@"2012" field2Value:lastYrPoints
                                   andField3:@"2011" field3Value:lastTwoYrPoints
                                   andField4:@"2010" field4Value:lastThreeYrPoints];
            
        }
        
        
    }
    
    */
    
}

-(void) viewWillAppear:(BOOL)animated;
{
       
    NSString *collegeSelection;
    NSString *courseSelected = self.title;
    
    NSString *strings[COLLEGE_NUM][FIELD_NUM];
    NSString *hitCollegeSelections[COLLEGE_NUM + 1];
    
    
    
    //initialize strings array
    for(int x =0; x < COLLEGE_NUM; x++ )
    {
        for(int y=0; y < FIELD_NUM; y++)
            strings[x][y]=nil;
        
    }
    
    
    //initialize CollegeSelections array
    for(int x =0; x < COLLEGE_NUM+1; x++ )
        hitCollegeSelections[x]=nil;
    
     
    
    for(int k = 0 ;k < COLLEGE_NUM;++k)
    {
        
        NSLog(@"assigning collegSelection  -- k = %d  \n",k);
        
        
        //NSLog(@" collegSelection  = %s  \n",colleges[k][2]);
        
        
        //old method when filling database in code
        
        
        //collegeSelection= [[NSString alloc] initWithUTF8String : entryA[k].college];
        
        collegeSelection= [[NSString alloc] initWithUTF8String : colleges[k][0]];

        
        NSLog(@"new attempt works : collegSelection  -- k = @  -- constructing sql statement \n");
        
  
        NSLog(@"finished assigning collegSelection  -- k = %d  -- constructing sql statement \n",k);
        
        NSString *qsql_1 = [NSString stringWithFormat: @"SELECT * FROM '%@' WHERE course='%@'",collegeSelection,courseSelected];

        
        sqlite3_stmt *statement_1;
        
        //declare table values (points) here
        
        NSString *field1Str=nil;
        NSString *field2Str=nil;
        NSString *field3Str=nil;
        //NSString *field4Str=nil;
        
        NSString *truncatedField2Str=nil;
        NSString *truncatedField3Str=nil;
        //NSString *truncatedField4Str=nil;
        
   
        //NSLog(@" k = %d  -- finished constructing sql statement -- going into sql if : \n",k);
        
        if(sqlite3_prepare(db, [qsql_1 UTF8String],-1, &statement_1,nil) == SQLITE_OK )
        {
            hitCollegeSelections[k]=collegeSelection;
            

            //NSLog(@"in sql if -- k = %d --  and about to try sql - while : \n",k);
            
            
            while(sqlite3_step(statement_1) == SQLITE_ROW)
            {
                
                //NSLog(@"in sql while -- k = %d  : \n",k);
                
                char *field1 = (char *) sqlite3_column_text(statement_1,0);
                field1Str = [[NSString alloc] initWithUTF8String : field1];
                
                //NSLog(@"field1Str set  -- k = %d  : \n",k);
        
                char *field2 = (char *) sqlite3_column_text(statement_1,1);
                field2Str = [[NSString alloc] initWithUTF8String : field2];
               
               // NSLog(@"field2Str set  -- k = %d  : \n",k);
            
                char *field3 = (char *) sqlite3_column_text(statement_1,2);
                field3Str = [[NSString alloc] initWithUTF8String : field3];
                
                //NSLog(@"field3Str set  -- k = %d  : \n",k);
                
                //char *field4 = (char *) sqlite3_column_text(statement_1,3);
                //field4Str = [[NSString alloc] initWithUTF8String : field4];
        

 
                truncatedField2Str = [field2Str substringToIndex:[field2Str length]-2];
                truncatedField3Str = [field3Str substringToIndex:[field3Str length]-2];
                //truncatedField4Str = [field4Str substringToIndex:[field4Str length]-2];
                
                // NSLog(@"truncatedField3Str set  -- k = %d  -- about to set strings[%d][0] : \n",k,k);
                
                
                //NSLog(@" strings[%d][0] = %@ -- going OUT of sql if  -- field1Str = %@: \n",k,strings[k][0],field1Str);
          
                strings[k][0]=field1Str;
                strings[k][1]=truncatedField2Str;
                strings[k][2]=truncatedField3Str;
    
            }//end while
            
            //---delete the compiled statement from memory---
            sqlite3_finalize(statement_1);
            
        }//end sql - if

        
        
        NSLog(@" k = %d -- going OUT of sql if : \n",k);
        
        
        
    } // end for over k

    
     NSLog(@" doing  college.texts : \n");
    
    college_1.text=hitCollegeSelections[0];
    college_2.text=hitCollegeSelections[1];
    college_3.text=hitCollegeSelections[2];
    college_4.text=hitCollegeSelections[3];
    college_5.text=hitCollegeSelections[4];
    college_6.text=hitCollegeSelections[5];
    
     NSLog(@" doing 6 th  college.texts : \n");
    
    college_7.text=hitCollegeSelections[6];


    //NSLog(@" done with college.texts  -- doing points.texts -- and strings[0][1] = %@ \n",strings[0][1]);
    
    NSLog(@" doing points now !! \n");

    
    points1_2012.text = strings[0][1];
    points1_2011.text = strings[0][2];
    //points1_2010.text = strings[0][3];
    
     NSLog(@" assigning 2nd points.texts\n");
    
    points2_2012.text = strings[1][1];
    points2_2011.text = strings[1][2];
    //points2_2010.text = strings[1][3];
    
    points3_2012.text = strings[2][1];
    points3_2011.text = strings[2][2];
    //points3_2010.text = strings[2][3];
    
    points4_2012.text = strings[3][1];
    points4_2011.text = strings[3][2];
    //points4_2010.text = strings[3][3];
    
    points5_2012.text = strings[4][1];
    points5_2011.text = strings[4][2];
    //points5_2010.text = strings[4][3];
    
    NSLog(@" assigning 6th points.texts\n");
    
    points6_2012.text = strings[5][1];
    points6_2011.text = strings[5][2];
    //points6_2010.text = strings[5][3];
    
    NSLog(@" assigning 7th points.texts\n");

    
    points7_2012.text = strings[6][1];
    points7_2011.text = strings[6][2];
    //points7_2010.text = strings[6][3];
    
    //points8_2012.text = strings[7][1];
    //points8_2011.text = strings[7][2];
    //points8_2010.text = strings[7][3];
    
    NSLog(@" done with  points.texts\n");
    

}


/*
-(void) fillCAO_Entries
{
    //fill CAO entry with data.
    
    
    for(int k =0 ;k < COLLEGE_NUM;k++)
    {
        
        entryA[k].college = colleges[k][0];

    }
    
    
    NSLog(@"got to filling array 0 \n");
    
    entryA[0].course =[NSArray arrayWithObjects: @"Commerce",@"265",@"170",@"445",@"Accountancy",@"265",@"170",@"445",@"Business Information Systems",@"280",@"170",@"440",@"Finance",@"280",@"170",@"440",@"Commerce with French",@"280",@"170",@"440",@"Commerce with German",@"280",@"170",@"440",@"Commerce with Italian",@"280",@"170",@"440",nil];
     
     
     NSLog(@"got PAST array 0 \n");
                       

    
    entryA[2].course =[NSArray arrayWithObjects: @"Architecture",@"280",@"170",@"440",@"Landscape Architecture",@"380",@"570",@"140",@"Structural Engineering with Architecture",@"380",@"570",@"140",@"Engineering",@"380",@"570",@"140",@"Science",@"380",@"570",@"140",@"Computer Science",@"380",@"570",@"140",@"Accountancy",@"n/a.0",@"n/a.0",@"n/a.0",
                       @"Commerce",@"280",@"170",@"440",@"Law",@"280",@"170",@"440",@"Business Information Systems",@"280",@"170",@"440",
                       @"Finance",@"280",@"170",@"440",@"Food Science",@"280",@"170",@"420",@"Nutritional Science",@"280",@"175",@"410",
                       @"Physics",@"280",@"170",@"440",@"Chemical Sciences",@"280",@"170",@"440",@"Genetics",@"280",@"170",@"440",
                       @"Electrical Engineering",@"280",@"170",@"440",@"Civil Engineering",@"280",@"170",@"440",@"Process Engineering",
                       @"290",@"170",@"270",@"Energy Engineering",@"150",@"250",@"550",@"Pharmacy",@"235",@"170",@"440",@"Environmental Science",@"265",@"170",@"445",@"Medicine",@"265",@"170",@"445",@"Economics",@"265",@"170",@"445",nil];
    
    
    
    entryA[1].course =[NSArray arrayWithObjects: @"Architecture",@"280",@"170",@"440",@"Landscape Architecture",@"380",@"570",@"140",@"Structural Engineering with Architecture",@"380",@"570",@"140",@"Engineering",@"380",@"570",@"140",@"Science",@"380",@"570",@"140",@"Computer Science",@"380",@"570",@"140",@"Accountancy",@"280",@"350",@"420",
                       @"Commerce",@"280",@"170",@"440",@"Law",@"780",@"170",@"440",@"Business Information Systems",@"280",@"170",@"440",
                       @"Finance",@"280",@"170",@"135",@"Architecture",@"280",@"170",@"440",@"Nutritional Science",@"280",@"175",@"410",
                       @"Physics",@"280",@"170",@"440",@"Chemical Sciences",@"280",@"170",@"440",@"Genetics",@"280",@"170",@"440",
                       @"Electrical Engineering",@"280",@"170",@"440",@"Civil Engineering",@"280",@"170",@"440",@"Process Engineering",
                       @"290",@"170",@"270",@"Energy Engineering",@"150",@"250",@"550",@"Pharmacy",@"235",@"170",@"440",@"Environmental Science",@"265",@"170",@"445",@"Medicine",@"265",@"170",@"445",@"Economics",@"265",@"170",@"445",nil];
    
   
    
    
    entryA[3].course =[NSArray arrayWithObjects: @"Architecture",@"280",@"170",@"440",@"Landscape Architecture",@"380",@"570",@"140",@"Structural Engineering with Architecture",@"380",@"570",@"140",@"Engineering",@"380",@"570",@"140",@"Science",@"380",@"570",@"140",@"Computer Science",@"380",@"570",@"140",@"Accountancy",@"220",@"160",@"365",
                       @"Commerce",@"280",@"170",@"440",@"Law",@"280",@"170",@"440",@"Business Information Systems",@"280",@"170",@"440",
                       @"Finance",@"280",@"170",@"440",@"Food Science",@"280",@"170",@"420",@"Nutritional Science",@"280",@"175",@"410",
                       @"Physics",@"280",@"170",@"440",@"Chemical Sciences",@"280",@"170",@"440",@"Genetics",@"280",@"170",@"440",
                       @"Electrical Engineering",@"280",@"170",@"440",@"Civil Engineering",@"280",@"170",@"440",@"Process Engineering",
                       @"290",@"170",@"270",@"Energy Engineering",@"150",@"250",@"550",@"Pharmacy",@"235",@"170",@"440",@"Environmental Science",@"265",@"170",@"445",@"Medicine",@"265",@"170",@"445",@"Economics",@"265",@"170",@"445",nil];
    
    
    entryA[4].course =[NSArray arrayWithObjects: @"Architecture",@"280",@"170",@"440",@"Landscape Architecture",@"380",@"570",@"140",@"Structural Engineering with Architecture",@"380",@"570",@"140",@"Engineering",@"380",@"570",@"140",@"Science",@"380",@"570",@"140",@"Computer Science",@"380",@"570",@"140",@"Accountancy",@"n/a.0",@"n/a.0",@"n/a.0",
                       @"Commerce",@"280",@"170",@"440",@"Law",@"280",@"170",@"440",@"Business Information Systems",@"280",@"170",@"440",
                       @"Finance",@"280",@"170",@"440",@"Food Science",@"280",@"170",@"420",@"Nutritional Science",@"280",@"175",@"410",
                       @"Physics",@"280",@"170",@"440",@"Chemical Sciences",@"280",@"170",@"440",@"Genetics",@"280",@"170",@"440",
                       @"Electrical Engineering",@"280",@"170",@"440",@"Civil Engineering",@"280",@"170",@"440",@"Process Engineering",
                       @"290",@"170",@"270",@"Energy Engineering",@"150",@"250",@"550",@"Pharmacy",@"235",@"170",@"440",@"Environmental Science",@"265",@"170",@"445",@"Medicine",@"265",@"170",@"445",@"Economics",@"265",@"170",@"445",nil];
    
    entryA[5].course =[NSArray arrayWithObjects: @"Architecture",@"280",@"170",@"440",@"Landscape Architecture",@"380",@"570",@"140",@"Structural Engineering with Architecture",@"380",@"570",@"140",@"Engineering",@"380",@"570",@"140",@"Science",@"380",@"570",@"140",@"Computer Science",@"380",@"570",@"140",@"Accountancy",@"380",@"570",@"140",
                       @"Commerce",@"280",@"170",@"440",@"Law",@"280",@"170",@"440",@"Business Information Systems",@"280",@"170",@"440",
                       @"Finance",@"280",@"170",@"440",@"Food Science",@"280",@"170",@"420",@"Nutritional Science",@"280",@"175",@"410",
                       @"Physics",@"280",@"170",@"440",@"Chemical Sciences",@"280",@"170",@"440",@"Genetics",@"280",@"170",@"440",
                       @"Electrical Engineering",@"280",@"170",@"440",@"Civil Engineering",@"280",@"170",@"440",@"Process Engineering",
                       @"290",@"170",@"270",@"Energy Engineering",@"150",@"250",@"550",@"Pharmacy",@"235",@"170",@"440",@"Environmental Science",@"265",@"170",@"445",@"Medicine",@"265",@"170",@"445",@"Economics",@"265",@"170",@"445",nil];
    
    
    entryA[6].course =[NSArray arrayWithObjects: @"Architecture",@"280",@"170",@"440",@"Landscape Architecture",@"380",@"570",@"140",@"Structural Engineering with Architecture",@"380",@"570",@"140",@"Engineering",@"380",@"570",@"140",@"Science",@"380",@"570",@"140",@"Computer Science",@"380",@"570",@"140",@"Accountancy",@"n/a.0",@"n/a.0",@"n/a.0",
                       @"Commerce",@"280",@"170",@"440",@"Law",@"280",@"170",@"440",@"Business Information Systems",@"280",@"170",@"440",
                       @"Finance",@"280",@"170",@"440",@"Food Science",@"280",@"170",@"420",@"Nutritional Science",@"280",@"175",@"410",
                       @"Physics",@"280",@"170",@"440",@"Chemical Sciences",@"280",@"170",@"440",@"Genetics",@"280",@"170",@"440",
                       @"Electrical Engineering",@"280",@"170",@"440",@"Civil Engineering",@"280",@"170",@"440",@"Process Engineering",
                       @"290",@"170",@"270",@"Energy Engineering",@"150",@"250",@"550",@"Pharmacy",@"235",@"170",@"440",@"Environmental Science",@"265",@"170",@"445",@"Medicine",@"265",@"170",@"445",@"Economics",@"265",@"170",@"445",nil];
    



	// Do any additional setup after loading the view.
}
*/ 



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    //NSLog(@"in memory warning function ! \n");
    // Dispose of any resources that can be recreated.
}




                                    /***   DATABASE TEST  ***/


-(NSString *) filePath;
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    
    NSString *documentsDir = [paths lastObject];
    
    
    return[documentsDir stringByAppendingPathComponent:@"cao_db_collegeLevel1.sql"];
}



//function to opemn the database
-(void)openDB
{
    
    //create first database
    if(sqlite3_open( [[self filePath] UTF8String], &db) != SQLITE_OK )
    {
        NSLog(@" sqlite3 error is = %s ",sqlite3_errmsg(db));
        
        sqlite3_close(db);
        NSAssert(0,@"Database one failed to open.");
    }
    
}


-(void) createTableOneNamed:(NSString *) tableNameOne withField1:(NSString *)  field1 withField2:(NSString *) field2
                 withField3:(NSString *)  field3 withField4:(NSString *) field4
{
    //NSLog(@"In creating tables");
    
    char *err;
    NSString *sql_1 = [NSString stringWithFormat:
                       @"CREATE TABLE IF NOT EXISTS '%@' ('%@' TEXT PRIMARY KEY,'%@' REAL,'%@' REAL,'%@' REAL);"
                       ,tableNameOne,field1, field2,field3,field4];
    
    
    if(sqlite3_exec(db,[sql_1 UTF8String],NULL,NULL, &err) != SQLITE_OK)
    {
        sqlite3_close(db);
        NSAssert(0,@"Tabled failed to create.");
    }
    
    
    //NSLog(@"Done creating tables");
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
            
            
            //NSLog(@" about to print msg \n ");
            
            //NSString *str = [[NSString alloc] initWithFormat:@" \n \n %@ : %@ - %@ - %@  -%@ \n \n",tableName,field1Str,field2Str,truncatedtruncatedField3Str,field4Str];
            
           // NSLog(str);
            
        }
        
        //---delete the compiled statement from memory---
        sqlite3_finalize(statement_1);
        
    }
    
}




@end












