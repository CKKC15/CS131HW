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

-- Q15
-- a)
{- data InstagramUser = Influencer | Normie

-- b)
lit_collab :: InstagramUser -> InstagramUser -> Bool
lit_collab Influencer Influencer = True
lit_collab _ _ = False

-- c)
data InstagramUser = 
    Influencer [String] |
    Normie

-- d)
is_sponsor :: InstagramUser -> String -> Bool
is_sponsor Normie _ = False
is_sponsor (Influencer []) sponsor = False
is_sponsor (Influencer lst) sponsor
    | head lst == sponsor = True -- found match
    | otherwise = is_sponsor (Influencer (tail lst)) sponsor -- check with tails
-}

-- e)
data InstagramUser = 
    Influencer [String] [InstagramUser] |
    Normie

-- f)
count_influencers :: InstagramUser -> Integer
count_influencers Normie = 0
count_influencers (Influencer _ []) = 0
count_influencers (Influencer _ lst) =
    foldl add_follower 0 lst
    where
        add_follower :: Integer -> InstagramUser -> Integer
        add_follower total Normie = total
        add_follower total (Influencer _ _) = (total + 1)

-- Q16
-- a)
ll_contains :: LinkedList -> Integer -> Bool
ll_contains EmptyList _ = False
ll_contains (ListNode val next) target = if (val == target) then True else (ll_contains next target)

data LinkedList = EmptyList | ListNode Integer LinkedList deriving Show

-- b)
ll_insert :: LinkedList -> Integer -> Integer -> LinkedList

-- c)
ll_insert EmptyList pos node_val = ListNode node_val EmptyList -- if empty (reach end), insert there
ll_insert (ListNode val next) pos node_val
    | pos <= 0 = ListNode node_val (ListNode val next) -- if negative or 0, insert in place
    | otherwise = ListNode val (ll_insert next (pos-1) node_val) -- create new ListNode with next pointing to recursive call