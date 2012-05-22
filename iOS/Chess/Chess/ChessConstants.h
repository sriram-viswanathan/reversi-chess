//
//  ChessConstants.h
//  Chess
//
//  Created by Yahoo on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#define SQUARE_SIZE 40
#define CHESS_BLOCKS 64
#define CHESS_CONTAINER_Y_LOCATION 70 //from ChessViewController boardContainer

#define CHESS_PIECE_MOVED @"chessPieceMoved"
#define CHESS_PIECE_DROPPED @"chessPieceDropped"

extern NSString *const WHITE_KING;
extern NSString *const WHITE_QUEEN;
extern NSString *const WHITE_BISHOP;
extern NSString *const WHITE_KNIGHT;
extern NSString *const WHITE_ROOK;
extern NSString *const WHITE_PAWN;

extern NSString *const BLACK_KING;
extern NSString *const BLACK_QUEEN;
extern NSString *const BLACK_BISHOP;
extern NSString *const BLACK_KNIGHT;
extern NSString *const BLACK_ROOK;
extern NSString *const BLACK_PAWN;

extern NSString *const EMPTY;

@interface ChessConstants

@end
