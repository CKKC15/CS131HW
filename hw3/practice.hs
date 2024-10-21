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
