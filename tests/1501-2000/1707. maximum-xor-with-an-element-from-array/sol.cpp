class Solution {
public:
    vector<int> maximizeXor(vector<int>& nums, vector<vector<int>>& queries) {
        vector<vector<int>> trie;
        trie.push_back({-1, -1});
        auto insert = [&](int num) {
            int node = 0;
            for (int i = 31; i >= 0; --i) {
                int bit = (num >> i) & 1;
                if (trie[node][bit] == -1) {
                    trie[node][bit] = trie.size();
                    trie.push_back({-1, -1});
                }
                node = trie[node][bit];
            }
        };
        auto maxor = [&](int num) {
            if (trie[0][0] == -1 && trie[0][1] == -1) return -1;
            int node = 0;
            int ans = 0;
            for (int i = 31; i >= 0; --i) {
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

        sort(nums.begin(), nums.end());
        vector<vector<int>> q;
        for (int i = 0; i < queries.size(); ++i) {
            q.push_back({queries[i][1], queries[i][0], i});
        }
        sort(q.begin(), q.end());
        vector<int> res(queries.size(), -1);
        int idx = 0;
        int n = nums.size();
        for (auto& item : q) {
            int m = item[0], x = item[1], i = item[2];
            while (idx < n && nums[idx] <= m) {
                insert(nums[idx]);
                idx++;
            }
            res[i] = maxor(x);
        }
        return res;
    }
};
