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
type CounterState = (Integer, [Poliomino])

playGame :: [Poliomino] -> State CounterState (Integer, [Poliomino])

playGame [] = do
    (level, accumm ) <- get
    return (level, accumm)

playGame (x:xs) = do

    (level, accum ) <- get    
    
    let    
        sum_x_accum = sum_figures x (head accum)
        level_counter = get_max_from sum_x_accum
    
        pile_higher = [(pile_up_figures x (head accum) level_counter)]

        when_lower = extract x (head accum)
        when_lower_level = get_max_from(when_lower)
        pile_lower = [(pile_up_figures x (head accum) when_lower_level)]

    if level_counter > level then
        put (level_counter, pile_higher)
    else
        put (level, pile_lower)
   
    playGame xs

main = print $ evalState (playGame [l', f']) initial_state
