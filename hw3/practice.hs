-- Q10
-- a)
scale_nums :: [Int] -> Int -> [Int]
scale_nums lst factor = map (\x -> x*factor) lst

-- b)
only_odds :: [[Int]] -> [[Int]]
only_odds lst = filter (\x -> all (odd) x ) lst

-- c)
largest_in_list :: [String] -> String
largest_in_list lst = foldl largest "" lst -- function take two parameters change accum, default accum is empty string, lst

largest :: String -> String -> String
largest first second =
    if length first >= length second then first else second

-- Q11
-- a)
count_if :: (a -> Bool) -> [a] -> Int
count_if fn [] = 0
count_if fn (x:xs)
    | fn x = 1 + count_if fn xs
    | otherwise = count_if fn xs

-- b)
count_if_with_filter :: (a -> Bool) -> [a] -> Int
count_if_with_filter fn lst = length (filter fn lst)

-- c)
count_if_with_fold :: (a -> Bool) -> [a] -> Int
count_if_with_fold fn lst = foldl (\accum x -> if fn x then (accum+1) else accum) 0 lst

-- Q12
f :: Int -> Int -> Int -> Int -> Int
f a b =
  let c = \a -> a   -- (1)
      d = \c -> b   -- (2)
  in \e f -> c d e  -- (3)

-- Q14
-- c)
foo :: Integer -> (Integer -> (Integer -> ((Integer -> a) -> [a])))
foo = (\x -> (\y -> (\z -> (\t -> map t [x, x+z..y]))))

-- d)
bar = foo 1 2 3
bar :: (Integer -> a) -> [a]
