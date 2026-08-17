#include <vector>
#include <algorithm>
#include <unordered_map>
using namespace std;

class Solution {
public:
    vector<int> recoverArray(int n, vector<int>& sums) {
        sort(sums.begin(), sums.end());
        vector<int> res;
        
        for (int _ = 0; _ < n; ++_) {
            int d = sums[1] - sums[0];
            
            vector<int> left_part, right_part;
            unordered_map<int, int> count;
            for (int s : sums) count[s]++;
            
            for (int s : sums) {
                if (count[s] > 0) {
                    left_part.push_back(s);
                    right_part.push_back(s + d);
                    count[s]--;
                    count[s + d]--;
                }
            }
            
            bool hasZero = false;
            for (int s : left_part) if (s == 0) { hasZero = true; break; }
            
            if (hasZero) {
                res.push_back(d);
                sums = left_part;
            } else {
                res.push_back(-d);
                sums = right_part;
            }
        }
        return res;
    }
};
