#include <iostream>
using namespace std;

class Person {
public:
  Person(const std::string& name) { name_ = name; }
  void listen_to_joke() { laugh();  }
  virtual void laugh() { cout << "haha!\n"; }
  virtual void heckle() { cout << "that's dumb!\n"; }
private:
  std::string name_;
};

class GigglyPerson : public Person {
public:
  GigglyPerson(const std::string& name) : Person(name) { }
  virtual void laugh() { cout << "giggle giggle!\n"; }
  virtual void heckle() { 
    cout << "that's... giggle... dumb... giggle!\n"; 
  } 
};

void comedy_club(Person& p) {
  p.listen_to_joke();
  p.heckle();
}

int main() {
  Person p("Leia");
  comedy_club(p);

  GigglyPerson g("Sanjay");
  comedy_club(g);
}