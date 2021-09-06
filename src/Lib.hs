module Lib where

import Data.List

empty = [[False,False,False,False,False], [False,False,False,False,False], [False,False,False,False,False], [False,False,False,False,False], [False,False,False,False,False]]
f = [[False,True,True,False,False], [True,True,False,False,False], [False,True,False,False,False], [False,False,False,False,False], [False,False,False,False,False]]
i = [[True,False,False,False,False], [True,False,False,False,False], [True,False,False,False,False], [True,False,False,False,False], [True,False,False,False,False]]
l = [[True,False,False,False,False], [True,False,False,False,False], [True,True,True,False,False], [False,False,False,False,False], [False,False,False,False,False]]
n = [[False,True,False,False,False], [True,True,False,False,False], [True,False,False,False,False], [True,False,False,False,False], [False,False,False,False,False]]
p = [[False,True,False,False,False], [True,True,False,False,False], [True,True,False,False,False], [False,False,False,False,False], [False,False,False,False,False]]
t = [[True,True,True,False,False], [False,True,False,False,False], [False,True,False,False,False], [False,False,False,False,False], [False,False,False,False,False]]
u = [[True,False,True,False,False], [True,True,True,False,False], [False,False,False,False,False], [False,False,False,False,False], [False,False,False,False,False]]
v = [[True,False,False,False,False], [True,False,False,False,False], [True,True,True,False,False], [False,False,False,False,False], [False,False,False,False,False]]
w = [[True,False,False,False,False], [True,True,False,False,False], [False,True,True,False,False], [False,False,False,False,False], [False,False,False,False,False]]
x = [[False,True,False,False,False], [True,True,True,False,False], [False,True,False,False,False], [False,False,False,False,False], [False,False,False,False,False]]
y = [[False,True,False,False,False], [True,True,False,False,False], [False,True,False,False,False], [False,True,False,False,False], [False,False,False,False,False]]
z = [[True,True,False,False,False], [False,True,False,False,False], [False,True,True,False,False], [False,False,False,False,False],[False,False,False,False,False]]

rotate_90 = Data.List.transpose . map Data.List.reverse

rotate_180 = rotate_90 . rotate_90

rotate_270 = rotate_180 . rotate_90

check_row_level_up row_a row_b = Data.List.intersect [True] (zipWith (&&) row_a row_b) == [True]

check_figure_level_up figure_a figure_b =  zipWith (check_row_level_up) figure_a figure_b

