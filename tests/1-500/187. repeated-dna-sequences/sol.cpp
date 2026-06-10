#include <string>
#include <unordered_map>
#include <vector>

using namespace std;

class Solution {
public:
    vector<string> findRepeatedDnaSequences(string s) {
        unordered_map<string, int> seen;
        vector<string> ans;
        for (int i = 0; i + 10 <= static_cast<int>(s.size()); i++) {
            string sub = s.substr(i, 10);
            int& count = seen[sub];
            if (count == 1) ans.push_back(sub);
            count++;
        }
        return ans;
    }
};
