//
//  ChessPiece.h
//  Chess
//
//  Created by Sriram Viswanathan on 5/19/12.
//  Copyright (c) 2012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChessConstants.h"

@interface ChessPiece : UIButton {
    unsigned int blockNumber;
    NSString *pieceType;
}

@property (nonatomic, retain) NSString *pieceType;

- (id) initWithPiece: (NSString *)type;
- (void) positionPiece: (unsigned int)inBlockNumber;
- (void) makePieceVisible: (unsigned int)inBlockNumber;

@end
