module Lib where

import Data.List

move_row_left :: [Integer] -> [Integer]
move_row_left [] = []
move_row_left (x:xs) = xs ++ [0]

move_figure_left :: [[Integer]] -> [[Integer]]
move_figure_left [] =  []
move_figure_left figure = map (move_row_left)  figure


diff_rows :: [Integer] -> [Integer] -> [Integer]
diff_rows x y = zipWith (-) x y

diff_figure :: [[Integer]] -> [[Integer]] -> [[Integer]]
diff_figure figure_a figure_b = zipWith (diff_rows) figure_a figure_b

sum_rows :: [Integer] -> [Integer] -> [Integer]
sum_rows x y = zipWith (+) x y

sum_figure :: [[Integer]] -> [[Integer]] -> [[Integer]]
sum_figure figure_a figure_b = zipWith (sum_rows) figure_a figure_b

get_max :: [[Integer]] -> Integer
get_max figure = maximum (map maximum figure)

replace_row :: [Integer] -> [Integer] -> Integer -> [Integer]
replace_row a b c =  zipWith (\ x y ->  if x == 1 then c else y) a b

pile_figures :: [[Integer]] -> [[Integer]] -> Integer -> [[Integer]]
pile_figures figure_a figure_b level = zipWith (\ a b -> replace_row a b level) figure_a figure_b

sum_sum :: [Integer] -> [Integer] -> [Integer]
sum_sum a b = zipWith (\ x y ->  if (x + y) > y then x + y else 0) a b

sum_sum_figure :: [[Integer]] -> [[Integer]] -> [[Integer]]
sum_sum_figure figure_a figure_b = zipWith (sum_sum) figure_a figure_b