# PYTH9
def strip_characters(sentence, chars_to_remove):
    return "".join(filter(lambda x : x not in chars_to_remove, sentence))

# PYTH10
def closure_maker(x):
   def closure_return(y):
      return x + y
   return closure_return

closure = closure_maker(1)
print(closure(2)) #this outputs 3


# PYTH11
# a)
from functools import reduce
def convert_to_decimal(bits):
  exponents = range(len(bits)-1, -1, -1)
  nums = [bit * 2**exponent for bit, exponent in zip(bits, exponents)]
  return reduce(lambda acc, num: acc + num, nums)

# b)
def parse_csv(lines):
   return [(item.split(",")[0], item.split(",")[1]) for item in lines]

# c)
def unique_characters(sentence):
   return {char for char in sentence}

# d)
def squares_dict(lower_bound, upper_bound):
   return {key: key**2 for key in range(lower_bound, upper_bound+1)}
