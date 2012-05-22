//
//  ChessBoardView.h
//  Chess
//
//  Created by Sriram Viswanathan on 5/19/12.
//  Copyright (c) 2012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChessConstants.h"
#import "ChessBoardLayout.h"

@interface ChessBoardView : UIView {
    UIView *squareBlocks;
    UIView *pieceBlocks;
    
    NSMutableDictionary *pieces;
}

- (void) initLayout: (ChessBoardLayout *)chessBoardLayout;
- (void) refreshLayout: (ChessBoardLayout *)chessBoardLayout revealedPieces: (NSMutableArray *)revealedPieces;

@end
