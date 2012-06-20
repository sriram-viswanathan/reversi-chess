//
//  ChessBlock.m
//  Chess
//
//  Created by Yahoo on 6/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ChessBlock.h"

@implementation ChessBlock

- (id) initBlockWithImage:(NSString *)imageName {
    
    
    UIImage *pieceImage = [UIImage imageNamed:imageName];
    [self setBackgroundImage:pieceImage forState:UIControlStateNormal];
    
    [self addTarget:self action:@selector(blockSelected: withEvent: ) forControlEvents:UIControlEventTouchUpInside];
    
    return self;
}

- (void)blockSelected:(UIControl *)control withEvent:(UIEvent *)event {
    
    CGPoint coordinate = [[[event allTouches] anyObject] locationInView:nil];
    
    CGFloat currentX = coordinate.x;
    CGFloat currentY = coordinate.y - (CHESS_CONTAINER_Y_LOCATION + SQUARE_SIZE / 2);
    
    /**
     We first normalize the x and y cordinates by rounding, dividing and multiplying
     with the square size and then adding square size / 2 to use the center of square
     **/
    CGFloat newX = (floor(currentX / SQUARE_SIZE) * SQUARE_SIZE) + SQUARE_SIZE / 2;
    CGFloat newY = (floor(currentY / SQUARE_SIZE) * SQUARE_SIZE) + SQUARE_SIZE / 2;
        
    int rowNumber = floor(newY / SQUARE_SIZE);
    int colNumber = floor(newX / SQUARE_SIZE);
    
    int blockNumber = (rowNumber * CHESS_ROW_COUNT) + colNumber;
    
    NSMutableDictionary *currentBlockDetails = [[NSMutableDictionary alloc] init];
    [currentBlockDetails setValue:[NSString stringWithFormat:@"%i", blockNumber] forKey:@"blockNumber"];

    [[NSNotificationCenter defaultCenter] postNotificationName:CHESS_BLOCK_SELECTED object: currentBlockDetails];    
}

@end
