// HASK17
// a)
#include <vector>
#include <iostream>
#include <queue>
using namespace std;

int longestRun(const vector<bool>& lst){
    int max_count = 0;
    int count = 0;
    for (int i = 0; i < lst.size(); i++){
        if (lst[i]){
            count++;
            if (count > max_count){
                max_count = count;
            }
        }
        else{
            count = 0;
        }
    }
    return max_count;
}
class Tree {
public:
  unsigned value;
  vector<Tree *> children;

  Tree(unsigned value, vector<Tree *> children) {
    this->value = value;
    this->children = children;
  }
};

// HASK17
// c)
unsigned maxTreeValue(Tree* root){
    if (root == nullptr){
        return 0;
    }
    unsigned max = root->value;
    queue<Tree*> bfs;
    vector<Tree*> children = root->children;
    for (int i = 0; i < children.size(); i++){
        bfs.push(children[i]);
    }
    //iterate through bfs
    while (!bfs.empty()){
        Tree* ptr = bfs.front();
        children = ptr->children;
        bfs.pop();
        if (ptr != nullptr){
            if (ptr->value > max){
                max = ptr->value;
            }
            //add children to queue
            for (int i = 0; i < children.size(); i++){
                bfs.push(children[i]);
            }
        }
    }
    return max;
}

int main(){
    /*
    vector<bool> vec1 = {true, true, false, true, true, true, false};
    vector<bool> vec2 = {true, false, true, true};
    cout << longestRun(vec1) << endl;
    cout << longestRun(vec2) << endl;
    */
    Tree *root = new Tree(5, {
        new Tree(3, {
            new Tree(1, {}),
            new Tree(4, {})
        }),
        new Tree(7, {
            new Tree(6, {}),
            new Tree(9, {})
        })
    });
    unsigned maxValue = maxTreeValue(root);
    cout << "The maximum value in the tree is: " << maxValue << endl;
}