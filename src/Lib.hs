module Lib where

import Data.List

empty = [[False,False,False,False,False],[False,False,False,False,False],[False,False,False,False,False],[False,False,False,False,False],[False,False,False,False,False]]

rotate_90 = Data.List.transpose . map Data.List.reverse

rotate_180 = rotate_90 . rotate_90

rotate_270 = rotate_180 . rotate_90

check_row_level_up row_a row_b = Data.List.intersect [True] (zipWith (&&) row_a row_b) == [True]

check_figure_level_up figure_a figure_b =  foldl (||) False (zipWith (check_row_level_up) figure_a figure_b)

get_board_height [] = 0
get_board_height board = length(board)
sum_figure figure  = foldl (+) 0 (map (length) (map (filter (\ item -> item == True)) figure))

get_board_length [] = 0
get_board_length (x:xs) = length(x)

move_row_left [] = []
move_row_left (x:xs) = xs ++ [False]

move_figure_left [] =  []
move_figure_left figure = map (move_row_left)  figure

-- move_figure_up [] = []
-- move_figure_up (x:xs) = xs : take (length x) (repeat False)

-- move_all_figure_left :: [[Bool]] -> [[Bool]]

-- move_all_figure_left [] = []
-- move_all_figure_left empty = empty

pairs [] = []

pairs xs = zip xs (tail xs)

check_pairs figure_list = map (\ (x,y) -> check_figure_level_up x y) (pairs figure_list)

stack_height figure_list = length (filter (\ x-> x == True) (check_pairs figure_list)) + 1

