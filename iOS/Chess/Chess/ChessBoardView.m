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
    
    for (int i=0; i<CHESS_ROW_COUNT; i++) {
        
        if (i%2) {
            firstSquareImage = [UIImage imageNamed:@"dark-square.png"];
            nextSquareImage = [UIImage imageNamed:@"light-square.png"];
        } else {
            firstSquareImage = [UIImage imageNamed:@"light-square.png"];
            nextSquareImage = [UIImage imageNamed:@"dark-square.png"];
        }
        
        for (int j=0; j<CHESS_COLUMN_COUNT; j++) {
            
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
            
            [squareImageView setTag:((i * CHESS_ROW_COUNT) + j)];
            
            [squareBlocks addSubview:squareImageView];
        }
    }
    
    return self;
}

- (void) initLayout: (ChessBoardLayout *)chessBoardLayout randomizePieces:(BOOL)randomizePieces {
    ChessPiece *chessPiece;
    
    piecesArrayToUse = [[NSMutableArray alloc] init];
    
    if (randomizePieces) {
        piecesArrayToUse = [chessBoardLayout chessPiecesRandomizedPositions];
    } else {
        piecesArrayToUse = [chessBoardLayout chessPiecesDefaultPositions];
    }
    
    for (unsigned int i=0; i<CHESS_BLOCKS; i++) {
        if ([piecesArrayToUse objectAtIndex:i] != EMPTY) {
            chessPiece = [[[ChessPiece alloc] initWithFrame:CGRectMake(0, 0, SQUARE_SIZE, SQUARE_SIZE)] initWithPiece:[piecesArrayToUse objectAtIndex:i]];
            [chessPiece positionPiece:i];
            
            [pieces setObject:chessPiece forKey:[NSString stringWithFormat:@"%i", i]];
            
            if ([piecesArrayToUse objectAtIndex:i] == WHITE_KING || [piecesArrayToUse objectAtIndex:i] == BLACK_KING) {
                [chessPiece makePieceVisible:i];
            }
            
            [self addSubview:chessPiece];
        }
    }
}

- (void) clearLayout {
    for (UIView *chessPiece in [self subviews]) {
        if ([chessPiece isKindOfClass:[ChessPiece class]]) {
            [chessPiece removeFromSuperview];
        }
    }
}

- (void) refreshLayout: (ChessBoardLayout *)chessBoardLayout revealedPieces: (NSMutableArray *)revealedPieces {
    ChessPiece *chessPiece;
    
    for (unsigned int i=0; i<CHESS_BLOCKS; i++) {
        if ([piecesArrayToUse objectAtIndex:i] != EMPTY) {
            
            chessPiece = [piecesArrayToUse objectAtIndex:i];
            
            if ([piecesArrayToUse objectAtIndex:i] == WHITE_KING || [piecesArrayToUse objectAtIndex:i] == BLACK_KING) {
                
                [[pieces objectForKey:[NSString stringWithFormat:@"%i", i]] setHidden:NO];
                
            } else if ([revealedPieces containsObject:[NSString stringWithFormat:@"%i", i]]) {
                
                [[pieces objectForKey:[NSString stringWithFormat:@"%i", i]] setHidden:NO];
                
            }
        }
    }
}

- (void) highlightBlocks: (NSArray *)blockNumbers removeHighlighting: (BOOL) removeHighlighting {
    
    /**
    Here we get all the subview inside squareBlocks,
    which are dark and light boxes
     
    Here count of boardBlocks will be same as CHESS_BLOCKS
    **/
    
    NSMutableArray *boardBlocks = [[NSMutableArray alloc] init];
    
    for (UIView *view in [squareBlocks subviews]) {
        [boardBlocks addObject:view];
    }
    
    UIImageView *existingBlockImageView, *newBlockImageView;
    UIImage *firstSquareImage, *nextSquareImage;
    CGRect frame;
    
    for (int i=0; i<CHESS_BLOCKS; i++) {
        
        int columnNumber = i % 8;
        int rowNumber = floor(i / 8);
            
        if (rowNumber % 2) {
            
            if ([blockNumbers containsObject:[NSString stringWithFormat:@"%i", i]]) {
                if (removeHighlighting) {
                    firstSquareImage = [UIImage imageNamed:@"dark-square.png"];
                    nextSquareImage = [UIImage imageNamed:@"light-square.png"];
                } else {
                    firstSquareImage = [UIImage imageNamed:@"dark-square-highlighted.png"];
                    nextSquareImage = [UIImage imageNamed:@"light-square-highlighted.png"];
                }
            } else {
                firstSquareImage = [UIImage imageNamed:@"dark-square.png"];
                nextSquareImage = [UIImage imageNamed:@"light-square.png"];
            }
            
        } else {
            
            if ([blockNumbers containsObject:[NSString stringWithFormat:@"%i", i]]) {
                if (removeHighlighting) {
                    firstSquareImage = [UIImage imageNamed:@"light-square.png"];
                    nextSquareImage = [UIImage imageNamed:@"dark-square.png"];
                } else {
                    firstSquareImage = [UIImage imageNamed:@"light-square-highlighted.png"];
                    nextSquareImage = [UIImage imageNamed:@"dark-square-highlighted.png"];
                }
            } else {
                firstSquareImage = [UIImage imageNamed:@"light-square.png"];
                nextSquareImage = [UIImage imageNamed:@"dark-square.png"];
            }
            
        }
        
        if (columnNumber % 2) {
            
            newBlockImageView = [[UIImageView alloc] initWithImage:firstSquareImage];
            
        } else {
            
            newBlockImageView = [[UIImageView alloc] initWithImage:nextSquareImage];
            
        }
        
        existingBlockImageView = [boardBlocks objectAtIndex:i];
        
        if (existingBlockImageView != nil) {
                    
            frame = existingBlockImageView.frame;
        
            [existingBlockImageView removeFromSuperview];
        
            newBlockImageView.frame = frame;
            [newBlockImageView setTag:i];
        
            [squareBlocks addSubview:newBlockImageView];
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