using System;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;

namespace ReversiChess
{
    public static class GlobalConstants
    {
        public static int COLORSTATE_LIGHT_NORMAL = 1;
        public static int COLORSTATE_LIGHT_HIGHLIGHTED = 2;
        public static int COLORSTATE_DARK_NORMAL = 3;
        public static int COLORSTATE_DARK_HIGHLIGHTED = 4;

        public static int PIECE_INDEX_BLACK_ROOK = 1;
        public static int PIECE_INDEX_BLACK_KNIGHT = 2;
        public static int PIECE_INDEX_BLACK_BISHOP_ON_WHITE = 3;
        public static int PIECE_INDEX_BLACK_BISHOP_ON_BLACK = 4;
        public static int PIECE_INDEX_BLACK_KING = 5;
        public static int PIECE_INDEX_BLACK_QUEEN = 6;
        public static int PIECE_INDEX_BLACK_PAWN = 7;
        
        public static int PIECE_INDEX_WHITE_ROOK = 8;
        public static int PIECE_INDEX_WHITE_KNIGHT = 9;
        public static int PIECE_INDEX_WHITE_BISHOP_ON_WHITE = 10;
        public static int PIECE_INDEX_WHITE_BISHOP_ON_BLACK = 11;
        public static int PIECE_INDEX_WHITE_KING = 12;
        public static int PIECE_INDEX_WHITE_QUEEN = 13;
        public static int PIECE_INDEX_WHITE_PAWN = 14;        
        
    }
}
