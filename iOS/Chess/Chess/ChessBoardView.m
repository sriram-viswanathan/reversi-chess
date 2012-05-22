//
//  ChessBoardView.m
//  Chess
//
//  Created by Sriram Viswanathan on 5/19/12.
//  Copyright (c) 2012. All rights reserved.
//

#import "ChessBoardView.h"
#import "ChessPiece.h"

@implementation ChessBoardView

- (id) init {
    
    squareBlocks = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
    [self addSubview:squareBlocks];
    
    pieces = [[NSMutableDictionary alloc] init];
        
    UIImage *firstSquareImage;
    UIImage *nextSquareImage;
    
    UIImageView *squareImageView;
    CGRect frame;
    
    for (int i=0; i<8; i++) {
        
        if (i%2) {
            firstSquareImage = [UIImage imageNamed:@"dark-square.png"];
            nextSquareImage = [UIImage imageNamed:@"light-square.png"];
        } else {
            firstSquareImage = [UIImage imageNamed:@"light-square.png"];
            nextSquareImage = [UIImage imageNamed:@"dark-square.png"];
        }
        
        for (int j=0; j<8; j++) {
            
            if (j%2) {
                squareImageView = [[UIImageView alloc] initWithImage:firstSquareImage];
            } else {
                squareImageView = [[UIImageView alloc] initWithImage:nextSquareImage];
            }
            
            frame = squareImageView.frame;
            frame.origin.x = j * SQUARE_SIZE;
            frame.origin.y = i * SQUARE_SIZE;
            frame.size.width = SQUARE_SIZE;
            frame.size.height = SQUARE_SIZE;
            squareImageView.frame = frame;
            
            [squareBlocks addSubview:squareImageView];
        }
    }
    
    return self;
}

- (void) initLayout: (ChessBoardLayout *)chessBoardLayout {
    ChessPiece *chessPiece;
    
    for (unsigned int i=0; i<CHESS_BLOCKS; i++) {
        if ([[chessBoardLayout pieces] objectAtIndex:i] != EMPTY) {
            chessPiece = [[[ChessPiece alloc] initWithFrame:CGRectMake(0, 0, SQUARE_SIZE, SQUARE_SIZE)] initWithPiece:[[chessBoardLayout pieces] objectAtIndex:i]];
            [chessPiece positionPiece:i];
            
            [pieces setObject:chessPiece forKey:[NSString stringWithFormat:@"%i", i]];
            
            if ([[chessBoardLayout pieces] objectAtIndex:i] == WHITE_KING || [[chessBoardLayout pieces] objectAtIndex:i] == BLACK_KING) {
                [chessPiece makePieceVisible:i];
            }
            
            [self addSubview:chessPiece];
        }
    }
}

- (void) refreshLayout: (ChessBoardLayout *)chessBoardLayout revealedPieces: (NSMutableArray *)revealedPieces {
    ChessPiece *chessPiece;
    
    for (unsigned int i=0; i<CHESS_BLOCKS; i++) {
        if ([[chessBoardLayout pieces] objectAtIndex:i] != EMPTY) {
            
            chessPiece = [[chessBoardLayout pieces] objectAtIndex:i];
            
            if ([[chessBoardLayout pieces] objectAtIndex:i] == WHITE_KING || [[chessBoardLayout pieces] objectAtIndex:i] == BLACK_KING) {
                
                [[pieces objectForKey:[NSString stringWithFormat:@"%i", i]] setHidden:NO];
                
            } else if ([revealedPieces containsObject:[NSString stringWithFormat:@"%i", i]]) {
                
                [[pieces objectForKey:[NSString stringWithFormat:@"%i", i]] setHidden:NO];
                
            }
        }
    }
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

@end
