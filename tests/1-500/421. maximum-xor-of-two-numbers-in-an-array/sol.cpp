class Solution {
public:
    int findMaximumXOR(vector<int>& nums) {
        int maxNum = *max_element(nums.begin(), nums.end());
        int mxBit = 0;
        while (maxNum > 0) {
            mxBit++;
            maxNum >>= 1;
        }
        
        vector<vector<int>> trie;
        trie.push_back({-1, -1});
        
        auto insert = [&](int num) {
            int node = 0;
            for (int i = mxBit - 1; i >= 0; i--) {
                int bit = (num >> i) & 1;
                if (trie[node][bit] == -1) {
                    trie[node][bit] = trie.size();
                    trie.push_back({-1, -1});
                }
                node = trie[node][bit];
            }
        };
        
        auto getMax = [&](int num) {
            int node = 0;
            int ans = 0;
            for (int i = mxBit - 1; i >= 0; i--) {
                int bit = (num >> i) & 1;
                int opp = 1 - bit;
                if (trie[node][opp] != -1) {
                    ans |= (1 << i);
                    node = trie[node][opp];
                } else {
                    node = trie[node][bit];
                }
            }
            return ans;
        };
        
        for (int num : nums) insert(num);
        
        int res = 0;
        for (int num : nums) res = max(res, getMax(num));
        
        return res;
    }
};
