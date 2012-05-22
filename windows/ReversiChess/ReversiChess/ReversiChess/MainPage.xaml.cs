using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows.Shapes;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Media.Animation;
using Microsoft.Phone.Controls;

namespace ReversiChess
{
    public partial class MainPage : PhoneApplicationPage
    {
        public ChessSquare[] Squares;
        private RandomizePieces RP;
      
        private int[] arrValidMoves;
        public bool[] arrOccupiedSquares;
        private bool isWhiteMove;
        private bool isBlackMove;
        private bool isPieceSelected;

        // Constructor
        public MainPage()
        {
            InitializeComponent();

            arrValidMoves = new int[32];
            arrOccupiedSquares = new bool[64];
            Squares = new ChessSquare[64];
            RP = new RandomizePieces(this);
            
            InitializeVariables();
            defineBoardProperties(); // Set the properties of the board 
            RedrawChessBoard(); //Redraw the Basic ChessBoard
            SetDefaultBoard(); // Set the initial position of the 32 chess pieces
        }

        private void InitializeVariables()
        {
            
            for (int i = 0; i < 32; i++)
            {
                arrValidMoves[i] = -1;
            }

            for (int i = 0; i < 64; i++)
            {
                arrOccupiedSquares[i] = false;
            }

            isWhiteMove = true;
            isBlackMove = false;
            isPieceSelected = false;

            
            for (int i = 0; i < 64; i++)
            {
                Squares[i] = new ChessSquare(this);
                Squares[i].setPosition(i);
                int x = Squares[i].getRowPosition();
                int y = Squares[i].getColPosition();

                if ((x+y) % 2 == 0)
                    Squares[i].setColorState(GlobalConstants.COLORSTATE_LIGHT_NORMAL);
                else
                    Squares[i].setColorState(GlobalConstants.COLORSTATE_DARK_NORMAL);

            }

        }

        private int GetValidMovesforKingPos(int nPos)
        {
            int count = 0;

            //first clean arrValidMoves
            for (int i = 0; i < 32; i++)
            {
                arrValidMoves[i] = -1;
            }

            if (nPos - 11 >= 0 && (nPos-11)%10 <= 7)
            {
                arrValidMoves[count] = nPos - 11;
                count++;
            }
            
            if (nPos - 10 >= 0 && (nPos - 10)%10 <=7)
            {
                arrValidMoves[count] = nPos - 10;
                count++;
            }

            if (nPos - 9 >= 0 && (nPos - 9) % 10 <= 7)
            {
                arrValidMoves[count] = nPos - 9;
                count++;
            }

            if (nPos - 1 >= 0 && (nPos - 1) % 10 <= 7)
            {
                arrValidMoves[count] = nPos - 1;
                count++;
            }

            if (nPos + 1 >= 0 && (nPos + 1) % 10 <= 7)
            {
                arrValidMoves[count] = nPos + 1;
                count++;
            }

            if (nPos + 9 <= 77 && (nPos + 9) % 10 <= 7)
            {
                arrValidMoves[count] = nPos + 9;
                count++;
            }

            if (nPos + 10 <= 77 && (nPos + 10) % 10 <= 7)
            {
                arrValidMoves[count] = nPos + 10;
                count++;
            }

            if (nPos + 11 <= 77 && (nPos + 11) % 10 <= 7)
            {
                arrValidMoves[count] = nPos + 11;
                count++;
            }

            return count;
        }

        private int GetNumberFromRowCol(int row, int col)
        {
            return (row * 8 + col);
        }

        private void defineBoardProperties()
        {
            // Define the properties of the Button
            btn_New_Game.Content = "New game";
            btn_New_Game.HorizontalAlignment = System.Windows.HorizontalAlignment.Center;
            btn_New_Game.VerticalAlignment = System.Windows.VerticalAlignment.Top;
            btn_New_Game.Margin = new Thickness(12, 126, 0, 0);
            btn_New_Game.Height = 72;
            btn_New_Game.Width = 228;

            //Define the properties of the Chess Board
            grid_Board.Height = 440;
            grid_Board.Width = 440;
            grid_Board.ShowGridLines = false;
            grid_Board.HorizontalAlignment = System.Windows.HorizontalAlignment.Center;
            grid_Board.VerticalAlignment = System.Windows.VerticalAlignment.Center;
            grid_Board.Margin = new Thickness(12, 176, 0, 0);

        }

        private void RedrawChessBoard()
        {
            //first clear all the children of the chessBoard
            grid_Board.Children.Clear();
            grid_Board.RowDefinitions.Clear();
            grid_Board.ColumnDefinitions.Clear();

            //Create 8 Rows and Columns
            for (int i = 0; i < 8; i++)
            {
                RowDefinition row = new RowDefinition();
                ColumnDefinition col = new ColumnDefinition();
                grid_Board.RowDefinitions.Add(row);
                grid_Board.ColumnDefinitions.Add(col);
            }

            //Add the 64 initial pieces
            for (int i = 0; i < 64; i++)
            {
                grid_Board.Children.Add(Squares[i].imgBackground);
                SetPiecePosition(Squares[i].imgBackground,Squares[i].getRowPosition(),Squares[i].getColPosition());

                grid_Board.Children.Add(Squares[i].imgPiece);
                SetPiecePosition(Squares[i].imgPiece, Squares[i].getRowPosition(), Squares[i].getColPosition());
            }

        }

        public void setOccupiedSquare(int value,bool state)
        {
            this.arrOccupiedSquares[value] = state;
        }

        public bool isOccupiedSquare(int value)
        {
            return this.arrOccupiedSquares[value];
        }

        private void SetDefaultBoard()
        {
            //Set the Black pieces first
            Squares[0].setPieceIndex(GlobalConstants.PIECE_INDEX_BLACK_ROOK);
            Squares[1].setPieceIndex(GlobalConstants.PIECE_INDEX_BLACK_KNIGHT);
            Squares[2].setPieceIndex(GlobalConstants.PIECE_INDEX_BLACK_BISHOP_ON_WHITE);
            Squares[3].setPieceIndex(GlobalConstants.PIECE_INDEX_BLACK_QUEEN);
            Squares[4].setPieceIndex(GlobalConstants.PIECE_INDEX_BLACK_KING);
            Squares[5].setPieceIndex(GlobalConstants.PIECE_INDEX_BLACK_BISHOP_ON_BLACK);
            Squares[6].setPieceIndex(GlobalConstants.PIECE_INDEX_BLACK_KNIGHT);
            Squares[7].setPieceIndex(GlobalConstants.PIECE_INDEX_BLACK_ROOK);

            for (int i = 8; i < 16; i++)
                Squares[i].setPieceIndex(GlobalConstants.PIECE_INDEX_BLACK_PAWN);

            //Set the White pieces next
            for (int i = 48; i < 56; i++)
                Squares[i].setPieceIndex(GlobalConstants.PIECE_INDEX_WHITE_PAWN);

            Squares[56].setPieceIndex(GlobalConstants.PIECE_INDEX_WHITE_ROOK);
            Squares[57].setPieceIndex(GlobalConstants.PIECE_INDEX_WHITE_KNIGHT);
            Squares[58].setPieceIndex(GlobalConstants.PIECE_INDEX_WHITE_BISHOP_ON_BLACK);
            Squares[59].setPieceIndex(GlobalConstants.PIECE_INDEX_WHITE_QUEEN);
            Squares[60].setPieceIndex(GlobalConstants.PIECE_INDEX_WHITE_KING);
            Squares[61].setPieceIndex(GlobalConstants.PIECE_INDEX_WHITE_BISHOP_ON_WHITE);
            Squares[62].setPieceIndex(GlobalConstants.PIECE_INDEX_WHITE_KNIGHT);
            Squares[63].setPieceIndex(GlobalConstants.PIECE_INDEX_WHITE_ROOK);

        }

        private void SetPiecePosition(FrameworkElement element, int row, int col)
        {
            Grid.SetRow(element, row);
            Grid.SetColumn(element, col);
        }

        private void btn_New_Game_Click(object sender, RoutedEventArgs e)
        {
            InitializeVariables();
            SetDefaultBoard();
            RedrawChessBoard();
            RandomizePiecesOnBoard();
            HideAllPieces();
        }

        private void RandomizePiecesOnBoard()
        {
            Random rnd = new Random();

            for (int i = 0; i < 64; i++)
                Squares[i].setNewPieceIndex(-1);

            for (int i = 0; i < 64; i++)
            {
                int nPieceIndex = Squares[i].getPieceIndex();

                if (nPieceIndex != -1)
                {
                    int newPos = RP.ApplyRandomFunction(nPieceIndex);
                    
                    // Once a  new Position is got, store the piece in a temp area of the cell
                    Squares[newPos].setNewPieceIndex(nPieceIndex);
                }
            }

            for (int i = 0; i < 64; i++)
            {
                Squares[i].setPieceIndex(Squares[i].getNewPieceIndex());
                Squares[i].setNewPieceIndex(-1);
            }
                              
            return;
        }

        private void HideAllPieces()
        {
            for (int i = 0; i < 64; i++)
            {
                if (Squares[i].getPieceIndex() != GlobalConstants.PIECE_INDEX_BLACK_KING && Squares[i].getPieceIndex() != GlobalConstants.PIECE_INDEX_WHITE_KING)
                    Squares[i].imgPiece.Visibility = System.Windows.Visibility.Collapsed;
            }

        }

        private void ShowAllPieces()
        {
            for (int i = 0; i < 64; i++)
            {
                Squares[i].imgPiece.Visibility = System.Windows.Visibility.Collapsed;
            }

            
        }

        private void grid_Board_Tap(object sender, GestureEventArgs e)
        {
           //grid_Board.
        }
    }
}