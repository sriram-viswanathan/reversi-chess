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
    NSString *selectedPiece;
    NSArray *possibleMoves;
    
    IBOutlet UIView *boardContainer;
    IBOutlet UIButton *randomizeButton;
}

@property (nonatomic,retain) IBOutlet UIView *boardContainer;
@property (nonatomic,retain) IBOutlet UIButton *randomizeButton;
@property (nonatomic,retain) IBOutlet ChessBoardView *chessBoardView;
@property (nonatomic,retain) IBOutlet ChessBoardLayout *chessBoardLayout;

@property (nonatomic, retain) IBOutlet NSMutableArray *revealedPieces;

- (IBAction) newGame;

@end
