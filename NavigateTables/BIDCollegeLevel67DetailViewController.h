//
//  BIDCollegeLevel67DetailViewController.h
//  NavigateTables
//
//  Created by EventHorizon on 07/01/2014.
//  Copyright (c) 2014 EventHorizon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BIDSecondLevelViewController.h"
#import <sqlite3.h>


@interface UIButton(Assign)

@property (nonatomic, retain) NSObject *assign;

@end




@interface BIDCollegeLevel67DetailViewController : UIViewController{
    
    IBOutlet UIScrollView *scroller_1;
    
    
    IBOutlet UILabel *heading;
    IBOutlet UILabel *year_1;
    IBOutlet UILabel *year_2;
    IBOutlet UILabel *year_3;
    
    
    IBOutlet UIButton  *course_2,*course_3,*course_4,*course_5,*course_6,*course_7,*course_8,*course_9,*course_10;
    IBOutlet UIButton  *course_11,*course_12,*course_13,*course_14,*course_15,*course_16,*course_17,*course_18,*course_19,*course_20;
    IBOutlet UIButton  *course_21,*course_22,*course_23,*course_24,*course_25,*course_26,*course_27,*course_28,*course_29,*course_30;
    IBOutlet UIButton  *course_31,*course_32,*course_33,*course_34,*course_35,*course_36,*course_37,*course_38,*course_39,*course_40;
    IBOutlet UIButton  *course_41,*course_42,*course_43,*course_44,*course_45,*course_46,*course_47,*course_48,*course_49,*course_50;

    
    
    IBOutlet UILabel *points2_2012,*points3_2012,*points4_2012,*points5_2012,*points6_2012,*points7_2012,*points8_2012,*points9_2012;
    IBOutlet UILabel *points10_2012,*points11_2012,*points12_2012,*points13_2012,*points14_2012,*points15_2012,*points16_2012,*points17_2012,*points18_2012,*points19_2012;
    IBOutlet UILabel *points20_2012,*points21_2012,*points22_2012,*points23_2012,*points24_2012,*points25_2012,*points26_2012,*points27_2012,*points28_2012,*points29_2012;
    IBOutlet UILabel *points30_2012,*points31_2012,*points32_2012,*points33_2012,*points34_2012,*points35_2012,*points36_2012,*points37_2012,*points38_2012,*points39_2012;
    IBOutlet UILabel *points40_2012,*points41_2012,*points42_2012,*points43_2012,*points44_2012,*points45_2012,*points46_2012,*points47_2012;
    
    
    
    IBOutlet UILabel *points2_2011, *points3_2011, *points4_2011, *points5_2011, *points6_2011, *points7_2011, *points8_2011, *points9_2011;
    IBOutlet UILabel *points10_2011,*points11_2011,*points12_2011,*points13_2011,*points14_2011,*points15_2011,*points16_2011,*points17_2011,*points18_2011,*points19_2011;
    IBOutlet UILabel *points20_2011,*points21_2011,*points22_2011,*points23_2011,*points24_2011,*points25_2011,*points26_2011,*points27_2011,*points28_2011,*points29_2011;
    IBOutlet UILabel *points30_2011,*points31_2011,*points32_2011,*points33_2011,*points34_2011,*points35_2011,*points36_2011,*points37_2011,*points38_2011,*points39_2011;
    IBOutlet UILabel *points40_2011,*points41_2011,*points42_2011,*points43_2011,*points44_2011,*points45_2011,*points46_2011,*points47_2011,*points48_2011,*points49_2011;
    IBOutlet UILabel *points50_2011,*points51_2011,*points52_2011,*points53_2011,*points54_2011,*points55_2011,*points56_2011,*points57_2011,*points58_2011,*points59_2011;
    IBOutlet UILabel *points60_2011,*points61_2011,*points62_2011,*points63_2011,*points64_2011,*points65_2011,*points66_2011,*points67_2011,*points68_2011,*points69_2011;
    IBOutlet UILabel *points70_2011,*points71_2011,*points72_2011,*points73_2011,*points74_2011,*points75_2011,*points76_2011,*points77_2011,*points78_2011,*points79_2011;
    IBOutlet UILabel *points80_2011,*points81_2011,*points82_2011,*points83_2011,*points84_2011,*points85_2011,*points86_2011,*points87_2011,*points88_2011,*points89_2011;
    IBOutlet UILabel *points90_2011,*points91_2011,*points92_2011;
    
    
    
    IBOutlet UILabel *points2_2010, *points3_2010, *points4_2010, *points5_2010, *points6_2010, *points7_2010, *points8_2010, *points9_2010;
    IBOutlet UILabel *points10_2010,*points11_2010,*points12_2010,*points13_2010,*points14_2010,*points15_2010,*points16_2010,*points17_2010,*points18_2010,*points19_2010;
    IBOutlet UILabel *points20_2010,*points21_2010,*points22_2010,*points23_2010,*points24_2010,*points25_2010,*points26_2010,*points27_2010,*points28_2010,*points29_2010;
    IBOutlet UILabel *points30_2010,*points31_2010,*points32_2010,*points33_2010,*points34_2010,*points35_2010,*points36_2010,*points37_2010,*points38_2010,*points39_2010;
    IBOutlet UILabel *points40_2010,*points41_2010,*points42_2010,*points43_2010,*points44_2010,*points45_2010,*points46_2010,*points47_2010,*points48_2010,*points49_2010;
    IBOutlet UILabel *points50_2010,*points51_2010,*points52_2010,*points53_2010,*points54_2010,*points55_2010,*points56_2010,*points57_2010,*points58_2010,*points59_2010;
    IBOutlet UILabel *points60_2010,*points61_2010,*points62_2010,*points63_2010,*points64_2010,*points65_2010,*points66_2010,*points67_2010,*points68_2010,*points69_2010;
    IBOutlet UILabel *points70_2010,*points71_2010,*points72_2010,*points73_2010,*points74_2010,*points75_2010,*points76_2010,*points77_2010,*points78_2010,*points79_2010;
    IBOutlet UILabel *points80_2010,*points81_2010,*points82_2010,*points83_2010,*points84_2010,*points85_2010,*points86_2010,*points87_2010,*points88_2010,*points89_2010;
    IBOutlet UILabel *points90_2010,*points91_2010,*points92_2010;
    
}

-(void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event;

-(IBAction)namePressed:(UIButton *)sender;

@end



