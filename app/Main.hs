module Main where

import Lib
import Control.Monad.State



-- Figures

empty = [[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0]]
l = [[0,0,0,0,0],[0,0,0,0,1],[0,0,0,0,1],[0,0,0,0,1],[0,0,0,1,1]]
i = [[0,0,0,0,1],[0,0,0,0,1],[0,0,0,0,1],[0,0,0,0,1],[0,0,0,0,1]]
x = [[0,0,0,1,0],[0,0,1,1,1],[0,0,0,1,0],[0,0,0,0,0],[0,0,0,0,0]]

initial_state = (0, [empty])

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

main = print $ evalState (playGame [l, i, x]) initial_state
