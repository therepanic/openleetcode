#include <string>
#include <queue>
#include <unordered_set>

class Solution {
public:
    int kSimilarity(string s1, string s2) {
        queue<string> q;
        q.push(s1);
        unordered_set<string> seen;
        int answ = 0;
        
        while (!q.empty()) {
            int size = q.size();
            for (int k = 0; k < size; k++) {
                string str = q.front();
                q.pop();
                if (str == s2) return answ;
                
                int i = 0;
                while (str[i] == s2[i]) i++;
                
                for (int j = i + 1; j < str.length(); j++) {
                    if (str[i] == s2[j] && s2[j] != s1[j]) {
                        swap(str[i], str[j]);
                        if (!seen.count(str)) {
                            seen.insert(str);
                            q.push(str);
                        }
                        swap(str[i], str[j]);
                    }
                }
            }
            answ++;
        }
        return answ;
    }
};
