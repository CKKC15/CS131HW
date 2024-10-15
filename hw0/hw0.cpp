#include <iostream>
using namespace std;

class Point {
public:
    Point(int x = 0, int y = 0) {
      x_ = x;
      y_ = y;
    }
    void display() const {
      cout << "(" << x_ << ", " << y_ << ")" << endl;
    }
 
    int x_, y_;
};

void modify(Point *p) {
    p->x_ = 50;           // A
    *p = Point(20, 30);   // B
}

int main() {
    Point pt(10, 10);
    modify(&pt);
    pt.display();
}