module Main where
import Data.List.Utils
grid = [[1,1,0,0],[1,0,0,0],[0,0,0,1],[0,0,1,1]]
x = 4
y = 4
isNear a b = any (==b) [a-1..a+1]
neighbors grid x y = sum $ [v|(_,_,v)<-(filter (\(x0,y0,v)->(isNear x x0)&&(isNear y y0)&&(x/=x0||y/=y0)) grid)]
neighborCount grid = neighbors [(i,j,grid!!i!!j)| j<-[0..x-1], i<-[0..y-1]]
nextGen (living, neighbors) = if living==0 then (if (neighbors==3) then 1 else 0) else (if (neighbors==2) || (neighbors==3) then 1 else 0)
gridSummary grid = [(((grid !! i) !! j), (neighborCount grid i j)) | i <- [0..x-1], j <- [0..y-1]]
makeGrid list = [[list !! j | j <- [i*x..(i+1)*x-1]] | i <- [0..y-1]]
next grid = makeGrid $ map nextGen (gridSummary grid)
generation grid n = iterate next grid !! n
main = do generation grid 3