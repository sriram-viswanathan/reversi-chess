//
//  ChessViewController.m
//  Chess
//
//  Created by Sriram Viswanathan on 5/19/12.
//  Copyright (c) 2012. All rights reserved.
//

#import "ChessPiece.h"
#import "ChessViewController.h"

@interface ChessViewController ()

@end

@implementation ChessViewController

@synthesize boardContainer;
@synthesize chessBoardView;
@synthesize chessBoardLayout;
@synthesize revealedPieces;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    revealedPieces = [[NSMutableArray alloc] init];
    
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(handleChessPieceMoved: ) name:CHESS_PIECE_MOVED object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(handleChessPieceDropped: ) name:CHESS_PIECE_DROPPED object:nil];
    
    // Add boardview
	chessBoardView = [[[ChessBoardView alloc] initWithFrame:CGRectMake(0, 0, 480, 320)] init];
    
    chessBoardLayout = [[ChessBoardLayout alloc] init];
    [chessBoardLayout reset];
    
    [chessBoardView initLayout:chessBoardLayout];
    
	[boardContainer addSubview:chessBoardView];
	[self.view addSubview:boardContainer];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void) handleChessPieceMoved: (NSNotification *)notification {
    
    NSDictionary *pieceDetails = notification.object;
    
    CGFloat newX = [[pieceDetails valueForKey:@"x"] floatValue];
    CGFloat newY = [[pieceDetails valueForKey:@"y"] floatValue] - (CHESS_CONTAINER_Y_LOCATION + SQUARE_SIZE / 2);
    
    ChessPiece *cp = (ChessPiece *)[pieceDetails objectForKey:@"control"];
    
    /**
     To Prevent draggin in between boxes,
     i.e to snap the piece to a box
     We first normalize the x and y cordinates by rounding, dividing and multiplying
     with the square size and then adding square size / 2 to use the center of square
     **/
    
    CGFloat newFitX = (roundf(newX / SQUARE_SIZE) * SQUARE_SIZE) + SQUARE_SIZE / 2;
    CGFloat newFitY = (roundf(newY / SQUARE_SIZE) * SQUARE_SIZE) + SQUARE_SIZE / 2;
            
    cp.center = CGPointMake(newFitX, newFitY);
}

- (void) handleChessPieceDropped: (NSNotification *)notification {
    NSDictionary *pieceDetails = notification.object;
    
    CGFloat newX = [[pieceDetails valueForKey:@"x"] floatValue];
    CGFloat newY = [[pieceDetails valueForKey:@"y"] floatValue] - (CHESS_CONTAINER_Y_LOCATION + SQUARE_SIZE / 2);
    
    
    int rowNumber = floor(newY / SQUARE_SIZE);
    int colNumber = floor(newX / SQUARE_SIZE);
    
    NSString *blockNumber = [NSString stringWithFormat:@"%i", (rowNumber * 8) + colNumber];
    
    if (![revealedPieces containsObject:blockNumber]) {
        [revealedPieces addObject:blockNumber];
    }
    
    [chessBoardView refreshLayout:chessBoardLayout revealedPieces:revealedPieces];
}

/*
- (void) handleChessPieceMoved {
    NSLog(@" Hello ");
}
*/


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
