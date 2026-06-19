#include <queue>
#include <unordered_set>
#include <algorithm>
using namespace std;

class Solution {
private:
    string removeSame(string s, int i) {
        if (i < 0) return s;
        int left = i, right = i;
        while (left > 0 && s[left - 1] == s[i]) left--;
        while (right + 1 < s.length() && s[right + 1] == s[i]) right++;
        int length = right - left + 1;
        if (length >= 3) {
            string newS = s.substr(0, left) + s.substr(right + 1);
            return removeSame(newS, left - 1);
        }
        return s;
    }

public:
    int findMinStep(string board, string hand) {
        sort(hand.begin(), hand.end());
        
        queue<tuple<string, string, int>> q;
        unordered_set<string> visited;
        q.push({board, hand, 0});
        visited.insert(board + "#" + hand);
        
        while (!q.empty()) {
            auto [currBoard, currHand, step] = q.front();
            q.pop();
            
            for (int i = 0; i <= currBoard.length(); i++) {
                for (int j = 0; j < currHand.length(); j++) {
                    if (j > 0 && currHand[j] == currHand[j - 1]) continue;
                    if (i > 0 && currBoard[i - 1] == currHand[j]) continue;
                    
                    bool pick = false;
                    if (i < currBoard.length() && currBoard[i] == currHand[j]) pick = true;
                    if (i > 0 && i < currBoard.length() &&
                        currBoard[i - 1] == currBoard[i] &&
                        currBoard[i] != currHand[j]) pick = true;
                    
                    if (pick) {
                        string newBoard = removeSame(
                            currBoard.substr(0, i) + currHand[j] + currBoard.substr(i), i
                        );
                        string newHand = currHand.substr(0, j) + currHand.substr(j + 1);
                        if (newBoard.empty()) return step + 1;
                        string key = newBoard + "#" + newHand;
                        if (visited.find(key) == visited.end()) {
                            visited.insert(key);
                            q.push({newBoard, newHand, step + 1});
                        }
                    }
                }
            }
        }
        return -1;
    }
};
