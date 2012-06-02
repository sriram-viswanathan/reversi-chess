//
//  ChessConstants.m
//  Chess
//
//  Created by Yahoo on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ChessConstants.h"

// Ids for the white pieces
NSString *const WHITE_KING =   @"wk";
NSString *const WHITE_QUEEN =  @"wq";
NSString *const WHITE_BISHOP_ON_WHITE = @"wbw";
NSString *const WHITE_BISHOP_ON_BLACK = @"wbb";
NSString *const WHITE_KNIGHT_1 = @"wn1";
NSString *const WHITE_KNIGHT_2 = @"wn2";
NSString *const WHITE_ROOK_1 = @"wr1";
NSString *const WHITE_ROOK_2 = @"wr2";
NSString *const WHITE_PAWN_1 = @"wp1";
NSString *const WHITE_PAWN_2 = @"wp2";
NSString *const WHITE_PAWN_3 = @"wp3";
NSString *const WHITE_PAWN_4 = @"wp4";
NSString *const WHITE_PAWN_5 = @"wp5";
NSString *const WHITE_PAWN_6 = @"wp6";
NSString *const WHITE_PAWN_7 = @"wp7";
NSString *const WHITE_PAWN_8 = @"wp8";

// Ids for the black pieces
NSString *const BLACK_KING = @"bk";
NSString *const BLACK_QUEEN = @"bq";
NSString *const BLACK_BISHOP_ON_WHITE = @"bbw";
NSString *const BLACK_BISHOP_ON_BLACK = @"bbb";
NSString *const BLACK_KNIGHT_1 = @"bn1";
NSString *const BLACK_KNIGHT_2 = @"bn2";
NSString *const BLACK_ROOK_1 = @"br1";
NSString *const BLACK_ROOK_2 = @"br2";
NSString *const BLACK_PAWN_1 = @"bp1";
NSString *const BLACK_PAWN_2 = @"bp2";
NSString *const BLACK_PAWN_3 = @"bp3";
NSString *const BLACK_PAWN_4 = @"bp4";
NSString *const BLACK_PAWN_5 = @"bp5";
NSString *const BLACK_PAWN_6 = @"bp6";
NSString *const BLACK_PAWN_7 = @"bp7";
NSString *const BLACK_PAWN_8 = @"bp8";

// ID for the an empty space
NSString *const EMPTY =   @"em";

@implementation ChessConstants

@synthesize piecesPositionBlocks;
@synthesize piecesPositionCoordinates;

- (void) convertBlocksToCoordinates: (NSMutableArray *)pieceBlocks {
    
    /**
     Assuming that pieceBlocks contains CHESS_BLOCKS elements
     **/
    
    NSMutableDictionary *tempDictinary;
    piecesPositionCoordinates = [[NSMutableArray alloc] init];
    
    for (int i=0; i<CHESS_ROW_COUNT; i++) {
        
        tempDictinary = [[NSMutableDictionary alloc] init];
        
        for (int j=0; j<CHESS_COLUMN_COUNT; j++) {
            
            [tempDictinary setValue:[pieceBlocks objectAtIndex:((i * CHESS_ROW_COUNT) + j)] forKey:[NSString stringWithFormat:@"%i", j]];
            
        }
        
        [piecesPositionCoordinates addObject:tempDictinary];
    }
    
}

- (void) convertCoordinatesToBlocks: (NSMutableArray *)pieceCoordinates {
    for (NSMutableDictionary *pieceBlocks in pieceCoordinates) {
        [piecesPositionBlocks setValue:@"" forKey:@""];
    }
}

@end
