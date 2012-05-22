//
//  ChessViewController.h
//  Chess
//
//  Created by Sriram Viswanathan on 5/19/12.
//  Copyright (c) 2012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChessBoardView.h"
#import "ChessBoardLayout.h"

@interface ChessViewController : UIViewController {
    ChessBoardView *chessBoardView;
    ChessBoardLayout *chessBoardLayout;
    
    NSMutableArray *revealedPieces;
    
    IBOutlet UIView *boardContainer;
}

@property (nonatomic,retain) IBOutlet UIView *boardContainer;
@property (nonatomic,retain) IBOutlet ChessBoardView *chessBoardView;
@property (nonatomic,retain) IBOutlet ChessBoardLayout *chessBoardLayout;

@property (nonatomic, retain) IBOutlet NSMutableArray *revealedPieces;

@end
