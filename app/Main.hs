module Main where

import Lib
import Data.Matrix

-- Figures

f = [[False,False,False,True,True],[False,False,True,True,False],[False,False,False,True,False],[False,False,False,False,False],[False,False,False,False,False]]
i = [[False,False,False,False,True],[False,False,False,False,True],[False,False,False,False,True],[False,False,False,False,True],[False,False,False,False,True]]
l = [[False,False,False,False,True],[False,False,False,False,True],[False,False,False,False,True],[False,False,False,True,True],[False,False,False,False,False]]
n = [[False,False,False,False,True],[False,False,False,True,True],[False,False,False,True,False],[False,False,False,True,False],[False,False,False,False,False]]
p = [[False,False,False,False,True],[False,False,False,True,True],[False,False,False,True,True],[False,False,False,False,False],[False,False,False,False,False]]
t = [[False,False,True,True,True],[False,False,False,True,False],[False,False,False,True,False],[False,False,False,False,False],[False,False,False,False,False]]
u = [[False,False,True,False,True],[False,False,True,True,True],[False,False,False,False,False],[False,False,False,False,False],[False,False,False,False,False]]
v = [[False,False,False,False,True],[False,False,False,False,True],[False,False,True,True,True],[False,False,False,False,False],[False,False,False,False,False]]
w = [[False,False,False,False,True],[False,False,False,True,True],[False,False,True,True,False],[False,False,False,False,False],[False,False,False,False,False]]
x = [[False,False,False,True,False],[False,False,True,True,True],[False,False,False,True,False],[False,False,False,False,False],[False,False,False,False,False]]
y = [[False,False,False,True,False],[False,False,False,True,True],[False,False,False,True,False],[False,False,False,True,False],[False,False,False,False,False]]
z = [[False,False,True,True,False],[False,False,False,True,False],[False,False,False,True,True],[False,False,False,False,False],[False,False,False,False,False]]

figure_set = [f, i, l, n, p, t, u, v, w, x, y, z]

main  = do 
    print ("PENTONOMINO STACK SOLVER")
