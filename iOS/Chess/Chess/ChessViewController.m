//
//  ChessViewController.m
//  Chess
//
//  Created by Sriram Viswanathan on 5/19/12.
//  Copyright (c) 2012. All rights reserved.
//

#import "ChessPiece.h"
#import "ChessViewController.h"

@implementation ChessViewController

@synthesize randomizeButton;
@synthesize boardContainer;
@synthesize chessBoardView;
@synthesize chessBoardLayout;
@synthesize revealedPieces;

- (void) awakeFromNib {
    [super awakeFromNib];
        
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(handleChessPieceDropped: ) name:CHESS_PIECE_DROPPED object:nil];
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(handleChessBlockSelected: ) name:CHESS_BLOCK_SELECTED object:nil];
    
    // Add boardview
	chessBoardView = [[[ChessBoardView alloc] initWithFrame:CGRectMake(0, 0, 480, 320)] init];    
    chessBoardLayout = [[ChessBoardLayout alloc] init];
    
    [self newGame];
    
	[boardContainer addSubview:chessBoardView];
	[self.view addSubview:boardContainer];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction) newGame {
    selectedPiece = @"";
    revealedPieces = [chessBoardView getInitialRevealedPieces];
    [chessBoardView clearLayout];
    [chessBoardLayout reset];
    [chessBoardLayout randomizePieces];
    [chessBoardView refreshLayout:chessBoardLayout revealedPieces:revealedPieces];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void) handleChessPieceDropped: (NSNotification *)notification {
        
    NSDictionary *pieceDetails = notification.object;
    
    CGFloat newX = [[pieceDetails valueForKey:@"x"] floatValue];
    CGFloat newY = [[pieceDetails valueForKey:@"y"] floatValue] - (CHESS_CONTAINER_Y_LOCATION + SQUARE_SIZE / 2);
    
    
    int rowNumber = floor(newY / SQUARE_SIZE);
    int colNumber = floor(newX / SQUARE_SIZE);
    int blockNumber = (rowNumber * CHESS_ROW_COUNT) + colNumber;
    
    possibleMoves = [chessBoardLayout getPossibleMoves:[pieceDetails objectForKey:@"pieceType"] blockNumber:blockNumber revealedPieces:revealedPieces];
    
    if (selectedPiece == @"") {
        selectedPiece = [pieceDetails objectForKey:@"pieceType"];
        [chessBoardView highlightBlocks:possibleMoves removeHighlighting:NO];
        
    } else {
        if (selectedPiece == [pieceDetails objectForKey:@"pieceType"]) {
            selectedPiece = @"";
            [chessBoardView highlightBlocks:possibleMoves removeHighlighting:YES];
        } else {
            [self movePiece:selectedPiece toBlockNumber:[NSString stringWithFormat:@"%i", blockNumber]];
        }
    }
}

- (void) handleChessBlockSelected: (NSNotification *)notification {
    
    if (selectedPiece != @"") {
        NSDictionary *blockDetails = notification.object;
        NSString *blockNumber = [blockDetails valueForKey:@"blockNumber"];
        
        if ([possibleMoves containsObject:blockNumber]) {
            
            [self movePiece:selectedPiece toBlockNumber:blockNumber];
            
        } else {
            NSLog(@"Invalid Move");
        }
    }
}

- (void)movePiece:(NSString *)currentPiece toBlockNumber:(NSString *)blockNumber {
    /*
    if (block is empty) {
       just move 
    } else if (block is enemy) {
       move, and make the enemy piece empty, as it is a cut
    } else if (block is enemy) {
       dont move, but reveal that piece
    }*/
    
    if ([chessBoardLayout isBlockEmpty:currentPiece targetBlockNumber:[blockNumber intValue]]) {
        
        NSLog(@"moved to empty block");
        
        [chessBoardLayout movePiece:currentPiece toBlockNumber:[blockNumber intValue]];
        
    } else if ([chessBoardLayout isEnemyPiecePiece:currentPiece targetBlockNumber:[blockNumber intValue]]) {
        
        NSLog(@"moved and cut enemy piece");
        
        [chessBoardLayout movePiece:currentPiece toBlockNumber:[blockNumber intValue]];
        
    } else {
        
        NSLog(@"revealed friendly piece");
        
        NSString *revealedPieceValue = [[chessBoardLayout finalLayoutPositions] objectAtIndex:[blockNumber intValue]];
        
        [revealedPieces addObject:revealedPieceValue];
    }
    
    [chessBoardView refreshLayout:chessBoardLayout revealedPieces:revealedPieces];
    selectedPiece = @"";
    [chessBoardView highlightBlocks:possibleMoves removeHighlighting:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
