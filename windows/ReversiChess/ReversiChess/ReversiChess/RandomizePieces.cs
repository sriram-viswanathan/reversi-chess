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
    public class RandomizePieces
    {
        private MainPage mainPageRef;

        public RandomizePieces()
        {
        }

        public RandomizePieces(MainPage pageref)
        {
            this.mainPageRef = pageref;
        }

        public int ApplyRandomFunction(int nPieceIndex)
        {
            if (nPieceIndex == GlobalConstants.PIECE_INDEX_BLACK_BISHOP_ON_BLACK)
                return (RandomPosForBishopOnBlack());
            else if (nPieceIndex == GlobalConstants.PIECE_INDEX_BLACK_BISHOP_ON_WHITE)
                return (RandomPosForBishopOnWhite());
            else if (nPieceIndex == GlobalConstants.PIECE_INDEX_BLACK_ROOK)
                return (RandomPosForRook());
            else if (nPieceIndex == GlobalConstants.PIECE_INDEX_BLACK_KNIGHT)
                return (RandomPosForKnight());
            else if (nPieceIndex == GlobalConstants.PIECE_INDEX_BLACK_QUEEN)
                return (RandomPosForQueen());
            else if (nPieceIndex == GlobalConstants.PIECE_INDEX_BLACK_KING)
                return (RandomPosForBlackKing());
            else if (nPieceIndex == GlobalConstants.PIECE_INDEX_BLACK_PAWN)
                return (RandomPosForBlackPawn());
            else if (nPieceIndex == GlobalConstants.PIECE_INDEX_WHITE_ROOK)
                return (RandomPosForRook());
            else if (nPieceIndex == GlobalConstants.PIECE_INDEX_WHITE_KNIGHT)
                return (RandomPosForKnight());
            else if (nPieceIndex == GlobalConstants.PIECE_INDEX_WHITE_BISHOP_ON_BLACK)
                return (RandomPosForBishopOnBlack());
            else if (nPieceIndex == GlobalConstants.PIECE_INDEX_WHITE_BISHOP_ON_WHITE)
                return (RandomPosForBishopOnWhite());            
            else if (nPieceIndex == GlobalConstants.PIECE_INDEX_WHITE_QUEEN)
                return (RandomPosForQueen());
            else if (nPieceIndex == GlobalConstants.PIECE_INDEX_WHITE_KING)
                return (RandomPosForWhiteKing());
            else if (nPieceIndex == GlobalConstants.PIECE_INDEX_WHITE_PAWN)
                return (RandomPosForWhitePawn());
            
            return -1;
        }

        int RandomPosForBishopOnBlack()
        {
            //first get all the unoccupied Black colored squares into an array
            int i = 0;
            int[] ValidSquares = new int[64];
            int count = 0;
            
            for (i = 0; i < 64; i++)
            {
                //Loop through all the available squares and pick only the black colored squares
                int row = i / 8;
                int col = i % 8;
                if ((row+col)%2 == 1 && this.mainPageRef.Squares[i].getNewPieceIndex() == -1)
                {
                    ValidSquares[count] = i;
                    count++;
                }
            }

            Random rand = new Random();
            
            //Shuffle the ValidSquares array
            for (i = count - 1; i > 0; i--)
            {
                int j = rand.Next(0, i + 1);
                int swap = ValidSquares[i];
                ValidSquares[i] = ValidSquares[j];
                ValidSquares[j] = swap;
            }

            int x = rand.Next(count);
            return ValidSquares[x];
        }

        int RandomPosForBishopOnWhite()
        {
            //first get all the unoccupied White colored squares into an array
            int i = 0;
            int[] ValidSquares = new int[64];
            int count = 0;

            for (i = 0; i < 64; i++)
            {
                //Loop through all the available squares and pick only the White colored squares
                int row = i / 8;
                int col = i % 8;
                if ((row + col) % 2 == 0 && this.mainPageRef.Squares[i].getNewPieceIndex() == -1)
                {
                    ValidSquares[count] = i;
                    count++;
                }
            }

            Random rand = new Random();

            //Shuffle the ValidSquares array
            for (i = count - 1; i > 0; i--)
            {
                int j = rand.Next(0, i + 1);
                int swap = ValidSquares[i];
                ValidSquares[i] = ValidSquares[j];
                ValidSquares[j] = swap;
            }

            int x = rand.Next(count);
            return ValidSquares[x];
        }

        int RandomPosForQueen()
        {
            //first get all the unoccupied Black and White colored squares into an array
            int i = 0;
            int[] ValidSquares = new int[64];
            int count = 0;

            for (i = 0; i < 64; i++)
            {
                if (this.mainPageRef.Squares[i].getNewPieceIndex() == -1)
                {
                    ValidSquares[count] = i;
                    count++;
                }
            }

            Random rand = new Random();

            //Shuffle the ValidSquares array
            for (i = count - 1; i > 0; i--)
            {
                int j = rand.Next(0, i + 1);
                int swap = ValidSquares[i];
                ValidSquares[i] = ValidSquares[j];
                ValidSquares[j] = swap;
            }

            int x = rand.Next(count);
            return ValidSquares[x];
        }

        int RandomPosForRook()
        {
            //first get all the unoccupied Black and White colored squares into an array
            int i = 0;
            int[] ValidSquares = new int[64];
            int count = 0;

            for (i = 0; i < 64; i++)
            {
                if (this.mainPageRef.Squares[i].getNewPieceIndex() == -1)
                {
                    ValidSquares[count] = i;
                    count++;
                }
            }

            Random rand = new Random();

            //Shuffle the ValidSquares array
            for (i = count - 1; i > 0; i--)
            {
                int j = rand.Next(0, i + 1);
                int swap = ValidSquares[i];
                ValidSquares[i] = ValidSquares[j];
                ValidSquares[j] = swap;
            }

            int x = rand.Next(count);
            return ValidSquares[x];
        }

        int RandomPosForKnight()
        {
            //first get all the unoccupied Black and White colored squares into an array
            int i = 0;
            int[] ValidSquares = new int[64];
            int count = 0;

            for (i = 0; i < 64; i++)
            {
                if (this.mainPageRef.Squares[i].getNewPieceIndex() == -1)
                {
                    ValidSquares[count] = i;
                    count++;
                }
            }

            Random rand = new Random();

            //Shuffle the ValidSquares array
            for (i = count - 1; i > 0; i--)
            {
                int j = rand.Next(0, i + 1);
                int swap = ValidSquares[i];
                ValidSquares[i] = ValidSquares[j];
                ValidSquares[j] = swap;
            }

            int x = rand.Next(count);
            return ValidSquares[x];
        }

        int RandomPosForBlackKing()
        {
            //first get all the unoccupied Black and White colored squares into an array
            int i = 0;
            int[] ValidSquares = new int[64];
            int count = 0;

            for (i = 0; i < 27; i++)
            {
                if (this.mainPageRef.Squares[i].getNewPieceIndex() == -1)
                {
                    ValidSquares[count] = i;
                    count++;
                }
            }

            Random rand = new Random();

            //Shuffle the ValidSquares array
            for (i = count - 1; i > 0; i--)
            {
                int j = rand.Next(0, i + 1);
                int swap = ValidSquares[i];
                ValidSquares[i] = ValidSquares[j];
                ValidSquares[j] = swap;
            }

            int x = rand.Next(count);
            return ValidSquares[x];
        }

        int RandomPosForWhiteKing()
        {
            //first get all the unoccupied Black and White colored squares into an array
            int i = 0;
            int[] ValidSquares = new int[64];
            int count = 0;

            for (i = 37; i < 64; i++)
            {
                if (this.mainPageRef.Squares[i].getNewPieceIndex() == -1)
                {
                    ValidSquares[count] = i;
                    count++;
                }
            }

            Random rand = new Random();

            //Shuffle the ValidSquares array
            for (i = count - 1; i > 0; i--)
            {
                int j = rand.Next(0, i + 1);
                int swap = ValidSquares[i];
                ValidSquares[i] = ValidSquares[j];
                ValidSquares[j] = swap;
            }

            int x = rand.Next(count);
            return ValidSquares[x];
        
        }

        int RandomPosForBlackPawn()
        {
            //first get all the unoccupied Black and White colored squares into an array
            int i = 0;
            int[] ValidSquares = new int[64];
            int count = 0;

            for (i = 8; i < 48; i++)
            {
                if (this.mainPageRef.Squares[i].getNewPieceIndex() == -1)
                {
                    ValidSquares[count] = i;
                    count++;
                }
            }

            Random rand = new Random();

            //Shuffle the ValidSquares array
            for (i = count - 1; i > 0; i--)
            {
                int j = rand.Next(0, i + 1);
                int swap = ValidSquares[i];
                ValidSquares[i] = ValidSquares[j];
                ValidSquares[j] = swap;
            }

            int x = rand.Next(count);
            return ValidSquares[x];
        }

        int RandomPosForWhitePawn()
        {
            //first get all the unoccupied Black and White colored squares into an array
            int i = 0;
            int[] ValidSquares = new int[64];
            int count = 0;

            for (i = 16; i < 55; i++)
            {
                if (this.mainPageRef.Squares[i].getNewPieceIndex() == -1)
                {
                    ValidSquares[count] = i;
                    count++;
                }
            }

            Random rand = new Random();

            //Shuffle the ValidSquares array
            for (i = count - 1; i > 0; i--)
            {
                int j = rand.Next(0, i + 1);
                int swap = ValidSquares[i];
                ValidSquares[i] = ValidSquares[j];
                ValidSquares[j] = swap;
            }

            int x = rand.Next(count);
            return ValidSquares[x];
        }
    }
}
