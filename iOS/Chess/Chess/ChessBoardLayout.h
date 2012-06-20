//
//  ChessBoardLayout.h
//  Chess
//
//  Created by Sriram Viswanathan on 5/19/12.
//  Copyright (c) 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChessBoardLayout : NSObject {
    NSMutableArray *chessPiecesDefaultPositions;
    NSMutableArray *chessPiecesRandomizedPositions;
    
    NSMutableArray *finalLayoutPositions;
    
    NSArray *revealedPiecesInLayout;
}

@property (nonatomic, retain) NSMutableArray *chessPiecesDefaultPositions;
@property (nonatomic, retain) NSMutableArray *chessPiecesRandomizedPositions;
@property (nonatomic, retain) NSMutableArray *finalLayoutPositions;

- (void) clear;
- (void) reset;
- (void) randomizePieces;
- (int) randomizeBishopPositionOnBlackSquare;
- (int) randomizeBishopPositionOnWhiteSquare;
- (int) randomizeQueenPosition;
- (int) randomizeRookPosition;
- (int) randomizeKnightPosition;
- (int) randomizeWhiteKingPosition;
- (int) randomizeBlackKingPosition;
- (int) randomizeWhitePawnPosition;
- (int) randomizeBlackPawnPosition;

- (NSMutableDictionary *)getRowColumnNumber: (int) blockNumber;
- (BOOL) isEnemyPiecePiece: (NSString *)currentPiece targetBlockNumber: (int)targetBlockNumber;
- (BOOL) isBlockEmpty: (NSString *)currentPiece targetBlockNumber: (int)targetBlockNumber;

- (NSMutableArray *) getPossibleMoves: (NSString *)currentPiece blockNumber:(int) blockNumber revealedPieces:(NSArray *)revealedPieces;
- (NSMutableArray *) getPossibleRookMoves: (NSString *) currentPiece blockNumber:(int) blockNumber;
- (NSMutableArray *) getPossibleKnightMoves: (NSString *) currentPiece blockNumber:(int) blockNumber;
- (NSMutableArray *) getPossibleBishopMoves: (NSString *) currentPiece blockNumber:(int) blockNumber;
- (NSMutableArray *) getPossibleQueenMoves: (NSString *) currentPiece blockNumber:(int) blockNumber;
- (NSMutableArray *) getPossibleKingMoves: (NSString *) currentPiece blockNumber:(int) blockNumber;
- (NSMutableArray *) getPossibleWhitePawnMoves: (NSString *) currentPiece blockNumber:(int) blockNumber;
- (NSMutableArray *) getPossibleBlackPawnMoves: (NSString *) currentPiece blockNumber:(int) blockNumber;

- (void) movePiece: (NSString *)currentPiece toBlockNumber: (int)targetBlockNumber;

@end
