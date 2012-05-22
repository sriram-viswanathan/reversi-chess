//
//  ChessBoardLayout.m
//  Chess
//
//  Created by Sriram Viswanathan on 5/19/12.
//  Copyright (c) 2012. All rights reserved.
//

#import "ChessConstants.h"
#import "ChessBoardLayout.h"

@implementation ChessBoardLayout

@synthesize pieces;

- (id) init {
    pieces = [[NSMutableArray alloc] initWithCapacity:CHESS_BLOCKS];
    return self;
}

-(void) clear {
	[pieces removeAllObjects];
    
	for (int i=0; i < CHESS_BLOCKS; i++) {
		[pieces insertObject:EMPTY atIndex:i];
	}
}

-(void) reset {
	[self clear];
	// Setup the white power pieces
	[pieces replaceObjectAtIndex:0 withObject:WHITE_ROOK];
	[pieces replaceObjectAtIndex:1 withObject:WHITE_KNIGHT];
	[pieces replaceObjectAtIndex:2 withObject:WHITE_BISHOP];
	[pieces replaceObjectAtIndex:3 withObject:WHITE_QUEEN];
	[pieces replaceObjectAtIndex:4 withObject:WHITE_KING];
	[pieces replaceObjectAtIndex:5 withObject:WHITE_BISHOP];
	[pieces replaceObjectAtIndex:6 withObject:WHITE_KNIGHT];
	[pieces replaceObjectAtIndex:7 withObject:WHITE_ROOK];
    
	// Setup the white pawns
	for (int i=8; i < 16; i++) {
		[pieces replaceObjectAtIndex:i withObject:WHITE_PAWN];
	}
    
	// Setup the black pawns
	for (int i=48; i < 56; i++) {
		[pieces replaceObjectAtIndex:i withObject:BLACK_PAWN];
	}
    
	// Setup the black power pieces
	[pieces replaceObjectAtIndex:56 withObject:BLACK_ROOK];
	[pieces replaceObjectAtIndex:57 withObject:BLACK_KNIGHT];
	[pieces replaceObjectAtIndex:58 withObject:BLACK_BISHOP];
	[pieces replaceObjectAtIndex:59 withObject:BLACK_QUEEN];
	[pieces replaceObjectAtIndex:60 withObject:BLACK_KING];
	[pieces replaceObjectAtIndex:61 withObject:BLACK_BISHOP];
	[pieces replaceObjectAtIndex:62 withObject:BLACK_KNIGHT];
	[pieces replaceObjectAtIndex:63 withObject:BLACK_ROOK];
}

@end
