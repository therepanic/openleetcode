class Solution {
public:
    vector<bool> canMakePaliQueries(string s, vector<vector<int>>& queries) {
        int n = s.size();
        vector<int> prefix(n + 1, 0);
        
        for (int i = 0; i < n; i++) {
            int bit = 1 << (s[i] - 'a');
            prefix[i + 1] = prefix[i] ^ bit;
        }
        
        vector<bool> res;
        
        for (auto& query : queries) {
            int left = query[0];
            int right = query[1];
            int ki = query[2];
            
            int mask = prefix[right + 1] ^ prefix[left];
            int oddCount = __builtin_popcount(mask);
            
            if (oddCount <= 1 || ki >= oddCount / 2) {
                res.push_back(true);
            } else {
                res.push_back(false);
            }
        }
        
        return res;
    }
};
