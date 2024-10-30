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