class Solution {
public:
    int minSwapsCouples(vector<int>& row) {
        int n = row.size() / 2;
        vector<int> parent(n);
        for (int i = 0; i < n; i++) {
            parent[i] = i;
        }
        
        function<int(int)> find = [&](int x) -> int {
            if (parent[x] != x) {
                parent[x] = find(parent[x]);
            }
            return parent[x];
        };
        
        auto unionSets = [&](int a, int b) {
            int pa = find(a);
            int pb = find(b);
            if (pa != pb) {
                parent[pa] = pb;
            }
        };
        
        for (int i = 0; i < row.size(); i += 2) {
            int couple1 = row[i] / 2;
            int couple2 = row[i+1] / 2;
            unionSets(couple1, couple2);
        }
        
        unordered_map<int, int> componentSize;
        for (int couple = 0; couple < n; couple++) {
            int root = find(couple);
            componentSize[root]++;
        }
        
        int swaps = 0;
        for (auto& [root, size] : componentSize) {
            swaps += size - 1;
        }
        
        return swaps;
    }
};
