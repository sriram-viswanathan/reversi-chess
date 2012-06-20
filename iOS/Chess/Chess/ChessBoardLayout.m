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

@synthesize chessPiecesDefaultPositions;
@synthesize chessPiecesRandomizedPositions;
@synthesize finalLayoutPositions;

- (id) init {
    chessPiecesDefaultPositions = [[NSMutableArray alloc] initWithCapacity:CHESS_BLOCKS];
    chessPiecesRandomizedPositions = [[NSMutableArray alloc] initWithCapacity:CHESS_BLOCKS];
    return self;
}

-(void) clear {
	[chessPiecesDefaultPositions removeAllObjects];
    
	for (int i=0; i < CHESS_BLOCKS; i++) {
		[chessPiecesDefaultPositions insertObject:EMPTY atIndex:i];
        [chessPiecesRandomizedPositions insertObject:EMPTY atIndex:i];
	}
}

/**
 This method resets to the default chess board layout
 with all pieces in their respective positions
 */
-(void) reset {
	[self clear];
	// Setup the white power pieces
	[chessPiecesDefaultPositions replaceObjectAtIndex:0 withObject:WHITE_ROOK_1];
	[chessPiecesDefaultPositions replaceObjectAtIndex:1 withObject:WHITE_KNIGHT_1];
	[chessPiecesDefaultPositions replaceObjectAtIndex:2 withObject:WHITE_BISHOP_ON_BLACK];
	[chessPiecesDefaultPositions replaceObjectAtIndex:3 withObject:WHITE_QUEEN];
	[chessPiecesDefaultPositions replaceObjectAtIndex:4 withObject:WHITE_KING];
	[chessPiecesDefaultPositions replaceObjectAtIndex:5 withObject:WHITE_BISHOP_ON_WHITE];
	[chessPiecesDefaultPositions replaceObjectAtIndex:6 withObject:WHITE_KNIGHT_2];
	[chessPiecesDefaultPositions replaceObjectAtIndex:7 withObject:WHITE_ROOK_2];
    
    // Setup the white pawns
    [chessPiecesDefaultPositions replaceObjectAtIndex:8 withObject:WHITE_PAWN_1];
    [chessPiecesDefaultPositions replaceObjectAtIndex:9 withObject:WHITE_PAWN_2];
    [chessPiecesDefaultPositions replaceObjectAtIndex:10 withObject:WHITE_PAWN_3];
    [chessPiecesDefaultPositions replaceObjectAtIndex:11 withObject:WHITE_PAWN_4];
    [chessPiecesDefaultPositions replaceObjectAtIndex:12 withObject:WHITE_PAWN_5];
    [chessPiecesDefaultPositions replaceObjectAtIndex:13 withObject:WHITE_PAWN_6];
    [chessPiecesDefaultPositions replaceObjectAtIndex:14 withObject:WHITE_PAWN_7];
    [chessPiecesDefaultPositions replaceObjectAtIndex:15 withObject:WHITE_PAWN_8];
    
	// Setup the black pawns
    [chessPiecesDefaultPositions replaceObjectAtIndex:48 withObject:BLACK_PAWN_1];
    [chessPiecesDefaultPositions replaceObjectAtIndex:49 withObject:BLACK_PAWN_2];
    [chessPiecesDefaultPositions replaceObjectAtIndex:50 withObject:BLACK_PAWN_3];
    [chessPiecesDefaultPositions replaceObjectAtIndex:51 withObject:BLACK_PAWN_4];
    [chessPiecesDefaultPositions replaceObjectAtIndex:52 withObject:BLACK_PAWN_5];
    [chessPiecesDefaultPositions replaceObjectAtIndex:53 withObject:BLACK_PAWN_6];
    [chessPiecesDefaultPositions replaceObjectAtIndex:54 withObject:BLACK_PAWN_7];
    [chessPiecesDefaultPositions replaceObjectAtIndex:55 withObject:BLACK_PAWN_8];
    
	// Setup the black power pieces
	[chessPiecesDefaultPositions replaceObjectAtIndex:56 withObject:BLACK_ROOK_1];
	[chessPiecesDefaultPositions replaceObjectAtIndex:57 withObject:BLACK_KNIGHT_1];
	[chessPiecesDefaultPositions replaceObjectAtIndex:58 withObject:BLACK_BISHOP_ON_WHITE];
	[chessPiecesDefaultPositions replaceObjectAtIndex:59 withObject:BLACK_QUEEN];
	[chessPiecesDefaultPositions replaceObjectAtIndex:60 withObject:BLACK_KING];
	[chessPiecesDefaultPositions replaceObjectAtIndex:61 withObject:BLACK_BISHOP_ON_BLACK];
	[chessPiecesDefaultPositions replaceObjectAtIndex:62 withObject:BLACK_KNIGHT_2];
	[chessPiecesDefaultPositions replaceObjectAtIndex:63 withObject:BLACK_ROOK_2];
    
    finalLayoutPositions = chessPiecesDefaultPositions;
}

/**
 All these randomize position naming is done based on the fact that
 white side is towards the top of the screen / board
 and black side is towards the bottom of the screen / board
 
 Also, the first chess block is a dark box (i.e 0,0 ) and the next one is light box
 */

- (void) randomizePieces {
    
    NSArray *whitePawns = [[NSArray alloc] initWithObjects:WHITE_PAWN_1, WHITE_PAWN_2, WHITE_PAWN_3, WHITE_PAWN_4, WHITE_PAWN_5, WHITE_PAWN_6, WHITE_PAWN_7, WHITE_PAWN_8, nil];
    
    NSArray *blackPawns = [[NSArray alloc] initWithObjects:BLACK_PAWN_1, BLACK_PAWN_2, BLACK_PAWN_3, BLACK_PAWN_4, BLACK_PAWN_5, BLACK_PAWN_6, BLACK_PAWN_7, BLACK_PAWN_8, nil];
    
    int requirePawnIndex = 0;
    
    for (int i=0; i<CHESS_BLOCKS; i++) {
        
        if ([chessPiecesDefaultPositions objectAtIndex:i] == WHITE_ROOK_1) {
            
            [chessPiecesRandomizedPositions replaceObjectAtIndex:[self randomizeRookPosition] withObject:WHITE_ROOK_1];
        
        } else if ([chessPiecesDefaultPositions objectAtIndex:i] == WHITE_ROOK_2) {
            
            [chessPiecesRandomizedPositions replaceObjectAtIndex:[self randomizeRookPosition] withObject:WHITE_ROOK_2];
            
        } else if ([chessPiecesDefaultPositions objectAtIndex:i] == WHITE_KNIGHT_1) {
            
            [chessPiecesRandomizedPositions replaceObjectAtIndex:[self randomizeKnightPosition] withObject:WHITE_KNIGHT_1];
            
        } else if ([chessPiecesDefaultPositions objectAtIndex:i] == WHITE_KNIGHT_2) {
            
            [chessPiecesRandomizedPositions replaceObjectAtIndex:[self randomizeKnightPosition] withObject:WHITE_KNIGHT_2];
            
        } else if ([chessPiecesDefaultPositions objectAtIndex:i] == WHITE_BISHOP_ON_WHITE) {
            
            [chessPiecesRandomizedPositions replaceObjectAtIndex:[self randomizeBishopPositionOnWhiteSquare] withObject:WHITE_BISHOP_ON_WHITE];
            
        } else if ([chessPiecesDefaultPositions objectAtIndex:i] == WHITE_QUEEN) {
            
            [chessPiecesRandomizedPositions replaceObjectAtIndex:[self randomizeQueenPosition] withObject:WHITE_QUEEN];
            
        } else if ([chessPiecesDefaultPositions objectAtIndex:i] == WHITE_KING) {
            
            [chessPiecesRandomizedPositions replaceObjectAtIndex:[self randomizeWhiteKingPosition] withObject:WHITE_KING];
        
        } else if ([chessPiecesDefaultPositions objectAtIndex:i] == WHITE_BISHOP_ON_BLACK) {
            
            [chessPiecesRandomizedPositions replaceObjectAtIndex:[self randomizeBishopPositionOnBlackSquare] withObject:WHITE_BISHOP_ON_BLACK];
            
        } else if ([whitePawns containsObject:[chessPiecesDefaultPositions objectAtIndex:i]]) {
            
            requirePawnIndex = [whitePawns indexOfObject:[chessPiecesDefaultPositions objectAtIndex:i]];
            
            [chessPiecesRandomizedPositions replaceObjectAtIndex:[self randomizeWhitePawnPosition] withObject:[whitePawns objectAtIndex:requirePawnIndex]];

            
        } else if ([chessPiecesDefaultPositions objectAtIndex:i] == BLACK_ROOK_1) {
            
            [chessPiecesRandomizedPositions replaceObjectAtIndex:[self randomizeRookPosition] withObject:BLACK_ROOK_1];
            
        } else if ([chessPiecesDefaultPositions objectAtIndex:i] == BLACK_ROOK_2) {
            
            [chessPiecesRandomizedPositions replaceObjectAtIndex:[self randomizeRookPosition] withObject:BLACK_ROOK_2];
            
        } else if ([chessPiecesDefaultPositions objectAtIndex:i] == BLACK_KNIGHT_1) {
            
            [chessPiecesRandomizedPositions replaceObjectAtIndex:[self randomizeKnightPosition] withObject:BLACK_KNIGHT_1];
        
        } else if ([chessPiecesDefaultPositions objectAtIndex:i] == BLACK_KNIGHT_2) {
            
            [chessPiecesRandomizedPositions replaceObjectAtIndex:[self randomizeKnightPosition] withObject:BLACK_KNIGHT_2];
            
        } else if ([chessPiecesDefaultPositions objectAtIndex:i] == BLACK_BISHOP_ON_WHITE) {
            
            [chessPiecesRandomizedPositions replaceObjectAtIndex:[self randomizeBishopPositionOnWhiteSquare] withObject:BLACK_BISHOP_ON_WHITE];
            
        } else if ([chessPiecesDefaultPositions objectAtIndex:i] == BLACK_QUEEN) {
            
            [chessPiecesRandomizedPositions replaceObjectAtIndex:[self randomizeQueenPosition] withObject:BLACK_QUEEN];
            
        } else if ([chessPiecesDefaultPositions objectAtIndex:i] == BLACK_KING) {
            
            [chessPiecesRandomizedPositions replaceObjectAtIndex:[self randomizeBlackKingPosition] withObject:BLACK_KING];
            
        } else if ([chessPiecesDefaultPositions objectAtIndex:i] == BLACK_BISHOP_ON_BLACK) {
            
            [chessPiecesRandomizedPositions replaceObjectAtIndex:[self randomizeBishopPositionOnBlackSquare] withObject:BLACK_BISHOP_ON_BLACK];
            
        } else if ([blackPawns containsObject:[chessPiecesDefaultPositions objectAtIndex:i]]) {
            
            requirePawnIndex = [blackPawns indexOfObject:[chessPiecesDefaultPositions objectAtIndex:i]];
            
            [chessPiecesRandomizedPositions replaceObjectAtIndex:[self randomizeBlackPawnPosition] withObject:[blackPawns objectAtIndex:requirePawnIndex]];
            
        }
        
    }
    
    finalLayoutPositions = chessPiecesRandomizedPositions;
}

- (int) randomizeBishopPositionOnBlackSquare {
    //first get all the unoccupied Black colored squares into an array
    int blockNumber;
    NSMutableArray *allowedPositions = [[NSMutableArray alloc] init];
    BOOL rowStartsWithWhiteBlock;
    
    for (int i=0; i<CHESS_ROW_COUNT; i++) {
        
        if (i%2 == 0) {
            rowStartsWithWhiteBlock = NO;
        } else {
            rowStartsWithWhiteBlock = YES;
        }
        
        for (int j=0; j<CHESS_COLUMN_COUNT; j++) {
            
            blockNumber = (i * CHESS_ROW_COUNT) + j;
            
            if ([chessPiecesRandomizedPositions objectAtIndex:blockNumber] == EMPTY) {
            
                if (rowStartsWithWhiteBlock) {
                    if (j%2 != 0) {
                        [allowedPositions addObject:[NSString stringWithFormat:@"%i", blockNumber]];
                    }
                } else {
                    if (j%2 == 0) {
                        [allowedPositions addObject:[NSString stringWithFormat:@"%i", blockNumber]];
                    }
                }
            }
        }
    }
    
    return [[allowedPositions objectAtIndex:random() % [allowedPositions count]] intValue];
}

- (int) randomizeBishopPositionOnWhiteSquare {
    //first get all the unoccupied Black colored squares into an array
    int blockNumber;
    NSMutableArray *allowedPositions = [[NSMutableArray alloc] init];
    BOOL rowStartsWithWhiteBlock;
    
    for (int i=0; i<8; i++) {
        
        if (i%2 == 0) {
            rowStartsWithWhiteBlock = NO;
        } else {
            rowStartsWithWhiteBlock = YES;
        }
        
        for (int j=0; j<8; j++) {
            
            blockNumber = (i * CHESS_ROW_COUNT) + j;
            
            if ([chessPiecesRandomizedPositions objectAtIndex:blockNumber] == EMPTY) {
                if (rowStartsWithWhiteBlock) {
                    if (j%2 == 0) {
                        [allowedPositions addObject:[NSString stringWithFormat:@"%i", blockNumber]];
                    }
                } else {
                    if (j%2 != 0) {
                        [allowedPositions addObject:[NSString stringWithFormat:@"%i", blockNumber]];
                    }
                }
            }
        }
    }
    
    return [[allowedPositions objectAtIndex:random() % [allowedPositions count]] intValue];
}

- (int) randomizeQueenPosition {
    int blockNumber;
    NSMutableArray *allowedPositions = [[NSMutableArray alloc] init];
    
    for (int i=0; i<8; i++) {
                
        for (int j=0; j<8; j++) {
            
            blockNumber = (i * CHESS_ROW_COUNT) + j;
            
            if ([chessPiecesRandomizedPositions objectAtIndex:blockNumber] == EMPTY) {
                [allowedPositions addObject:[NSString stringWithFormat:@"%i", blockNumber]];
            }
        }
    }
    
    return [[allowedPositions objectAtIndex:random() % [allowedPositions count]] intValue];
}

- (int) randomizeRookPosition {
    int blockNumber;
    NSMutableArray *allowedPositions = [[NSMutableArray alloc] init];
    
    for (int i=0; i<8; i++) {
        
        for (int j=0; j<8; j++) {
            blockNumber = (i * CHESS_ROW_COUNT) + j;
            
            if ([chessPiecesRandomizedPositions objectAtIndex:blockNumber] == EMPTY) {
                [allowedPositions addObject:[NSString stringWithFormat:@"%i", blockNumber]];
            }
        }
    }
    
    return [[allowedPositions objectAtIndex:random() % [allowedPositions count]] intValue];
}

- (int) randomizeKnightPosition {
    int blockNumber;
    NSMutableArray *allowedPositions = [[NSMutableArray alloc] init];
    
    for (int i=0; i<8; i++) {
        
        for (int j=0; j<8; j++) {
            blockNumber = (i * CHESS_ROW_COUNT) + j;
            
            if ([chessPiecesRandomizedPositions objectAtIndex:blockNumber] == EMPTY) {
                [allowedPositions addObject:[NSString stringWithFormat:@"%i", blockNumber]];
            }
        }
    }
    
    return [[allowedPositions objectAtIndex:random() % [allowedPositions count]] intValue];
}

- (int) randomizeWhiteKingPosition {
    
    /**
     Here we are taking the top 3 rows and first 3 columns from the 4th row
     so which makes it a total of 27 blocks from top
     */
    
    int blockNumber;
    NSMutableArray *allowedPositions = [[NSMutableArray alloc] init];
    
    for (int i=0; i<4; i++) {
        
        for (int j=0; j<8; j++) {
            
            blockNumber = (i * CHESS_ROW_COUNT) + j;
            
            if ([chessPiecesRandomizedPositions objectAtIndex:blockNumber] == EMPTY) {
                if (blockNumber < 27) {
                    [allowedPositions addObject:[NSString stringWithFormat:@"%i", blockNumber]];
                }
            }
        }
    }
    
    return [[allowedPositions objectAtIndex:random() % [allowedPositions count]] intValue];
}

- (int) randomizeBlackKingPosition {
    
    /**
     Here we are taking the bottom 3 rows and last 3 columns from the 4th row from bottom
     so which makes it a total of 27 blocks from bottom
     */
    
    int blockNumber;
    NSMutableArray *allowedPositions = [[NSMutableArray alloc] init];
    
    for (int i=4; i<8; i++) {
        
        for (int j=0; j<8; j++) {
            
            blockNumber = (i * CHESS_ROW_COUNT) + j;
            
            if ([chessPiecesRandomizedPositions objectAtIndex:blockNumber] == EMPTY) {
                if (blockNumber > 36) {
                    [allowedPositions addObject:[NSString stringWithFormat:@"%i", blockNumber]];
                }
            }
        }
    }
    
    return [[allowedPositions objectAtIndex:random() % [allowedPositions count]] intValue];
}

- (int) randomizeWhitePawnPosition {
    
    /**
     Here we are taking the rows from 2nd to 6th
     */
    
    int blockNumber;
    NSMutableArray *allowedPositions = [[NSMutableArray alloc] init];
    
    for (int i=1; i<6; i++) {
        
        for (int j=0; j<8; j++) {
            
            blockNumber = (i * CHESS_ROW_COUNT) + j;
            
            if ([chessPiecesRandomizedPositions objectAtIndex:blockNumber] == EMPTY) {
                [allowedPositions addObject:[NSString stringWithFormat:@"%i", blockNumber]];
            }
        }
    }
    
    return [[allowedPositions objectAtIndex:random() % [allowedPositions count]] intValue];
}

- (int) randomizeBlackPawnPosition {
    
    /**
     Here we are taking the rows from 2nd to 6th from the bottom
     */
    
    int blockNumber;
    NSMutableArray *allowedPositions = [[NSMutableArray alloc] init];
    
    for (int i=2; i<7; i++) {
        
        for (int j=0; j<8; j++) {
            
            blockNumber = (i * CHESS_ROW_COUNT) + j;
            
            if ([chessPiecesRandomizedPositions objectAtIndex:blockNumber] == EMPTY) {
                [allowedPositions addObject:[NSString stringWithFormat:@"%i", blockNumber]];
            }
        }
    }
    
    return [[allowedPositions objectAtIndex:random() % [allowedPositions count]] intValue];
}

- (NSMutableDictionary *)getRowColumnNumber: (int) blockNumber {
    
    int rowNumber = floor(blockNumber / 8);
    int columnNumber = (blockNumber % 8);
    
    NSMutableDictionary *rowCol = [[NSMutableDictionary alloc] init];
    
    [rowCol setValue:[NSString stringWithFormat:@"%i", rowNumber] forKey:@"row"];
    [rowCol setValue:[NSString stringWithFormat:@"%i", columnNumber] forKey:@"column"];
    
    return rowCol;
}

- (BOOL) isEnemyPiecePiece: (NSString *)currentPiece targetBlockNumber: (int)targetBlockNumber {
    
    NSArray *whitePieces = [[NSArray alloc] initWithObjects:WHITE_KING, WHITE_QUEEN, WHITE_BISHOP_ON_WHITE, WHITE_BISHOP_ON_BLACK, WHITE_KNIGHT_1, WHITE_KNIGHT_2, WHITE_ROOK_1, WHITE_ROOK_2, WHITE_PAWN_1, WHITE_PAWN_2, WHITE_PAWN_3, WHITE_PAWN_4, WHITE_PAWN_5, WHITE_PAWN_6, WHITE_PAWN_7, WHITE_PAWN_8, nil];
    
    NSArray *blackPieces = [[NSArray alloc] initWithObjects:BLACK_KING, BLACK_QUEEN, BLACK_BISHOP_ON_WHITE, BLACK_BISHOP_ON_BLACK, BLACK_KNIGHT_1, BLACK_KNIGHT_2,  BLACK_ROOK_1, BLACK_ROOK_2, BLACK_PAWN_1, BLACK_PAWN_2, BLACK_PAWN_3, BLACK_PAWN_4, BLACK_PAWN_5, BLACK_PAWN_6, BLACK_PAWN_7, BLACK_PAWN_8,nil];
    
    if ([whitePieces containsObject:currentPiece]) {
        
        if ([blackPieces containsObject:[finalLayoutPositions objectAtIndex:targetBlockNumber]]) {
            return YES;
        } else {
            return NO;
        }
        
    } else if ([blackPieces containsObject:currentPiece]) {
        
        if ([whitePieces containsObject:[finalLayoutPositions objectAtIndex:targetBlockNumber]]) {
            return YES;
        } else {
            return NO;
        }
        
    }
    
    return NO;
}

- (BOOL) isBlockEmpty: (NSString *)currentPiece targetBlockNumber: (int)targetBlockNumber {
    
    if ([finalLayoutPositions objectAtIndex:targetBlockNumber] == EMPTY) {
        return YES;
    }

    return NO;
}


- (NSMutableArray *) getPossibleMoves: (NSString *)currentPiece blockNumber:(int) blockNumber revealedPieces:(NSArray *)revealedPieces {
    
    revealedPiecesInLayout = revealedPieces;
    
    NSArray *whitePawns = [[NSArray alloc] initWithObjects:WHITE_PAWN_1, WHITE_PAWN_2, WHITE_PAWN_3, WHITE_PAWN_4, WHITE_PAWN_5, WHITE_PAWN_6, WHITE_PAWN_7, WHITE_PAWN_8, nil];
    
    NSArray *blackPawns = [[NSArray alloc] initWithObjects:BLACK_PAWN_1, BLACK_PAWN_2, BLACK_PAWN_3, BLACK_PAWN_4, BLACK_PAWN_5, BLACK_PAWN_6, BLACK_PAWN_7, BLACK_PAWN_8, nil];
        
    // find the current block number
    int currentPiecePosition = 0;//blockNumber;
    
    for (int i=0; i<CHESS_BLOCKS; i++) {
        
        if ([finalLayoutPositions objectAtIndex:i] == currentPiece) {
            currentPiecePosition = i;
        }
    }
        
    if (currentPiece == WHITE_ROOK_1) {
        
        return [self getPossibleRookMoves:WHITE_ROOK_1 blockNumber:currentPiecePosition];
        
    } else if (currentPiece == WHITE_ROOK_2){
        
            return [self getPossibleRookMoves:WHITE_ROOK_2 blockNumber:currentPiecePosition];
        
    } else if (currentPiece == WHITE_KNIGHT_1) {
        
        return [self getPossibleKnightMoves: WHITE_KNIGHT_1 blockNumber:currentPiecePosition];
        
    } else if (currentPiece == WHITE_KNIGHT_2) {
        
        return [self getPossibleKnightMoves: WHITE_KNIGHT_2 blockNumber:currentPiecePosition];
        
    } else if (currentPiece == WHITE_BISHOP_ON_WHITE) {
        
        return [self getPossibleBishopMoves: WHITE_BISHOP_ON_WHITE blockNumber:currentPiecePosition];
        
    } else if (currentPiece == WHITE_QUEEN) {
        
        return [self getPossibleQueenMoves: WHITE_QUEEN blockNumber:currentPiecePosition];
        
    } else if (currentPiece == WHITE_KING) {
        
        return [self getPossibleKingMoves:WHITE_KING blockNumber:currentPiecePosition];
        
    } else if (currentPiece == WHITE_BISHOP_ON_BLACK) {
        
        return [self getPossibleBishopMoves: WHITE_BISHOP_ON_BLACK blockNumber:currentPiecePosition];
        
    } else if ([whitePawns containsObject:currentPiece]) {
        
        return [self getPossibleWhitePawnMoves:currentPiece blockNumber:currentPiecePosition];
        
    } else if (currentPiece == BLACK_ROOK_1) {
        
        return [self getPossibleRookMoves:BLACK_ROOK_1 blockNumber:currentPiecePosition];
    
    } else if (currentPiece == BLACK_ROOK_2) {
        
        return [self getPossibleRookMoves:BLACK_ROOK_2 blockNumber:currentPiecePosition];
        
    } else if (currentPiece == BLACK_KNIGHT_1) {
        
        return [self getPossibleKnightMoves: BLACK_KNIGHT_1 blockNumber:currentPiecePosition];
    
    } else if (currentPiece == BLACK_KNIGHT_2) {
        
        return [self getPossibleKnightMoves: BLACK_KNIGHT_2 blockNumber:currentPiecePosition];
        
    } else if (currentPiece == BLACK_BISHOP_ON_WHITE) {
        
        return [self getPossibleBishopMoves: BLACK_BISHOP_ON_WHITE blockNumber:currentPiecePosition];
        
    } else if (currentPiece == BLACK_QUEEN) {
        
        return [self getPossibleQueenMoves: BLACK_QUEEN blockNumber:currentPiecePosition];
        
    } else if (currentPiece == BLACK_KING) {
        
        return [self getPossibleKingMoves:BLACK_KING blockNumber:currentPiecePosition];
        
    } else if (currentPiece == BLACK_BISHOP_ON_BLACK) {
        
        return [self getPossibleBishopMoves: BLACK_BISHOP_ON_BLACK blockNumber:currentPiecePosition];
        
    } else if ([blackPawns containsObject:currentPiece]) {
        
        return [self getPossibleBlackPawnMoves:currentPiece blockNumber:currentPiecePosition];
        
    }
    
    return [[NSMutableArray alloc] init];
}

- (NSMutableArray *) getPossibleRookMoves: (NSString *) currentPiece blockNumber:(int) blockNumber {
    
    NSMutableArray *returnVal = [[NSMutableArray alloc] init];
    NSMutableDictionary *rowCol = [self getRowColumnNumber:blockNumber];
    int currentRow = [[rowCol valueForKey:@"row"] intValue];
    int currentColumn = [[rowCol valueForKey:@"column"] intValue];
    
    int i, requiredIndex = 0;
    
    int top = 0, bottom = CHESS_ROW_COUNT - 1;
    int left = 0, right = CHESS_COLUMN_COUNT - 1;
    
    for (i=currentRow-1; i>=top; i--) {
        
        if (i >= 0) {
            requiredIndex = (i * CHESS_ROW_COUNT) + currentColumn;
            
            if ([finalLayoutPositions objectAtIndex:requiredIndex] == EMPTY) {
                [returnVal addObject:[NSString stringWithFormat:@"%i", requiredIndex]];
            } else if ([self isEnemyPiecePiece:currentPiece targetBlockNumber:requiredIndex]) {
                [returnVal addObject:[NSString stringWithFormat:@"%i", requiredIndex]];
                i = top; // loop breaking condition
            } else {
                
                if (![revealedPiecesInLayout containsObject:[finalLayoutPositions objectAtIndex:requiredIndex]]) {
                    [returnVal addObject:[NSString stringWithFormat:@"%i", requiredIndex]];
                }
                
                i = top; // loop breaking condition
            }
            
        }
    }
    
    for (i=currentRow+1; i<=bottom; i++) {
        
        if (i <= CHESS_ROW_COUNT - 1) {
            requiredIndex = (i * CHESS_ROW_COUNT) + currentColumn;
            
            if ([finalLayoutPositions objectAtIndex:requiredIndex] == EMPTY) {
                [returnVal addObject:[NSString stringWithFormat:@"%i", requiredIndex]];
            } else if ([self isEnemyPiecePiece:currentPiece targetBlockNumber:requiredIndex]) {
                [returnVal addObject:[NSString stringWithFormat:@"%i", requiredIndex]];
                i = bottom; // loop breaking condition
            } else {
                
                if (![revealedPiecesInLayout containsObject:[finalLayoutPositions objectAtIndex:requiredIndex]]) {
                    [returnVal addObject:[NSString stringWithFormat:@"%i", requiredIndex]];
                }
                
                i = bottom; // loop breaking condition
            }
            
        }
    }
        
    for (i=currentColumn-1; i>=left; i--) {
        
        if (i >= 0) {
            requiredIndex = (currentRow * CHESS_ROW_COUNT) + i;
            
            if ([finalLayoutPositions objectAtIndex:requiredIndex] == EMPTY) {
                [returnVal addObject:[NSString stringWithFormat:@"%i", requiredIndex]];
            } else if ([self isEnemyPiecePiece:currentPiece targetBlockNumber:requiredIndex]) {
                [returnVal addObject:[NSString stringWithFormat:@"%i", requiredIndex]];
                i = left; // loop breaking condition
            } else {
                
                if (![revealedPiecesInLayout containsObject:[finalLayoutPositions objectAtIndex:requiredIndex]]) {
                    [returnVal addObject:[NSString stringWithFormat:@"%i", requiredIndex]];
                }
                
                i = left; // loop breaking condition
            }
        }
    }
    
    for (i=currentColumn+1; i<=right; i++) {
        
        if (i <= CHESS_COLUMN_COUNT - 1) {
            requiredIndex = (currentRow * CHESS_ROW_COUNT) + i;
            
            if ([finalLayoutPositions objectAtIndex:requiredIndex] == EMPTY) {
                [returnVal addObject:[NSString stringWithFormat:@"%i", requiredIndex]];
            } else if ([self isEnemyPiecePiece:currentPiece targetBlockNumber:requiredIndex]) {
                [returnVal addObject:[NSString stringWithFormat:@"%i", requiredIndex]];
                i = right; // loop breaking condition
            } else {
                
                if (![revealedPiecesInLayout containsObject:[finalLayoutPositions objectAtIndex:requiredIndex]]) {
                    [returnVal addObject:[NSString stringWithFormat:@"%i", requiredIndex]];
                }
                
                i = right; // loop breaking condition
            }
        }
    }
    
    return returnVal;
}

- (NSMutableArray *) getPossibleKnightMoves: (NSString *) currentPiece blockNumber:(int) blockNumber {
    
    NSMutableArray *returnVal = [[NSMutableArray alloc] init];
    
    NSMutableDictionary *rowCol = [self getRowColumnNumber:blockNumber];
    
    /**
     Full block moves for a knight is like
     2 blocks in any direction followed by
     1 block in perpendicular dirction to the previous 2 blocks
     */
    int top = [[rowCol valueForKey:@"row"] intValue] - 2;
    int bottom = [[rowCol valueForKey:@"row"] intValue] + 2;
    
    int targetLeft = [[rowCol valueForKey:@"column"] intValue] - 1;
    int targetRight = [[rowCol valueForKey:@"column"] intValue] + 1;
    
    int left = [[rowCol valueForKey:@"column"] intValue] - 2;
    int right = [[rowCol valueForKey:@"column"] intValue] + 2;
    
    int targetTop = [[rowCol valueForKey:@"row"] intValue] - 1;
    int targetBottom = [[rowCol valueForKey:@"row"] intValue] + 1;
    
    int requiredIndex = 0;
    
    NSMutableArray *tempIndexes = [[NSMutableArray alloc] init];
    
    if (top >=0) {
        
        if (targetLeft >= 0) {
            requiredIndex = (top * CHESS_ROW_COUNT) + targetLeft;
            
            [tempIndexes addObject:[NSString stringWithFormat:@"%i", requiredIndex]];
        }
        
        if (targetRight <= 7) {
            requiredIndex = (top * CHESS_ROW_COUNT) + targetRight;
            
            [tempIndexes addObject:[NSString stringWithFormat:@"%i", requiredIndex]];
        }
    }
    
    if (bottom <=7) {
        
        if (targetLeft >= 0) {
            requiredIndex = (bottom * CHESS_ROW_COUNT) + targetLeft;
            
            [tempIndexes addObject:[NSString stringWithFormat:@"%i", requiredIndex]];
        }
        
        if (targetRight <= 7) {
            requiredIndex = (bottom * CHESS_ROW_COUNT) + targetRight;
            
            [tempIndexes addObject:[NSString stringWithFormat:@"%i", requiredIndex]];
        }
    }
    
    if (left >= 0) {
        
        if (targetTop >= 0) {
            requiredIndex = (targetTop * CHESS_ROW_COUNT) + left;
            
            [tempIndexes addObject:[NSString stringWithFormat:@"%i", requiredIndex]];
        }
        
        if (targetBottom <= 7) {
            requiredIndex = (targetBottom * CHESS_ROW_COUNT) + left;
            
            [tempIndexes addObject:[NSString stringWithFormat:@"%i", requiredIndex]];
        }
        
    }
    
    if (right <= 7) {
        
        if (targetTop >= 0) {
            requiredIndex = (targetTop * CHESS_ROW_COUNT) + right;
            
            [tempIndexes addObject:[NSString stringWithFormat:@"%i", requiredIndex]];
        }
        
        if (targetBottom <= 7) {
            requiredIndex = (targetBottom * CHESS_ROW_COUNT) + right;
            
            [tempIndexes addObject:[NSString stringWithFormat:@"%i", requiredIndex]];
        }
        
    }
    
    for (NSString *index in tempIndexes) {
        requiredIndex = [index intValue];
        
        if ([finalLayoutPositions objectAtIndex:requiredIndex] == EMPTY
            || [self isEnemyPiecePiece:currentPiece targetBlockNumber:requiredIndex]
            || ![revealedPiecesInLayout containsObject:[finalLayoutPositions objectAtIndex:requiredIndex]]) {
            
            [returnVal addObject:[NSString stringWithFormat:@"%i", requiredIndex]];
            
        }
    }
        
    return returnVal;
}

- (NSMutableArray *) getPossibleBishopMoves: (NSString *) currentPiece blockNumber:(int) blockNumber {
    
    NSMutableArray *returnVal = [[NSMutableArray alloc] init];
    
    NSMutableDictionary *rowCol = [self getRowColumnNumber:blockNumber];
    
    int i=0,j, requiredRow, requiredColumn;
    
    int top = 0;
    int bottom = CHESS_ROW_COUNT - 1;
    
    int left = 0;
    int right = CHESS_COLUMN_COUNT - 1;
    
    int rowNumber = [[rowCol valueForKey:@"row"] intValue];
    int columnNumber = [[rowCol valueForKey:@"column"] intValue];
    
    int requiredIndex = 0;
    
    /**
     Find possible blocks from current position 
     towards left-top corner diagonally
     */
    j=1;
    for (i=rowNumber; i >= top; i--) {
        
        requiredRow = rowNumber - j;
        requiredColumn = columnNumber - j;
        
        if (requiredRow >= top && requiredColumn >= left) {
            requiredIndex = (requiredRow * CHESS_ROW_COUNT) + requiredColumn;
            
            if ([finalLayoutPositions objectAtIndex:requiredIndex] == EMPTY) {
                
                [returnVal addObject:[NSString stringWithFormat:@"%i", requiredIndex]];
                
            } else if ([self isEnemyPiecePiece:currentPiece targetBlockNumber:requiredIndex]) {
                
                [returnVal addObject:[NSString stringWithFormat:@"%i", requiredIndex]];
                
                rowNumber = top; //loop breaking condition
                
            } else {
                
                if (![revealedPiecesInLayout containsObject:[finalLayoutPositions objectAtIndex:requiredIndex]]) {
                    [returnVal addObject:[NSString stringWithFormat:@"%i", requiredIndex]];
                }
                
                rowNumber = top; //loop breaking condition
            }
        }
        
        j++;
        
    }
    
    /**
     Setting rowNumber and columnNumber again bcoz,
     it was over-written for loop breaking condition
     **/
    rowNumber = [[rowCol valueForKey:@"row"] intValue];
    columnNumber = [[rowCol valueForKey:@"column"] intValue];
    
    /**
     Find possible blocks from current position 
     towards right-top corner diagonally
     */
    
    j=1;
    for (i=rowNumber; i >= top; i--) {
        
        requiredRow = rowNumber - j;
        requiredColumn = columnNumber + j;
        
        if (requiredRow >= top && requiredColumn <= right) {
            requiredIndex = (requiredRow * CHESS_ROW_COUNT) + requiredColumn;
            
            if ([finalLayoutPositions objectAtIndex:requiredIndex] == EMPTY) {
                
                [returnVal addObject:[NSString stringWithFormat:@"%i", requiredIndex]];
                
            } else if ([self isEnemyPiecePiece:currentPiece targetBlockNumber:requiredIndex]) {
                
                [returnVal addObject:[NSString stringWithFormat:@"%i", requiredIndex]];
                
                rowNumber = top; //loop breaking condition
                
            } else {
                
                if (![revealedPiecesInLayout containsObject:[finalLayoutPositions objectAtIndex:requiredIndex]]) {
                    [returnVal addObject:[NSString stringWithFormat:@"%i", requiredIndex]];
                }
                
                rowNumber = top; //loop breaking condition
            }
        }
        
        j++;
        
    }
    
    /**
     Setting rowNumber and columnNumber again bcoz,
     it was over-written for loop breaking condition
     **/
    rowNumber = [[rowCol valueForKey:@"row"] intValue];
    columnNumber = [[rowCol valueForKey:@"column"] intValue];
    
    /**
     Find possible blocks from current position 
     towards left-bottom corner diagonally
     */
    j=1;
    for (i=rowNumber; i <= bottom; i++) {
        
        requiredRow = rowNumber + j;
        requiredColumn = columnNumber - j;
        
        if (requiredRow <= bottom && requiredColumn >= left) {
            requiredIndex = (requiredRow * CHESS_ROW_COUNT) + requiredColumn;
            
            if ([finalLayoutPositions objectAtIndex:requiredIndex] == EMPTY) {
                
                [returnVal addObject:[NSString stringWithFormat:@"%i", requiredIndex]];
                
            } else if ([self isEnemyPiecePiece:currentPiece targetBlockNumber:requiredIndex]) {
                
                [returnVal addObject:[NSString stringWithFormat:@"%i", requiredIndex]];
                
                rowNumber = bottom; //loop breaking condition
                
            } else {
                
                if (![revealedPiecesInLayout containsObject:[finalLayoutPositions objectAtIndex:requiredIndex]]) {
                    [returnVal addObject:[NSString stringWithFormat:@"%i", requiredIndex]];
                }
                
                rowNumber = bottom; //loop breaking condition
            }
        }
        
        j++;
        
    }
    
    /**
     Setting rowNumber and columnNumber again bcoz,
     it was over-written for loop breaking condition
     **/
    rowNumber = [[rowCol valueForKey:@"row"] intValue];
    columnNumber = [[rowCol valueForKey:@"column"] intValue];
    
    /**
     Find possible blocks from current position 
     towards right-bottom corner diagonally
     */
    j=1;
    for (i=rowNumber; i <= bottom; i++) {
        
        requiredRow = rowNumber + j;
        requiredColumn = columnNumber + j;
        
        if (requiredRow <= bottom && requiredColumn <= right) {
            requiredIndex = (requiredRow * CHESS_ROW_COUNT) + requiredColumn;
            
            if ([finalLayoutPositions objectAtIndex:requiredIndex] == EMPTY) {
                
                [returnVal addObject:[NSString stringWithFormat:@"%i", requiredIndex]];
                
            } else if ([self isEnemyPiecePiece:currentPiece targetBlockNumber:requiredIndex]) {
                
                [returnVal addObject:[NSString stringWithFormat:@"%i", requiredIndex]];
                
                rowNumber = bottom; //loop breaking condition
                
            } else {
                
                if (![revealedPiecesInLayout containsObject:[finalLayoutPositions objectAtIndex:requiredIndex]]) {
                    [returnVal addObject:[NSString stringWithFormat:@"%i", requiredIndex]];
                }
                
                rowNumber = bottom; //loop breaking condition
            }
        }
        
        j++;
        
    }
    
    return returnVal;
}

- (NSMutableArray *) getPossibleQueenMoves: (NSString *) currentPiece blockNumber:(int) blockNumber {
    NSMutableArray *returnVal = [[NSMutableArray alloc] init];
    
    [returnVal addObjectsFromArray:[self getPossibleBishopMoves:currentPiece blockNumber:blockNumber]];
    [returnVal addObjectsFromArray:[self getPossibleRookMoves:currentPiece blockNumber:blockNumber]];
    
    return returnVal;
}

- (NSMutableArray *) getPossibleKingMoves: (NSString *) currentPiece blockNumber:(int) blockNumber {
        
    NSMutableArray *returnVal = [[NSMutableArray alloc] init];
    
    NSMutableDictionary *rowCol = [self getRowColumnNumber:blockNumber];
    
    int top = [[rowCol valueForKey:@"row"] intValue] - 1;
    int bottom = [[rowCol valueForKey:@"row"] intValue] + 1;
    
    int left = [[rowCol valueForKey:@"column"] intValue] - 1;
    int right = [[rowCol valueForKey:@"column"] intValue] + 1;
    
    if (top < 0) {
        top = 0;
    }
    
    if (bottom > CHESS_ROW_COUNT - 1) {
        bottom = CHESS_ROW_COUNT - 1;
    }
    
    if (left < 0) {
        left = 0;
    }
    
    if (right > CHESS_COLUMN_COUNT - 1) {
        right = CHESS_COLUMN_COUNT - 1;
    }
    
    int requiredIndex = 0;
    
    for (int i=top; i<=bottom; i++) {
        
        for (int j=left; j<=right; j++) {
            
            requiredIndex = ((i * CHESS_ROW_COUNT) + j);
            
            if (blockNumber != requiredIndex) {
                if ([finalLayoutPositions objectAtIndex:requiredIndex] == EMPTY
                    || [self isEnemyPiecePiece:currentPiece targetBlockNumber:requiredIndex]) {
                    
                    [returnVal addObject:[NSString stringWithFormat:@"%i", requiredIndex]];
                    
                }
                
                if ([finalLayoutPositions objectAtIndex:requiredIndex] == EMPTY) {
                    
                    [returnVal addObject:[NSString stringWithFormat:@"%i", requiredIndex]];
                    
                } else if ([self isEnemyPiecePiece:currentPiece targetBlockNumber:requiredIndex]) {
                    
                    [returnVal addObject:[NSString stringWithFormat:@"%i", requiredIndex]];
                    
                } else {
                    if (![revealedPiecesInLayout containsObject:[finalLayoutPositions objectAtIndex:requiredIndex]]) {
                        
                        [returnVal addObject:[NSString stringWithFormat:@"%i", requiredIndex]];
                        
                    }
                }
            }
        }
        
    }
    
    return returnVal;
}

/**
 A Pawn can move only in one direction, i.e towards the opposition.
 In our layout, White Pawns start from top of screen and move towards 
 bottom of of the screen
*/

- (NSMutableArray *) getPossibleWhitePawnMoves: (NSString *) currentPiece blockNumber:(int) blockNumber {
    
    NSMutableArray *returnVal = [[NSMutableArray alloc] init];
    
    NSArray *defaultPositionBlockNumbers = [[NSArray alloc] initWithObjects:@"8", @"9", @"10", @"11", @"12", @"13", @"14", @"15", nil];
    
    NSMutableDictionary *rowCol = [self getRowColumnNumber:blockNumber];
    
    int rowNumber = [[rowCol valueForKey:@"row"] intValue];
    int columnNumber = [[rowCol valueForKey:@"column"] intValue];
    
    int requiredIndex = 0;
    int newRow = rowNumber + 1;
    int newColumn = columnNumber;
    
    if (newRow < CHESS_ROW_COUNT) {
        
        /**
         One block move straight
         */

        requiredIndex = (newRow * CHESS_ROW_COUNT) + columnNumber;        
        if ([finalLayoutPositions objectAtIndex:requiredIndex] == EMPTY) {
            
            [returnVal addObject:[NSString stringWithFormat:@"%i", requiredIndex]];
            
            /**
             Two block move straight
             */
            if ([defaultPositionBlockNumbers containsObject:[NSString stringWithFormat:@"%i", blockNumber]]) {
                
                requiredIndex = ((newRow + 1) * CHESS_ROW_COUNT) + newColumn;
                
                if ([finalLayoutPositions objectAtIndex:requiredIndex] == EMPTY) {
                    
                    [returnVal addObject:[NSString stringWithFormat:@"%i", requiredIndex]];
                    
                }
            }
            
        }
        
        /**
         One block diagonal-left move, only if opposite piece is there
         */
        newColumn = columnNumber - 1;
        if (newColumn >= 0) {
            requiredIndex = (newRow * CHESS_ROW_COUNT) + newColumn;
            
            if ([self isEnemyPiecePiece:currentPiece targetBlockNumber:requiredIndex]) {
                
                [returnVal addObject:[NSString stringWithFormat:@"%i", requiredIndex]];
                
            }
        }
        
        /**
         One block diagonal-right move, only if opposite piece is there
         */
        newColumn = columnNumber + 1;
        if (newColumn < CHESS_COLUMN_COUNT) {
            
            requiredIndex = (newRow * CHESS_ROW_COUNT) + newColumn;
            
            if ([self isEnemyPiecePiece:currentPiece targetBlockNumber:requiredIndex]) {
                
                [returnVal addObject:[NSString stringWithFormat:@"%i", requiredIndex]];
                
            }
            
        }
    }
    
    return returnVal;
}

/**
 A Pawn can move only in one direction, i.e towards the opposition.
 In our layout, Black Pawns start from bottom of screen and move towards 
 top of of the screen
 */
- (NSMutableArray *) getPossibleBlackPawnMoves: (NSString *) currentPiece blockNumber:(int) blockNumber {
    
    NSMutableArray *returnVal = [[NSMutableArray alloc] init];
    
    NSArray *defaultPositionBlockNumbers = [[NSArray alloc] initWithObjects:@"48", @"49", @"50", @"51", @"52", @"53", @"54", @"55", nil];
    
    NSMutableDictionary *rowCol = [self getRowColumnNumber:blockNumber];
    
    int rowNumber = [[rowCol valueForKey:@"row"] intValue];
    int columnNumber = [[rowCol valueForKey:@"column"] intValue];
    
    int requiredIndex = 0;
    int newRow = rowNumber - 1;
    int newColumn = columnNumber;
    
    if (newRow >= 0) {
        /**
         One block move straight
         */
        requiredIndex = (newRow * CHESS_ROW_COUNT) + columnNumber;
        if ([finalLayoutPositions objectAtIndex:requiredIndex] == EMPTY) {
            
            [returnVal addObject:[NSString stringWithFormat:@"%i", requiredIndex]];
            
            /**
             Two block move straight
             */
            if ([defaultPositionBlockNumbers containsObject:[NSString stringWithFormat:@"%i", blockNumber]]) {
                
                requiredIndex = ((newRow - 1) * CHESS_ROW_COUNT) + newColumn;
                
                if ([finalLayoutPositions objectAtIndex:requiredIndex] == EMPTY) {
                    
                    [returnVal addObject:[NSString stringWithFormat:@"%i", requiredIndex]];
                    
                }
            }
            
        }

        
        /**
         One block diagonal-left move, only if opposite piece is there
         */
        newColumn = columnNumber - 1;
        if (newColumn >= 0) {
            requiredIndex = (newRow * CHESS_ROW_COUNT) + newColumn;
            
            if ([self isEnemyPiecePiece:currentPiece targetBlockNumber:requiredIndex]) {
                
                [returnVal addObject:[NSString stringWithFormat:@"%i", requiredIndex]];
                
            }
        }
        
        /**
         One block diagonal-right move, only if opposite piece is there
         */
        newColumn = columnNumber + 1;
        if (newColumn < CHESS_COLUMN_COUNT) {
            
            requiredIndex = (newRow * CHESS_ROW_COUNT) + newColumn;
            
            if ([self isEnemyPiecePiece:currentPiece targetBlockNumber:requiredIndex]) {
                
                [returnVal addObject:[NSString stringWithFormat:@"%i", requiredIndex]];
                
            }
            
        }
    }
    
    return returnVal;
}

- (void) movePiece: (NSString *)currentPiece toBlockNumber: (int)targetBlockNumber {
    
    int currentPiecePosition = [finalLayoutPositions indexOfObject:currentPiece];
    
    [finalLayoutPositions replaceObjectAtIndex:currentPiecePosition withObject:EMPTY];
    [finalLayoutPositions replaceObjectAtIndex:targetBlockNumber withObject:currentPiece];
    
}

@end