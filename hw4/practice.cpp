// HASK17
// a)
#include <vector>
#include <iostream>
using namespace std;

int longestRun(const vector<bool>& lst){
    int max_count = 0;
    int count = 0;
    for (const bool& condition : lst){
        if (condition){
            count++;
            if (count > max_count){
                max_count = count;
            }
        }
        else{
            count = 0;
        }
    }
}

int main(){
    std::vector<bool> vec1 {true, true, false, true, true, true, false};
    std::vector<bool> vec2 {true, false, true, true};
    cout << longestRun(vec1) << endl;
    cout << longestRun(vec2) << endl;
}