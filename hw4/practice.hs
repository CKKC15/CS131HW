-- HASK17
-- b)
longest_run :: [Bool] -> Integer
longest_run lst = helper lst 0 0
where
    helper [] total curr = total
    helper (x:xs) total curr
        | x = helper xs total (curr + 1)
        | otherwise = helper xs max total curr 0