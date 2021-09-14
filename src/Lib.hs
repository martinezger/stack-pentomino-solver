module Lib where

import Data.List

move_row_left :: [Integer] -> [Integer]
move_row_left [] = []
move_row_left (x:xs) = xs ++ [0]

move_figure_left :: [[Integer]] -> [[Integer]]
move_figure_left [] =  []
move_figure_left figure = map (move_row_left)  figure

sum_rows :: [Integer] -> [Integer] -> [Integer]
sum_rows x y = zipWith (+) x y

sum_figure :: [[Integer]] -> [[Integer]] -> [[Integer]]
sum_figure figure_a figure_b = zipWith (sum_rows) figure_a figure_b

get_max :: [[Integer]] -> Integer
get_max figure = maximum (map maximum figure)

replace_max :: [Integer] -> [Integer] -> Integer -> [Integer]
replace_max a b c =  zipWith (\ x y ->  if x == 1 then c else y) a b

pile_figures_max :: [[Integer]] -> [[Integer]] -> Integer -> [[Integer]]
pile_figures_max figure_a figure_b level = zipWith (\ a b -> replace_max a b level) figure_a figure_b

replace_not_max :: [Integer] -> [Integer] -> [Integer]
replace_not_max ant sig = zipWith(\ x y -> if x < y then y else x) ant sig

pile_figures_not_max :: [[Integer]] -> [[Integer]] -> [[Integer]]
pile_figures_not_max figure_a figure_b = zipWith(replace_not_max) figure_a figure_b
