public class Solution {
    public int[] GetCoprimes(int[] nums, int[][] edges) {
        int n = nums.Length;
        List<List<int>> adj = new List<List<int>>();
        for (int i = 0; i < n; i++) adj.Add(new List<int>());
        foreach (var e in edges) {
            adj[e[0]].Add(e[1]);
            adj[e[1]].Add(e[0]);
        }
        int[] ans = new int[n];
        Array.Fill(ans, -1);
        int[] depth = new int[n];
        int[] ancestorByValue = new int[51];
        Array.Fill(ancestorByValue, -1);
        Dfs(0, 0, 0, nums, adj, ans, depth, ancestorByValue);
        return ans;
    }
    
    private void Dfs(int node, int prev, int dep, int[] nums, List<List<int>> adj, int[] ans, int[] depth, int[] ancestorByValue) {
        depth[node] = dep;
        int best = int.MaxValue;
        int bestAnc = -1;
        for (int i = 1; i <= 50; i++) {
            if (Gcd(i, nums[node]) == 1) {
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
        foreach (var v in adj[node]) {
            if (v != prev) Dfs(v, node, dep + 1, nums, adj, ans, depth, ancestorByValue);
        }
        ancestorByValue[nums[node]] = prevState;
    }
    
    private int Gcd(int a, int b) {
        while (b != 0) {
            int t = a % b;
            a = b;
            b = t;
        }
        return a;
    }
}
