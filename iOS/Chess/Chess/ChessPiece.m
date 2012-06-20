//
//  ChessPiece.m
//  Chess
//
//  Created by Sriram Viswanathan on 5/19/12.
//  Copyright (c) 2012. All rights reserved.
//

#import "ChessPiece.h"
#import "ChessBoardView.h"
#import "ChessViewController.h"

@implementation ChessPiece

@synthesize pieceType;

- (id) initWithPiece: (NSString *)type {
    
    self.hidden = YES;
    
    pieceType = type;
    
    NSArray *whitePawns = [[NSArray alloc] initWithObjects:WHITE_PAWN_1, WHITE_PAWN_2, WHITE_PAWN_3, WHITE_PAWN_4, WHITE_PAWN_5, WHITE_PAWN_6, WHITE_PAWN_7, WHITE_PAWN_8, nil];
    
    NSArray *blackPawns = [[NSArray alloc] initWithObjects:BLACK_PAWN_1, BLACK_PAWN_2, BLACK_PAWN_3, BLACK_PAWN_4, BLACK_PAWN_5, BLACK_PAWN_6, BLACK_PAWN_7, BLACK_PAWN_8, nil];
    
    NSArray *whiteBishops = [[NSArray alloc] initWithObjects:WHITE_BISHOP_ON_WHITE, WHITE_BISHOP_ON_BLACK, nil];
    
    NSArray *blackBishops = [[NSArray alloc] initWithObjects:BLACK_BISHOP_ON_WHITE, BLACK_BISHOP_ON_BLACK, nil];
    
    NSArray *whiteKnights = [[NSArray alloc] initWithObjects:WHITE_KNIGHT_1, WHITE_KNIGHT_2, nil];
    
    NSArray *blackKnights = [[NSArray alloc] initWithObjects:BLACK_KNIGHT_1, BLACK_KNIGHT_2, nil];
    
    NSArray *whiteRooks = [[NSArray alloc] initWithObjects:WHITE_ROOK_1, WHITE_ROOK_2, nil];
    
    NSArray *blackRooks = [[NSArray alloc] initWithObjects:BLACK_ROOK_1, BLACK_ROOK_2, nil];
    
    NSString *pieceImagePath;
    
    if ([whitePawns containsObject:type]) {
        
        pieceImagePath = @"wp.png";
        
    } else if ([blackPawns containsObject:type]) {
        
        pieceImagePath = @"bp.png";
        
    } else if ([whiteBishops containsObject:type]) {
        
        pieceImagePath = @"wb.png";
        
    } else if ([blackBishops containsObject:type]) {
        
        pieceImagePath = @"bb.png";
    
    } else if ([whiteKnights containsObject:type]) {
        
        pieceImagePath = @"wn.png";
    
    } else if ([blackKnights containsObject:type]) {
        
        pieceImagePath = @"bn.png";
        
    } else if ([whiteRooks containsObject:type]) {
        
        pieceImagePath = @"wr.png";
    
    } else if ([blackRooks containsObject:type]) {
        
        pieceImagePath = @"br.png";
        
    } else {
        pieceImagePath = [NSString stringWithFormat:@"%@.png", type];
    }
    
    UIImage *pieceImage = [UIImage imageNamed:pieceImagePath];
    [self setBackgroundImage:pieceImage forState:UIControlStateNormal];
    
    //[self addTarget:self action:@selector(lifted: withEvent: ) forControlEvents:UIControlEventTouchDown];
    //[self addTarget:self action:@selector(draggedOut: withEvent: ) forControlEvents:UIControlEventTouchDragOutside | UIControlEventTouchDragInside];
    [self addTarget:self action:@selector(dropped: withEvent: ) forControlEvents:UIControlEventTouchUpInside];
    

    
    return self;
}

- (void) positionPiece: (unsigned int)inBlockNumber {
    
    blockNumber = inBlockNumber;
    
    int columnNumber = blockNumber % 8;
    int rowNumber = ceil(blockNumber / 8);
    
    CGRect frame = self.frame;
    frame.origin.x = columnNumber * SQUARE_SIZE;
    frame.origin.y = rowNumber * SQUARE_SIZE;
    frame.size.width = SQUARE_SIZE;
    frame.size.height = SQUARE_SIZE;
    
    self.frame = frame;
}

- (void) makePieceVisible: (unsigned int)inBlockNumber {
    self.hidden = false;
}

// Makes the piece draggable
- (void)draggedOut:(UIControl *)control withEvent:(UIEvent *)event {
    
    CGPoint coordinate = [[[event allTouches] anyObject] locationInView:nil];
    
    NSMutableDictionary *currentPieceDetails = [[NSMutableDictionary alloc] init];
    [currentPieceDetails setValue:[NSString stringWithFormat:@"%f", coordinate.x] forKey:@"x"];
    [currentPieceDetails setValue:[NSString stringWithFormat:@"%f", coordinate.y] forKey:@"y"];
    [currentPieceDetails setValue:control forKey:@"control"];
    
    ChessPiece *piece = (ChessPiece *)control;
    
    [currentPieceDetails setValue:piece.pieceType forKey:@"pieceType"];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:CHESS_PIECE_MOVED object: currentPieceDetails];
} 

- (void)dropped:(UIControl *)control withEvent:(UIEvent *)event {
    
    CGPoint coordinate = [[[event allTouches] anyObject] locationInView:nil];
    
    NSMutableDictionary *currentPieceDetails = [[NSMutableDictionary alloc] init];
    [currentPieceDetails setValue:[NSString stringWithFormat:@"%f", coordinate.x] forKey:@"x"];
    [currentPieceDetails setValue:[NSString stringWithFormat:@"%f", coordinate.y] forKey:@"y"];
    [currentPieceDetails setValue:control forKey:@"control"];
    
    ChessPiece *piece = (ChessPiece *)control;
    
    [currentPieceDetails setValue:piece.pieceType forKey:@"pieceType"];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:CHESS_PIECE_DROPPED object: currentPieceDetails];
}

- (void)lifted:(UIControl *)control withEvent:(UIEvent *)event {
    
    CGPoint coordinate = [[[event allTouches] anyObject] locationInView:nil];
    
    NSMutableDictionary *currentPieceDetails = [[NSMutableDictionary alloc] init];
    [currentPieceDetails setValue:[NSString stringWithFormat:@"%f", coordinate.x] forKey:@"x"];
    [currentPieceDetails setValue:[NSString stringWithFormat:@"%f", coordinate.y] forKey:@"y"];
    [currentPieceDetails setValue:control forKey:@"control"];
    
    ChessPiece *piece = (ChessPiece *)control;
    
    [currentPieceDetails setValue:piece.pieceType forKey:@"pieceType"];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:CHESS_PIECE_LIFTED object: currentPieceDetails];
}


@end