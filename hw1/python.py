import copy
class Comedian:
  def __init__(self, joke):
    self.__joke = joke

  def change_joke(self, joke):
    self.__joke = joke

  def get_joke(self):
    return self.__joke

def process(c):
 # line A 
 c = copy.copy(c)
 c[1] = Comedian("joke3")
 c.append(Comedian("joke4"))
 c = c + [Comedian("joke5")]		 
 c[0].change_joke("joke6")

def main():
 c1 = Comedian("joke1")
 c2 = Comedian("joke2")
 com = [c1,c2]
 process(com)
 c1 = Comedian("joke7")
 for c in com:
  print(c.get_joke())

class FakeDuck:
  def quack(self):
    print("quack!")
class Duck:
  def __init__(self):
    pass

class DuckTwo(Duck):
  pass

"""
def largest_sum(nums, k):
  if k < 0 or k > len(nums):
    raise ValueError
  elif k == 0:
    return 0

  max_sum = None
  for i in range(len(nums)-k+1):
    sum = 0
    for num in nums[i:i+k]:
      sum += num
    if max_sum == None or sum > max_sum:
      max_sum = sum
  return max_sum
"""

def largest_sum(nums, k):
  if k < 0 or k > len(nums):
    raise ValueError
  elif k == 0:
    return 0

  sum = 0
  for num in nums[0:k]:
    sum += num

  max_sum = sum
  for i in range(0, len(nums)-k):
    sum -= nums[i]
    sum += nums[i+k]
    max_sum = max(sum, max_sum)
  return max_sum

class Event:
  def __init__(self, start, end):
    if (start >= end):
      raise ValueError(f'{start} > {end}')
    self.start_time = start
    self.end_time = end

class Calendar:
    def __init__(self):
      self.__events = []

    def get_events(self):
      return self.__events
    
    def add_event(self, event):
      if (isinstance(event, Event)):
        self.__events.append(event)
      else: 
        raise TypeError
    
class AdventCalendar(Calendar):
  def __init__(self, year):
    Calendar.__init__(self)
    self.year = year

class Joker:
 joke = "I dressed as a UDP packet at the party. Nobody got it."

 def change_joke(self):
  print(f'self.joke = {self.joke}')
  print(f'Joker.joke = {Joker.joke}')
  Joker.joke = "How does an OOP coder get wealthy? Inheritance."
  self.joke = "Why do Java coders wear glasses? They can't C#."
  print(f'self.joke = {self.joke}')
  print(f'Joker.joke = {Joker.joke}')

j = Joker()
print(f'j.joke = {j.joke}')
print(f'Joker.joke = {Joker.joke}')
j.change_joke()
print(f'j.joke = {j.joke}')
print(f'Joker.joke = {Joker.joke}')
