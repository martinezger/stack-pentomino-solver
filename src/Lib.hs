module Lib where

import Data.List

type Row = [Integer]
type Poliomino =  [Row]

rotate_90 :: Poliomino -> Poliomino
rotate_90 = Data.List.transpose . map Data.List.reverse

rotate_180 :: Poliomino -> Poliomino
rotate_180 = rotate_90 . rotate_90

rotate_270 :: Poliomino -> Poliomino
rotate_270 = rotate_180 . rotate_90

move_row_left :: Row -> Row
move_row_left [] = []
move_row_left (x:xs) = xs ++ [0]

move_figure_left :: Poliomino -> Poliomino
move_figure_left [] =  []
move_figure_left figure = map (move_row_left)  figure

sum_rows :: Row -> Row -> Row
sum_rows a b = zipWith (+) a b

sum_figures :: Poliomino -> Poliomino -> Poliomino
sum_figures figure_a figure_b = zipWith (sum_rows) figure_a figure_b

get_max_from :: Poliomino -> Integer
get_max_from figure = maximum (map maximum figure)

pile_up_rows :: Row -> Row -> Integer -> Row
pile_up_rows a b c =  zipWith (\ x y ->  if x == 1 then c else y) a b

pile_up_figures :: Poliomino -> Poliomino -> Integer -> Poliomino
pile_up_figures figure_a figure_b level = zipWith (\ a b -> pile_up_rows a b level) figure_a figure_b

extract_row :: Row -> Row -> Row
extract_row a b = zipWith (\ x y ->  if (x + y) > y then x + y else 0) a b

extract :: Poliomino -> Poliomino -> Poliomino
extract figure_a figure_b = zipWith (extract_row) figure_a figure_b