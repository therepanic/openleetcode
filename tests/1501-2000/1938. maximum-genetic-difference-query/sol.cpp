class Solution {
public:
    vector<int> maxGeneticDifference(vector<int>& parents, vector<vector<int>>& queries) {
        int n = parents.size();
        vector<vector<int>> adj(n);
        int root = 0;
        for (int i = 0; i < n; i++) {
            if (parents[i] == -1) root = i;
            else adj[parents[i]].push_back(i);
        }

        // Trie node
        struct Node {
            int count;
            unordered_map<int, Node*> child;
            Node() : count(0) {}
        };

        Node* trie = new Node();

        auto increase = [&](int num, int delta) {
            Node* cur = trie;
            for (int i = 17; i >= 0; i--) {
                int bit = (num >> i) & 1;
                if (cur->child.find(bit) == cur->child.end()) {
                    cur->child[bit] = new Node();
                }
                cur = cur->child[bit];
                cur->count += delta;
            }
        };

        auto findMax = [&](int num) {
            Node* cur = trie;
            int ans = 0;
            for (int i = 17; i >= 0; i--) {
                int bit = (num >> i) & 1;
                int desired = 1 - bit;
                if (cur->child.find(desired) != cur->child.end() && cur->child[desired]->count > 0) {
                    cur = cur->child[desired];
                    ans |= (1 << i);
                } else {
                    cur = cur->child[bit];
                }
            }
            return ans;
        };

        // group queries by node
        unordered_map<int, vector<pair<int,int>>> qmap;
        for (int i = 0; i < queries.size(); i++) {
            qmap[queries[i][0]].push_back({i, queries[i][1]});
        }

        vector<int> ans(queries.size(), 0);

        function<void(int)> dfs = [&](int u) {
            increase(u, 1);
            for (auto& p : qmap[u]) {
                ans[p.first] = findMax(p.second);
            }
            for (int v : adj[u]) {
                dfs(v);
            }
            increase(u, -1);
        };

        dfs(root);
        return ans;
    }
};
