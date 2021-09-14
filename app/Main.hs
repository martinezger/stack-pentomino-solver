module Main where

import Lib
import Control.Monad.State



-- Figures

empty = [[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0]]

f = [[0,0,0,1,1],[0,0,1,1,0],[0,0,0,1,0],[0,0,0,0,0],[0,0,0,0,0]]

i = [[0,0,0,0,1],[0,0,0,0,1],[0,0,0,0,1],[0,0,0,0,1],[0,0,0,0,1]]

l = [[0,0,0,0,1],[0,0,0,0,1],[0,0,0,0,1],[0,0,0,1,1],[0,0,0,0,0]]

n = [[0,0,0,0,0],[0,0,0,0,1],[0,0,0,1,1],[0,0,0,1,0],[0,0,0,1,0]]

p =[[0,0,0,0,1],[0,0,0,1,1],[0,0,0,1,1],[0,0,0,0,0],[0,0,0,0,0]]

t = [[0,0,1,1,1],[0,0,0,1,0],[0,0,0,1,0],[0,0,0,0,0],[0,0,0,0,0]]

u = [[0,0,1,0,1],[0,0,1,1,1],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0]]

v = [[0,0,0,0,1],[0,0,0,0,1],[0,0,1,1,1],[0,0,0,0,0],[0,0,0,0,0]]

w = [[0,0,0,0,1],[0,0,0,1,1],[0,0,1,1,0],[0,0,0,0,0],[0,0,0,0,0]]

x = [[0,0,0,1,0],[0,0,1,1,1],[0,0,0,1,0],[0,0,0,0,0],[0,0,0,0,0]]

y = [[0,0,0,1,0],[0,0,0,1,1],[0,0,0,1,0],[0,0,0,1,0],[0,0,0,0,0]]

z = [[0,0,1,1,0],[0,0,0,1,0],[0,0,0,1,1],[0,0,0,0,0],[0,0,0,0,0]]

test_accum = [[1,0,1,2,1],[1,0,2,2,2],[1,0,1,2,1],[1,0,1,0,1],[1,0,1,0,1]]


l' =  [[0,0,0,0,0],[0,0,0,0,0],[1,0,0,0,0],[1,0,0,0,0],[1,1,1,0,0]]
f' = [[0,0,0,0,0],[0,0,0,0,0], [0,0,1,1,0],[0,1,1,0,0],[0,0,1,0,0]]

test_set = [empty, i, x, i]

initial_state = (2, [test_accum])

type Levels = Integer
type CounterState = (Integer, [[[Integer]]])

playGame :: [[[Integer]]] -> State CounterState (Integer, [[[Integer]]])

playGame [] = do
    (level, accumm ) <- get
    return (level, accumm)

playGame (x:xs) = do

    (level, accum ) <- get    

    let xx = sum_figure x (head accum)
    let level_counter = get_max xx
    let pile_max = [(pile_figures x (head accum) level_counter)]
    
    let when_lower = sum_sum_figure x (head accum)
    let when_lower_level = get_max(when_lower)
    let pile_lower = [(pile_figures x (head accum) when_lower_level)]

    if level_counter > level then
        put (level_counter, pile_max)
    else
        put (level_counter, pile_lower)
   
    playGame xs

main = print $ evalState (playGame [l', f']) initial_state

-- main = print "hola"