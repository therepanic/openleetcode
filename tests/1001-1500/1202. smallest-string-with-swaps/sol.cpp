class Solution {
public:
    string smallestStringWithSwaps(string s, vector<vector<int>>& pairs) {
        int n = s.size();
        vector<int> parent(n);
        for (int i = 0; i < n; i++) parent[i] = i;
        
        function<int(int)> find = [&](int x) -> int {
            if (parent[x] != x) {
                parent[x] = find(parent[x]);
            }
            return parent[x];
        };
        
        auto union_set = [&](int x, int y) {
            int rx = find(x), ry = find(y);
            if (rx != ry) parent[rx] = ry;
        };
        
        for (auto& pair : pairs) {
            union_set(pair[0], pair[1]);
        }
        
        unordered_map<int, vector<int>> groups;
        for (int i = 0; i < n; i++) {
            groups[find(i)].push_back(i);
        }
        
        string res(n, ' ');
        for (auto& [root, indices] : groups) {
            vector<char> chars;
            for (int idx : indices) chars.push_back(s[idx]);
            sort(indices.begin(), indices.end());
            sort(chars.begin(), chars.end());
            for (int k = 0; k < indices.size(); k++) {
                res[indices[k]] = chars[k];
            }
        }
        
        return res;
    }
};
