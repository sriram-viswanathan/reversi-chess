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
#define CHESS_ROW_COUNT 8
#define CHESS_COLUMN_COUNT 8

#define CHESS_PIECE_LIFTED @"chessPieceLifted"
#define CHESS_PIECE_MOVED @"chessPieceMoved"
#define CHESS_PIECE_DROPPED @"chessPieceDropped"

extern NSString *const WHITE_KING;
extern NSString *const WHITE_QUEEN;
extern NSString *const WHITE_BISHOP_ON_WHITE;
extern NSString *const WHITE_BISHOP_ON_BLACK;
extern NSString *const WHITE_KNIGHT_1;
extern NSString *const WHITE_KNIGHT_2;
extern NSString *const WHITE_ROOK_1;
extern NSString *const WHITE_ROOK_2;
extern NSString *const WHITE_PAWN_1;
extern NSString *const WHITE_PAWN_2;
extern NSString *const WHITE_PAWN_3;
extern NSString *const WHITE_PAWN_4;
extern NSString *const WHITE_PAWN_5;
extern NSString *const WHITE_PAWN_6;
extern NSString *const WHITE_PAWN_7;
extern NSString *const WHITE_PAWN_8;

extern NSString *const BLACK_KING;
extern NSString *const BLACK_QUEEN;
extern NSString *const BLACK_BISHOP_ON_WHITE;
extern NSString *const BLACK_BISHOP_ON_BLACK;
extern NSString *const BLACK_KNIGHT_1;
extern NSString *const BLACK_KNIGHT_2;
extern NSString *const BLACK_ROOK_1;
extern NSString *const BLACK_ROOK_2;
extern NSString *const BLACK_PAWN_1;
extern NSString *const BLACK_PAWN_2;
extern NSString *const BLACK_PAWN_3;
extern NSString *const BLACK_PAWN_4;
extern NSString *const BLACK_PAWN_5;
extern NSString *const BLACK_PAWN_6;
extern NSString *const BLACK_PAWN_7;
extern NSString *const BLACK_PAWN_8;

extern NSString *const EMPTY;

@interface ChessConstants : NSObject {
    NSMutableArray *piecesPositionCoordinates;
    NSMutableArray *piecesPositionBlocks;
}

@property(nonatomic, retain) NSMutableArray *piecesPositionCoordinates;
@property(nonatomic, retain) NSMutableArray *piecesPositionBlocks;

- (void) convertBlocksToCoordinates: (NSMutableArray *)pieceBlocks;
- (void) convertCoordinatesToBlocks: (NSMutableDictionary *)pieceCoordinates;

@end
