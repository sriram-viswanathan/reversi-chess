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
    
    NSMutableDictionary *pieces;
    NSMutableArray *piecesArrayToUse;
}

- (void) initLayout: (ChessBoardLayout *)chessBoardLayout randomizePieces:(BOOL) randomizePieces;
- (void) clearLayout;
- (void) refreshLayout: (ChessBoardLayout *)chessBoardLayout revealedPieces: (NSMutableArray *)revealedPieces;
- (void) highlightBlocks: (NSArray *)blockNumbers removeHighlighting: (BOOL) removeHighlighting;


@end
