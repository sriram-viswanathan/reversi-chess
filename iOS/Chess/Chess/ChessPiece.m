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
    
    NSString *pieceImagePath = [NSString stringWithFormat:@"%@.png", type];
    UIImage *pieceImage = [UIImage imageNamed:pieceImagePath];
    
    [self setBackgroundImage:pieceImage forState:UIControlStateNormal];
    
    [self addTarget:self action:@selector(draggedOut: withEvent: ) forControlEvents:UIControlEventTouchDragOutside | UIControlEventTouchDragInside];
    
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


@end