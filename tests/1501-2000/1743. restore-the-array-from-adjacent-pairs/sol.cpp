class Solution {
public:
    vector<int> restoreArray(vector<vector<int>>& adjacentPairs) {
        unordered_map<int, int> xorMap;
        unordered_map<int, int> degree;

        for (auto& pair : adjacentPairs) {
            int u = pair[0], v = pair[1];
            xorMap[u] ^= v;
            xorMap[v] ^= u;
            degree[u]++;
            degree[v]++;
        }

        int start = 0;
        for (auto& [k, v] : degree) {
            if (v == 1) {
                start = k;
                break;
            }
        }

        int n = adjacentPairs.size() + 1;
        vector<int> res(n);

        res[0] = start;
        int prev = 0;

        for (int i = 1; i < n; i++) {
            res[i] = xorMap[res[i - 1]] ^ prev;
            prev = res[i - 1];
        }

        return res;
    }
};
