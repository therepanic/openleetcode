class Solution {
public:
    vector<bool> areConnected(int n, int threshold, vector<vector<int>>& queries) {
        int limit = n;
        for (auto& q : queries) {
            limit = max(limit, max(q[0], q[1]));
        }
        vector<int> parent(limit + 1);
        vector<int> rank(limit + 1);
        for (int i = 0; i <= limit; i++) {
            parent[i] = i;
            rank[i] = 1;
        }

        function<int(int)> find = [&](int x) -> int {
            int res = x;
            while (res != parent[res]) {
                parent[res] = parent[parent[res]];
                res = parent[res];
            }
            return res;
        };

        auto union_sets = [&](int a, int b) -> bool {
            int p1 = find(a);
            int p2 = find(b);
            if (p1 == p2) return false;
            if (rank[p1] > rank[p2]) {
                parent[p2] = p1;
                rank[p1] += rank[p2];
            } else {
                parent[p1] = p2;
                rank[p2] += rank[p1];
            }
            return true;
        };

        for (int i = threshold + 1; i <= limit; i++) {
            for (int j = 2 * i; j <= limit; j += i) {
                union_sets(i, j);
            }
        }

        vector<bool> result;
        for (auto& q : queries) {
            result.push_back(find(q[0]) == find(q[1]));
        }
        return result;
    }
};
