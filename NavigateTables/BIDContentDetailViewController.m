#import "BIDContentDetailViewController.h"
#define SIZE 10
#define COLLEGE_NUM 7
#define MAX_COURSE_NUM 70
#define FIELD_NUM 5

#define UCC_COURSE_NUM 220
#define CIT_COURSE_NUM 132
#define UCD_COURSE_NUM 244
#define DBS_COURSE_NUM 68
#define GMT_COURSE_NUM 60
#define NUIM_COURSE_NUM 164
#define NUIG_COURSE_NUM 220
#define TABLE_FIELD_NUM 7
#define TABLE_ROW_NUM 500


struct cao_entry{
    const char *college;
    NSArray *course;
    
};




//const char *colleges[COLLEGE_NUM+1][2]={{"UCC"},{"CIT"},{"UCD"},{"DBS"},/*,{"GMT"},{"NUIM"},{"NUIG"},*/{'\0'}};
const int sizes[COLLEGE_NUM+1]={28,28,28,28/*UCC_COURSE_NUM,CIT_COURSE_NUM,UCD_COURSE_NUM,DBS_COURSE_NUM,GMT_COURSE_NUM,NUIM_COURSE_NUM,NUIG_COURSE_NUM,1*/};



/**  real Data  **/



/*      test      */

//const char *colleges[COLLEGE_NUM +1][2]={{"UCD"},{"DIT"},{"NUIG"},{"UCC"},{"TCD"},{"CIT"},{"DCU"},{'\0'}};
//const int sizes[COLLEGE_NUM +1]={28,96,96,96,96,96,96,1};

//struct cao_entry entryA[COLLEGE_NUM +1];
struct cao_entry entryA;

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

#
- (void)viewDidLoad
{
    NSLog(@" in viewDidLoad method - just got in there  \n");
    
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
    
    
    //[self openDB];
    
    
    //[self fillCAO_Entries];
    
    
    //[self createTableOneNamed : @"CAOLevel9DataDebug3" withField1: @"courseID" withField2: @"courseName" withField3: @"abbrev. courseName" withField4: @"college" withField5: @"2010" withField6: @"2011" withField7: @"2012"];
    
    /*
    
    NSString *courseName;
    NSString *courseID;
    NSString *abbrevcourseName;
    NSString *collegeName;
    NSString *lastYrPoints;
    NSString *lastTwoYrPoints;
    NSString *lastThreeYrPoints;
    
        
        for(int i=0;i < TABLE_FIELD_NUM*TABLE_ROW_NUM ;i+=TABLE_FIELD_NUM)
        {
            
            
            courseID         =  [entryA.course objectAtIndex:i];
            courseName       =  [entryA.course objectAtIndex:i+1];
            abbrevcourseName =  [entryA.course objectAtIndex:i+2];
            collegeName      =  [entryA.course objectAtIndex:i+3];
            lastYrPoints     =  [entryA.course objectAtIndex:i+4];
            lastTwoYrPoints  =  [entryA.course objectAtIndex:i+5];
            lastThreeYrPoints=  [entryA.course objectAtIndex:i+6];
            
            
            //NSLog(@"********  inserting records - %@,%@,%@,%@,%@,%@,%@ into table  - - i = %d  **************\n",courseID,courseName,abbrevcourseName,lastYrPoints,lastTwoYrPoints,lastThreeYrPoints,collegeName,i);
            

            [self insertRecordIntoTableNamed: @"CAOLevel9DataDebug3"
                                  withField1:@"courseID"           field1Value:courseID
                                  andField2:@"courseName"         field2Value:courseName
                                  andField3:@"abbrev. courseName" field3Value:abbrevcourseName
                                  andField4:@"college"            field4Value:collegeName
                                  andField5:@"2010"               field5Value:lastYrPoints
                                  andField6:@"2011"               field6Value:lastTwoYrPoints
                                  andField7:@"2012"               field7Value:lastThreeYrPoints];
            
        }
     */
    
}

-(void) viewWillAppear:(BOOL)animated;
{

    NSString *courseSelected = self.title;
    NSString *mainTableName=@"CAOLevel9DataDebug3";
    NSString *strings[COLLEGE_NUM][FIELD_NUM];
    NSString *hitCollegeSelections[COLLEGE_NUM + 1];
    
    int hits=0;
    
    int k=0;
    
    NSString *qsql_1 = [NSString stringWithFormat: @"SELECT * FROM '%@' WHERE courseName='%@'",mainTableName,courseSelected];
    
    sqlite3_stmt *statement_1;
    
    //declare table values (points) here
    
    NSString *field1Str=nil;
    NSString *field2Str=nil;
    NSString *field3Str=nil;
    NSString *field4Str=nil;
    NSString *field5Str=nil;
    NSString *field6Str=nil;
    NSString *field7Str=nil;
    
    NSString *truncatedField2Str=nil;
    NSString *truncatedField3Str=nil;
    NSString *truncatedField4Str=nil;
    NSString *truncatedField5Str=nil;
    NSString *truncatedField6Str=nil;
    NSString *truncatedField7Str=nil;
    
    //NSLog(@"got TO sql - if loop qsql_1 = %@",qsql_1);
    
    if(sqlite3_prepare(db, [qsql_1 UTF8String],-1, &statement_1,nil) == SQLITE_OK )
    {
        //NSLog(@"got into sql - if loop");
        
        while(sqlite3_step(statement_1) == SQLITE_ROW)
        {
            //NSLog(@"got into sql - while loop");
            
            char *field4 = (char *) sqlite3_column_text(statement_1,3);
            field4Str = [[NSString alloc] initWithUTF8String : field4];
            
            //NSLog(@"field4Str set = ->%@<-  -- k = %d  :  \n",field4Str,k);
            
            char *field5 = (char *) sqlite3_column_text(statement_1,4);
            field5Str = [[NSString alloc] initWithUTF8String : field5];
            
            //NSLog(@"field5Str set = ->%@<-  -- k = %d  : \n",field5Str,k);
            
            char *field6 = (char *) sqlite3_column_text(statement_1,5);
            field6Str = [[NSString alloc] initWithUTF8String : field6];
            
            //NSLog(@"field6Str = ->%@<- ,- -- k = %d  : \n",field6Str,k);
            
            char *field7 = (char *) sqlite3_column_text(statement_1,6);
            field7Str = [[NSString alloc] initWithUTF8String : field7];
            
            
            //NSLog(@"field7Str = ->%@<- ,- -- k = %d  : \n",field7Str,k);
            
            truncatedField5Str = [field5Str substringToIndex:[field5Str length]-2];
            truncatedField6Str = [field6Str substringToIndex:[field6Str length]-2];
            truncatedField7Str = [field7Str substringToIndex:[field7Str length]-2];  
            
            
          
            hitCollegeSelections[k]=field4Str;
            
            //NSLog(@"after assignment - hitCollegeSelections : ->%@<-n",hitCollegeSelections);
            
            strings[k][1]=truncatedField5Str;
            strings[k][2]=truncatedField6Str;
            strings[k][3]=truncatedField7Str;
            
            k++;
            
        }//end while
        
        
        hits=k;
        
        //---delete the compiled statement from memory---
        sqlite3_finalize(statement_1);
        
    }//end sql - if
    
    
    
    
    for(int i=0;i<hits;i++)
    {
        
        //NSLog(@"in for before switch about to assign to hitCollegeSelections  ");
        
        //hitCollegeSelections[i]= [[NSString alloc] initWithUTF8String : colleges[i][0]];//[NSString stringWithFormat: @"'%@'",(id)colleges[i]];
        
        //NSLog(@"before switch PAST assigning to hitCollegeSelections -- hits = %d -- i = %d \n",hits,i);
        
        switch(i)
        {
            case 0:
                college_1.text=hitCollegeSelections[i];
                //NSLog(@"aassigned college1.text and doing point in  case 0 ");
                points1_2010.text = strings[i][1];
                //NSLog(@"aassigned points1_2012 in  case 0 ");
                points1_2011.text = strings[i][2];
                //NSLog(@"aassigned points1_2011 in  case 0 ");
                points1_2012.text = strings[i][3];
                
                //NSLog(@"about to break out of case 0 ");
                break;
                
            case 1:
                //NSLog(@" on case 1 -- hitCollegeSelections[%d] = %@\n",i,hitCollegeSelections[i]);
               //if(! (strings[i][1]) )
               //     continue;
                college_2.text=hitCollegeSelections[i];
                //NSLog(@" got past assigning-- hitCollegeSelections[%d] ",i);
                points2_2010.text = strings[i][1];
                //NSLog(@" got past assigning-- strings1 ");
                points2_2011.text = strings[i][2];
                //NSLog(@" got past assigning-- strings2 ");
                points2_2012.text = strings[i][3];
                //NSLog(@" got past assigning-- strings3 ");
                break;
                
            case 2:
                //NSLog(@" on case 2 -- hitCollegeSelections[%d] = %@\n",i,hitCollegeSelections[i]);
                college_3.text=hitCollegeSelections[i];
                points3_2010.text = strings[i][1];
                points3_2011.text = strings[i][2];
                points3_2012.text = strings[i][3];
                break;
                
            case 3:
                college_4.text=hitCollegeSelections[i];
                points4_2010.text = strings[i][1];
                points4_2011.text = strings[i][2];
                points4_2012.text = strings[i][3];
                break;
                
            case 4:
                college_5.text=hitCollegeSelections[i];
                points5_2010.text = strings[i][1];
                points5_2011.text = strings[i][2];
                points5_2012.text = strings[i][3];
                break;
                
            case 5:
                //NSLog(@" on case 5 -- hitCollegeSelections[%d] = %@\n",i,hitCollegeSelections[i]);
                college_6.text=hitCollegeSelections[i];
                points6_2010.text = strings[i][1];
                points6_2011.text = strings[i][2];
                points6_2012.text = strings[i][3];
                break;
                
            case 6:
                //NSLog(@" on case 6 -- hitCollegeSelections[%d] = %@\n",i,hitCollegeSelections[i]);
                college_7.text=hitCollegeSelections[i];
                points7_2010.text = strings[i][1];
                points7_2011.text = strings[i][2];
                points7_2012.text = strings[i][3];
                break;
                
            case 7:
                NSLog(@" in case 7 -- hitCollegeSelections[%d] = %@\n",i,hitCollegeSelections[i]);
                college_8.text=hitCollegeSelections[i];
                points8_2010.text = strings[i][1];
                points8_2011.text = strings[i][2];
                points8_2012.text = strings[i][3];
                break;
                
                /* wont go beyond 8 colleges for a while yet.*/
                 
            case 8:
                NSLog(@" in case 8 -- hitCollegeSelections[%d] = %@\n",i,hitCollegeSelections[i]);

                 college_9.text=hitCollegeSelections[i];
                NSLog(@" in case 8 -- written to hitCollegeSelections -- doing points now \n");
                 points9_2010.text = strings[i][1];
                NSLog(@" in case 8 -- done with points 9 - 2010 now \n");
                 points9_2011.text = strings[i][2];
                NSLog(@" in case 8 -- done with points 9 - 2011 now \n");
                 points9_2012.text = strings[i][3];
                NSLog(@" in case 8 -- done with points 9 - 2012 now \n");
                 break;
                 
                 
            case 9:
                NSLog(@" in case 9 -- hitCollegeSelections[%d] = %@\n",i,hitCollegeSelections[i]);

                 college_10.text=hitCollegeSelections[i];
                
                 NSLog(@" in case 9 -- done with college text assign -- now doing points 9 - breaking now \n");
                
                 points10_2010.text = strings[i][1];
                 points10_2011.text = strings[i][2];
                 points10_2012.text = strings[i][3];
                
                NSLog(@" in case 9 -- done with points 9 - breaking now \n");
                 break;
                 
            case 10:
                 college_11.text=hitCollegeSelections[i];
                 points11_2010.text = strings[i][1];
                 points11_2011.text = strings[i][2];
                 points11_2012.text = strings[i][3];
                 break;
                 
            case 11:
                 college_12.text=hitCollegeSelections[i];
                 points12_2010.text = strings[i][1];
                 points12_2011.text = strings[i][2];
                 points12_2012.text = strings[i][3];
                 break;
                 
            case 12:
                 college_13.text=hitCollegeSelections[i];
                 points13_2010.text = strings[i][1];
                 points13_2011.text = strings[i][2];
                 points13_2012.text = strings[i][3];
                 break;
                
            case 13:
                 college_14.text=hitCollegeSelections[i];
                 points14_2010.text = strings[i][1];
                 points14_2011.text = strings[i][2];
                 points14_2012.text = strings[i][3];
                 break;
                 
            case 14:
                 college_15.text=hitCollegeSelections[i];
                 points15_2010.text = strings[i][1];
                 points15_2011.text = strings[i][2];
                 points15_2012.text = strings[i][3];
                 break;
                 
            case 15:
                 college_16.text=hitCollegeSelections[i];
                 points16_2012.text = strings[i][1];
                 points16_2011.text = strings[i][2];
                 points16_2010.text = strings[i][3];
                 break;
                 
            case 16:
                 college_17.text=hitCollegeSelections[i];
                 points17_2010.text = strings[i][1];
                 points17_2011.text = strings[i][2];
                 points17_2012.text = strings[i][3];
                 break;
                 
            case 17:
                 college_18.text=hitCollegeSelections[i];
                 points18_2010.text = strings[i][1];
                 points18_2011.text = strings[i][2];
                 points18_2012.text = strings[i][3];
                 break;
                
            case 18:
                college_19.text=hitCollegeSelections[i];
                points19_2010.text = strings[i][1];
                points19_2011.text = strings[i][2];
                points19_2012.text = strings[i][3];
                break;
                
            case 19:
                college_20.text=hitCollegeSelections[i];
                points20_2010.text = strings[i][1];
                points20_2011.text = strings[i][2];
                points20_2012.text = strings[i][3];
                break;
                 
                
            default:
                break;
                
        }//end switch
        
        NSLog(@"after switch !");
        
    }//end for.
    
    NSLog(@"after for !");
    
}//end function.



-(void) fillCAO_Entries
{
    //fill CAO entry with data.
 
    
    entryA.course =
    
    [NSArray arrayWithObjects: @"PS2551",@"Civil Engineering",@"Civil Engineering",@"NUIG",@"025",@"585",@"315",
     @"HD1226",@"Nutritional Science",@"Nutritional Science",@"DBS",@"025",@"585",@"315",
     @"EN3733",@"Pharmacy",@"Pharmacy",@"DIT",@"285",@"395",@"480",
     @"LM5713",@"Finance",@"Finance",@"CIT",@"255",@"265",@"510",
     @"IS7435",@"Finance",@"Finance",@"CIT",@"180",@"040",@"185",
     @"LP2859",@"Pharmacy",@"Pharmacy",@"CIT",@"575",@"130",@"325",
     @"GR7031",@"Food Science",@"Food Science",@"NUIM",@"575",@"130",@"325",
     @"GJ2553",@"Business Information Systems",@"Business Information Sy",@"NUIM",@"150",@"425",@"180",
     @"EH4643",@"Food Science",@"Food Science",@"CIT",@"385",@"465",@"505",
     @"KG3844",@"Electrical Engineering",@"Electrical Engine",@"TCD",@"200",@"300",@"305",
     @"MR9913",@"Food Science",@"Food Science",@"UL",@"225",@"015",@"170",
     @"HR8590",@"Civil Engineering",@"Civil Engineering",@"DBS",@"530",@"130",@"580",
     @"PO0837",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"UCD",@"090",@"115",@"185",
     @"EH4643",@"Physics",@"Physics",@"UL",@"380",@"320",@"565",
     @"JQ1491",@"General Arts",@"General Arts",@"GMIT",@"360",@"190",@"380",
     @"QL4375",@"Law",@"Law",@"NUIG",@"480",@"015",@"405",
     @"JH7286",@"Physics",@"Physics",@"CIT",@"035",@"140",@"150",
     @"IJ0365",@"Business Information Systems",@"Business Information Sy",@"CIT",@"175",@"555",@"570",
     @"BN5940",@"Accountancy",@"Accountancy",@"WIT",@"590",@"255",@"485",
     @"BK4968",@"Nutritional Science",@"Nutritional Science",@"UCD",@"315",@"125",@"010",
     @"GK0301",@"Pharmacy",@"Pharmacy",@"NUIM",@"450",@"445",@"325",
     @"BI7747",@"Accountancy",@"Accountancy",@"DIT",@"465",@"505",@"530",
     @"QP8190",@"Civil Engineering",@"Civil Engineering",@"CIT",@"145",@"300",@"135",
     @"IP3154",@"Chemical Science",@"Chemical Science",@"UL",@"170",@"550",@"385",
     @"MS6865",@"Food Science",@"Food Science",@"TCD",@"150",@"175",@"545",
     @"AI7505",@"Environmental Science",@"Environmental Sc",@"TCD",@"510",@"565",@"550",
     @"SR0380",@"General Arts",@"General Arts",@"UCD",@"325",@"175",@"595",
     @"JD8463",@"Food Science",@"Food Science",@"NUIM",@"320",@"565",@"115",
     @"LM5713",@"Environmental Science",@"Environmental Sc",@"DIT",@"125",@"215",@"440",
     @"DB9983",@"Physics",@"Physics",@"CIT",@"175",@"545",@"190",
     @"EC1796",@"Civil Engineering",@"Civil Engineering",@"DIT",@"290",@"245",@"000",
     @"LB1644",@"Commerce",@"Commerce",@"NUIM",@"030",@"020",@"425",
     @"AN7125",@"Accountancy",@"Accountancy",@"CIT",@"595",@"405",@"255",
     @"KE6469",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"GMIT",@"325",@"055",@"300",
     @"EK4898",@"Food Science",@"Food Science",@"UCC",@"325",@"255",@"410",
     @"HC8328",@"Chemical Science",@"Chemical Science",@"UCD",@"590",@"255",@"485",
     @"QI1461",@"Physics",@"Physics",@"DCU",@"175",@"555",@"570",
     @"EL7466",@"Chemical Science",@"Chemical Science",@"NUIG",@"570",@"460",@"365",
     @"LP2859",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"DBS",@"150",@"550",@"170",
     @"MN7383",@"Business Information Systems",@"Business Information Sy",@"DCU",@"550",@"170",@"410",
     @"MO4167",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"DCU",@"580",@"580",@"345",
     @"NN8595",@"Physics",@"Physics",@"UCD",@"585",@"315",@"160",
     @"AH7855",@"General Arts",@"General Arts",@"DCU",@"240",@"125",@"360",
     @"JD8463",@"Pharmacy",@"Pharmacy",@"NUIG",@"425",@"275",@"525",
     @"LG0206",@"Business Information Systems",@"Business Information Sy",@"TCD",@"275",@"240",@"125",
     @"OP6922",@"General Arts",@"General Arts",@"DCU",@"140",@"150",@"235",
     @"SO6433",@"Food Science",@"Food Science",@"UCC",@"510",@"565",@"550",
     @"NN8595",@"Electrical Engineering",@"Electrical Engine",@"NUIG",@"180",@"335",@"390",
     @"KQ3577",@"Business Information Systems",@"Business Information Sy",@"UL",@"315",@"170",@"550",
     @"MR9913",@"Nutritional Science",@"Nutritional Science",@"UCC",@"540",@"005",@"570",
     @"BK4968",@"Accountancy",@"Accountancy",@"UCD",@"210",@"365",@"295",
     @"GS3123",@"Arts",@"Arts",@"WIT",@"040",@"185",@"570",
     @"HH4642",@"Business and Accounting",@"Business and Accou",@"DCU",@"450",@"445",@"325",
     @"JO9464",@"General Arts",@"General Arts",@"UL",@"185",@"570",@"460",
     @"BG4115",@"Finance",@"Finance",@"UCC",@"385",@"465",@"505",
     @"QQ9539",@"Physics",@"Physics",@"NUIG",@"010",@"080",@"460",
     @"QS6837",@"Accountancy",@"Accountancy",@"UCD",@"245",@"290",@"080",
     @"GJ2553",@"Physics",@"Physics",@"UCC",@"260",@"195",@"150",
     @"MC9446",@"Environmental Science",@"Environmental Sc",@"UCC",@"200",@"235",@"255",
     @"MN7383",@"Business Information Systems",@"Business Information Sy",@"UL",@"530",@"130",@"580",
     @"LN3533",@"Electrical Engineering",@"Electrical Engine",@"NUIG",@"570",@"230",@"250",
     @"MD0795",@"Finance",@"Finance",@"WIT",@"140",@"150",@"235",
     @"QK8899",@"General Arts",@"General Arts",@"GMIT",@"015",@"405",@"465",
     @"CC9188",@"Food Science",@"Food Science",@"WIT",@"030",@"440",@"375",
     @"DO2519",@"Accountancy",@"Accountancy",@"DCU",@"440",@"000",@"040",
     @"DJ1749",@"Civil Engineering",@"Civil Engineering",@"DIT",@"215",@"440",@"575",
     @"OO8187",@"Physics",@"Physics",@"NUIG",@"190",@"360",@"270",
     @"NR9482",@"Civil Engineering",@"Civil Engineering",@"NUIM",@"125",@"215",@"440",
     @"JI3979",@"Commerce",@"Commerce",@"WIT",@"150",@"550",@"170",
     @"MD0795",@"Law",@"Law",@"TCD",@"250",@"150",@"175",
     @"CH4800",@"Electrical Engineering",@"Electrical Engine",@"UCC",@"305",@"405",@"210",
     @"KG3844",@"Arts",@"Arts",@"NUIM",@"380",@"320",@"565",
     @"NS9158",@"Accountancy",@"Accountancy",@"UCC",@"315",@"170",@"550",
     @"QI1461",@"Business and Accounting",@"Business and Accou",@"NUIM",@"585",@"470",@"035",
     @"MS6865",@"General Arts",@"General Arts",@"DBS",@"505",@"460",@"275",
     @"PL6859",@"Physics",@"Physics",@"GMIT",@"250",@"450",@"445",
     @"EJ5731",@"Food Science",@"Food Science",@"WIT",@"565",@"115",@"585",
     @"SL8197",@"Electrical Engineering",@"Electrical Engine",@"WIT",@"030",@"440",@"375",
     @"OD2962",@"Accountancy",@"Accountancy",@"NUIM",@"440",@"000",@"040",
     @"AL9607",@"Commerce",@"Commerce",@"UCC",@"255",@"030",@"020",
     @"OE0372",@"Physics",@"Physics",@"UCD",@"095",@"360",@"570",
     @"AH7855",@"Accountancy",@"Accountancy",@"CIT",@"150",@"175",@"545",
     @"JC8282",@"Chemical Science",@"Chemical Science",@"NUIM",@"380",@"525",@"030",
     @"GC7194",@"Environmental Science",@"Environmental Sc",@"UCC",@"255",@"145",@"195",
     @"IR4513",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"DCU",@"485",@"415",@"150",
     @"AH7855",@"Physics",@"Physics",@"CIT",@"170",@"410",@"055",
     @"FM5936",@"Physics",@"Physics",@"DCU",@"425",@"275",@"525",
     @"EJ5731",@"Pharmacy",@"Pharmacy",@"GMIT",@"025",@"585",@"315",
     @"MQ9594",@"Law",@"Law",@"NUIG",@"025",@"585",@"315",
     @"SK0150",@"General Arts",@"General Arts",@"UCD",@"565",@"550",@"240",
     @"EB7920",@"Pharmacy",@"Pharmacy",@"DCU",@"585",@"470",@"035",
     @"EI0932",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"TCD",@"185",@"570",@"460",
     @"FD9766",@"Environmental Science",@"Environmental Sc",@"WIT",@"555",@"570",@"565",
     @"LP2859",@"Finance",@"Finance",@"TCD",@"305",@"405",@"210",
     @"JS5191",@"Pharmacy",@"Pharmacy",@"WIT",@"325",@"055",@"300",
     @"OD2962",@"Finance",@"Finance",@"GMIT",@"555",@"485",@"045",
     @"EI0932",@"Business and Accounting",@"Business and Accou",@"WIT",@"430",@"435",@"315",
     @"IS7435",@"Chemical Science",@"Chemical Science",@"CIT",@"095",@"360",@"570",
     @"EM9180",@"Finance",@"Finance",@"UCD",@"385",@"465",@"505",
     @"NS9158",@"Civil Engineering",@"Civil Engineering",@"UL",@"515",@"065",@"505",
     @"KD2532",@"Nutritional Science",@"Nutritional Science",@"CIT",@"270",@"190",@"360",
     @"KR6437",@"Business Information Systems",@"Business Information Sy",@"CIT",@"325",@"055",@"300",
     @"ML8240",@"General Arts",@"General Arts",@"UCC",@"405",@"210",@"030",
     @"AL9607",@"Physics",@"Physics",@"DIT",@"550",@"240",@"155",
     @"CN4107",@"General Arts",@"General Arts",@"GMIT",@"485",@"045",@"200",
     @"LB1644",@"Law",@"Law",@"TCD",@"515",@"065",@"505",
     @"IP3154",@"Electrical Engineering",@"Electrical Engine",@"NUIG",@"030",@"440",@"375",
     @"JR3954",@"Commerce",@"Commerce",@"UL",@"580",@"345",@"035",
     @"AQ6270",@"Chemical Science",@"Chemical Science",@"GMIT",@"305",@"405",@"210",
     @"KS4144",@"Finance",@"Finance",@"CIT",@"230",@"250",@"450",
     @"DH7363",@"Food Science",@"Food Science",@"NUIG",@"275",@"525",@"485",
     @"QQ9539",@"Pharmacy",@"Pharmacy",@"NUIG",@"410",@"320",@"095",
     @"KE6469",@"Commerce",@"Commerce",@"DBS",@"160",@"175",@"555",
     @"SM1257",@"Food Science",@"Food Science",@"DCU",@"185",@"370",@"080",
     @"IP3154",@"Law",@"Law",@"GMIT",@"260",@"195",@"150",
     @"MQ9594",@"Business and Accounting",@"Business and Accou",@"DBS",@"575",@"040",@"250",
     @"OD2962",@"Law",@"Law",@"DBS",@"485",@"415",@"150",
     @"AK0663",@"Environmental Science",@"Environmental Sc",@"DCU",@"005",@"325",@"275",
     @"SP1301",@"Finance",@"Finance",@"DCU",@"145",@"195",@"145",
     @"FB4655",@"Business and Accounting",@"Business and Accou",@"DIT",@"150",@"235",@"325",
     @"SN0374",@"Civil Engineering",@"Civil Engineering",@"TCD",@"040",@"185",@"570",
     @"HI3258",@"Business Information Systems",@"Business Information Sy",@"DIT",@"185",@"370",@"080",
     @"OP6922",@"Law",@"Law",@"WIT",@"325",@"175",@"595",
     @"KN5854",@"Physics",@"Physics",@"CIT",@"485",@"045",@"200",
     @"JB6326",@"Chemical Science",@"Chemical Science",@"DCU",@"090",@"200",@"235",
     @"PR4599",@"Commerce",@"Commerce",@"UCC",@"460",@"010",@"080",
     @"MO4167",@"Food Science",@"Food Science",@"TCD",@"030",@"060",@"150",
     @"EL7466",@"Civil Engineering",@"Civil Engineering",@"NUIG",@"570",@"565",@"285",
     @"AN7125",@"Nutritional Science",@"Nutritional Science",@"NUIM",@"005",@"325",@"275",
     @"JH7286",@"Law",@"Law",@"WIT",@"300",@"575",@"040",
     @"JP4575",@"Arts",@"Arts",@"WIT",@"265",@"510",@"565",
     @"KN5854",@"Arts",@"Arts",@"UL",@"385",@"465",@"505",
     @"FM5936",@"Law",@"Law",@"TCD",@"405",@"255",@"145",
     @"MM1601",@"Electrical Engineering",@"Electrical Engine",@"DCU",@"010",@"175",@"540",
     @"KG3844",@"Pharmacy",@"Pharmacy",@"NUIG",@"185",@"370",@"080",
     @"ED5548",@"Finance",@"Finance",@"GMIT",@"365",@"170",@"590",
     @"JI3979",@"Finance",@"Finance",@"DCU",@"135",@"090",@"115",
     @"PL6859",@"Civil Engineering",@"Civil Engineering",@"GMIT",@"145",@"195",@"145",
     @"QM4838",@"Finance",@"Finance",@"DBS",@"440",@"000",@"040",
     @"MP1718",@"Business and Accounting",@"Business and Accou",@"NUIM",@"505",@"530",@"245",
     @"OP6922",@"Civil Engineering",@"Civil Engineering",@"UCC",@"210",@"365",@"295",
     @"NQ9934",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"NUIG",@"440",@"375",@"460",
     @"FM5936",@"Law",@"Law",@"GMIT",@"035",@"140",@"150",
     @"BK4968",@"Arts",@"Arts",@"NUIG",@"580",@"580",@"345",
     @"DK2434",@"Commerce",@"Commerce",@"UCD",@"575",@"130",@"325",
     @"SL8197",@"Electrical Engineering",@"Electrical Engine",@"UL",@"095",@"360",@"570",
     @"JE4349",@"Business and Accounting",@"Business and Accou",@"CIT",@"235",@"255",@"265",
     @"GG2153",@"Civil Engineering",@"Civil Engineering",@"CIT",@"175",@"555",@"570",
     @"NN8595",@"Chemical Science",@"Chemical Science",@"UCC",@"330",@"460",@"010",
     @"NP6713",@"Pharmacy",@"Pharmacy",@"WIT",@"315",@"125",@"010",
     @"NP6713",@"Accountancy",@"Accountancy",@"DCU",@"570",@"460",@"365",
     @"PE5194",@"Commerce",@"Commerce",@"DCU",@"330",@"460",@"010",
     @"GH5484",@"Food Science",@"Food Science",@"UCC",@"525",@"485",@"415",
     @"HE2169",@"General Arts",@"General Arts",@"WIT",@"460",@"365",@"170",
     @"MB9225",@"Arts",@"Arts",@"DCU",@"315",@"125",@"010",
     @"MO4167",@"Civil Engineering",@"Civil Engineering",@"CIT",@"175",@"555",@"570",
     @"FS7045",@"Nutritional Science",@"Nutritional Science",@"DIT",@"015",@"170",@"075",
     @"EI0932",@"General Arts",@"General Arts",@"UCC",@"285",@"395",@"480",
     @"QP8190",@"Civil Engineering",@"Civil Engineering",@"NUIG",@"560",@"170",@"245",
     @"GR7031",@"Accountancy",@"Accountancy",@"DCU",@"385",@"465",@"505",
     @"EJ5731",@"General Arts",@"General Arts",@"UCC",@"425",@"180",@"335",
     @"CK3281",@"Commerce",@"Commerce",@"DBS",@"445",@"325",@"175",
     @"HI3258",@"Finance",@"Finance",@"NUIG",@"150",@"235",@"325",
     @"SN0374",@"Environmental Science",@"Environmental Sc",@"NUIM",@"405",@"465",@"385",
     @"DN8471",@"Finance",@"Finance",@"DBS",@"030",@"020",@"425",
     @"OR7289",@"Nutritional Science",@"Nutritional Science",@"UCC",@"290",@"080",@"360",
     @"CB2826",@"Accountancy",@"Accountancy",@"TCD",@"000",@"040",@"040",
     @"QL4375",@"Food Science",@"Food Science",@"UCD",@"200",@"300",@"305",
     @"AL9607",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"UL",@"470",@"035",@"505",
     @"BP6603",@"General Arts",@"General Arts",@"DBS",@"585",@"470",@"035",
     @"DC2939",@"Nutritional Science",@"Nutritional Science",@"DCU",@"385",@"125",@"215",
     @"QO4405",@"Accountancy",@"Accountancy",@"NUIM",@"175",@"545",@"190",
     @"GL8912",@"Arts",@"Arts",@"NUIG",@"185",@"000",@"425",
     @"LN3533",@"Law",@"Law",@"UCD",@"585",@"470",@"035",
     @"BN5940",@"Food Science",@"Food Science",@"DCU",@"565",@"550",@"240",
     @"PN6059",@"Commerce",@"Commerce",@"UCC",@"175",@"595",@"405",
     @"BM9828",@"Food Science",@"Food Science",@"UCD",@"255",@"265",@"510",
     @"FM5936",@"Business and Accounting",@"Business and Accou",@"WIT",@"155",@"200",@"395",
     @"PS2551",@"Accountancy",@"Accountancy",@"WIT",@"030",@"020",@"425",
     @"ME0389",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"UCD",@"230",@"090",@"200",
     @"II7802",@"Pharmacy",@"Pharmacy",@"DBS",@"000",@"290",@"FC6824",
     @"BP6603",@"Civil Engineering",@"Civil Engineering",@"TCD",@"550",@"170",@"410",
     @"HH4642",@"Electrical Engineering",@"Electrical Engine",@"GMIT",@"150",@"175",@"545",
     @"PI1576",@"Business and Accounting",@"Business and Accou",@"UCD",@"200",@"470",@"150",
     @"BG4115",@"Food Science",@"Food Science",@"UCC",@"015",@"440",@"000",
     @"MM1601",@"Finance",@"Finance",@"DCU",@"505",@"460",@"275",
     @"LO5282",@"Finance",@"Finance",@"DBS",@"545",@"190",@"530",
     @"CJ3857",@"Commerce",@"Commerce",@"NUIM",@"580",@"355",@"515",
     @"MS6865",@"Environmental Science",@"Environmental Sc",@"DCU",@"345",@"545",@"260",
     @"CG5708",@"Environmental Science",@"Environmental Sc",@"DCU",@"010",@"180",@"040",
     @"DJ1749",@"Business and Accounting",@"Business and Accou",@"CIT",@"005",@"325",@"275",
     @"CH4800",@"Physics",@"Physics",@"DIT",@"425",@"330",@"460",
     @"SR0380",@"Food Science",@"Food Science",@"DIT",@"175",@"545",@"190",
     @"KS4144",@"Arts",@"Arts",@"CIT",@"150",@"235",@"325",
     @"JR3954",@"Arts",@"Arts",@"WIT",@"360",@"270",@"350",
     @"HB7373",@"Pharmacy",@"Pharmacy",@"UCD",@"395",@"480",@"015",
     @"OS5097",@"General Arts",@"General Arts",@"DCU",@"505",@"495",@"005",
     @"BH1127",@"Business Information Systems",@"Business Information Sy",@"DCU",@"170",@"550",@"385",
     @"FB4655",@"General Arts",@"General Arts",@"CIT",@"360",@"525",@"200",
     @"JB6326",@"Business Information Systems",@"Business Information Sy",@"CIT",@"265",@"510",@"565",
     @"OK2621",@"General Arts",@"General Arts",@"DIT",@"270",@"350",@"430",
     @"KG3844",@"Pharmacy",@"Pharmacy",@"DBS",@"045",@"200",@"300",
     @"LR9659",@"Physics",@"Physics",@"UCC",@"200",@"470",@"150",
     @"KH5097",@"Electrical Engineering",@"Electrical Engine",@"UCC",@"460",@"275",@"580",
     @"BL6674",@"Arts",@"Arts",@"WIT",@"425",@"330",@"460",
     @"EN3733",@"Business Information Systems",@"Business Information Sy",@"UCD",@"275",@"240",@"125",
     @"SO6433",@"Pharmacy",@"Pharmacy",@"TCD",@"275",@"240",@"125",
     @"JS5191",@"General Arts",@"General Arts",@"UCC",@"095",@"360",@"570",
     @"CP5268",@"Accountancy",@"Accountancy",@"NUIM",@"265",@"510",@"565",
     @"PO0837",@"Food Science",@"Food Science",@"TCD",@"010",@"175",@"540",
     @"FH0170",@"Pharmacy",@"Pharmacy",@"UCD",@"555",@"570",@"565",
     @"CC9188",@"Environmental Science",@"Environmental Sc",@"DBS",@"585",@"315",@"160",
     @"IJ0365",@"Business Information Systems",@"Business Information Sy",@"DCU",@"080",@"380",@"525",
     @"PJ6089",@"Nutritional Science",@"Nutritional Science",@"NUIM",@"000",@"290",@"FC6824",
     @"FG9978",@"Pharmacy",@"Pharmacy",@"UL",@"155",@"200",@"395",
     @"QL4375",@"Chemical Science",@"Chemical Science",@"NUIG",@"495",@"005",@"325",
     @"HI3258",@"Finance",@"Finance",@"DBS",@"115",@"185",@"370",
     @"PL6859",@"Commerce",@"Commerce",@"DCU",@"360",@"190",@"380",
     @"BB7732",@"Physics",@"Physics",@"TCD",@"290",@"080",@"360",
     @"BQ2594",@"Food Science",@"Food Science",@"UCD",@"460",@"555",@"485",
     @"AI7505",@"Food Science",@"Food Science",@"DIT",@"045",@"200",@"300",
     @"CJ3857",@"Accountancy",@"Accountancy",@"DIT",@"010",@"175",@"540",
     @"KH5097",@"Arts",@"Arts",@"UCD",@"240",@"155",@"200",
     @"IG5477",@"Law",@"Law",@"TCD",@"395",@"560",@"170",
     @"IR4513",@"Nutritional Science",@"Nutritional Science",@"NUIG",@"480",@"015",@"405",
     @"CM9957",@"Business and Accounting",@"Business and Accou",@"NUIG",@"200",@"395",@"560",
     @"SR0380",@"Business and Accounting",@"Business and Accou",@"CIT",@"565",@"115",@"585",
     @"OP6922",@"Chemical Science",@"Chemical Science",@"CIT",@"195",@"145",@"300",
     @"OS5097",@"Chemical Science",@"Chemical Science",@"UCC",@"425",@"330",@"460",
     @"HR8590",@"Civil Engineering",@"Civil Engineering",@"CIT",@"010",@"345",@"545",
     @"BI7747",@"Law",@"Law",@"DIT",@"170",@"010",@"180",
     @"OP6922",@"Law",@"Law",@"UL",@"585",@"470",@"035",
     @"FI0698",@"Commerce",@"Commerce",@"NUIM",@"170",@"590",@"325",
     @"FD9766",@"Nutritional Science",@"Nutritional Science",@"GMIT",@"565",@"285",@"395",
     @"FE1753",@"Environmental Science",@"Environmental Sc",@"DBS",@"350",@"430",@"435",
     @"LN3533",@"Law",@"Law",@"NUIM",@"575",@"130",@"325",
     @"JP4575",@"Business and Accounting",@"Business and Accou",@"DIT",@"555",@"485",@"045",
     @"EN3733",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"DBS",@"135",@"090",@"115",
     @"EN3733",@"Commerce",@"Commerce",@"TCD",@"145",@"300",@"135",
     @"QL4375",@"Law",@"Law",@"UCC",@"495",@"005",@"325",
     @"SL8197",@"General Arts",@"General Arts",@"GMIT",@"570",@"230",@"250",
     @"SR0380",@"Environmental Science",@"Environmental Sc",@"DBS",@"160",@"175",@"555",
     @"AQ6270",@"Arts",@"Arts",@"WIT",@"170",@"410",@"055",
     @"JR3954",@"Nutritional Science",@"Nutritional Science",@"NUIG",@"410",@"320",@"095",
     @"MP1718",@"Accountancy",@"Accountancy",@"UCC",@"275",@"525",@"485",
     @"KS4144",@"Accountancy",@"Accountancy",@"NUIG",@"405",@"465",@"385",
     @"FM5936",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"UL",@"315",@"160",@"175",
     @"HJ4736",@"Law",@"Law",@"DIT",@"170",@"590",@"325",
     @"LP2859",@"Accountancy",@"Accountancy",@"UL",@"570",@"230",@"250",
     @"FB4655",@"Chemical Science",@"Chemical Science",@"DIT",@"160",@"175",@"555",
     @"IR4513",@"Accountancy",@"Accountancy",@"WIT",@"300",@"135",@"090",
     @"FS7045",@"Physics",@"Physics",@"CIT",@"325",@"175",@"595",
     @"PM9217",@"Chemical Science",@"Chemical Science",@"DBS",@"545",@"260",@"195",
     @"OK2621",@"Electrical Engineering",@"Electrical Engine",@"UCD",@"010",@"345",@"545",
     @"OK2621",@"Arts",@"Arts",@"DCU",@"125",@"215",@"440",
     @"KC3189",@"Commerce",@"Commerce",@"UL",@"130",@"325",@"255",
     @"BL6674",@"Civil Engineering",@"Civil Engineering",@"UL",@"025",@"585",@"315",
     @"IG5477",@"Commerce",@"Commerce",@"WIT",@"385",@"465",@"505",
     @"ME0389",@"Physics",@"Physics",@"DBS",@"055",@"300",@"575",
     @"JR3954",@"General Arts",@"General Arts",@"NUIM",@"010",@"345",@"545",
     @"FH0170",@"Electrical Engineering",@"Electrical Engine",@"GMIT",@"245",@"290",@"080",
     @"EM9180",@"General Arts",@"General Arts",@"DCU",@"575",@"040",@"250",
     @"FL1472",@"Physics",@"Physics",@"WIT",@"355",@"515",@"065",
     @"PL6859",@"Pharmacy",@"Pharmacy",@"WIT",@"590",@"255",@"485",
     @"FD9766",@"Environmental Science",@"Environmental Sc",@"UL",@"255",@"485",@"270",
     @"SG9962",@"Arts",@"Arts",@"NUIM",@"525",@"485",@"415",
     @"JB6326",@"Finance",@"Finance",@"UCC",@"060",@"150",@"425",
     @"NR9482",@"Commerce",@"Commerce",@"UCD",@"305",@"405",@"210",
     @"OQ8009",@"Civil Engineering",@"Civil Engineering",@"DCU",@"325",@"255",@"410",
     @"AO3398",@"Pharmacy",@"Pharmacy",@"GMIT",@"335",@"390",@"315",
     @"LS0039",@"Business and Accounting",@"Business and Accou",@"TCD",@"360",@"570",@"230",
     @"JR3954",@"Environmental Science",@"Environmental Sc",@"CIT",@"315",@"160",@"175",
     @"ML8240",@"Nutritional Science",@"Nutritional Science",@"GMIT",@"545",@"190",@"530",
     @"EJ5731",@"Accountancy",@"Accountancy",@"DBS",@"030",@"440",@"375",
     @"OP6922",@"Accountancy",@"Accountancy",@"TCD",@"175",@"555",@"570",
     @"BQ2594",@"Physics",@"Physics",@"TCD",@"135",@"090",@"115",
     @"NR9482",@"Civil Engineering",@"Civil Engineering",@"GMIT",@"465",@"385",@"385",
     @"GB6062",@"Arts",@"Arts",@"CIT",@"285",@"395",@"480",
     @"CH4800",@"Commerce",@"Commerce",@"DIT",@"565",@"550",@"240",
     @"SN0374",@"Law",@"Law",@"NUIM",@"360",@"270",@"350",
     @"EK4898",@"Finance",@"Finance",@"UCC",@"485",@"045",@"200",
     @"JI3979",@"Electrical Engineering",@"Electrical Engine",@"GMIT",@"150",@"010",@"345",
     @"CI7224",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"NUIM",@"150",@"140",@"230",
     @"SL8197",@"Finance",@"Finance",@"TCD",@"150",@"425",@"180",
     @"PJ6089",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"GMIT",@"150",@"010",@"345",
     @"PQ0897",@"Commerce",@"Commerce",@"DIT",@"505",@"530",@"245",
     @"HI3258",@"General Arts",@"General Arts",@"GMIT",@"010",@"180",@"040",
     @"ML8240",@"Business and Accounting",@"Business and Accou",@"GMIT",@"590",@"325",@"185",
     @"JR3954",@"Accountancy",@"Accountancy",@"UL",@"580",@"355",@"515",
     @"HS6874",@"Electrical Engineering",@"Electrical Engine",@"DIT",@"355",@"515",@"065",
     @"BG4115",@"Food Science",@"Food Science",@"WIT",@"010",@"175",@"540",
     @"AP3528",@"Business and Accounting",@"Business and Accou",@"WIT",@"410",@"255",@"030",
     @"HQ8420",@"Electrical Engineering",@"Electrical Engine",@"DCU",@"145",@"195",@"145",
     @"KB8629",@"Business Information Systems",@"Business Information Sy",@"DBS",@"460",@"275",@"580",
     @"PO0837",@"Commerce",@"Commerce",@"DIT",@"015",@"170",@"075",
     @"EB7920",@"Finance",@"Finance",@"WIT",@"150",@"010",@"345",
     @"DI4941",@"Law",@"Law",@"GMIT",@"040",@"185",@"570",
     @"SN0374",@"Arts",@"Arts",@"NUIM",@"555",@"570",@"565",
     @"LQ4777",@"Accountancy",@"Accountancy",@"DBS",@"320",@"095",@"360",
     @"MO4167",@"Electrical Engineering",@"Electrical Engine",@"DCU",@"395",@"480",@"015",
     @"JR3954",@"General Arts",@"General Arts",@"NUIM",@"405",@"465",@"385",
     @"ND8824",@"Environmental Science",@"Environmental Sc",@"DCU",@"010",@"080",@"460",
     @"PL6859",@"Pharmacy",@"Pharmacy",@"NUIM",@"030",@"060",@"150",
     @"KE6469",@"Food Science",@"Food Science",@"DIT",@"335",@"390",@"315",
     @"FB4655",@"Chemical Science",@"Chemical Science",@"WIT",@"460",@"290",@"245",
     @"PM9217",@"Pharmacy",@"Pharmacy",@"DCU",@"005",@"325",@"275",
     @"MO4167",@"Business Information Systems",@"Business Information Sy",@"UCC",@"580",@"580",@"345",
     @"BI7747",@"Business and Accounting",@"Business and Accou",@"GMIT",@"570",@"580",@"355",
     @"SH6103",@"Electrical Engineering",@"Electrical Engine",@"UL",@"440",@"375",@"460",
     @"GS3123",@"Chemical Science",@"Chemical Science",@"WIT",@"570",@"565",@"285",
     @"KQ3577",@"Business and Accounting",@"Business and Accou",@"CIT",@"270",@"190",@"360",
     @"FH0170",@"Law",@"Law",@"DCU",@"160",@"175",@"555",
     @"LQ4777",@"Nutritional Science",@"Nutritional Science",@"DIT",@"215",@"440",@"575",
     @"NM0692",@"Accountancy",@"Accountancy",@"DBS",@"140",@"230",@"090",
     @"JQ1491",@"Finance",@"Finance",@"UCD",@"255",@"030",@"020",
     @"PJ6089",@"Finance",@"Finance",@"DBS",@"580",@"345",@"035",
     @"FJ8908",@"Environmental Science",@"Environmental Sc",@"DCU",@"115",@"185",@"370",
     @"IP3154",@"Business and Accounting",@"Business and Accou",@"TCD",@"425",@"275",@"525",
     @"BK4968",@"Arts",@"Arts",@"DBS",@"035",@"505",@"495",
     @"LP2859",@"Arts",@"Arts",@"UL",@"020",@"425",@"275",
     @"GH5484",@"Food Science",@"Food Science",@"WIT",@"505",@"495",@"005",
     @"CH4800",@"Environmental Science",@"Environmental Sc",@"DIT",@"385",@"385",@"125",
     @"LS0039",@"Food Science",@"Food Science",@"NUIM",@"255",@"485",@"270",
     @"GL8912",@"Accountancy",@"Accountancy",@"GMIT",@"425",@"330",@"460",
     @"EC1796",@"Arts",@"Arts",@"WIT",@"370",@"080",@"380",
     @"LE4399",@"Law",@"Law",@"WIT",@"170",@"010",@"180",
     @"NS9158",@"Food Science",@"Food Science",@"GMIT",@"160",@"175",@"555",
     @"MM1601",@"General Arts",@"General Arts",@"NUIM",@"375",@"460",@"290",
     @"DB9983",@"Electrical Engineering",@"Electrical Engine",@"NUIM",@"345",@"035",@"140",
     @"PM9217",@"Finance",@"Finance",@"DIT",@"570",@"230",@"250",
     @"EK4898",@"Physics",@"Physics",@"UCC",@"185",@"000",@"425",
     @"HD1226",@"Business Information Systems",@"Business Information Sy",@"DIT",@"230",@"250",@"450",
     @"AK0663",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"NUIM",@"565",@"285",@"395",
     @"PO0837",@"Law",@"Law",@"WIT",@"200",@"395",@"560",
     @"GS3123",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"WIT",@"460",@"010",@"080",
     @"IB7874",@"Accountancy",@"Accountancy",@"DBS",@"290",@"245",@"000",
     @"LR9659",@"General Arts",@"General Arts",@"UCC",@"190",@"380",@"320",
     @"MB9225",@"Business and Accounting",@"Business and Accou",@"CIT",@"565",@"115",@"585",
     @"NP6713",@"Food Science",@"Food Science",@"UCC",@"405",@"210",@"030",
     @"QI1461",@"Commerce",@"Commerce",@"DIT",@"305",@"405",@"210",
     @"KN5854",@"Business Information Systems",@"Business Information Sy",@"NUIG",@"345",@"035",@"140",
     @"GH5484",@"General Arts",@"General Arts",@"DIT",@"125",@"010",@"175",
     @"LR9659",@"Food Science",@"Food Science",@"CIT",@"330",@"460",@"010",
     @"BO5525",@"Business Information Systems",@"Business Information Sy",@"NUIM",@"325",@"255",@"410",
     @"KO5031",@"Finance",@"Finance",@"UCD",@"525",@"485",@"415",
     @"LR9659",@"Arts",@"Arts",@"DCU",@"055",@"210",@"365",
     @"FS7045",@"Finance",@"Finance",@"NUIG",@"255",@"265",@"510",
     @"QP8190",@"Physics",@"Physics",@"DCU",@"175",@"595",@"405",
     @"SL8197",@"Pharmacy",@"Pharmacy",@"DIT",@"515",@"065",@"505",
     @"OE0372",@"Arts",@"Arts",@"UL",@"125",@"010",@"175",
     @"NL8859",@"General Arts",@"General Arts",@"TCD",@"485",@"415",@"150",
     @"KN5854",@"Law",@"Law",@"CIT",@"190",@"530",@"130",
     @"DM0580",@"General Arts",@"General Arts",@"WIT",@"555",@"485",@"045",
     @"IQ1568",@"Finance",@"Finance",@"DIT",@"470",@"035",@"505",
     @"MB9225",@"Business and Accounting",@"Business and Accou",@"NUIG",@"460",@"290",@"245",
     @"CI7224",@"Electrical Engineering",@"Electrical Engine",@"DCU",@"335",@"390",@"315",
     @"KQ3577",@"Accountancy",@"Accountancy",@"DIT",@"595",@"405",@"255",
     @"OM5656",@"Food Science",@"Food Science",@"WIT",@"355",@"515",@"065",
     @"JE4349",@"Law",@"Law",@"NUIG",@"485",@"270",@"190",
     @"CG5708",@"Business Information Systems",@"Business Information Sy",@"UCC",@"200",@"300",@"305",
     @"GJ2553",@"Nutritional Science",@"Nutritional Science",@"CIT",@"485",@"270",@"190",
     @"MM1601",@"Civil Engineering",@"Civil Engineering",@"GMIT",@"525",@"030",@"440",
     @"IE6685",@"General Arts",@"General Arts",@"UCD",@"160",@"175",@"555",
     @"SJ4825",@"Physics",@"Physics",@"UL",@"185",@"370",@"080",
     @"BH1127",@"Business and Accounting",@"Business and Accou",@"UCC",@"405",@"255",@"145",
     @"FH0170",@"Finance",@"Finance",@"GMIT",@"325",@"255",@"410",
     @"AO3398",@"Accountancy",@"Accountancy",@"NUIG",@"550",@"385",@"465",
     @"EH4643",@"Law",@"Law",@"NUIM",@"440",@"575",@"130",
     @"KD2532",@"Civil Engineering",@"Civil Engineering",@"WIT",@"300",@"575",@"040",
     @"QP8190",@"Arts",@"Arts",@"TCD",@"230",@"250",@"450",
     @"FK8758",@"Accountancy",@"Accountancy",@"WIT",@"130",@"325",@"255",
     @"DO2519",@"Finance",@"Finance",@"DCU",@"445",@"325",@"175",
     @"AP3528",@"Civil Engineering",@"Civil Engineering",@"GMIT",@"585",@"315",@"160",
     @"KG3844",@"General Arts",@"General Arts",@"WIT",@"240",@"155",@"200",
     @"SG9962",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"NUIM",@"210",@"030",@"060",
     @"OM5656",@"Pharmacy",@"Pharmacy",@"TCD",@"470",@"150",@"010",
     @"PL6859",@"Electrical Engineering",@"Electrical Engine",@"GMIT",@"090",@"115",@"185",
     @"IJ0365",@"Law",@"Law",@"NUIG",@"325",@"255",@"410",
     @"KO5031",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"UCC",@"320",@"565",@"115",
     @"JS5191",@"Food Science",@"Food Science",@"DCU",@"390",@"315",@"170",
     @"SL8197",@"Food Science",@"Food Science",@"UL",@"345",@"545",@"260",
     @"OP6922",@"Accountancy",@"Accountancy",@"GMIT",@"175",@"595",@"405",
     @"LE4399",@"Environmental Science",@"Environmental Sc",@"CIT",@"065",@"505",@"460",
     @"MS6865",@"Chemical Science",@"Chemical Science",@"TCD",@"170",@"410",@"055",
     @"NE8100",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"TCD",@"250",@"150",@"175",
     @"HK4718",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"NUIM",@"015",@"170",@"075",
     @"PQ0897",@"Accountancy",@"Accountancy",@"DCU",@"345",@"035",@"140",
     @"PL6859",@"Commerce",@"Commerce",@"WIT",@"140",@"150",@"235",
     @"FS7045",@"Accountancy",@"Accountancy",@"UCC",@"245",@"290",@"080",
     @"NQ9934",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"DCU",@"030",@"060",@"150",
     @"HK4718",@"Law",@"Law",@"DIT",@"425",@"330",@"460",
     @"MN7383",@"Food Science",@"Food Science",@"UL",@"385",@"125",@"215",
     @"FC0434",@"Civil Engineering",@"Civil Engineering",@"UCC",@"385",@"465",@"505",
     @"QR6584",@"Pharmacy",@"Pharmacy",@"NUIG",@"390",@"315",@"170",
     @"IJ0365",@"General Arts",@"General Arts",@"UL",@"580",@"580",@"345",
     @"BQ2594",@"Commerce",@"Commerce",@"TCD",@"275",@"525",@"485",
     @"FI0698",@"Pharmacy",@"Pharmacy",@"WIT",@"315",@"160",@"175",
     @"AM5742",@"Pharmacy",@"Pharmacy",@"CIT",@"035",@"140",@"150",
     @"MP1718",@"Pharmacy",@"Pharmacy",@"DCU",@"325",@"255",@"410",
     @"QP8190",@"Nutritional Science",@"Nutritional Science",@"DIT",@"030",@"440",@"375",
     @"LO5282",@"Civil Engineering",@"Civil Engineering",@"CIT",@"575",@"130",@"325",
     @"EL7466",@"Accountancy",@"Accountancy",@"UL",@"030",@"020",@"425",
     @"AL9607",@"Business Information Systems",@"Business Information Sy",@"TCD",@"595",@"405",@"255",
     @"AG0070",@"Environmental Science",@"Environmental Sc",@"DIT",@"460",@"275",@"580",
     @"SN0374",@"Arts",@"Arts",@"NUIG",@"560",@"170",@"245",
     @"PE5194",@"Food Science",@"Food Science",@"NUIG",@"585",@"470",@"035",
     @"LS0039",@"Law",@"Law",@"TCD",@"170",@"075",@"590",
     @"DK2434",@"Arts",@"Arts",@"UCC",@"325",@"175",@"595",
     @"BH1127",@"Environmental Science",@"Environmental Sc",@"WIT",@"590",@"325",@"185",
     @"QN5114",@"Accountancy",@"Accountancy",@"UCC",@"405",@"465",@"385",
     @"EL7466",@"Business and Accounting",@"Business and Accou",@"WIT",@"135",@"090",@"115",
     @"CK3281",@"Food Science",@"Food Science",@"DIT",@"045",@"200",@"300",
     @"HD1226",@"Business and Accounting",@"Business and Accou",@"NUIG",@"250",@"450",@"445",
     @"OE0372",@"General Arts",@"General Arts",@"DIT",@"245",@"225",@"015",
     @"CL9687",@"Arts",@"Arts",@"DIT",@"150",@"425",@"180",
     @"EJ5731",@"Arts",@"Arts",@"UL",@"320",@"565",@"115",
     @"IG5477",@"General Arts",@"General Arts",@"TCD",@"095",@"360",@"570",
     @"OQ8009",@"Commerce",@"Commerce",@"UCD",@"560",@"170",@"245",
     @"GI0439",@"Environmental Science",@"Environmental Sc",@"UCC",@"145",@"300",@"135",
     @"IQ1568",@"Chemical Science",@"Chemical Science",@"UCD",@"285",@"395",@"480",
     @"PM9217",@"Physics",@"Physics",@"UCC",@"000",@"425",@"330",
     @"EH4643",@"Law",@"Law",@"UCD",@"015",@"405",@"465",
     @"GJ2553",@"Business and Accounting",@"Business and Accou",@"DIT",@"255",@"410",@"255",
     @"HB7373",@"Chemical Science",@"Chemical Science",@"NUIG",@"465",@"505",@"530",
     @"KC3189",@"Accountancy",@"Accountancy",@"DCU",@"320",@"565",@"115",
     @"DC2939",@"Nutritional Science",@"Nutritional Science",@"GMIT",@"255",@"030",@"020",
     @"HJ4736",@"Business Information Systems",@"Business Information Sy",@"WIT",@"395",@"480",@"015",
     @"ME0389",@"Physics",@"Physics",@"CIT",@"335",@"390",@"315",
     @"BG4115",@"Accountancy",@"Accountancy",@"CIT",@"355",@"515",@"065",
     @"GH5484",@"Law",@"Law",@"GMIT",@"425",@"180",@"335",
     @"II7802",@"Arts",@"Arts",@"TCD",@"040",@"040",@"170",
     @"SG9962",@"Arts",@"Arts",@"DBS",@"565",@"285",@"395",
     @"IP3154",@"Electrical Engineering",@"Electrical Engine",@"UCD",@"040",@"185",@"570",
     @"QM4838",@"Commerce",@"Commerce",@"GMIT",@"195",@"145",@"300",
     @"FD9766",@"Physics",@"Physics",@"WIT",@"390",@"315",@"170",
     @"QJ8760",@"General Arts",@"General Arts",@"UL",@"570",@"230",@"250",
     @"GR7031",@"Accountancy",@"Accountancy",@"NUIG",@"300",@"135",@"090",
     @"LE4399",@"Commerce",@"Commerce",@"TCD",@"160",@"175",@"555",
     @"AM5742",@"Food Science",@"Food Science",@"DBS",@"430",@"435",@"315",
     @"LO5282",@"Commerce",@"Commerce",@"DBS",@"015",@"170",@"075",
     @"IP3154",@"Pharmacy",@"Pharmacy",@"UCD",@"570",@"580",@"355",
     @"PE5194",@"Law",@"Law",@"CIT",@"325",@"255",@"410",
     @"CK3281",@"Business Information Systems",@"Business Information Sy",@"NUIM",@"150",@"235",@"325",
     @"LP2859",@"Chemical Science",@"Chemical Science",@"WIT",@"170",@"075",@"590",
     @"HQ8420",@"Accountancy",@"Accountancy",@"UCD",@"080",@"460",@"555",
     @"NR9482",@"Finance",@"Finance",@"DCU",@"470",@"035",@"505",
     @"MR9913",@"Law",@"Law",@"CIT",@"170",@"550",@"385",
     @"AN7125",@"Environmental Science",@"Environmental Sc",@"DIT",@"140",@"150",@"235",
     @"JC8282",@"Business and Accounting",@"Business and Accou",@"TCD",@"580",@"355",@"515",
     @"MN7383",@"Accountancy",@"Accountancy",@"CIT",@"040",@"250",@"150",
     @"OO8187",@"Law",@"Law",@"GMIT",@"505",@"460",@"275",
     @"DN8471",@"Environmental Science",@"Environmental Sc",@"DBS",@"390",@"315",@"170",
     @"QH5740",@"Environmental Science",@"Environmental Sc",@"WIT",@"175",@"545",@"190",
     @"GG2153",@"Civil Engineering",@"Civil Engineering",@"NUIG",@"405",@"465",@"385",
     @"CG5708",@"Arts",@"Arts",@"CIT",@"565",@"115",@"585",
     @"AP3528",@"Law",@"Law",@"GMIT",@"570",@"230",@"250",
     @"AK0663",@"Nutritional Science",@"Nutritional Science",@"DIT",@"080",@"360",@"190",
     @"NC4568",@"Physics",@"Physics",@"GMIT",@"190",@"530",@"130",
     @"BH1127",@"Nutritional Science",@"Nutritional Science",@"CIT",@"020",@"425",@"275",
     @"AK0663",@"Arts",@"Arts",@"WIT",@"295",@"570",@"580",
     @"FC0434",@"Business Information Systems",@"Business Information Sy",@"NUIG",@"025",@"585",@"315",
     @"SN0374",@"Finance",@"Finance",@"UCD",@"570",@"565",@"285",
     @"JD8463",@"General Arts",@"General Arts",@"UL",@"430",@"435",@"315",
     @"FE1753",@"Accountancy",@"Accountancy",@"UL",@"195",@"150",@"550",
     @"EL7466",@"Chemical Science",@"Chemical Science",@"UCC",@"315",@"125",@"010",
     @"ND8824",@"Food Science",@"Food Science",@"NUIG",@"080",@"460",@"555",
     @"PO0837",@"Finance",@"Finance",@"UCD",@"360",@"270",@"350",
     @"AP3528",@"Business Information Systems",@"Business Information Sy",@"DCU",@"020",@"425",@"275",
     @"SM1257",@"Law",@"Law",@"GMIT",@"525",@"485",@"415",
     @"PK7152",@"Business Information Systems",@"Business Information Sy",@"NUIM",@"255",@"410",@"255",
     @"EE3080",@"Accountancy",@"Accountancy",@"DBS",@"425",@"330",@"460",
     @"NM0692",@"Accountancy",@"Accountancy",@"DCU",@"545",@"190",@"530",
     @"EI0932",@"Physics",@"Physics",@"UCC",@"485",@"270",@"190",
     @"EM9180",@"Accountancy",@"Accountancy",@"GMIT",@"150",@"140",@"230",
     @"FG9978",@"Accountancy",@"Accountancy",@"GMIT",@"315",@"160",@"175",
     @"BJ3171",@"Electrical Engineering",@"Electrical Engine",@"DIT",@"560",@"170",@"245",
     @"EB7920",@"Physics",@"Physics",@"UCC",@"170",@"010",@"180",
     @"LC7572",@"Physics",@"Physics",@"DCU",@"345",@"035",@"140",
     @"KD2532",@"Civil Engineering",@"Civil Engineering",@"NUIG",@"330",@"460",@"010",
     @"JS5191",@"Nutritional Science",@"Nutritional Science",@"UCC",@"170",@"410",@"055",
     @"DG9912",@"Physics",@"Physics",@"UCD",@"385",@"465",@"505",
     @"LG0206",@"Law",@"Law",@"DCU",@"015",@"440",@"000",
     @"BH1127",@"Nutritional Science",@"Nutritional Science",@"UCC",@"415",@"150",@"140",
     @"GS3123",@"Accountancy",@"Accountancy",@"NUIM",@"570",@"460",@"365",
     @"OL8130",@"Environmental Science",@"Environmental Sc",@"DIT",@"460",@"275",@"580",
     @"PR4599",@"Food Science",@"Food Science",@"TCD",@"515",@"065",@"505",
     @"LC7572",@"Finance",@"Finance",@"NUIM",@"065",@"505",@"460",
     @"BL6674",@"Accountancy",@"Accountancy",@"UCD",@"235",@"255",@"265",
     @"BG4115",@"Finance",@"Finance",@"CIT",@"360",@"190",@"380",
     @"PS2551",@"Chemical Science",@"Chemical Science",@"UCC",@"170",@"410",@"055",
     @"IP3154",@"Arts and Hispanic Studies",@"Arts and Hispanic St",@"DIT",@"250",@"450",@"445",
     @"EE3080",@"Chemical Science",@"Chemical Science",@"DBS",@"360",@"190",@"380",
     @"EI0932",@"General Arts",@"General Arts",@"GMIT",@"040",@"040",@"170",
     @"CB2826",@"Environmental Science",@"Environmental Sc",@"DIT",@"505",@"530",@"245",
     @"FM5936",@"Electrical Engineering",@"Electrical Engine",@"TCD",@"525",@"030",@"440",
     @"PR4599",@"Science",@"Chemical Science",@"DIT",@"300",@"135",@"090",
     @"QO1425",@"General Science",@"Chemical Science",@"UCC",@"580",@"580",@"345",
     @"QO4405",@"Chemical Science",@"Chemical Science",@"UCC",@"580",@"580",@"345",
     @"QO2485",@"Chemical Science",@"Chemical Science",@"UCC",@"580",@"580",@"345",
     @"QO2485",@"Chemical Science",@"Chemical Science",@"UCC",@"580",@"580",@"345",
     nil];
    
  	// Do any additional setup after loading the view.
}



-(void) InitializeVars
{
    college_1.text=@"";
    points1_2010.text=@"";
    points1_2011.text=@"";
    points1_2012.text=@"";
    
    college_2.text=@"";
    points2_2010.text=@"";
    points2_2011.text=@"";
    points2_2012.text=@"";
    
    college_3.text=@"";
    points3_2010.text=@"";
    points3_2011.text=@"";
    points3_2012.text=@"";
    
    college_4.text=@"";
    points4_2010.text=@"";
    points4_2011.text=@"";
    points4_2012.text=@"";
    
    college_5.text=@"";
    points5_2010.text=@"";
    points5_2011.text=@"";
    points5_2012.text=@"";
    
    college_6.text=@"";
    points6_2010.text=@"";
    points6_2011.text=@"";
    points6_2012.text=@"";
    
    college_7.text=@"";
    points7_2010.text=@"";
    points7_2011.text=@"";
    points7_2012.text=@"";
    
    college_8.text=@"";
    points8_2010.text=@"";
    points8_2011.text=@"";
    points8_2012.text=@"";
    
    college_9.text=@"";
    points9_2010.text=@"";
    points9_2011.text=@"";
    points9_2012.text=@"";
  
    
}





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
    
    
    return[documentsDir stringByAppendingPathComponent:@"Debugging16_PAUL_TABLE.sql"];
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
                 withField3:(NSString *)  field3 withField4:(NSString *) field4 withField5:(NSString *) field5
                 withField6:(NSString *)  field6 withField7:(NSString *) field7
{
    
    char *err;
    NSString *sql_1 = [NSString stringWithFormat:
                       @"CREATE TABLE IF NOT EXISTS '%@' ('%@' TEXT PRIMARY KEY,'%@' REAL,'%@' REAL,'%@' REAL,'%@' REAL,'%@' REAL,'%@' REAL);"
                       ,tableNameOne,field1, field2,field3,field4, field5,field6,field7];
    
    
    if(sqlite3_exec(db,[sql_1 UTF8String],NULL,NULL, &err) != SQLITE_OK)
    {
        sqlite3_close(db);
        NSAssert(0,@"Tabled failed to create.");
    }
    
    
    NSLog(@"Done creating table");
}



-(void)insertRecordIntoTableNamed: (NSString *) tableName
                       withField1: (NSString *) field1 field1Value: (NSString *) field1Value andField2: (NSString *) field2
                      field2Value: (NSString *) field2Value  andField3: (NSString *) field3
                      field3Value: (NSString *) field3Value  andField4: (NSString *) field4
                      field4Value: (NSString *) field4Value  andField5: (NSString *) field5
                      field5Value: (NSString *) field5Value  andField6: (NSString *) field6
                      field6Value: (NSString *) field6Value  andField7: (NSString *) field7
                      field7Value: (NSString *) field7Value

{
    NSString *sql_1 =[NSString stringWithFormat:
                      @"INSERT OR REPLACE INTO '%@' ('%@','%@','%@','%@','%@','%@','%@') VALUES ('%@','%@','%@','%@','%@','%@','%@');",
                      tableName,field1,field2,field3,field4,field5,field6,field7,field1Value,field2Value,field3Value,field4Value,field5Value,field6Value,field7Value];
    
    char *err;
    
    
    //NSLog(@"Actually in 'insertRecordIntoTableNamed' funtion and doing update ......");
    
    if(sqlite3_exec(db,[sql_1 UTF8String],NULL,NULL, &err) != SQLITE_OK)
    {
        sqlite3_close(db);
        NSAssert(0,@"Error updating table.");
    }
    
    /*
    else{
        NSLog(@"^^^^^^^^^^^^    SUCCESSFULLY  £££££££££££££££ \n");
    }
    */
    
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
            
            // NSLog(str);
            
        }
        
        //---delete the compiled statement from memory---
        sqlite3_finalize(statement_1);
        
    }
    
}




@end












