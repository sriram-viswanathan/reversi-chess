//
//  ChessBoardLayout.h
//  Chess
//
//  Created by Sriram Viswanathan on 5/19/12.
//  Copyright (c) 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChessBoardLayout : NSObject {
    NSMutableArray *pieces;
}

@property (nonatomic, retain) NSMutableArray *pieces;

-(void) clear;
-(void) reset;

@end
