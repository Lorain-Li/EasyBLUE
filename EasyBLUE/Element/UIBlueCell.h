//
//  UIBlueCell.h
//  EasyBLUE
//
//  Created by Lorain on 2016/11/14.
//  Copyright © 2016年 LorainLynies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBlueCell : UIView
@property (retain,nonatomic) NSDictionary   *advData;
@property (retain,nonatomic) NSNumber       *RSSI;
@property (retain,nonatomic) NSString       *ID;
@property (nonatomic)        BOOL           state;
- (void) createWithAdvData:(NSDictionary *)advdata RSSI:(NSNumber *)rssi ID:(NSString *)identifer Status:(BOOL) newState;

@end


#define SIGNAL_WIDTH        (40)
#define SIGNAL_HEIGHT       (40)
#define NAME_HEIGHT         (20)
#define ADV_HEIGHT          (30)
#define ID_HEIGHT           (10)
