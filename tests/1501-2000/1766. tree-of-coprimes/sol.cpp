class Solution {
public:
    vector<int> getCoprimes(vector<int>& nums, vector<vector<int>>& edges) {
        int n = nums.size();
        vector<vector<int>> adj(n);
        for (auto& e : edges) {
            adj[e[0]].push_back(e[1]);
            adj[e[1]].push_back(e[0]);
        }
        vector<int> ans(n, -1);
        vector<int> depth(n, 0);
        vector<int> ancestorByValue(51, -1);
        dfs(0, 0, 0, nums, adj, ans, depth, ancestorByValue);
        return ans;
    }
    
    void dfs(int node, int prev, int dep, vector<int>& nums, vector<vector<int>>& adj, vector<int>& ans, vector<int>& depth, vector<int>& ancestorByValue) {
        depth[node] = dep;
        int best = INT_MAX;
        int bestAnc = -1;
        for (int i = 1; i <= 50; i++) {
            if (gcd(i, nums[node]) == 1) {
                int anc = ancestorByValue[i];
                if (anc != -1) {
                    int diff = dep - depth[anc];
                    if (diff < best) {
                        best = diff;
                        bestAnc = anc;
                    }
                }
            }
        }
        ans[node] = bestAnc;
        int prevState = ancestorByValue[nums[node]];
        ancestorByValue[nums[node]] = node;
        for (int v : adj[node]) {
            if (v != prev) dfs(v, node, dep + 1, nums, adj, ans, depth, ancestorByValue);
        }
        ancestorByValue[nums[node]] = prevState;
    }
    
    int gcd(int a, int b) {
        return b == 0 ? a : gcd(b, a % b);
    }
};
