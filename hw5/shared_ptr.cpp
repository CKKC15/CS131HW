#include<iostream>
using namespace std;
class my_shared_ptr
{
private:
    int * ptr = nullptr;
    int * refCount = nullptr; // a)

public:
  // b) constructor
  my_shared_ptr(int * ptr)
  {
    this->ptr = ptr;
    this->refCount = new int(1);
  }
  
  // c) copy constructor
  my_shared_ptr(const my_shared_ptr & other)
  {
    ptr = other.ptr;
    refCount = other.refCount;
    (*refCount)++;
  }

  // d) destructor
  ~my_shared_ptr()
  {
    if (refCount){
        (*refCount)--;
        if (*refCount == 0){
            delete ptr;
            delete refCount;
        }
    }
  }

  // e) copy assignment
  my_shared_ptr& operator=(const my_shared_ptr & obj) 
  {
    if (this == &obj) { //self assignment
        return *this; 
    }
    if (refCount && --(*refCount) == 0) { //get rid of current if last reference cuz copying to obj
        delete ptr;
        delete refCount;
    }
    
    ptr = obj.ptr;
    refCount = obj.refCount;
    (*refCount)++;

    return *this;
  }
};

int main(){
    auto ptr1 = new int[100];
    auto ptr2 = new int[200];
    my_shared_ptr m(ptr1); // should create a new shared_ptr for ptr1
    my_shared_ptr n(ptr2); // should create a new shared_ptr for ptr2
    n = m; // ptr2 should be deleted, and there should be 2 shared_ptr pointing to ptr1
}