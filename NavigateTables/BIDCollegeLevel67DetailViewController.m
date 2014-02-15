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
    
    
    [self openDB];
    
    
    [self fillCAO_Entries];
    
    [self createTableOneNamed : @"simTestTable" withField1: @"courseID" withField2: @"courseName" withField3: @"abbrev. courseName" withField4: @"college" withField5: @"2010" withField6: @"2011" withField7: @"2012" withField8: @"NotAllonPtsOffered" withField9: @"MusictestInterview" withField10: @"Interview" withField11: @"testInterviewPortfolio" withField12: @"AQA" withField13: @"Matriculate" ];
    
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
    NSString *Matriculate;
    
    
    for(int i=0;i < TABLE_FIELD_NUM*TABLE_ROW_NUM ;i+=TABLE_FIELD_NUM)
    {
        
        if([entryA.course objectAtIndex:i] == nil)
            break;
        
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
        Matriculate            =  [entryA.course objectAtIndex:i+12];
        
        
        [self insertRecordIntoTableNamed: @"simTestTable"
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
                              andField13:@"Matriculate"           field13Value:Matriculate
         
         ];
    }
    

}



- (void) fillCAO_Entries
{
    entryA.course =
    
    [NSArray arrayWithObjects:@"AL601",@"Electronics and Computer Engineering",@"Electronics and C",@"ATHLONE IT",@"205",@"200",@"155",@"",@"",@"",@"",@"",@"",@"AL604",@"Civil Engineering",@"Civil Engineering",@"ATHLONE IT",@"165",@"240",@"190",@"",@"",@"",@"",@"",@"",@"AL630",@"Pharmacy Technician",@"Pharmacy Technici",@"ATHLONE IT",@"305",@"275",@"275",@"",@"",@"",@"",@"",@"",@"AL631",@"Dental Nursing",@"Dental Nursing",@"ATHLONE IT",@"300",@"325",@"280",@"",@"",@"",@"",@"",@"",@"AL632",@"Science (Bioscience/Chemistry)",@"Science (Bioscien",@"ATHLONE IT",@"160",@"130",@"",@"(AQA) All qualified applicants",@"",@"",@"",@"",@"",@"AL650",@"Business",@"Business",@"ATHLONE IT",@"180",@"270",@"270",@"",@"",@"",@"",@"",@"",@"AL651",@"Music and Instrument Technology",@"Music and Instrum",@"ATHLONE IT",@"230",@"240",@"235",@"",@"",@"",@"",@"",@"",@"AL652",@"Business in Equine Studies",@"Business in Equin",@"ATHLONE IT",@"",@"",@"",@"(AQA) All qualified applicants",@"",@"",@"",@"",@"",@"AL653",@"Office Management",@"Office Management",@"ATHLONE IT",@"195",@"195",@"",@"(AQA) All qualified applicants",@"",@"",@"",@"",@"",@"AL654",@"Accounting Technician",@"Accounting Techni",@"ATHLONE IT",@"",@"",@"",@"(AQA) All qualified applicants",@"",@"",@"",@"",@"",@"AL655",@"Social Media Marketing",@"Social Media Mark",@"ATHLONE IT",@"180",@"160",@"",@"",@"",@"",@"",@"",@"",@"AL657",@"Computing for Business",@"Computing for Bus",@"ATHLONE IT",@"220",@"170",@"190",@"",@"",@"",@"",@"",@"",@"AL660",@"Culinary Arts",@"Culinary Arts",@"ATHLONE IT",@"240",@"200",@"155",@"",@"",@"",@"",@"",@"",@"AL661",@"Bar Supervision",@"Bar Supervision",@"ATHLONE IT",@"150",@"170",@"135",@"",@"",@"",@"",@"",@"",@"AL663",@"Business (Sport and Recreation)",@"Business (Sport a",@"ATHLONE IT",@"230",@"250",@"270",@"",@"",@"",@"",@"",@"",@"AL664",@"Applied Social Studies",@"Applied Social St",@"ATHLONE IT",@"300",@"310",@"",@"",@"",@"",@"",@"",@"",@"AL665",@"Childcare Supervisory Management",@"Childcare Supervi",@"ATHLONE IT",@"290",@"305",@"300",@"",@"",@"",@"",@"",@"",@"AL702",@"Electronics and Wireless Communications",@"Electronics and W",@"ATHLONE IT",@"265",@"170",@"165",@"",@"",@"",@"",@"",@"",@"AL703",@"Computer Network Management",@"Computer Network",@"ATHLONE IT",@"190",@"180",@"155",@"",@"",@"",@"",@"",@"",@"AL704",@"Computer Engineering",@"Computer Engineer",@"ATHLONE IT",@"190",@"190",@"180",@"",@"",@"",@"",@"",@"",@"AL710",@"Mechanical Engineering",@"Mechanical Engine",@"ATHLONE IT",@"195",@"200",@"190",@"",@"",@"",@"",@"",@"",@"AL711",@"Mechanical Engineering and Renewable Energy",@"Mechanical Engine",@"ATHLONE IT",@"205",@"240",@"250",@"",@"",@"",@"",@"",@"",@"AL712",@"Mechatronics",@"Mechatronics",@"ATHLONE IT",@"200",@"255",@"",@"",@"",@"",@"",@"",@"",@"AL721",@"Civil Engineering",@"Civil Engineering",@"ATHLONE IT",@"",@"240",@"190",@"(AQA) All qualified applicants",@"",@"",@"",@"",@"",@"AL730",@"Biotechnology",@"Biotechnology",@"ATHLONE IT",@"205",@"270",@"170",@"",@"",@"",@"",@"",@"",@"AL731",@"Veterinary Nursing",@"Veterinary Nursin",@"ATHLONE IT",@"435",@"400",@"405",@"",@"",@"",@"",@"",@"",@"AL733",@"Forensic Toxicology",@"Forensic Toxicolo",@"ATHLONE IT",@"210",@"200",@"",@"",@"",@"",@"",@"",@"",@"AL734",@"Pharmaceutical Science (Drug Development and Analysis)",@"Pharmaceutical Sc",@"ATHLONE IT",@"195",@"225",@"",@"",@"",@"",@"",@"",@"",@"AL750",@"Smart Technology for Business",@"Smart Technology",@"ATHLONE IT",@"205",@"170",@"190",@"",@"",@"",@"",@"",@"",@"AL760",@"Spa and Wellness Management",@"Spa and Wellness",@"ATHLONE IT",@"205",@"180",@"200",@"",@"",@"",@"",@"",@"",@"AL761",@"Hotel and Leisure Management",@"Hotel and Leisure",@"ATHLONE IT",@"200",@"205",@"205",@"",@"",@"",@"",@"",@"",@"AL763",@"Design (Communications)",@"Design (Communica",@"ATHLONE IT",@"600",@"530",@"465",@"(+) Includes Project / Portfolio Score",@"",@"",@"",@"",@"",@"PC402",@"Humanities",@"Humanities",@"CARLOW COLLEGE",@"200",@"255",@"280",@"",@"",@"",@"",@"",@"",@"PC404",@"Applied Social Studies in Social Care",@"Applied Social St",@"CARLOW COLLEGE",@"220",@"220",@"270",@"",@"",@"",@"",@"",@"",@"TA006",@"Culinary Arts",@"Culinary Arts",@"IT TALLAGHT ",@"270",@"265",@"235",@"",@"",@"",@"",@"",@"",@"TA015",@"International Hospitality and Tourism Management",@"International Hos",@"IT TALLAGHT ",@"230",@"245",@"255",@"",@"",@"",@"",@"",@"",@"TA101",@"Accounting",@"Accounting",@"IT TALLAGHT ",@"180",@"230",@"265",@"",@"",@"",@"",@"",@"",@"TA102",@"Business Administration",@"Business Administ",@"IT TALLAGHT ",@"185",@"205",@"215",@"",@"",@"",@"",@"",@"",@"TA103",@"Marketing",@"Marketing",@"IT TALLAGHT ",@"180",@"190",@"210",@"",@"",@"",@"",@"",@"",@"TA111",@"Accounting and Finance",@"Accounting and Fi",@"IT TALLAGHT ",@"180",@"200",@"265",@"",@"",@"",@"",@"",@"",@"TA113",@"Management",@"Management",@"IT TALLAGHT ",@"180",@"245",@"230",@"",@"",@"",@"",@"",@"",@"TA114",@"Marketing",@"Marketing",@"IT TALLAGHT ",@"180",@"190",@"210",@"",@"",@"",@"",@"",@"",@"TA201",@"Electronic Engineering",@"Electronic Engine",@"IT TALLAGHT ",@"150",@"255",@"230",@"",@"",@"",@"",@"",@"",@"TA203",@"Mechanical Engineering",@"Mechanical Engine",@"IT TALLAGHT ",@"160",@"245",@"255",@"",@"",@"",@"",@"",@"",@"TA213",@"Mechanical Engineering",@"Mechanical Engine",@"IT TALLAGHT ",@"210",@"245",@"255",@"",@"",@"",@"",@"",@"",@"TA215",@"Energy and Environmental Engineering",@"Energy and Enviro",@"IT TALLAGHT ",@"185",@"205",@"245",@"",@"",@"",@"",@"",@"",@"TA216",@"Electronic Engineering",@"Electronic Engine",@"IT TALLAGHT ",@"165",@"255",@"230",@"",@"",@"",@"",@"",@"",@"TA302",@"Computing",@"Computing",@"IT TALLAGHT ",@"295",@"320",@"290",@"",@"",@"",@"",@"",@"",@"TA311",@"Bioanalysis",@"Bioanalysis",@"IT TALLAGHT ",@"320",@"265",@"245",@"",@"",@"",@"",@"",@"",@"TA312",@"Computing",@"Computing",@"IT TALLAGHT ",@"275",@"320",@"290",@"",@"",@"",@"",@"",@"",@"TA313",@"Information Technology Management",@"Information Techn",@"IT TALLAGHT ",@"245",@"270",@"225",@"",@"",@"",@"",@"",@"",@"TA314",@"Pharmaceutical Science",@"Pharmaceutical Sc",@"IT TALLAGHT ",@"325",@"345",@"325",@"",@"",@"",@"",@"",@"",@"TA315",@"DNA and Forensic Science",@"DNA and Forensic",@"IT TALLAGHT ",@"380",@"370",@"360",@"",@"",@"",@"",@"",@"",@"TA316",@"Sports Science and Health",@"Sports Science an",@"IT TALLAGHT ",@"395",@"390",@"375",@"",@"",@"",@"",@"",@"",@"NC008",@"Management of Technology in Business",@"Management of Tec",@"NATIONAL COLLEGE OF IRELAND",@"230",@"230",@"250",@"",@"",@"",@"",@"",@"",@"NC102",@"Computing in Applications and Support",@"Computing in Appl",@"NATIONAL COLLEGE OF IRELAND",@"200",@"230",@"200",@"",@"",@"",@"",@"",@"",@"NC103",@"Business",@"Business",@"NATIONAL COLLEGE OF IRELAND",@"200",@"280",@"290",@"",@"",@"",@"",@"",@"",@"PI201#",@"Montessori Education",@"Montessori Educat",@"PORTOBELLO COLLEGE",@"250",@"",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"TR801",@"Dental Nursing",@"Dental Nursing",@"TRINITY COLLEGE DUBLIN",@"360",@"380",@"330",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"TR802",@"Dental Hygiene",@"Dental Hygiene",@"TRINITY COLLEGE DUBLIN",@"435",@"435",@"420",@"(*) Not all on this points score were offered places; (#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"TR803",@"Dental Technology",@"Dental Technology",@"TRINITY COLLEGE DUBLIN",@"410",@"390",@"400",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DK650",@"Culinary Arts",@"Culinary Arts",@"DUNDALK IT",@"230",@"215",@"185",@"",@"",@"",@"",@"",@"",@"DK651",@"Hospitality Studies",@"Hospitality Studi",@"DUNDALK IT",@"200",@"210",@"160",@"",@"",@"",@"",@"",@"",@"DK685",@"Agriculture",@"Agriculture",@"DUNDALK IT",@"345",@"300",@"280",@"",@"",@"",@"",@"",@"",@"DK710",@"Business & Management",@"Business & Manage",@"DUNDALK IT",@"100",@"145",@"",@"",@"",@"",@"",@"",@"",@"DK711",@"Business & Technology",@"Business & Techno",@"DUNDALK IT",@"",@"133",@"190",@"(AQA) All qualified applicants",@"",@"",@"",@"",@"",@"DK721",@"Computing (incorporating 3 award options)",@"Computing (incorp",@"DUNDALK IT",@"125",@"160",@"165",@"",@"",@"",@"",@"",@"",@"DK740",@"Engineering - Electrical and Electronic Systems",@"Engineering - Ele",@"DUNDALK IT",@"",@"",@"180",@"(AQA) All qualified applicants",@"",@"",@"",@"",@"",@"DK742",@"Engineering - Mechanical Engineering",@"Engineering - Mec",@"DUNDALK IT",@"140",@"150",@"150",@"",@"",@"",@"",@"",@"",@"DK744",@"Engineering - Civil Engineering",@"Engineering - Civ",@"DUNDALK IT",@"125",@"150",@"175",@"",@"",@"",@"",@"",@"",@"DK745",@"Construction Technology",@"Construction Tech",@"DUNDALK IT",@"",@"150",@"120",@"(AQA) All qualified applicants",@"",@"",@"",@"",@"",@"DK750",@"Hospitality Management",@"Hospitality Manag",@"DUNDALK IT",@"190",@"200",@"195",@"",@"",@"",@"",@"",@"",@"DK752",@"Event Management",@"Event Management",@"DUNDALK IT",@"170",@"200",@"210",@"",@"",@"",@"",@"",@"",@"DK762",@"Communications in Creative Multimedia",@"Communications in",@"DUNDALK IT",@"205",@"265",@"",@"",@"",@"",@"",@"",@"",@"DK763",@"Sport, Exercise and Enterprise",@"Sport, Exercise a",@"DUNDALK IT",@"245",@"260",@"285",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"DK765",@"Video and Film Production",@"Video and Film Pr",@"DUNDALK IT",@"235",@"300",@"315",@"",@"",@"",@"",@"",@"",@"DK767",@"Community Youth Work",@"Community Youth W",@"DUNDALK IT",@"",@"300",@"300",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"DK768",@"Music and Audio Production",@"Music and Audio P",@"DUNDALK IT",@"275",@"330",@"",@"",@"",@"",@"",@"",@"",@"DK781",@"Science - Applied Bioscience",@"Science - Applied",@"DUNDALK IT",@"165",@"250",@"200",@"",@"",@"",@"",@"",@"",@"DK783",@"Science - Pharmaceutical Science",@"Science - Pharmac",@"DUNDALK IT",@"270",@"200",@"200",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"DK784",@"Veterinary Nursing",@"Veterinary Nursin",@"DUNDALK IT",@"390",@"375",@"375",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"LM180",@"Equine Science",@"Equine Science",@"UNIVERSITY OF LIMERICK",@"315",@"340",@"335",@"",@"",@"",@"",@"",@"",@"CW006",@"Business Studies (Wexford)",@"Business Studies",@"IT CARLOW",@"230",@"205",@"",@"",@"",@"",@"",@"",@"",@"CW016",@"Business - Office Management (Wexford)",@"Business - Office",@"IT CARLOW",@"230",@"205",@"",@"",@"",@"",@"",@"",@"",@"CW017",@"Applied Social Studies (Professional Social Care - Wexford)",@"Applied Social St",@"IT CARLOW",@"290",@"325",@"",@"",@"",@"",@"",@"",@"",@"CW037",@"Business (Wexford)",@"Business (Wexford",@"IT CARLOW",@"210",@"200",@"",@"",@"",@"",@"",@"",@"",@"CW057",@"Art (Wexford) - Portfolio",@"Art (Wexford) - P",@"IT CARLOW",@"700",@"700",@"",@"(+) Includes Project / Portfolio Score",@"",@"",@"",@"",@"",@"CW106",@"Physiology and Health Science",@"Physiology and He",@"IT CARLOW",@"430",@"410",@"410",@"",@"",@"",@"",@"",@"",@"CW107",@"Analytical and Forensic Science",@"Analytical and Fo",@"IT CARLOW",@"250",@"275",@"300",@"",@"",@"",@"",@"",@"",@"CW116",@"Pharmacy Technician Studies",@"Pharmacy Technici",@"IT CARLOW",@"330",@"270",@"290",@"",@"",@"",@"",@"",@"",@"CW117",@"Biosciences",@"Biosciences",@"IT CARLOW",@"240",@"280",@"270",@"",@"",@"",@"",@"",@"",@"CW126",@"Science - Applied Biology or Applied Chemistry",@"Science - Applied",@"IT CARLOW",@"250",@"235",@"245",@"",@"",@"",@"",@"",@"",@"CW206",@"Computing",@"Computing",@"IT CARLOW",@"250",@"255",@"",@"",@"",@"",@"",@"",@"",@"CW207",@"Software Development",@"Software Developm",@"IT CARLOW",@"290",@"325",@"295",@"",@"",@"",@"",@"",@"",@"CW217",@"Computer Systems Management",@"Computer Systems",@"IT CARLOW",@"230",@"290",@"290",@"",@"",@"",@"",@"",@"",@"CW406",@"Civil Engineering",@"Civil Engineering",@"IT CARLOW",@"160",@"210",@"185",@"",@"",@"",@"",@"",@"",@"CW407",@"Architectural Technology",@"Architectural Tec",@"IT CARLOW",@"180",@"275",@"275",@"",@"",@"",@"",@"",@"",@"CW416",@"Construction",@"Construction",@"IT CARLOW",@"160",@"205",@"",@"",@"",@"",@"",@"",@"",@"CW417",@"Construction - Buildings and Services Management",@"Construction - Bu",@"IT CARLOW",@"200",@"220",@"245",@"",@"",@"",@"",@"",@"",@"CW427",@"Civil Engineering",@"Civil Engineering",@"IT CARLOW",@"225",@"210",@"185",@"",@"",@"",@"",@"",@"",@"CW507",@"Aircraft Systems",@"Aircraft Systems",@"IT CARLOW",@"315",@"305",@"300",@"",@"",@"",@"",@"",@"",@"CW517",@"Mechanical Engineering",@"Mechanical Engine",@"IT CARLOW",@"240",@"300",@"315",@"",@"",@"",@"",@"",@"",@"CW527",@"Electronic Engineering",@"Electronic Engine",@"IT CARLOW",@"215",@"210",@"205",@"",@"",@"",@"",@"",@"",@"CW547",@"TV and Media Production",@"TV and Media Prod",@"IT CARLOW",@"290",@"305",@"315",@"",@"",@"",@"",@"",@"",@"CW706",@"Legal Studies",@"Legal Studies",@"IT CARLOW",@"265",@"270",@"280",@"",@"",@"",@"",@"",@"",@"CW707",@"Design in Industrial Design",@"Design in Industr",@"IT CARLOW",@"250",@"245",@"250",@"",@"",@"",@"",@"",@"",@"CW717",@"Applied Social Studies (Professional Social Care)",@"Applied Social St",@"IT CARLOW",@"295",@"300",@"",@"",@"",@"",@"",@"",@"",@"CW807",@"Sport and Exercise (GAA) - Portfolio",@"Sport and Exercis",@"IT CARLOW",@"700",@"700",@"",@"(+) Includes Project / Portfolio Score",@"",@"",@"",@"",@"",@"CW817",@"Sport and Exercise (Rugby) - Portfolio",@"Sport and Exercis",@"IT CARLOW",@"700",@"700",@"",@"(+) Includes Project / Portfolio Score",@"",@"",@"",@"",@"",@"CW827",@"Sport and Exercise (Soccer) - Portfolio",@"Sport and Exercis",@"IT CARLOW",@"700",@"700",@"",@"(+) Includes Project / Portfolio Score",@"",@"",@"",@"",@"",@"CW906",@"Business Studies",@"Business Studies",@"IT CARLOW",@"215",@"210",@"200",@"",@"",@"",@"",@"",@"",@"CW916",@"Business - Office Management",@"Business - Office",@"IT CARLOW",@"200",@"205",@"205",@"",@"",@"",@"",@"",@"",@"CW917",@"Business",@"Business",@"IT CARLOW",@"200",@"220",@"285",@"",@"",@"",@"",@"",@"",@"CW926",@"Business with Law",@"Business with Law",@"IT CARLOW",@"210",@"315",@"320",@"",@"",@"",@"",@"",@"",@"CW936",@"Accounting",@"Accounting",@"IT CARLOW",@"200",@"300",@"315",@"",@"",@"",@"",@"",@"",@"CR001",@"Applied Physics & Instrumentation",@"Applied Physics &",@"CORK IT",@"255",@"295",@"",@"",@"",@"",@"",@"",@"",@"CR006",@"Applied Biosciences",@"Applied Bioscienc",@"CORK IT",@"300",@"290",@"290",@"",@"",@"",@"",@"",@"",@"CR007",@"Analytical and Pharmaceutical Chemistry",@"Analytical and Ph",@"CORK IT",@"260",@"135",@"265",@"",@"",@"",@"",@"",@"",@"CR010",@"Agriculture",@"Agriculture",@"CORK IT",@"335",@"330",@"320",@"",@"",@"",@"",@"",@"",@"CR011",@"Horticulture",@"Horticulture",@"CORK IT",@"105",@"",@"210",@"",@"",@"",@"",@"",@"",@"CR016",@"Computing",@"Computing",@"CORK IT",@"290",@"290",@"280",@"",@"",@"",@"",@"",@"",@"CR021",@"Business Studies",@"Business Studies",@"CORK IT",@"240",@"250",@"270",@"",@"",@"",@"",@"",@"",@"CR022",@"Business Administration",@"Business Administ",@"CORK IT",@"200",@"210",@"250",@"",@"",@"",@"",@"",@"",@"CR023",@"Accounting",@"Accounting",@"CORK IT",@"280",@"325",@"355",@"",@"",@"",@"",@"",@"",@"CR031",@"Social Care",@"Social Care",@"CORK IT",@"350",@"370",@"350",@"",@"",@"",@"",@"",@"",@"CR032",@"Recreation and Leisure",@"Recreation and Le",@"CORK IT",@"320",@"330",@"340",@"",@"",@"",@"",@"",@"",@"CR041",@"Tourism",@"Tourism",@"CORK IT",@"230",@"260",@"260",@"",@"",@"",@"",@"",@"",@"CR042",@"Hospitality Management",@"Hospitality Manag",@"CORK IT",@"230",@"240",@"240",@"",@"",@"",@"",@"",@"",@"CR046",@"Transport Management and Technology (Automobile Technology)",@"Transport Managem",@"CORK IT",@"210",@"210",@"",@"",@"",@"",@"",@"",@"",@"CR051",@"Civil Engineering",@"Civil Engineering",@"CORK IT",@"220",@"225",@"225",@"",@"",@"",@"",@"",@"",@"CR052",@"Construction",@"Construction",@"CORK IT",@"200",@"200",@"200",@"",@"",@"",@"",@"",@"",@"CR053",@"Interior Architecture",@"Interior Architec",@"CORK IT",@"205",@"280",@"300",@"",@"",@"",@"",@"",@"",@"CR061",@"Electronic Engineering",@"Electronic Engine",@"CORK IT",@"220",@"230",@"220",@"",@"",@"",@"",@"",@"",@"CR062",@"Electrical Engineering",@"Electrical Engine",@"CORK IT",@"220",@"240",@"250",@"",@"",@"",@"",@"",@"",@"CR071",@"Mechanical Engineering",@"Mechanical Engine",@"CORK IT",@"240",@"340",@"345",@"",@"",@"",@"",@"",@"",@"CR072",@"Building Services Engineering",@"Building Services",@"CORK IT",@"235",@"225",@"250",@"",@"",@"",@"",@"",@"",@"CR075",@"Biomedical Engineering",@"Biomedical Engine",@"CORK IT",@"260",@"390",@"330",@"",@"",@"",@"",@"",@"",@"CR077",@"Craft Technology (Wood) with Business",@"Craft Technology",@"CORK IT",@"225",@"",@"",@"",@"",@"",@"",@"",@"",@"CR090",@"Architectural Technology",@"Architectural Tec",@"CORK IT",@"220",@"285",@"320",@"",@"",@"",@"",@"",@"",@"CR094",@"Nautical Science at National Maritime College of Ireland",@"Nautical Science",@"CORK IT",@"280",@"320",@"",@"",@"",@"",@"",@"",@"",@"CR095",@"Marine & Plant Engineering at National Maritime College of Ireland",@"Marine & Plant En",@"CORK IT",@"240",@"300",@"",@"",@"",@"",@"",@"",@"",@"CR300",@"Physical Sciences (Level 7 - Common Entry)",@"Physical Sciences",@"CORK IT",@"260",@"290",@"",@"",@"",@"",@"",@"",@"",@"CR620",@"Early Years Education",@"Early Years Educa",@"CORK IT",@"360",@"350",@"",@"",@"",@"",@"",@"",@"",@"CR640",@"Culinary Arts",@"Culinary Arts",@"CORK IT",@"300",@"300",@"275",@"",@"",@"",@"",@"",@"",@"CR650",@"Bar Management",@"Bar Management",@"CORK IT",@"230",@"240",@"250",@"",@"",@"",@"",@"",@"",@"CR655",@"Culinary Studies",@"Culinary Studies",@"CORK IT",@"210",@"200",@"200",@"",@"",@"",@"",@"",@"",@"CR657",@"Hospitality Studies",@"Hospitality Studi",@"CORK IT",@"",@"",@"",@"(AQA) All qualified applicants",@"",@"",@"",@"",@"",@"CR805",@"Marine Electrotechnology at National Maritime College of Ire",@"Marine Electrotec",@"CORK IT",@"200",@"225",@"",@"",@"",@"",@"",@"",@"",@"CR888",@"Information Technology Support",@"Information Techn",@"CORK IT",@"250",@"250",@"245",@"",@"",@"",@"",@"",@"", @"CT110",@"Computing in Information Technology",@"Computing in Info",@"COLLEGE OF COMPUTER TRAINING",@"",@"",@"",@"(AQA) All qualified applicants",@"",@"",@"",@"",@"",@"CT116",@"Information Technology",@"Information Techn",@"COLLEGE OF COMPUTER TRAINING",@"",@"",@"",@"(AQA) All qualified applicants",@"",@"",@"",@"",@"",@"GA170",@"Business",@"Business",@"GALWAY-MAYO IT",@"205",@"240",@"260",@"",@"",@"",@"",@"",@"",@"GA171",@"Administration and Information Systems",@"Administration an",@"GALWAY-MAYO IT",@"200",@"205",@"200",@"",@"",@"",@"",@"",@"",@"GA172",@"Rural Enterprise and Agri-Business (Year 1 at Mountbellew)",@"Rural Enterprise",@"GALWAY-MAYO IT",@"285",@"285",@"300",@"",@"",@"",@"",@"",@"",@"GA270",@"Art and Design",@"Art and Design",@"GALWAY-MAYO IT",@"428",@"463",@"432",@"(+) Includes Project / Portfolio Score",@"",@"",@"",@"",@"",@"GA272",@"Heritage Studies",@"Heritage Studies",@"GALWAY-MAYO IT",@"145",@"225",@"235",@"",@"",@"",@"",@"",@"",@"GA360",@"Tourism",@"Tourism",@"GALWAY-MAYO IT",@"145",@"140",@"200",@"",@"",@"",@"",@"",@"",@"GA361",@"Culinary Arts",@"Culinary Arts",@"GALWAY-MAYO IT",@"160",@"185",@"240",@"",@"",@"",@"",@"",@"",@"GA362",@"Hospitality Studies",@"Hospitality Studi",@"GALWAY-MAYO IT",@"140",@"140",@"140",@"",@"",@"",@"",@"",@"",@"GA363",@"Bar Supervision",@"Bar Supervision",@"GALWAY-MAYO IT",@"140",@"145",@"140",@"",@"",@"",@"",@"",@"",@"GA370",@"Hotel and Catering Management",@"Hotel and Caterin",@"GALWAY-MAYO IT",@"160",@"230",@"235",@"",@"",@"",@"",@"",@"",@"GA372",@"Culinary Arts",@"Culinary Arts",@"GALWAY-MAYO IT",@"160",@"185",@"240",@"",@"",@"",@"",@"",@"",@"GA373",@"Bar Management",@"Bar Management",@"GALWAY-MAYO IT",@"140",@"140",@"155",@"",@"",@"",@"",@"",@"",@"GA374",@"Tourism Management",@"Tourism Managemen",@"GALWAY-MAYO IT",@"185",@"165",@"165",@"",@"",@"",@"",@"",@"",@"GA375",@"Retail and Customer Service Management",@"Retail and Custom",@"GALWAY-MAYO IT",@"140",@"155",@"160",@"",@"",@"",@"",@"",@"",@"GA376",@"Event Management with Public Relations",@"Event Management",@"GALWAY-MAYO IT",@"220",@"265",@"",@"",@"",@"",@"",@"",@"",@"GA460",@"Construction Management",@"Construction Mana",@"GALWAY-MAYO IT",@"160",@"240",@"210",@"",@"",@"",@"",@"",@"",@"GA461",@"Construction Economics and Quantity Surveying",@"Construction Econ",@"GALWAY-MAYO IT",@"140",@"140",@"140",@"",@"",@"",@"",@"",@"",@"GA462",@"Architectural Technology",@"Architectural Tec",@"GALWAY-MAYO IT",@"180",@"155",@"180",@"",@"",@"",@"",@"",@"",@"GA463",@"Civil Engineering",@"Civil Engineering",@"GALWAY-MAYO IT",@"150",@"165",@"180",@"",@"",@"",@"",@"",@"",@"GA470",@"Construction Management",@"Construction Mana",@"GALWAY-MAYO IT",@"155",@"240",@"210",@"",@"",@"",@"",@"",@"",@"GA471",@"Construction Economics and Quantity Surveying",@"Construction Econ",@"GALWAY-MAYO IT",@"145",@"140",@"140",@"",@"",@"",@"",@"",@"",@"GA472",@"Architectural Technology",@"Architectural Tec",@"GALWAY-MAYO IT",@"140",@"155",@"180",@"",@"",@"",@"",@"",@"",@"GA473",@"Civil Engineering",@"Civil Engineering",@"GALWAY-MAYO IT",@"150",@"165",@"180",@"",@"",@"",@"",@"",@"",@"GA570",@"Computer and Electronic Engineering",@"Computer and Elec",@"GALWAY-MAYO IT",@"210",@"255",@"255",@"",@"",@"",@"",@"",@"",@"GA572",@"Computer and Energy Systems",@"Computer and Ener",@"GALWAY-MAYO IT",@"215",@"255",@"255",@"",@"",@"",@"",@"",@"",@"GA573",@"Electrical Services and Automation Engineering",@"Electrical Servic",@"GALWAY-MAYO IT",@"175",@"",@"",@"",@"",@"",@"",@"",@"",@"GA670",@"Mechanical Engineering",@"Mechanical Engine",@"GALWAY-MAYO IT",@"290",@"305",@"325",@"",@"",@"",@"",@"",@"",@"GA673",@"Energy Engineering",@"Energy Engineerin",@"GALWAY-MAYO IT",@"205",@"250",@"320",@"",@"",@"",@"",@"",@"",@"GA770",@"Applied Freshwater and Marine Biology",@"Applied Freshwate",@"GALWAY-MAYO IT",@"350",@"375",@"340",@"",@"",@"",@"",@"",@"",@"GA771",@"Applied Biology and Biopharmaceutical Science",@"Applied Biology a",@"GALWAY-MAYO IT",@"330",@"375",@"330",@"",@"",@"",@"",@"",@"",@"GA772",@"Chemical and Pharmaceutical Science",@"Chemical and Phar",@"GALWAY-MAYO IT",@"300",@"310",@"310",@"",@"",@"",@"",@"",@"",@"GA773",@"Physics and Instrumentation",@"Physics and Instr",@"GALWAY-MAYO IT",@"350",@"290",@"265",@"",@"",@"",@"",@"",@"",@"GA774",@"Science (Undenominated)",@"Science (Undenomi",@"GALWAY-MAYO IT",@"320",@"360",@"330",@"",@"",@"",@"",@"",@"",@"GA775",@"Computing in Software Development",@"Computing in Soft",@"GALWAY-MAYO IT",@"300",@"290",@"250",@"",@"",@"",@"",@"",@"",@"GA776",@"Business Computing and Digital Media",@"Business Computin",@"GALWAY-MAYO IT",@"210",@"210",@"240",@"",@"",@"",@"",@"",@"",@"GA777",@"Agriculture & Environmental Management (Mountbellew)",@"Agriculture & Env",@"GALWAY-MAYO IT",@"300",@"350",@"",@"",@"",@"",@"",@"",@"",@"GA869",@"Business in Computer Applications (Castlebar)",@"Business in Compu",@"GALWAY-MAYO IT",@"145",@"160",@"",@"",@"",@"",@"",@"",@"",@"GA870",@"Outdoor Education and Leisure (Castlebar)",@"Outdoor Education",@"GALWAY-MAYO IT",@"180",@"220",@"",@"",@"",@"",@"",@"",@"",@"GA872",@"Heritage Studies (Castlebar)",@"Heritage Studies",@"GALWAY-MAYO IT",@"265",@"185",@"",@"",@"",@"",@"",@"",@"",@"GA874",@"Outdoor Education and Leisure with Geography (Castlebar)",@"Outdoor Education",@"GALWAY-MAYO IT",@"170",@"230",@"",@"",@"",@"",@"",@"",@"",@"GA875",@"Construction Management in Refurbishment and Maintenance (Ca",@"Construction Mana",@"GALWAY-MAYO IT",@"",@"170",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"GA877",@"Business (Castlebar)",@"Business (Castleb",@"GALWAY-MAYO IT",@"160",@"140",@"",@"",@"",@"",@"",@"",@"",@"GA878",@"Accounting and Financial Management (Castlebar)",@"Accounting and Fi",@"GALWAY-MAYO IT",@"150",@"150",@"",@"",@"",@"",@"",@"",@"",@"GA879",@"Applied Social Studies (Castlebar)",@"Applied Social St",@"GALWAY-MAYO IT",@"270",@"275",@"",@"",@"",@"",@"",@"",@"",@"GA970",@"Furniture Design and Manufacture (Letterfrack)",@"Furniture Design",@"GALWAY-MAYO IT",@"365",@"320",@"",@"",@"",@"",@"",@"",@"",@"GA971",@"Furniture and Wood Technology (Letterfrack)",@"Furniture and Woo",@"GALWAY-MAYO IT",@"290",@"350",@"",@"",@"",@"",@"",@"",@"",@"LY106",@"Business - Accounting and Administration",@"Business - Accoun",@"LETTERKENNY IT",@"100",@"",@"",@"",@"",@"",@"",@"",@"",@"LY107",@"Business - Management",@"Business - Manage",@"LETTERKENNY IT",@"150",@"150",@"145",@"",@"",@"",@"",@"",@"",@"LY117",@"Administration and Information Technology",@"Administration an",@"LETTERKENNY IT",@"140",@"190",@"",@"",@"",@"",@"",@"",@"",@"LY127",@"Business - Marketing",@"Business - Market",@"LETTERKENNY IT",@"145",@"185",@"155",@"",@"",@"",@"",@"",@"",@"LY206",@"Sports Studies",@"Sports Studies",@"LETTERKENNY IT",@"100",@"100",@"",@"",@"",@"",@"",@"",@"",@"LY207",@"Law with Criminal Justice with Irish/French/German/Spanish",@"Law with Criminal",@"LETTERKENNY IT",@"140",@"140",@"",@"",@"",@"",@"",@"",@"",@"LY306",@"Hotel Administration at Killybegs",@"Hotel Administrat",@"LETTERKENNY IT",@"",@"125",@"",@"(AQA) All qualified applicants",@"",@"",@"",@"",@"",@"LY317",@"Culinary Arts at Killybegs",@"Culinary Arts at",@"LETTERKENNY IT",@"140",@"150",@"",@"(AQA) All qualified applicants",@"",@"",@"",@"",@"",@"LY327",@"Hotel Restaurant and Resort Management at Killybegs",@"Hotel Restaurant",@"LETTERKENNY IT",@"150",@"175",@"",@"",@"",@"",@"",@"",@"",@"LY336",@"Bar and Restaurant Supervision at Killybegs",@"Bar and Restauran",@"LETTERKENNY IT",@"",@"",@"",@"(AQA) All qualified applicants",@"",@"",@"",@"",@"",@"LY346",@"Culinary Arts at Killybegs",@"Culinary Arts at",@"LETTERKENNY IT",@"",@"",@"",@"(AQA) All qualified applicants",@"",@"",@"",@"",@"",@"LY417",@"Product Design",@"Product Design",@"LETTERKENNY IT",@"145",@"140",@"145",@"",@"",@"",@"",@"",@"",@"LY427",@"Digital Media Design",@"Digital Media Des",@"LETTERKENNY IT",@"180",@"245",@"",@"",@"",@"",@"",@"",@"",@"LY437",@"Animation",@"Animation",@"LETTERKENNY IT",@"145",@"140",@"",@"",@"",@"",@"",@"",@"",@"LY507",@"Quantity Surveying",@"Quantity Surveyin",@"LETTERKENNY IT",@"140",@"",@"",@"",@"",@"",@"",@"",@"",@"LY517",@"Building Services and Renewable Energy",@"Building Services",@"LETTERKENNY IT",@"170",@"155",@"",@"",@"",@"",@"",@"",@"",@"LY527",@"Civil Engineering",@"Civil Engineering",@"LETTERKENNY IT",@"185",@"155",@"215",@"",@"",@"",@"",@"",@"",@"LY547",@"Architectural Technology",@"Architectural Tec",@"LETTERKENNY IT",@"180",@"160",@"163",@"",@"",@"",@"",@"",@"",@"LY607",@"Electronics",@"Electronics",@"LETTERKENNY IT",@"140",@"175",@"145",@"",@"",@"",@"",@"",@"",@"LY617",@"Mechanical Engineering",@"Mechanical Engine",@"LETTERKENNY IT",@"140",@"140",@"140",@"",@"",@"",@"",@"",@"",@"LY627",@"Computer Engineering",@"Computer Engineer",@"LETTERKENNY IT",@"165",@"170",@"140",@"",@"",@"",@"",@"",@"",@"LY707",@"Computer Games Development",@"Computer Games De",@"LETTERKENNY IT",@"205",@"210",@"200",@"",@"",@"",@"",@"",@"",@"LY717",@"Computing",@"Computing",@"LETTERKENNY IT",@"140",@"140",@"",@"",@"",@"",@"",@"",@"",@"LY737",@"Computer Security and Digital Forensics",@"Computer Security",@"LETTERKENNY IT",@"185",@"145",@"145",@"",@"",@"",@"",@"",@"",@"LY806",@"Pharmacy Technician",@"Pharmacy Technici",@"LETTERKENNY IT",@"160",@"230",@"210",@"",@"",@"",@"",@"",@"",@"LY816",@"Dental Nursing",@"Dental Nursing",@"LETTERKENNY IT",@"195",@"215",@"",@"",@"",@"",@"",@"",@"",@"LY817",@"Bioscience",@"Bioscience",@"LETTERKENNY IT",@"150",@"165",@"205",@"",@"",@"",@"",@"",@"",@"LY826",@"Applied Agriculture",@"Applied Agricultu",@"LETTERKENNY IT",@"190",@"",@"",@"",@"",@"",@"",@"",@"",@"LY827",@"Analytical and Forensic Science",@"Analytical and Fo",@"LETTERKENNY IT",@"145",@"210",@"200",@"",@"",@"",@"",@"",@"",@"LY837",@"Food Science and Nutrition",@"Food Science and",@"LETTERKENNY IT",@"170",@"225",@"200",@"",@"",@"",@"",@"",@"",@"LY847",@"Veterinary Nursing",@"Veterinary Nursin",@"LETTERKENNY IT",@"390",@"380",@"350",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"LY906",@"Early Childhood Care, Health and Education",@"Early Childhood C",@"LETTERKENNY IT",@"180",@"115",@"",@"",@"",@"",@"",@"",@"",@"LY916",@"Health and Social Care",@"Health and Social",@"LETTERKENNY IT",@"130",@"110",@"",@"",@"",@"",@"",@"",@"",@"LY917",@"Health and Social Care",@"Health and Social",@"LETTERKENNY IT",@"155",@"320",@"",@"",@"",@"",@"",@"",@"",@"DB513",@"Business",@"Business",@"DUBLIN BUSINESS SCHOOL",@"105",@"130",@"120",@"",@"",@"",@"",@"",@"",@"DB522",@"Business in Accounting",@"Business in Accou",@"DUBLIN BUSINESS SCHOOL",@"145",@"",@"120",@"",@"",@"",@"",@"",@"",@"DB533",@"Business in Marketing",@"Business in Marke",@"DUBLIN BUSINESS SCHOOL",@"120",@"125",@"125",@"",@"",@"",@"",@"",@"",@"DB563",@"Cultural Studies",@"Cultural Studies",@"DUBLIN BUSINESS SCHOOL",@"",@"105",@"",@"(AQA) All qualified applicants",@"",@"",@"",@"",@"",@"DB571",@"Business Studies",@"Business Studies",@"DUBLIN BUSINESS SCHOOL",@"110",@"220",@"230",@"",@"",@"",@"",@"",@"",@"DB572",@"Business in Accounting",@"Business in Accou",@"DUBLIN BUSINESS SCHOOL",@"150",@"",@"120",@"",@"",@"",@"",@"",@"",@"DB573",@"Business in Marketing",@"Business in Marke",@"DUBLIN BUSINESS SCHOOL",@"100",@"125",@"125",@"",@"",@"",@"",@"",@"",@"DB574",@"Business in Information Technology",@"Business in Infor",@"DUBLIN BUSINESS SCHOOL",@"",@"",@"105",@"(AQA) All qualified applicants",@"",@"",@"",@"",@"",@"DB575",@"Social Studies",@"Social Studies",@"DUBLIN BUSINESS SCHOOL",@"",@"",@"120",@"(AQA) All qualified applicants",@"",@"",@"",@"",@"",@"DB576",@"Film and Media",@"Film and Media",@"DUBLIN BUSINESS SCHOOL",@"",@"",@"",@"(AQA) All qualified applicants",@"",@"",@"",@"",@"",@"DB578",@"Journalism and Media",@"Journalism and Me",@"DUBLIN BUSINESS SCHOOL",@"",@"110",@"",@"(AQA) All qualified applicants",@"",@"",@"",@"",@"",@"DT002",@"Engineering Systems Maintenance",@"Engineering Syste",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"230",@"200",@"180",@"",@"",@"",@"",@"",@"",@"DT003",@"Automation Engineering",@"Automation Engine",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"250",@"260",@"260",@"",@"",@"",@"",@"",@"",@"DT004",@"Civil Engineering",@"Civil Engineering",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"240",@"220",@"220",@"",@"",@"",@"",@"",@"",@"DT005",@"Building Services Engineering",@"Building Services",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"225",@"180",@"180",@"",@"",@"",@"",@"",@"",@"DT006",@"Mechanical Engineering",@"Mechanical Engine",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"300",@"230",@"230",@"",@"",@"",@"",@"",@"",@"DT007",@"Automotive Management and Technology",@"Automotive Manage",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"250",@"250",@"270",@"",@"",@"",@"",@"",@"",@"DT008",@"Electronics and Communications Engineering",@"Electronics and C",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"240",@"180",@"180",@"",@"",@"",@"",@"",@"",@"DT009",@"Electrical and Control Engineering",@"Electrical and Co",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"225",@"200",@"",@"",@"",@"",@"",@"",@"",@"DT010",@"Sustainable Design in Electrical Services Engineering",@"Sustainable Desig",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"225",@"180",@"180",@"",@"",@"",@"",@"",@"",@"DT011",@"Aviation Technology",@"Aviation Technolo",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"325",@"330",@"285",@"",@"",@"",@"",@"",@"",@"DT080",@"Networking Technologies",@"Networking Techno",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"270",@"235",@"",@"",@"",@"",@"",@"",@"",@"DT097",@"Engineering (General Entry)",@"Engineering (Gene",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"360",@"320",@"",@"",@"",@"",@"",@"",@"",@"DT104",@"Auctioneering, Valuation and Estate Agency",@"Auctioneering, Va",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"220",@"105",@"200",@"",@"",@"",@"",@"",@"",@"DT169",@"Timber Product Technology",@"Timber Product Te",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"245",@"240",@"",@"",@"",@"",@"",@"",@"",@"DT170",@"Buildings Management (Maintenance & Conservation)",@"Buildings Managem",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"100",@"110",@"",@"",@"",@"",@"",@"",@"",@"DT212",@"Science - Common 1st Year",@"Science - Common",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"380",@"390",@"350",@"",@"",@"",@"",@"",@"",@"DT259",@"Biosciences",@"Biosciences",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"385",@"400",@"350",@"",@"",@"",@"",@"",@"",@"DT260",@"Industrial and Environmental Physics",@"Industrial and En",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"230",@"240",@"240",@"",@"",@"",@"",@"",@"",@"DT261",@"Medicinal Chemistry and Pharmaceutical Sciences",@"Medicinal Chemist",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"375",@"350",@"340",@"",@"",@"",@"",@"",@"",@"DT303",@"Marketing",@"Marketing",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"300",@"375",@"370",@"",@"",@"",@"",@"",@"",@"DT315",@"Business Studies",@"Business Studies",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"300",@"310",@"310",@"",@"",@"",@"",@"",@"",@"DT324",@"Business Management",@"Business Manageme",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"300",@"320",@"335",@"",@"",@"",@"",@"",@"",@"DT360",@"Retail Management and Marketing",@"Retail Management",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"280",@"300",@"300",@"",@"",@"",@"",@"",@"",@"DT406",@"Tourism Management",@"Tourism Managemen",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"275",@"250",@"220",@"(*) Not all on this points score were offered places",@"",@"",@"",@"",@"",@"DT408",@"Hospitality Management",@"Hospitality Manag",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"280",@"270",@"240",@"",@"",@"",@"",@"",@"",@"DT411",@"Leisure Management",@"Leisure Managemen",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"315",@"270",@"280",@"",@"",@"",@"",@"",@"",@"DT418",@"Baking and Pastry Arts Management",@"Baking and Pastry",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"310",@"335",@"220",@"",@"",@"",@"",@"",@"",@"DT424",@"Food Science and Management",@"Food Science and",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"260",@"260",@"230",@"",@"",@"",@"",@"",@"",@"DT425",@"Pharmacy Technician Studies",@"Pharmacy Technici",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"340",@"340",@"330",@"",@"",@"",@"",@"",@"",@"DT432",@"Culinary Arts(Professional Culinary Practice)",@"Culinary Arts(Pro",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"310",@"325",@"",@"",@"",@"",@"",@"",@"",@"DT444",@"Health and Nutrition for Culinary Arts",@"Health and Nutrit",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"290",@"250",@"210",@"",@"",@"",@"",@"",@"",@"DT598",@"Visual Merchandising and Display",@"Visual Merchandis",@"DUBLIN INSTITUTE OF TECHNOLOGY",@"450",@"470",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"CI001",@"Counselling Skills and Psychotherapy Studies",@"Counselling Skill",@"NATIONAL COUNSELLING AND PSYCHOTHERAPY INSTITUTE",@"125",@"120",@"",@"",@"",@"",@"",@"",@"",@"CI002",@"Counselling Skills and Addiction Studies",@"Counselling Skill",@"NATIONAL COUNSELLING AND PSYCHOTHERAPY INSTITUTE",@"135",@"185",@"130",@"",@"",@"",@"",@"",@"",@"CI005",@"Counselling Skills and Youth Studies",@"Counselling Skill",@"NATIONAL COUNSELLING AND PSYCHOTHERAPY INSTITUTE",@"",@"",@"",@"(AQA) All qualified applicants",@"",@"",@"",@"",@"",@"LC111",@"Fashion Knitwear & Textiles",@"Fashion Knitwear",@"LIMERICK IT",@"605",@"",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"LC221",@"Business (Accounting/Finance)",@"Business (Account",@"LIMERICK IT",@"250",@"330",@"335",@"",@"",@"",@"",@"",@"",@"LC222",@"Business (Marketing and Management)",@"Business (Marketi",@"LIMERICK IT",@"250",@"320",@"335",@"",@"",@"",@"",@"",@"",@"LC228",@"Sports Coaching & Development",@"Sports Coaching &",@"LIMERICK IT",@"275",@"",@"",@"",@"",@"",@"",@"",@"",@"LC232",@"Business Computing",@"Business Computin",@"LIMERICK IT",@"200",@"180",@"200",@"",@"",@"",@"",@"",@"",@"LC235",@"Internet Systems Development",@"Internet Systems",@"LIMERICK IT",@"240",@"240",@"250",@"",@"",@"",@"",@"",@"",@"LC237",@"eBusiness Management Systems",@"eBusiness Managem",@"LIMERICK IT",@"205",@"170",@"250",@"",@"",@"",@"",@"",@"",@"LC244",@"Sustainable Building and Renewable Energy",@"Sustainable Build",@"LIMERICK IT",@"200",@"185",@"",@"",@"",@"",@"",@"",@"",@"LC251",@"Civil Engineering",@"Civil Engineering",@"LIMERICK IT",@"190",@"200",@"240",@"",@"",@"",@"",@"",@"",@"LC253",@"Construction",@"Construction",@"LIMERICK IT",@"170",@"170",@"200",@"",@"",@"",@"",@"",@"",@"LC254",@"Construction (Health and Safety)",@"Construction (Hea",@"LIMERICK IT",@"190",@"210",@"195",@"",@"",@"",@"",@"",@"",@"LC256",@"Construction Practice",@"Construction Prac",@"LIMERICK IT",@"155",@"155",@"",@"",@"",@"",@"",@"",@"",@"LC257",@"Interior Design & Technology",@"Interior Design &",@"LIMERICK IT",@"155",@"",@"",@"",@"",@"",@"",@"",@"",@"LC260",@"Applied Biology",@"Applied Biology",@"LIMERICK IT",@"270",@"245",@"310",@"",@"",@"",@"",@"",@"",@"LC261",@"Applied Chemistry",@"Applied Chemistry",@"LIMERICK IT",@"345",@"180",@"",@"",@"",@"",@"",@"",@"",@"LC264",@"Environmental & Analytical Science",@"Environmental & A",@"LIMERICK IT",@"220",@"165",@"310",@"",@"",@"",@"",@"",@"",@"LC267",@"Pharmaceutical and Forensic Analysis",@"Pharmaceutical an",@"LIMERICK IT",@"260",@"360",@"330",@"",@"",@"",@"",@"",@"",@"LC270",@"Music Technology and Production",@"Music Technology",@"LIMERICK IT",@"345",@"340",@"355",@"",@"",@"",@"",@"",@"",@"LC276",@"Video and Sound Technology",@"Video and Sound T",@"LIMERICK IT",@"245",@"270",@"",@"",@"",@"",@"",@"",@"",@"LC277",@"Industrial Automation and Robotic Systems",@"Industrial Automa",@"LIMERICK IT",@"195",@"195",@"225",@"",@"",@"",@"",@"",@"",@"LC278",@"Renewable and Electrical Energy Systems",@"Renewable and Ele",@"LIMERICK IT",@"200",@"200",@"265",@"",@"",@"",@"",@"",@"",@"LC279",@"Electronic Engineering",@"Electronic Engine",@"LIMERICK IT",@"205",@"220",@"235",@"",@"",@"",@"",@"",@"", @"LC281",@"Automobile Technology",@"Automobile Techno",@"LIMERICK IT",@"255",@"310",@"",@"",@"",@"",@"",@"",@"",@"LC284",@"Agricultural Mechanisation - Salesian Agri. College Pallaske",@"Agricultural Mech",@"LIMERICK IT",@"305",@"290",@"",@"",@"",@"",@"",@"",@"",@"LC285",@"Mechanical Engineering",@"Mechanical Engine",@"LIMERICK IT",@"200",@"225",@"230",@"",@"",@"",@"",@"",@"",@"LC286",@"Road Transport Technology and Management",@"Road Transport Te",@"LIMERICK IT",@"210",@"225",@"270",@"",@"",@"",@"",@"",@"",@"LC296",@"Front Office Management",@"Front Office Mana",@"LIMERICK IT",@"180",@"185",@"200",@"",@"",@"",@"",@"",@"",@"LC298",@"Culinary Arts",@"Culinary Arts",@"LIMERICK IT",@"270",@"270",@"255",@"",@"",@"",@"",@"",@"",@"LC299",@"Hospitality Studies",@"Hospitality Studi",@"LIMERICK IT",@"240",@"245",@"230",@"",@"",@"",@"",@"",@"",@"LC401",@"Business (Thurles)",@"Business (Thurles",@"LIMERICK IT",@"140",@"150",@"",@"",@"",@"",@"",@"",@"",@"LC403",@"Computing (Thurles)",@"Computing (Thurle",@"LIMERICK IT",@"145",@"145",@"",@"",@"",@"",@"",@"",@"",@"LC404",@"Computing - Smart Energy Systems (Thurles)",@"Computing - Smart",@"LIMERICK IT",@"",@"215",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"LC416",@"Computer Services Management (Thurles)",@"Computer Services",@"LIMERICK IT",@"155",@"140",@"",@"",@"",@"",@"",@"",@"",@"LC419",@"Business (Thurles)",@"Business (Thurles",@"LIMERICK IT",@"",@"195",@"",@"(AQA) All qualified applicants",@"",@"",@"",@"",@"",@"LC423",@"Sports Strength and Conditioning (Thurles)",@"Sports Strength a",@"LIMERICK IT",@"265",@"265",@"",@"",@"",@"",@"",@"",@"",@"LC501",@"Business (Clonmel)",@"Business (Clonmel",@"LIMERICK IT",@"165",@"170",@"",@"",@"",@"",@"",@"",@"",@"LC504",@"Creative Multimedia (Clonmel)",@"Creative Multimed",@"LIMERICK IT",@"150",@"140",@"",@"",@"",@"",@"",@"",@"",@"LC511",@"Marketing with Languages (Clonmel)",@"Marketing with La",@"LIMERICK IT",@"145",@"145",@"",@"",@"",@"",@"",@"",@"",@"LC514",@"Creative Multimedia (Clonmel)",@"Creative Multimed",@"LIMERICK IT",@"145",@"230",@"",@"",@"",@"",@"",@"",@"",@"SG101",@"Business",@"Business",@"IT SLIGO ",@"",@"210",@"240",@"(AQA) All qualified applicants",@"",@"",@"",@"",@"",@"SG105",@"Business in Office Administration",@"Business in Offic",@"IT SLIGO ",@"",@"",@"205",@"(AQA) All qualified applicants",@"",@"",@"",@"",@"",@"SG108",@"Business in Accounting",@"Business in Accou",@"IT SLIGO ",@"120",@"",@"",@"(AQA) All qualified applicants",@"",@"",@"",@"",@"",@"SG131",@"Computing - Games Development",@"Computing - Games",@"IT SLIGO ",@"240",@"200",@"270",@"",@"",@"",@"",@"",@"",@"SG134",@"Recreation and Leisure",@"Recreation and Le",@"IT SLIGO ",@"290",@"290",@"300",@"",@"",@"",@"",@"",@"",@"SG135",@"Business in Tourism with Event Management",@"Business in Touri",@"IT SLIGO ",@"140",@"140",@"",@"",@"",@"",@"",@"",@"",@"SG136",@"Computing - Software Development",@"Computing - Softw",@"IT SLIGO ",@"250",@"205",@"255",@"",@"",@"",@"",@"",@"",@"SG137",@"Computing - Systems and Networking",@"Computing - Syste",@"IT SLIGO ",@"250",@"145",@"205",@"",@"",@"",@"",@"",@"",@"SG231",@"Fine Art",@"Fine Art",@"IT SLIGO ",@"690",@"695",@"680",@"(+) Includes Project / Portfolio Score",@"",@"",@"",@"",@"",@"SG232",@"Creative Design and Innovation",@"Creative Design a",@"IT SLIGO ",@"140",@"150",@"160",@"",@"",@"",@"",@"",@"",@"SG332",@"Advanced Wood and Sustainable Building Technology",@"Advanced Wood and",@"IT SLIGO ",@"145",@"145",@"",@"",@"",@"",@"",@"",@"",@"SG333",@"Mechanical Engineering",@"Mechanical Engine",@"IT SLIGO ",@"145",@"155",@"250",@"",@"",@"",@"",@"",@"",@"SG334",@"Mechatronics",@"Mechatronics",@"IT SLIGO ",@"145",@"160",@"175",@"",@"",@"",@"",@"",@"",@"SG335",@"Environmental Engineering",@"Environmental Eng",@"IT SLIGO ",@"165",@"185",@"",@"",@"",@"",@"",@"",@"",@"SG337",@"Electronic Engineering",@"Electronic Engine",@"IT SLIGO ",@"150",@"140",@"140",@"",@"",@"",@"",@"",@"",@"SG338",@"Civil Engineering",@"Civil Engineering",@"IT SLIGO ",@"155",@"190",@"140",@"",@"",@"",@"",@"",@"",@"SG401",@"Science",@"Science",@"IT SLIGO ",@"100",@"",@"",@"(AQA) All qualified applicants",@"",@"",@"",@"",@"",@"SG431",@"Pharmaceutical Science with Drug Development",@"Pharmaceutical Sc",@"IT SLIGO ",@"245",@"190",@"280",@"",@"",@"",@"",@"",@"",@"SG432",@"Environmental Protection",@"Environmental Pro",@"IT SLIGO ",@"230",@"230",@"250",@"",@"",@"",@"",@"",@"",@"SG433",@"Occupational Safety and Health",@"Occupational Safe",@"IT SLIGO ",@"245",@"280",@"310",@"",@"",@"",@"",@"",@"",@"SG435",@"Health Science and Physiology",@"Health Science an",@"IT SLIGO ",@"355",@"355",@"360",@"",@"",@"",@"",@"",@"",@"SG436",@"Biomedical Science",@"Biomedical Scienc",@"IT SLIGO ",@"230",@"250",@"255",@"",@"",@"",@"",@"",@"",@"SG437",@"Forensic Investigation and Analysis",@"Forensic Investig",@"IT SLIGO ",@"235",@"295",@"335",@"",@"",@"",@"",@"",@"",@"SG438",@"Applied Archaeology",@"Applied Archaeolo",@"IT SLIGO ",@"140",@"295",@"310",@"",@"",@"",@"",@"",@"",@"SG531",@"Marketing - P.R. with Events Management",@"Marketing - P.R.",@"IT SLIGO ",@"145",@"150",@"145",@"",@"",@"",@"",@"",@"",@"SG532",@"Marketing with Languages",@"Marketing with La",@"IT SLIGO ",@"165",@"165",@"155",@"",@"",@"",@"",@"",@"",@"SG533",@"Marketing",@"Marketing",@"IT SLIGO ",@"140",@"160",@"140",@"",@"",@"",@"",@"",@"",@"SG536",@"Business",@"Business",@"IT SLIGO ",@"145",@"210",@"240",@"",@"",@"",@"",@"",@"",@"SG538",@"Web Development and Creative Media",@"Web Development a",@"IT SLIGO ",@"140",@"140",@"200",@"",@"",@"",@"",@"",@"",@"AS201",@"Applied Science in Food and Business Management",@"Applied Science i",@"ST ANGELAS - SLIGO",@"285",@"",@"",@"",@"",@"",@"",@"",@"",@"DL131",@"Computing in Multimedia Programming",@"Computing in Mult",@"DUN LAOGHAIRE IADT",@"285",@"300",@"290",@"",@"",@"",@"",@"",@"",@"DL133",@"Audio Visual Media Technology",@"Audio Visual Medi",@"DUN LAOGHAIRE IADT",@"200",@"235",@"285",@"",@"",@"",@"",@"",@"",@"DL231",@"Business Studies - Entrepreneurship",@"Business Studies",@"DUN LAOGHAIRE IADT",@"215",@"200",@"250",@"",@"",@"",@"",@"",@"",@"GF010",@"Business in Management",@"Business in Manag",@"GRAFTON COLLEGE of MANAGEMENT SCIENCES",@"150",@"",@"",@"",@"",@"",@"",@"",@"",@"GF011",@"Business in Accounting",@"Business in Accou",@"GRAFTON COLLEGE of MANAGEMENT SCIENCES",@"135",@"",@"",@"",@"",@"",@"",@"",@"",@"GC210",@"Marketing (Cork)",@"Marketing (Cork)",@"GRIFFITH COLLEGE DUBLIN, CORK AND LIMERICK",@"180",@"125",@"",@"(AQA) All qualified applicants",@"",@"",@"",@"",@"",@"GC211",@"Business (Cork)",@"Business (Cork)",@"GRIFFITH COLLEGE DUBLIN, CORK AND LIMERICK",@"170",@"145",@"",@"(AQA) All qualified applicants",@"",@"",@"",@"",@"",@"GC216",@"Business (Cork)",@"Business (Cork)",@"GRIFFITH COLLEGE DUBLIN, CORK AND LIMERICK",@"205",@"145",@"",@"(AQA) All qualified applicants",@"",@"",@"",@"",@"",@"GC265",@"Journalism (Cork)",@"Journalism (Cork)",@"GRIFFITH COLLEGE DUBLIN, CORK AND LIMERICK",@"115",@"120",@"",@"(AQA) All qualified applicants",@"",@"",@"",@"",@"",@"GC306",@"Diploma in International Hospitality Management (Limerick)",@"Diploma in Intern",@"GRIFFITH COLLEGE DUBLIN, CORK AND LIMERICK",@"100",@"",@"",@"",@"",@"",@"",@"",@"",@"GC310",@"Marketing (Limerick)",@"Marketing (Limeri",@"GRIFFITH COLLEGE DUBLIN, CORK AND LIMERICK",@"150",@"",@"",@"",@"",@"",@"",@"",@"",@"GC311",@"Business (Limerick)",@"Business (Limeric",@"GRIFFITH COLLEGE DUBLIN, CORK AND LIMERICK",@"135",@"",@"",@"",@"",@"",@"",@"",@"",@"GC316",@"Business (Limerick)",@"Business (Limeric",@"GRIFFITH COLLEGE DUBLIN, CORK AND LIMERICK",@"225",@"185",@"",@"",@"",@"",@"",@"",@"",@"GC320",@"Office Administration (Limerick)",@"Office Administra",@"GRIFFITH COLLEGE DUBLIN, CORK AND LIMERICK",@"365",@"250",@"",@"",@"",@"",@"",@"",@"",@"GC335",@"Computing (Limerick)",@"Computing (Limeri",@"GRIFFITH COLLEGE DUBLIN, CORK AND LIMERICK",@"",@"170",@"",@"(AQA) All qualified applicants",@"",@"",@"",@"",@"",@"GC340",@"Computing (Limerick)",@"Computing (Limeri",@"GRIFFITH COLLEGE DUBLIN, CORK AND LIMERICK",@"135",@"",@"",@"",@"",@"",@"",@"",@"",@"GC410",@"Marketing (Dublin)",@"Marketing (Dublin",@"GRIFFITH COLLEGE DUBLIN, CORK AND LIMERICK",@"130",@"",@"",@"",@"",@"",@"",@"",@"",@"GC411",@"Business (Dublin)",@"Business (Dublin)",@"GRIFFITH COLLEGE DUBLIN, CORK AND LIMERICK",@"",@"110",@"",@"(AQA) All qualified applicants",@"",@"",@"",@"",@"",@"GC416",@"Business (Dublin)",@"Business (Dublin)",@"GRIFFITH COLLEGE DUBLIN, CORK AND LIMERICK",@"190",@"110",@"",@"(AQA) All qualified applicants",@"",@"",@"",@"",@"",@"GC425",@"Legal Studies and Practice (Dublin)",@"Legal Studies and",@"GRIFFITH COLLEGE DUBLIN, CORK AND LIMERICK",@"250",@"",@"",@"",@"",@"",@"",@"",@"",@"GC435",@"Computing (Dublin)",@"Computing (Dublin",@"GRIFFITH COLLEGE DUBLIN, CORK AND LIMERICK",@"",@"",@"",@"(AQA) All qualified applicants",@"",@"",@"",@"",@"",@"GC440",@"Computing (Dublin)",@"Computing (Dublin",@"GRIFFITH COLLEGE DUBLIN, CORK AND LIMERICK",@"140",@"",@"",@"(AQA) All qualified applicants",@"",@"",@"",@"",@"",@"GC445",@"Computer Games Technology (Dublin)",@"Computer Games Te",@"GRIFFITH COLLEGE DUBLIN, CORK AND LIMERICK",@"",@"",@"",@"(AQA) All qualified applicants",@"",@"",@"",@"",@"",@"GC460",@"Music Production for Games (Dublin) - Interview",@"Music Production",@"GRIFFITH COLLEGE DUBLIN, CORK AND LIMERICK",@"230",@"",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"GC465",@"Journalism (Dublin)",@"Journalism (Dubli",@"GRIFFITH COLLEGE DUBLIN, CORK AND LIMERICK",@"",@"105",@"",@"(AQA) All qualified applicants",@"",@"",@"",@"",@"",@"GC470",@"Photographic Media (Dublin)",@"Photographic Medi",@"GRIFFITH COLLEGE DUBLIN, CORK AND LIMERICK",@"",@"120",@"",@"(AQA) All qualified applicants",@"",@"",@"",@"",@"",@"GC475",@"Photography (Dublin)",@"Photography (Dubl",@"GRIFFITH COLLEGE DUBLIN, CORK AND LIMERICK",@"",@"105",@"",@"(AQA) All qualified applicants",@"",@"",@"",@"",@"",@"GC490",@"Interior Design (Dublin)",@"Interior Design (",@"GRIFFITH COLLEGE DUBLIN, CORK AND LIMERICK",@"",@"105",@"",@"(AQA) All qualified applicants",@"",@"",@"",@"",@"",@"GC495",@"Fashion Design (Dublin) - Portfolio",@"Fashion Design (D",@"GRIFFITH COLLEGE DUBLIN, CORK AND LIMERICK",@"100",@"255",@"",@"(#) Test / Interview / Portfolio",@"",@"",@"",@"",@"",@"BY201",@"Business",@"Business",@"INSTITUTE OF BUSINESS AND TECHNOLOGY  SWORDS",@"215",@"",@"",@"",@"",@"",@"",@"",@"",@"BY251",@"Business",@"Business",@"INSTITUTE OF BUSINESS AND TECHNOLOGY  SWORDS",@"200",@"235",@"",@"",@"",@"",@"",@"",@"",@"BN001",@"Electronics and Computer Engineering",@"Electronics and C",@"IT BLANCHARDSTOWN ",@"180",@"185",@"180",@"",@"",@"",@"",@"",@"",@"BN002",@"Computing (Information Technology)",@"Computing (Inform",@"IT BLANCHARDSTOWN ",@"200",@"215",@"220",@"",@"",@"",@"",@"",@"",@"BN003",@"Business",@"Business",@"IT BLANCHARDSTOWN ",@"180",@"210",@"210",@"",@"",@"",@"",@"",@"",@"BN009",@"Mechatronic Engineering",@"Mechatronic Engin",@"IT BLANCHARDSTOWN ",@"180",@"190",@"200",@"",@"",@"",@"",@"",@"",@"BN010",@"Business and Information Technology",@"Business and Info",@"IT BLANCHARDSTOWN ",@"180",@"210",@"250",@"",@"",@"",@"",@"",@"",@"BN011",@"Applied Social Studies in Social Care",@"Applied Social St",@"IT BLANCHARDSTOWN ",@"330",@"360",@"355",@"",@"",@"",@"",@"",@"",@"BN012",@"Computer Engineering",@"Computer Engineer",@"IT BLANCHARDSTOWN ",@"180",@"180",@"205",@"",@"",@"",@"",@"",@"",@"BN013",@"Computing (Information Technology)",@"Computing (Inform",@"IT BLANCHARDSTOWN ",@"200",@"215",@"220",@"",@"",@"",@"",@"",@"",@"BN014",@"Business",@"Business",@"IT BLANCHARDSTOWN ",@"180",@"210",@"210",@"",@"",@"",@"",@"",@"",@"BN015",@"Engineering (Common 1st Year)",@"Engineering (Comm",@"IT BLANCHARDSTOWN ",@"",@"220",@"",@"(AQA) All qualified applicants",@"",@"",@"",@"",@"",@"BN016",@"Business (Common 1st Year)",@"Business (Common",@"IT BLANCHARDSTOWN ",@"100",@"270",@"",@"",@"",@"",@"",@"",@"",@"BN017",@"International Business",@"International Bus",@"IT BLANCHARDSTOWN ",@"185",@"255",@"235",@"",@"",@"",@"",@"",@"",@"BN020",@"Sports Management and Coaching",@"Sports Management",@"IT BLANCHARDSTOWN ",@"335",@"320",@"345",@"",@"",@"",@"",@"",@"",@"BN021",@"Creative Digital Media",@"Creative Digital",@"IT BLANCHARDSTOWN ",@"310",@"310",@"320",@"",@"",@"",@"",@"",@"",@"BN022",@"Horticulture",@"Horticulture",@"IT BLANCHARDSTOWN ",@"180",@"225",@"255",@"",@"",@"",@"",@"",@"",@"BN025",@"Social and Community Development",@"Social and Commun",@"IT BLANCHARDSTOWN ",@"300",@"310",@"315",@"",@"",@"",@"",@"",@"",@"BN030",@"Early Childhood Care and Education",@"Early Childhood C",@"IT BLANCHARDSTOWN ",@"340",@"330",@"",@"",@"",@"",@"",@"",@"",@"TL605",@"Business Studies (Office Information Systems)",@"Business Studies",@"IT TRALEE",@"185",@"210",@"220",@"",@"",@"",@"",@"",@"",@"TL620",@"Culinary Arts",@"Culinary Arts",@"IT TRALEE",@"135",@"135",@"140",@"",@"",@"",@"",@"",@"",@"TL621",@"Hospitality Studies",@"Hospitality Studi",@"IT TRALEE",@"",@"",@"",@"(AQA) All qualified applicants",@"",@"",@"",@"",@"",@"TL630",@"Advanced Business Studies",@"Advanced Business",@"IT TRALEE",@"460",@"405",@"395",@"",@"",@"",@"",@"",@"",@"TL651",@"Science (Biological and Environmental Studies)",@"Science (Biologic",@"IT TRALEE",@"270",@"245",@"265",@"",@"",@"",@"",@"",@"",@"TL700",@"Social Media and Web Technologies",@"Social Media and",@"IT TRALEE",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"TL710",@"Computing with Software Development",@"Computing with So",@"IT TRALEE",@"200",@"245",@"240",@"",@"",@"",@"",@"",@"",@"TL711",@"Computing with Games Development",@"Computing with Ga",@"IT TRALEE",@"210",@"320",@"300",@"",@"",@"",@"",@"",@"",@"TL712",@"Computing with Multimedia",@"Computing with Mu",@"IT TRALEE",@"210",@"310",@"295",@"",@"",@"",@"",@"",@"",@"TL714",@"Computing with Mobile App Development",@"Computing with Mo",@"IT TRALEE",@"210",@"",@"",@"",@"",@"",@"",@"",@"",@"TL719",@"Culinary Arts",@"Culinary Arts",@"IT TRALEE",@"250",@"135",@"140",@"",@"",@"",@"",@"",@"",@"TL720",@"Travel and Tourism Management",@"Travel and Touris",@"IT TRALEE",@"205",@"295",@"310",@"",@"",@"",@"",@"",@"",@"TL721",@"Adventure Tourism Management",@"Adventure Tourism",@"IT TRALEE",@"230",@"305",@"310",@"",@"",@"",@"",@"",@"",@"TL722",@"Hotel Management",@"Hotel Management",@"IT TRALEE",@"250",@"",@"",@"",@"",@"",@"",@"",@"",@"TL731",@"Business",@"Business",@"IT TRALEE",@"200",@"",@"",@"",@"",@"",@"",@"",@"",@"TL733",@"International Business",@"International Bus",@"IT TRALEE",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"TL743",@"Advanced Wood Technology and Sustainable Construction",@"Advanced Wood Tec",@"IT TRALEE",@"200",@"",@"",@"",@"",@"",@"",@"",@"",@"TL744",@"Agricultural Engineering",@"Agricultural Engi",@"IT TRALEE",@"240",@"230",@"240",@"",@"",@"",@"",@"",@"",@"TL745",@"Civil and Environmental Engineering",@"Civil and Environ",@"IT TRALEE",@"200",@"",@"",@"",@"",@"",@"",@"",@"",@"TL746",@"Energy Technology and the Built Environment",@"Energy Technology",@"IT TRALEE",@"230",@"",@"",@"",@"",@"",@"",@"",@"",@"TL747",@"Engineering",@"Engineering",@"IT TRALEE",@"220",@"",@"",@"",@"",@"",@"",@"",@"",@"TL748",@"Agricultural Science",@"Agricultural Scie",@"IT TRALEE",@"310",@"305",@"",@"",@"",@"",@"",@"",@"",@"TL749",@"Food Science with Innovation",@"Food Science with",@"IT TRALEE",@"305",@"",@"",@"",@"",@"",@"",@"",@"",@"TL753",@"Pharmaceutical Analysis with Forensics",@"Pharmaceutical An",@"IT TRALEE",@"245",@"",@"325",@"",@"",@"",@"",@"",@"",@"TL754",@"Pharmaceutical Analysis with Environmental Science",@"Pharmaceutical An",@"IT TRALEE",@"335",@"",@"240",@"",@"",@"",@"",@"",@"",@"TL771",@"Health and Leisure",@"Health and Leisur",@"IT TRALEE",@"295",@"295",@"355",@"",@"",@"",@"",@"",@"",@"TL772",@"Health and Leisure with Massage",@"Health and Leisur",@"IT TRALEE",@"290",@"300",@"335",@"",@"",@"",@"",@"",@"",@"TL780",@"Early Childhood Care and Education",@"Early Childhood C",@"IT TRALEE",@"280",@"335",@"355",@"",@"",@"",@"",@"",@"",@"TL781",@"Social Care",@"Social Care",@"IT TRALEE",@"280",@"",@"",@"",@"",@"",@"",@"",@"",@"TL782",@"Youth and Community Work Practice",@"Youth and Communi",@"IT TRALEE",@"285",@"240",@"275",@"",@"",@"",@"",@"",@"",@"WD003",@"Business",@"Business",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"200",@"300",@"300",@"",@"",@"",@"",@"",@"",@"WD010",@"Electronic Engineering",@"Electronic Engine",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"205",@"355",@"345",@"",@"",@"",@"",@"",@"",@"WD011",@"Mechanical Engineering",@"Mechanical Engine",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"200",@"205",@"210",@"",@"",@"",@"",@"",@"",@"WD013",@"Legal Studies",@"Legal Studies",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"205",@"225",@"280",@"",@"",@"",@"",@"",@"",@"WD018",@"Applied Social Studies in Social Care",@"Applied Social St",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"300",@"355",@"355",@"",@"",@"",@"",@"",@"",@"WD019",@"Recreation and Sport Management",@"Recreation and Sp",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"285",@"290",@"290",@"",@"",@"",@"",@"",@"",@"WD040",@"Building Services Engineering",@"Building Services",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"215",@"200",@"205",@"",@"",@"",@"",@"",@"",@"WD076",@"Forestry",@"Forestry",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"295",@"270",@"280",@"",@"",@"",@"",@"",@"",@"WD078",@"Agricultural Science",@"Agricultural Scie",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"410",@"380",@"370",@"",@"",@"",@"",@"",@"",@"WD094",@"Architectural Technology",@"Architectural Tec",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"215",@"215",@"220",@"",@"",@"",@"",@"",@"",@"WD096",@"Horticulture (Waterford - Kildalton)",@"Horticulture (Wat",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"220",@"220",@"",@"",@"",@"",@"",@"",@"",@"WD097",@"Horticulture (Dublin - National Botanic Gardens)",@"Horticulture (Dub",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"205",@"210",@"230",@"",@"",@"",@"",@"",@"",@"WD126",@"Agriculture",@"Agriculture",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"380",@"355",@"345",@"",@"",@"",@"",@"",@"",@"WD139",@"Civil Engineering",@"Civil Engineering",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"200",@"205",@"215",@"",@"",@"",@"",@"",@"",@"WD151",@"Software Systems Development",@"Software Systems",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"200",@"200",@"200",@"",@"",@"",@"",@"",@"",@"WD153",@"Multimedia Applications Development",@"Multimedia Applic",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"205",@"210",@"235",@"",@"",@"",@"",@"",@"",@"WD155",@"Information Technology",@"Information Techn",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"200",@"210",@"220",@"",@"",@"",@"",@"",@"",@"WD159",@"Business",@"Business",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"200",@"300",@"300",@"",@"",@"",@"",@"",@"",@"WD164",@"Food Science with Business",@"Food Science with",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"255",@"245",@"220",@"",@"",@"",@"",@"",@"",@"WD172",@"Culinary Arts",@"Culinary Arts",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"220",@"210",@"240",@"",@"",@"",@"",@"",@"",@"WD173",@"Hospitality Studies",@"Hospitality Studi",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"205",@"215",@"225",@"",@"",@"",@"",@"",@"",@"WD174",@"Tourism",@"Tourism",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"210",@"210",@"",@"",@"",@"",@"",@"",@"",@"WD175",@"Pharmaceutical Science",@"Pharmaceutical Sc",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"300",@"315",@"325",@"",@"",@"",@"",@"",@"",@"WD176",@"Applied Biology",@"Applied Biology",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"335",@"320",@"345",@"",@"",@"",@"",@"",@"",@"WD177",@"Science (Agri. Pharm. Food Sci. Applied Biology)",@"Science (Agri. Ph",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"355",@"320",@"",@"",@"",@"",@"",@"",@"",@"WD182",@"Electrical Engineering",@"Electrical Engine",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"215",@"200",@"",@"",@"",@"",@"",@"",@"",@"WD184",@"Retail Management",@"Retail Management",@"WATERFORD INSTITUTE OF TECHNOLOGY",@"205",@"",@"",@"",@"",@"",@"",@"",@"", nil];

 }



/*
-(void) checkAndCreateDatabase{
	// Check if the SQL database has already been saved to the users phone, if not then copy it over
	BOOL success;
    
	// Create a FileManager object, we will use this to check the status
	// of the database and to copy it over if required
	NSFileManager *fileManager = [NSFileManager defaultManager];
    
	// Check if the database has already been created in the users filesystem
	success = [fileManager fileExistsAtPath:[self filePath]];
    
	// If the database already exists then return without doing anything
	if(success){ NSLog(@"------- checkAndCreateDatabase  IN returning successfully --------"); return;}
    
    NSLog(@"------- checkAndCreateDatabase  NOT returning successfully --------");
    
	// If not then proceed to copy the database from the application to the users filesystem
    
	// Get the path to the database in the application package
	NSString *databasePathFromApp = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:databaseName];
    
	// Copy the database from the package to the users filesystem
	[fileManager copyItemAtPath:databasePathFromApp toPath:[self filePath] error:nil];
    
	[fileManager release];
}
*/

-(void) viewWillAppear:(BOOL)animated;
{
    
    NSString *collegeSelection=self.title;
    NSString *mainTable=@"simTestTable";
    
    NSString *unique_code=nil;
    
    //check if database file has been saved to  the user's phone,if not coopy it over.
    //[self checkAndCreateDatabase];
    
    
    //NSString *qsql_1 = [NSString stringWithFormat: @"SELECT * FROM '%@' WHERE  college='%@'",mainTable,collegeSelection];
    NSString *qsql_1 = [NSString stringWithFormat: @"SELECT * FROM '%@'",mainTable];
    NSString *strings[MAX_COURSE_NUM][FIELD_NUM];
    int college_course_counter=0;
    
    sqlite3_stmt *statement_1;
    
    sqlite3 *database;
    
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
    
    
    if(sqlite3_open_v2([[self filePath] UTF8String], &db,1,NULL) == SQLITE_OK) {
    
        NSLog(@"in open db loop filepath = %@ ",[self filePath]);
        
    if(sqlite3_prepare_v2(db, [qsql_1 UTF8String],-1, &statement_1,NULL) == SQLITE_OK )
    {
        
        NSLog(@"in prepare statement loop -- statement = %s",qsql_1);
        
        int k=0;
  
        while(sqlite3_step(statement_1) == SQLITE_ROW)
        {
            
            
             NSLog(@"in while sqlite3 step -- loop");
            
            char *field1 = (char *) sqlite3_column_text(statement_1,0);
            field1Str = [[NSString alloc] initWithUTF8String : field1];
            
            NSLog(@"field1 = %@",field1Str);
            
            unique_code=field1Str;
            
            char *field2 = (char *) sqlite3_column_text(statement_1,1);
            field2Str = [[NSString alloc] initWithUTF8String : field2];
            
            
                NSLog(@"field2 = %@",field2Str);
            
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
        
    else{
        
       // NSLog(@" ******************** getting database error - sqlite3 official error  is = ");
        
        //NSLog(@" %s ", err);
        
        sqlite3_errmsg(db) ;
        
        sqlite3_errcode(db);
        
        NSLog(@"%s Prepare failure '%s' (%1d)", __FUNCTION__, sqlite3_errmsg(db), sqlite3_errcode(db));
        NSLog(@"-- and main table = ->%@<-",mainTable);
        //NSLog(@"<-");
        
        //NSLog(@" -- done with sqlite3_ error msg call :) ********************  ");

        
    }
        
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
    //NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    
    //NSString *paths = [[NSBundle mainBundle] pathForResource:@"college_simtest_data" ofType:@"sql"];
    
    //NSString *documentsDir = [paths lastObject];
    
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    NSString *dbPath = [[[NSBundle mainBundle] resourcePath ]stringByAppendingPathComponent:@"college_simtest_data2.sql"];
    
    BOOL success = [fileMgr fileExistsAtPath:dbPath];
    
    
    
    NSLog(@" in filePath function -- resourcePath = ->%@<- -- dbPath = ->%@<- ",[[NSBundle mainBundle] resourcePath],dbPath);
    
    if(success)
        NSLog(@"succesful in retrieving DB path");
        
    //return[documentsDir stringByAppendingPathComponent:@"college_simtest_data.sql"];
    //return[documentsDir stringByAppendingPathComponent:@"AnimalDatabase.sql"];
    //return[paths stringByAppendingPathComponent:@"college_simtest_data.sql"];
    
    return dbPath;
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
    
    return sol5;
}



@end







