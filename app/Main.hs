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

test_set = [empty, i, x, i]

initial_state = (0, [empty])

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
    let pile_max = [(pile_figures_max x (head accum) level_counter)]
    let pile_not_max = [(pile_figures_not_max x (head accum))]

    if level_counter > level then
        put (level_counter, pile_max)
    else
        put (level_counter, pile_not_max)
   
    playGame xs

main = print $ evalState (playGame [i, move_figure_left i, move_figure_left i , i, i ]) initial_state

-- main = print "hola"