class Solution {
public:
    int minimumHammingDistance(vector<int>& source, vector<int>& target, vector<vector<int>>& allowedSwaps) {
        int n = source.size();
        vector<int> parent(n);
        iota(parent.begin(), parent.end(), 0);
        
        function<int(int)> find = [&](int x) -> int {
            if (parent[x] != x) {
                parent[x] = find(parent[x]);
            }
            return parent[x];
        };
        
        auto unite = [&](int a, int b) {
            parent[find(a)] = find(b);
        };
        
        for (auto& swap : allowedSwaps) {
            unite(swap[0], swap[1]);
        }
        
        unordered_map<int, vector<int>> groups;
        for (int i = 0; i < n; i++) {
            groups[find(i)].push_back(source[i]);
        }
        unordered_map<int, unordered_map<int, int>> freq_map;
        for (auto& [root, vals] : groups) {
            unordered_map<int, int> freq;
            for (int v : vals) freq[v]++;
            freq_map[root] = freq;
        }
        
        int hamming_dist = 0;
        for (int i = 0; i < n; i++) {
            int root = find(i);
            auto& freq = freq_map[root];
            int val = target[i];
            if (freq[val] > 0) {
                freq[val]--;
            } else {
                hamming_dist++;
            }
        }
        return hamming_dist;
    }
};
