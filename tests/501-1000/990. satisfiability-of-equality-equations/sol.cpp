class Solution {
public:
    bool equationsPossible(vector<string>& equations) {
        vector<int> parent(26);
        vector<int> rank(26, 0);
        for (int i = 0; i < 26; ++i) parent[i] = i;

        function<int(int)> find = [&](int x) -> int {
            if (parent[x] != x) {
                parent[x] = find(parent[x]);
            }
            return parent[x];
        };

        auto unionSets = [&](int a, int b) {
            int ra = find(a);
            int rb = find(b);
            if (ra == rb) return;
            if (rank[ra] < rank[rb]) {
                parent[ra] = rb;
            } else if (rank[ra] > rank[rb]) {
                parent[rb] = ra;
            } else {
                parent[rb] = ra;
                rank[ra]++;
            }
        };

        for (const string& eq : equations) {
            if (eq[1] == '=') {
                unionSets(eq[0] - 'a', eq[3] - 'a');
            }
        }

        for (const string& eq : equations) {
            if (eq[1] == '!' && find(eq[0] - 'a') == find(eq[3] - 'a')) {
                return false;
            }
        }
        return true;
    }
};
