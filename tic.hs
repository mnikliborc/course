data MoveResult =
  Ok Board | Occupied | Finished BoardFinished

data Player = Naught | Cross
data Won = Won Player | Draw

data XCoord = X1 | X2 | X3
data YCoord = Y1 | Y2 | Y3
data Position = Position XCoord YCoord

data Board = 
  Board
    Cell Cell Cell
    Cell Cell Cell
    Cell Cell Cell

type Cell =
  Maybe Player
{-
data BoardFinished = 
  BoardFinished Board

whoWon :: BoardFinished -> Won
whoWon = undefined

move :: Board -> Position -> MoveResult
move b p pos =
  case playerAt b pos of 
    Cell Just _  -> Occupied
    Cell Nothing -> 
      let c = Cell Just (nextPlayer b)
      let nb = nextBoard pos b
      case isFinished nb of
        True -> Finished (BoardFinished nb)
        False -> Ok nb
      

nextBoard :: Position -> Board -> Board
nextBoard ((Position (X1) (Y1)), (Board p1 p2 p3 p4 p5 p6 p7 p8 p9)) -> Board c p2 p3 p4 p5 p6 p7 p8 p9
nextBoard ((Position (X2) (Y1)), (Board p1 p2 p3 p4 p5 p6 p7 p8 p9)) -> Board p1 c p3 p4 p5 p6 p7 p8 p9
nextBoard ((Position (X3) (Y1)), (Board p1 p2 p3 p4 p5 p6 p7 p8 p9)) -> Board p1 p2 c p4 p5 p6 p7 p8 p9
nextBoard ((Position (X1) (Y2)), (Board p1 p2 p3 p4 p5 p6 p7 p8 p9)) -> Board p1 p2 p3 c p5 p6 p7 p8 p9
nextBoard ((Position (X2) (Y2)), (Board p1 p2 p3 p4 p5 p6 p7 p8 p9)) -> Board p1 p2 p3 p4 c p6 p7 p8 p9
nextBoard ((Position (X3) (Y2)), (Board p1 p2 p3 p4 p5 p6 p7 p8 p9)) -> Board p1 p2 p3 p4 p5 c p7 p8 p9
nextBoard ((Position (X1) (Y3)), (Board p1 p2 p3 p4 p5 p6 p7 p8 p9)) -> Board p1 p2 p3 p4 p5 p6 c p8 p9
nextBoard ((Position (X2) (Y3)), (Board p1 p2 p3 p4 p5 p6 p7 p8 p9)) -> Board p1 p2 p3 p4 p5 p6 p7 c p9
nextBoard ((Position (X3) (Y3)), (Board p1 p2 p3 p4 p5 p6 p7 p8 p9)) -> Board p1 p2 p3 p4 p5 p6 p7 p8 c

isFinished :: Board -> Bool
isFinished b = length . filter $ (\c -> case c of 
  Nothing -> True
  _       -> False) (getCells b)

nextPlayer :: Board -> Player
nextPlayer b = case (countCrosses (getCells b)) `mod` 2 of 
  0 -> Cross
  1 -> Naught

countCrosses :: [Cell] -> Int -> Int
countCrosses Nil agg = agg
countCrosses ((Just Cross):cs) = countCrosses cs (agg + 1)
countCrosses (_:cs) = countCrosses cs (agg)

getCells :: Board -> [Cell]
getCells (Board c1 c2 c3 c4 c5 c6 c7 c8 c9) = 
  [c1, c2, c3, c4, c5, c6, c7, c8, c9]

playerAt :: Board -> Position -> Cell
playerAt (Board c _ _ _ _ _ _ _ _) (Position (X1) (Y1)) = c
playerAt (Board _ c _ _ _ _ _ _ _) (Position (X2) (Y1)) = c
playerAt (Board _ _ c _ _ _ _ _ _) (Position (X3) (Y1)) = c
playerAt (Board _ _ _ c _ _ _ _ _) (Position (X1) (Y2)) = c
playerAt (Board _ _ _ _ c _ _ _ _) (Position (X2) (Y2)) = c
playerAt (Board _ _ _ _ _ c _ _ _) (Position (X3) (Y2)) = c
playerAt (Board _ _ _ _ _ _ c _ _) (Position (X1) (Y3)) = c
playerAt (Board _ _ _ _ _ _ _ c _) (Position (X2) (Y3)) = c
playerAt (Board _ _ _ _ _ _ _ _ c) (Position (X3) (Y3)) = c-}