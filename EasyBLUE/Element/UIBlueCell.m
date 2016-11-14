//
//  UIBlueCell.m
//  EasyBLUE
//
//  Created by Lorain on 2016/11/14.
//  Copyright © 2016年 LorainLynies. All rights reserved.
//

#import "UIBlueCell.h"

@implementation UIBlueCell

- (void)createWithAdvData:(NSDictionary *)advdata RSSI:(NSNumber *)rssi ID:(NSString *)identifer Status:(BOOL)newState
{
    self.advData = advdata;
    self.RSSI = rssi;
    self.ID = identifer;
    self.state = newState;
    
    CGFloat sx = self.bounds.size.width;
    
    UIView*  showSignal = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SIGNAL_WIDTH , SIGNAL_HEIGHT)];
    UILabel* showName = [[UILabel alloc] initWithFrame:CGRectMake(SIGNAL_WIDTH, 0, sx - SIGNAL_WIDTH, NAME_HEIGHT)];
    UILabel* showAdv  = [[UILabel alloc] initWithFrame:CGRectMake(SIGNAL_WIDTH, NAME_HEIGHT, sx - SIGNAL_WIDTH, ADV_HEIGHT)];
    UILabel* showID   = [[UILabel alloc] initWithFrame:CGRectMake(0, NAME_HEIGHT + ADV_HEIGHT, sx,ID_HEIGHT)];
    
    showSignal.backgroundColor = [UIColor greenColor];
    showName.backgroundColor = [UIColor blueColor];
    showAdv.backgroundColor = [UIColor grayColor];
    showID.backgroundColor = [UIColor purpleColor];
    
    [self addSubview:showSignal];
    [self addSubview:showName];
    [self addSubview:showAdv];
    [self addSubview:showID];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
