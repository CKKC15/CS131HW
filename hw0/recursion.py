def find_biggest(arr):
    if (len(arr) == 1):
        return arr[0]
    rest = find_biggest(arr[1:])
    if (rest > arr[0]):
        return rest
    return arr[0]

def largest_index(arr):
    if (len(arr) == 1):
        return 0
    index = largest_index(arr[1:]) + 1
    if (arr[index] > arr[0]):
        return index
    return 0

def delete(arr, item):
    if (len(arr) == 0):
        return []
    if (arr[0] != item):
        return [arr[0]] + delete(arr[1:], item)
    return delete(arr[1:], item)

array = [-1, 10, 3]
print(delete(array, 3))
