-- Q1
largest :: String -> String -> String
largest first second 
    | length first > length second =
        first
    | length second > length first =
        second
    | otherwise =
        first

-- Q2
reflect :: Integer -> Integer
reflect 0 = 0
reflect num
  | num < 0 = (-1) + reflect (num+1)
  | num > 0 = 1 + reflect (num-1)

-- Q3
-- regular if statements
is_even_if :: Integer -> Bool
is_even_if num = 
    if num == 0
        then True
    else 
        if num == 1
            then False
        else is_even_if (num - 2)

is_odd_if :: Integer -> Bool
is_odd_if num = not (is_even_if num)

-- using guards
is_even_guards :: Integer -> Bool
is_even_guards num
    | num == 0 = True
    | num == 1 = False
    | otherwise = is_even_guards (num-2)
is_odd_guards :: Integer -> Bool
is_odd_guards num = not (is_even_guards num)

-- using pattern matching
is_even_pattern :: Integer -> Bool
is_even_pattern 0 = True
is_even_pattern 1 = False
is_even_pattern n = is_even_pattern (n-2)

is_odd_pattern :: Integer -> Bool
is_odd_pattern n = not (is_even_pattern n)

-- Q4
quad :: Double -> Double -> Double -> (Double, Double)
quad a b c 
    | a == 0 = (0,0)
    | root < 0 = (0,0)
    | otherwise = (positive, negative)
    where
        root = b^2 - 4 * a * c
        positive = (-b + sqrt root)/(2*a)
        negative = (-b - sqrt root)/(2*a)

-- Q5
sum_is_divisible :: Integer -> Integer -> Integer -> Bool
sum_is_divisible a b c =
    if (mod (sum a b) c == 0)
        then True
    else False
    where
        sum a b
            | a == b = b
            | otherwise = a + sum (a + 1) b

-- Q6
find_min :: [Integer] -> Integer
find_min lst
    | length lst == 1 = head lst
    | otherwise = min (head lst) (find_min (tail lst))

-- Q7
all_factors :: Integer -> [Integer]
all_factors n = [x | x <- [1..n], mod n x == 0]

perfect_numbers :: [Integer]
perfect_numbers = [x | x <- [1..], sum (init (all_factors x)) == x]

-- Q8
count_occurrences :: [Integer] -> [Integer] -> Integer
count_occurrences [] _ = 1
count_occurrences _ [] = 0
count_occurrences lst1 lst2
    | head lst1 == head lst2 = count_occurrences (tail lst1) (tail lst2) + count_occurrences lst1 (tail lst2)
    | otherwise = count_occurrences lst1 (tail lst2)

-- Q9
fibonacci :: Integer -> [Integer]
fibonacci n = reverse (fib_reverse n)
fib_reverse n
    | n <= 0 = []
    | otherwise = helper n 0 1 : fib_reverse (n-1)
    where
        helper 0 a _ = a -- nth fibonacci number
        helper n a b = helper (n-1) b (a+b)

rle :: [Integer] -> [(Integer, Integer)]
rle [] = []
rle lst = helper (tail lst) (head lst) 1
helper lst prev count
    | lst == [] = [(prev, count)]
    | head lst == prev = helper (tail lst) (head lst) (count+1)
    | otherwise = (prev, count) : helper (tail lst) (head lst) 1