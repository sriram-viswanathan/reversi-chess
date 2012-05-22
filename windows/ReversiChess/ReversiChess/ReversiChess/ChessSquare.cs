using System;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Media.Animation;
using System.Windows.Shapes;

namespace ReversiChess
{
    public class ChessSquare
    {
        private int ColorState; //White_Normal, Dark_Normal, White_Highlighted, Dark_Highlighted
        private bool isValidMove;
        private int nPieceIndex;
        private int Position;
        public Image imgBackground = new Image();
        public Image imgPiece = new Image();
        private int newPieceIndex;
        private bool hasHiddenPiece;

        private MainPage MainPageRef;

        public ChessSquare()
        {
            return;
        }

        public ChessSquare(MainPage refPage)
        {
            ColorState = -1;
            isValidMove = false;
            nPieceIndex = -1;
            Position = -1;
            hasHiddenPiece = false;
            this.MainPageRef = refPage;
            newPieceIndex = -1;
        }

        public bool CheckHiddenPiece()
        {
            return hasHiddenPiece;
        }

        public void setHiddenPiece(bool value)
        {
            hasHiddenPiece = value;
        }

        public int getRowPosition()
        {
            return Position / 8;
        }

        public int getColPosition()
        {
            return Position % 8;
        }

        public void setColorState(int state)
        {
            this.ColorState = state;

            if(ColorState == GlobalConstants.COLORSTATE_LIGHT_NORMAL)
                imgBackground.Source = new BitmapImage(new Uri("/ReversiChess;component/Images/Light_Normal.png", System.UriKind.Relative));
            else if(ColorState == GlobalConstants.COLORSTATE_DARK_NORMAL)
                imgBackground.Source = new BitmapImage(new Uri("/ReversiChess;component/Images/Dark_Normal.png", System.UriKind.Relative));
            else if (ColorState == GlobalConstants.COLORSTATE_LIGHT_HIGHLIGHTED)
                imgBackground.Source = new BitmapImage(new Uri("/ReversiChess;component/Images/Light_Highlighted.png", System.UriKind.Relative));
            else if (ColorState == GlobalConstants.COLORSTATE_DARK_HIGHLIGHTED)
                imgBackground.Source = new BitmapImage(new Uri("/ReversiChess;component/Images/Dark_Highlighted.png", System.UriKind.Relative));
        }

        public int getColorState()
        {
            return this.ColorState;
        }

        public void setNewPieceIndex(int index)
        {
            this.newPieceIndex = index;
            this.MainPageRef.arrOccupiedSquares[this.Position] = true;
        }

        public int getNewPieceIndex()
        {
            return this.newPieceIndex;
        }

        public void setPieceIndex(int index)
        {
            
            this.nPieceIndex = index;

            if (index == -1)
            {
                this.MainPageRef.grid_Board.Children.Remove(this.imgPiece);
                return;
            }

            if(nPieceIndex == GlobalConstants.PIECE_INDEX_BLACK_BISHOP_ON_BLACK || nPieceIndex == GlobalConstants.PIECE_INDEX_BLACK_BISHOP_ON_WHITE)
                this.imgPiece.Source = new BitmapImage(new Uri("/ReversiChess;component/Images/Black_Bishop.png", System.UriKind.Relative));
            else if(nPieceIndex == GlobalConstants.PIECE_INDEX_BLACK_ROOK)
                this.imgPiece.Source = new BitmapImage(new Uri("/ReversiChess;component/Images/Black_Rook.png", System.UriKind.Relative));
            else if(nPieceIndex == GlobalConstants.PIECE_INDEX_BLACK_KNIGHT)
                this.imgPiece.Source = new BitmapImage(new Uri("/ReversiChess;component/Images/Black_Knight.png", System.UriKind.Relative));
            else if(nPieceIndex == GlobalConstants.PIECE_INDEX_BLACK_QUEEN)
                this.imgPiece.Source = new BitmapImage(new Uri("/ReversiChess;component/Images/Black_Queen.png", System.UriKind.Relative));
            else if(nPieceIndex == GlobalConstants.PIECE_INDEX_BLACK_KING)
                this.imgPiece.Source = new BitmapImage(new Uri("/ReversiChess;component/Images/Black_King.png", System.UriKind.Relative));
            else if(nPieceIndex == GlobalConstants.PIECE_INDEX_BLACK_PAWN)
                this.imgPiece.Source = new BitmapImage(new Uri("/ReversiChess;component/Images/Black_Pawn.png", System.UriKind.Relative));
            else if(nPieceIndex == GlobalConstants.PIECE_INDEX_WHITE_ROOK)
                this.imgPiece.Source = new BitmapImage(new Uri("/ReversiChess;component/Images/White_Rook.png", System.UriKind.Relative));
            else if(nPieceIndex == GlobalConstants.PIECE_INDEX_WHITE_KNIGHT)
                this.imgPiece.Source = new BitmapImage(new Uri("/ReversiChess;component/Images/White_Knight.png", System.UriKind.Relative));
            else if(nPieceIndex == GlobalConstants.PIECE_INDEX_WHITE_BISHOP_ON_BLACK || nPieceIndex == GlobalConstants.PIECE_INDEX_WHITE_BISHOP_ON_WHITE)
                this.imgPiece.Source = new BitmapImage(new Uri("/ReversiChess;component/Images/White_Bishop.png", System.UriKind.Relative));
            else if(nPieceIndex == GlobalConstants.PIECE_INDEX_WHITE_QUEEN)
                this.imgPiece.Source = new BitmapImage(new Uri("/ReversiChess;component/Images/White_Queen.png", System.UriKind.Relative));
            else if(nPieceIndex == GlobalConstants.PIECE_INDEX_WHITE_KING)
                this.imgPiece.Source = new BitmapImage(new Uri("/ReversiChess;component/Images/White_King.png", System.UriKind.Relative));
            else if(nPieceIndex == GlobalConstants.PIECE_INDEX_WHITE_PAWN)
                this.imgPiece.Source = new BitmapImage(new Uri("/ReversiChess;component/Images/White_Pawn.png", System.UriKind.Relative));
            
            this.imgPiece.Width = this.imgPiece.Height = 40;

            int x = getRowPosition();
            int y = getColPosition();

            this.MainPageRef.setOccupiedSquare(x*8+y, true);
        }

        public int getPieceIndex()
        {
            return this.nPieceIndex;
        }

        public void setValidMove(bool value)
        {
            isValidMove = value;
        }

        public bool getValidMove()
        {
            return this.isValidMove;
        }

        public void setPosition(int value)
        {
            this.Position = value;
        }

        public int getPosition()
        {
            return this.Position;
        }
    }
}
