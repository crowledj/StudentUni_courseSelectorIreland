#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BIDSecondLevelViewController.h"
#import <sqlite3.h>


/* attempt to create a subclassed Button*/
/*
 @interface CustomButton : UIButton
 
 @property (copy,nonatomic) NSString *new_fucnt;
 
 @end
 */
/*             end attempt             */


/* AGAIN */

@interface UIButton(Assign)

@property (nonatomic, retain) NSObject *assign;

@end




@interface BIDCollegeLevelDetailViewController : UIViewController{
    
    IBOutlet UIScrollView *scroller;

    
    IBOutlet UILabel *heading;
    IBOutlet UILabel *year_1;
    IBOutlet UILabel *year_2;
    IBOutlet UILabel *year_3;
    
    //working line.
    IBOutlet UIButton  *course_2;IBOutlet UIButton  *course_3;IBOutlet UIButton  *course_4;
    IBOutlet UIButton  *course_5;IBOutlet UIButton  *course_6;
    IBOutlet UIButton  *course_7;
    IBOutlet UIButton  *course_8;
    IBOutlet UIButton  *course_9;
    IBOutlet UIButton  *course_10;
    IBOutlet UIButton  *course_11;
    IBOutlet UIButton  *course_12;
    IBOutlet UIButton  *course_13;
    IBOutlet UIButton  *course_14;
    IBOutlet UIButton  *course_15;
    IBOutlet UIButton  *course_16;
    IBOutlet UIButton  *course_17;
    IBOutlet UIButton  *course_18;
    IBOutlet UIButton  *course_19;
    IBOutlet UIButton  *course_20;
    IBOutlet UIButton  *course_21;
    IBOutlet UIButton  *course_22;
    IBOutlet UIButton  *course_23;
    IBOutlet UIButton  *course_24;
    IBOutlet UIButton  *course_25;
    IBOutlet UIButton  *course_26;
    IBOutlet UIButton  *course_27;
    IBOutlet UIButton  *course_28;
    IBOutlet UIButton  *course_29;
    IBOutlet UIButton  *course_30;
    IBOutlet UIButton  *course_31;
    IBOutlet UIButton  *course_32;
    IBOutlet UIButton  *course_33;
    IBOutlet UIButton  *course_34;
    IBOutlet UIButton  *course_35;
    IBOutlet UIButton  *course_36;
    IBOutlet UIButton  *course_37;
    IBOutlet UIButton  *course_38;
    IBOutlet UIButton  *course_39;
    IBOutlet UIButton  *course_40;
    IBOutlet UIButton  *course_41;
    IBOutlet UIButton  *course_42;
    IBOutlet UIButton  *course_43;
    IBOutlet UIButton  *course_44;
    IBOutlet UIButton  *course_45;
    IBOutlet UIButton  *course_46;
    IBOutlet UIButton  *course_47;
    IBOutlet UIButton  *course_48;
    IBOutlet UIButton  *course_49;
    IBOutlet UIButton  *course_50;
    IBOutlet UIButton  *course_51;
    IBOutlet UIButton  *course_52;
    IBOutlet UIButton  *course_53;
    IBOutlet UIButton  *course_54;
    IBOutlet UIButton  *course_55;
    IBOutlet UIButton  *course_56;
    IBOutlet UIButton  *course_57;
    IBOutlet UIButton  *course_58;
    IBOutlet UIButton  *course_59;
    IBOutlet UIButton  *course_60;
    IBOutlet UIButton  *course_61;
    IBOutlet UIButton  *course_62;
    IBOutlet UIButton  *course_63;
    IBOutlet UIButton  *course_64;
    IBOutlet UIButton  *course_65;
    IBOutlet UIButton  *course_66;
    IBOutlet UIButton  *course_67;
    IBOutlet UIButton  *course_68;
    IBOutlet UIButton  *course_69;
    IBOutlet UIButton  *course_70;
    IBOutlet UIButton  *course_71;
    IBOutlet UIButton  *course_72;
    IBOutlet UIButton  *course_73;
    IBOutlet UIButton  *course_74;
    IBOutlet UIButton  *course_75;
    IBOutlet UIButton  *course_76;
    IBOutlet UIButton  *course_77;
    IBOutlet UIButton  *course_78;
    IBOutlet UIButton  *course_79;
    IBOutlet UIButton  *course_80;
    IBOutlet UIButton  *course_81;
    IBOutlet UIButton  *course_82;
    IBOutlet UIButton  *course_83;
    IBOutlet UIButton  *course_84;
    IBOutlet UIButton  *course_85;
    IBOutlet UIButton  *course_86;
    IBOutlet UIButton  *course_87;
    IBOutlet UIButton  *course_88;
    IBOutlet UIButton  *course_89;
    IBOutlet UIButton  *course_90;
    IBOutlet UIButton  *course_91;

    

    IBOutlet UILabel *points2_2012;
    IBOutlet UILabel *points3_2012;
    IBOutlet UILabel *points4_2012;
    IBOutlet UILabel *points5_2012;
    IBOutlet UILabel *points6_2012;
    IBOutlet UILabel *points7_2012;
    IBOutlet UILabel *points8_2012;
    IBOutlet UILabel *points9_2012;
    IBOutlet UILabel *points10_2012;
    IBOutlet UILabel *points11_2012;
    IBOutlet UILabel *points12_2012;
    IBOutlet UILabel *points13_2012;
    IBOutlet UILabel *points14_2012;
    IBOutlet UILabel *points15_2012;
    IBOutlet UILabel *points16_2012;
    IBOutlet UILabel *points17_2012;
    IBOutlet UILabel *points18_2012;
    IBOutlet UILabel *points19_2012;
    IBOutlet UILabel *points20_2012;
    IBOutlet UILabel *points21_2012;
    IBOutlet UILabel *points22_2012;
    IBOutlet UILabel *points23_2012;
    IBOutlet UILabel *points24_2012;
    IBOutlet UILabel *points25_2012;
    IBOutlet UILabel *points26_2012;
    IBOutlet UILabel *points27_2012;
    IBOutlet UILabel *points28_2012;
    IBOutlet UILabel *points29_2012;
    IBOutlet UILabel *points30_2012;
    IBOutlet UILabel *points31_2012;
    IBOutlet UILabel *points32_2012;
    IBOutlet UILabel *points33_2012;
    IBOutlet UILabel *points34_2012;
    IBOutlet UILabel *points35_2012;
    IBOutlet UILabel *points36_2012;
    IBOutlet UILabel *points37_2012;
    IBOutlet UILabel *points38_2012;
    IBOutlet UILabel *points39_2012;
    IBOutlet UILabel *points40_2012;
    IBOutlet UILabel *points41_2012;
    IBOutlet UILabel *points42_2012;
    IBOutlet UILabel *points43_2012;
    IBOutlet UILabel *points44_2012;
    IBOutlet UILabel *points45_2012;
    IBOutlet UILabel *points46_2012;
    IBOutlet UILabel *points47_2012;
    IBOutlet UILabel *points48_2012;
    IBOutlet UILabel *points49_2012;
    IBOutlet UILabel *points50_2012;
    IBOutlet UILabel *points51_2012;
    IBOutlet UILabel *points52_2012;
    IBOutlet UILabel *points53_2012;
    IBOutlet UILabel *points54_2012;
    IBOutlet UILabel *points55_2012;
    IBOutlet UILabel *points56_2012;
    IBOutlet UILabel *points57_2012;
    IBOutlet UILabel *points58_2012;
    IBOutlet UILabel *points59_2012;
    IBOutlet UILabel *points60_2012;
    IBOutlet UILabel *points61_2012;
    IBOutlet UILabel *points62_2012;
    IBOutlet UILabel *points63_2012;
    IBOutlet UILabel *points64_2012;
    IBOutlet UILabel *points65_2012;
    IBOutlet UILabel *points66_2012;
    IBOutlet UILabel *points67_2012;
    IBOutlet UILabel *points68_2012;
    IBOutlet UILabel *points69_2012;
    IBOutlet UILabel *points70_2012;
    IBOutlet UILabel *points71_2012;
    IBOutlet UILabel *points72_2012;
    IBOutlet UILabel *points73_2012;
    IBOutlet UILabel *points74_2012;
    IBOutlet UILabel *points75_2012;
    IBOutlet UILabel *points76_2012;
    IBOutlet UILabel *points77_2012;
    IBOutlet UILabel *points78_2012;
    IBOutlet UILabel *points79_2012;
    IBOutlet UILabel *points80_2012;
    IBOutlet UILabel *points81_2012;
    IBOutlet UILabel *points82_2012;
    IBOutlet UILabel *points83_2012;
    IBOutlet UILabel *points84_2012;
    IBOutlet UILabel *points85_2012;
    IBOutlet UILabel *points86_2012;
    IBOutlet UILabel *points87_2012;
    IBOutlet UILabel *points88_2012;
    IBOutlet UILabel *points89_2012;
    IBOutlet UILabel *points90_2012;
    IBOutlet UILabel *points91_2012;
    
    
    IBOutlet UILabel *points1_2011;
    IBOutlet UILabel *points2_2011;
    IBOutlet UILabel *points3_2011;
    IBOutlet UILabel *points4_2011;
    IBOutlet UILabel *points5_2011;
    IBOutlet UILabel *points6_2011;
    IBOutlet UILabel *points7_2011;
    IBOutlet UILabel *points8_2011;
    IBOutlet UILabel *points9_2011;
    IBOutlet UILabel *points10_2011;
    IBOutlet UILabel *points11_2011;
    IBOutlet UILabel *points12_2011;
    IBOutlet UILabel *points13_2011;
    IBOutlet UILabel *points14_2011;
    IBOutlet UILabel *points15_2011;
    IBOutlet UILabel *points16_2011;
    IBOutlet UILabel *points17_2011;
    IBOutlet UILabel *points18_2011;
    IBOutlet UILabel *points19_2011;
    IBOutlet UILabel *points20_2011;
    IBOutlet UILabel *points21_2011;
    IBOutlet UILabel *points22_2011;
    IBOutlet UILabel *points23_2011;
    IBOutlet UILabel *points24_2011;
    IBOutlet UILabel *points25_2011;
    IBOutlet UILabel *points26_2011;
    IBOutlet UILabel *points27_2011;
    IBOutlet UILabel *points28_2011;
    IBOutlet UILabel *points29_2011;
    IBOutlet UILabel *points30_2011;
    IBOutlet UILabel *points31_2011;
    IBOutlet UILabel *points32_2011;
    IBOutlet UILabel *points33_2011;
    IBOutlet UILabel *points34_2011;
    IBOutlet UILabel *points35_2011;
    IBOutlet UILabel *points36_2011;
    IBOutlet UILabel *points37_2011;
    IBOutlet UILabel *points38_2011;
    IBOutlet UILabel *points39_2011;
    IBOutlet UILabel *points40_2011;
    IBOutlet UILabel *points41_2011;
    IBOutlet UILabel *points42_2011;
    IBOutlet UILabel *points43_2011;
    IBOutlet UILabel *points44_2011;
    IBOutlet UILabel *points45_2011;
    IBOutlet UILabel *points46_2011;
    IBOutlet UILabel *points47_2011;
    IBOutlet UILabel *points48_2011;
    IBOutlet UILabel *points49_2011;
    IBOutlet UILabel *points50_2011;
    IBOutlet UILabel *points51_2011;
    IBOutlet UILabel *points52_2011;
    IBOutlet UILabel *points53_2011;
    IBOutlet UILabel *points54_2011;
    IBOutlet UILabel *points55_2011;
    IBOutlet UILabel *points56_2011;
    IBOutlet UILabel *points57_2011;
    IBOutlet UILabel *points58_2011;
    IBOutlet UILabel *points59_2011;
    IBOutlet UILabel *points60_2011;
    IBOutlet UILabel *points61_2011;
    IBOutlet UILabel *points62_2011;
    IBOutlet UILabel *points63_2011;
    IBOutlet UILabel *points64_2011;
    IBOutlet UILabel *points65_2011;
    IBOutlet UILabel *points66_2011;
    IBOutlet UILabel *points67_2011;
    IBOutlet UILabel *points68_2011;
    IBOutlet UILabel *points69_2011;
    IBOutlet UILabel *points70_2011;
    IBOutlet UILabel *points71_2011;
    IBOutlet UILabel *points72_2011;
    IBOutlet UILabel *points73_2011;
    IBOutlet UILabel *points74_2011;
    IBOutlet UILabel *points75_2011;
    IBOutlet UILabel *points76_2011;
    IBOutlet UILabel *points77_2011;
    IBOutlet UILabel *points78_2011;
    IBOutlet UILabel *points79_2011;
    IBOutlet UILabel *points80_2011;
    IBOutlet UILabel *points81_2011;
    IBOutlet UILabel *points82_2011;
    IBOutlet UILabel *points83_2011;
    IBOutlet UILabel *points84_2011;
    IBOutlet UILabel *points85_2011;
    IBOutlet UILabel *points86_2011;
    IBOutlet UILabel *points87_2011;
    IBOutlet UILabel *points88_2011;
    IBOutlet UILabel *points89_2011;
    IBOutlet UILabel *points90_2011;
    IBOutlet UILabel *points91_2011;
    
    
    
    IBOutlet UILabel *points2_2010;
    IBOutlet UILabel *points3_2010;
    IBOutlet UILabel *points4_2010;
    IBOutlet UILabel *points5_2010;
    IBOutlet UILabel *points6_2010;
    IBOutlet UILabel *points7_2010;
    IBOutlet UILabel *points8_2010;
    IBOutlet UILabel *points9_2010;
    IBOutlet UILabel *points10_2010;
    IBOutlet UILabel *points11_2010;
    IBOutlet UILabel *points12_2010;
    IBOutlet UILabel *points13_2010;
    IBOutlet UILabel *points14_2010;
    IBOutlet UILabel *points15_2010;
    IBOutlet UILabel *points16_2010;
    IBOutlet UILabel *points17_2010;
    IBOutlet UILabel *points18_2010;
    IBOutlet UILabel *points19_2010;
    IBOutlet UILabel *points20_2010;
    IBOutlet UILabel *points21_2010;
    IBOutlet UILabel *points22_2010;
    IBOutlet UILabel *points23_2010;
    IBOutlet UILabel *points24_2010;
    IBOutlet UILabel *points25_2010;
    IBOutlet UILabel *points26_2010;
    IBOutlet UILabel *points27_2010;
    IBOutlet UILabel *points28_2010;
    IBOutlet UILabel *points29_2010;
    IBOutlet UILabel *points30_2010;
    IBOutlet UILabel *points31_2010;
    IBOutlet UILabel *points32_2010;
    IBOutlet UILabel *points33_2010;
    IBOutlet UILabel *points34_2010;
    IBOutlet UILabel *points35_2010;
    IBOutlet UILabel *points36_2010;
    IBOutlet UILabel *points37_2010;
    IBOutlet UILabel *points38_2010;
    IBOutlet UILabel *points39_2010;
    IBOutlet UILabel *points40_2010;
    IBOutlet UILabel *points41_2010;
    IBOutlet UILabel *points42_2010;
    IBOutlet UILabel *points43_2010;
    IBOutlet UILabel *points44_2010;
    IBOutlet UILabel *points45_2010;
    IBOutlet UILabel *points46_2010;
    IBOutlet UILabel *points47_2010;
    IBOutlet UILabel *points48_2010;
    IBOutlet UILabel *points49_2010;
    IBOutlet UILabel *points50_2010;
    IBOutlet UILabel *points51_2010;
    IBOutlet UILabel *points52_2010;
    IBOutlet UILabel *points53_2010;
    IBOutlet UILabel *points54_2010;
    IBOutlet UILabel *points55_2010;
    IBOutlet UILabel *points56_2010;
    IBOutlet UILabel *points57_2010;
    IBOutlet UILabel *points58_2010;
    IBOutlet UILabel *points59_2010;
    IBOutlet UILabel *points60_2010;
    IBOutlet UILabel *points61_2010;
    IBOutlet UILabel *points62_2010;
    IBOutlet UILabel *points63_2010;
    IBOutlet UILabel *points64_2010;
    IBOutlet UILabel *points65_2010;
    IBOutlet UILabel *points66_2010;
    IBOutlet UILabel *points67_2010;
    IBOutlet UILabel *points68_2010;
    IBOutlet UILabel *points69_2010;
    IBOutlet UILabel *points70_2010;
    IBOutlet UILabel *points71_2010;
    IBOutlet UILabel *points72_2010;
    IBOutlet UILabel *points73_2010;
    IBOutlet UILabel *points74_2010;
    IBOutlet UILabel *points75_2010;
    IBOutlet UILabel *points76_2010;
    IBOutlet UILabel *points77_2010;
    IBOutlet UILabel *points78_2010;
    IBOutlet UILabel *points79_2010;
    IBOutlet UILabel *points80_2010;
    IBOutlet UILabel *points81_2010;
    IBOutlet UILabel *points82_2010;
    IBOutlet UILabel *points83_2010;
    IBOutlet UILabel *points84_2010;
    IBOutlet UILabel *points85_2010;
    IBOutlet UILabel *points86_2010;
    IBOutlet UILabel *points87_2010;
    IBOutlet UILabel *points88_2010;
    IBOutlet UILabel *points89_2010;
    IBOutlet UILabel *points90_2010;
    IBOutlet UILabel *points91_2010;
    
}

-(void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event;

-(IBAction)namePressed:(UIButton *)sender;

@end



