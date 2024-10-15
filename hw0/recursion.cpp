#include <iostream>
using namespace std;

int find_biggest(int arr[], int size){
    if (size == 1) return arr[0];
    int rest = find_biggest(arr+1, size-1);
    if (rest > arr[0]){
        return rest;
    }
    return arr[0];
}

int largest_index(int arr[], int size){
  if (size == 1) return 0;
  int index = largest_index(arr+1, size-1) + 1;
  if (arr[index] > arr[0]){
    return index;
  }
  return 0;
}

int main() {
  int arr[] = {-1,10,3};
  cout << largest_index(arr,3);  // prints 10
}