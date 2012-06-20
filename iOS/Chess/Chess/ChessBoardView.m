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
        
    NSString *firstSquareImage;
    NSString *nextSquareImage;
    ChessBlock *chessBlock;
    
    UIButton *squareImageView;
    CGRect frame;
    
    for (int i=0; i<CHESS_ROW_COUNT; i++) {
        
        if (i%2) {
            firstSquareImage = @"dark-square.png";
            nextSquareImage = @"light-square.png";
        } else {
            firstSquareImage = @"light-square.png";
            nextSquareImage = @"dark-square.png";
        }
        
        for (int j=0; j<CHESS_COLUMN_COUNT; j++) {
            
            chessBlock = [[ChessBlock alloc] init];
            
            if (j%2) {
                squareImageView = [chessBlock initBlockWithImage:firstSquareImage];
            } else {
                squareImageView = [chessBlock initBlockWithImage:nextSquareImage];
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

- (void) clearLayout {
    for (UIView *chessPiece in [self subviews]) {
        if ([chessPiece isKindOfClass:[ChessPiece class]]) {
            [chessPiece removeFromSuperview];
        }
    }
}

- (void) refreshLayout: (ChessBoardLayout *)chessBoardLayout revealedPieces: (NSMutableArray *)revealedPieces {
    
    [self clearLayout];
    
    ChessPiece *chessPiece;
    
    piecesArrayToUse = [chessBoardLayout finalLayoutPositions];
    
    for (unsigned int i=0; i<CHESS_BLOCKS; i++) {
        if ([piecesArrayToUse objectAtIndex:i] != EMPTY) {
            chessPiece = [[[ChessPiece alloc] initWithFrame:CGRectMake(0, 0, SQUARE_SIZE, SQUARE_SIZE)] initWithPiece:[piecesArrayToUse objectAtIndex:i]];
            [chessPiece positionPiece:i];
            
            [pieces setObject:chessPiece forKey:[NSString stringWithFormat:@"%i", i]];
            
            if ([revealedPieces containsObject:[piecesArrayToUse objectAtIndex:i]]) {
                
                [chessPiece makePieceVisible:i];
                
            }
            
            [self addSubview:chessPiece];
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
    
    UIButton *existingBlockImageView, *newBlockImageView;
    NSString *firstSquareImage, *nextSquareImage;
    ChessBlock *chessBlock;
    CGRect frame;
    
    for (int i=0; i<CHESS_BLOCKS; i++) {
        
        int columnNumber = i % 8;
        int rowNumber = floor(i / 8);
            
        if (rowNumber % 2) {
            
            if ([blockNumbers containsObject:[NSString stringWithFormat:@"%i", i]]) {
                if (removeHighlighting) {
                    firstSquareImage = @"dark-square.png";
                    nextSquareImage = @"light-square.png";
                } else {
                    firstSquareImage = @"dark-square-highlighted.png";
                    nextSquareImage = @"light-square-highlighted.png";
                }
            } else {
                firstSquareImage = @"dark-square.png";
                nextSquareImage = @"light-square.png";
            }
            
        } else {
            
            if ([blockNumbers containsObject:[NSString stringWithFormat:@"%i", i]]) {
                if (removeHighlighting) {
                    firstSquareImage = @"light-square.png";
                    nextSquareImage = @"dark-square.png";
                } else {
                    firstSquareImage = @"light-square-highlighted.png";
                    nextSquareImage = @"dark-square-highlighted.png";
                }
            } else {
                firstSquareImage = @"light-square.png";
                nextSquareImage = @"dark-square.png";
            }
            
        }
        
        chessBlock = [[ChessBlock alloc] init];
        
        if (columnNumber % 2) {
            
            newBlockImageView = [chessBlock initBlockWithImage:firstSquareImage];
            
        } else {
            
            newBlockImageView = [chessBlock initBlockWithImage:nextSquareImage];
            
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

- (NSMutableArray *)getInitialRevealedPieces {
    return [[NSMutableArray alloc] initWithObjects:WHITE_KING, BLACK_KING, nil];
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