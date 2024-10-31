-- HASK17
-- b)
longest_run :: [Bool] -> Integer
longest_run lst = helper lst 0 0
    where
        helper [] total curr = max total curr
        helper (x:xs) total curr
            | x = helper xs total (curr + 1)
            | otherwise = helper xs (max total curr) 0

-- HASK17
-- d)
max_tree_value :: Tree -> Integer
max_tree_value Empty = 0
max_tree_value (Node val []) = val
max_tree_value (Node val children) = max val (maximum (map max_tree_value children))

data Tree = 
    Empty | 
    Node Integer [Tree]

-- HASK18
data Event = Travel Integer | Fight Integer | Heal Integer
super_giuseppe :: [Event] -> Integer
super_giuseppe lst = helper lst 100 False
    where
        helper [] health _ = health -- done with game
        helper _ health _ 
            | health <= 0 = -1 -- lose all hp
        helper (Travel dist:xs) health inDefenseMode
            | inDefenseMode = helper xs health inDefenseMode -- don't gain any health
            | otherwise = helper xs (min 100 (health + dist `div` 4)) inDefenseMode
        helper (Fight hplost:xs) health inDefenseMode
            | inDefenseMode = helper xs (health - hplost `div` 2) inDefenseMode -- lose half
            | otherwise = helper xs (health - hplost) (health - hplost <= 40) 
        helper (Heal hpgain:xs) health inDefenseMode = helper xs (min 100 (health + hpgain)) (health + hpgain <= 40) -- gain health and check if inDefenseMode

-- HASK19
-- a)
sumSquares :: Integer -> Integer
sumSquares 0 = 0
sumSquares n = n^2 + sumSquares(n-1)

-- b)
sumSquaresTail :: Integer -> Integer
sumSquaresTail n = helper n 0
    where
        helper 0 acc = acc
        helper n acc = helper (n-1) (acc + n^2)