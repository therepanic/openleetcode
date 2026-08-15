class Solution {
    public int[] getCoprimes(int[] nums, int[][] edges) {
        int n = nums.length;
        List<List<Integer>> adj = new ArrayList<>();
        for (int i = 0; i < n; i++) adj.add(new ArrayList<>());
        for (int[] e : edges) {
            adj.get(e[0]).add(e[1]);
            adj.get(e[1]).add(e[0]);
        }
        int[] ans = new int[n];
        Arrays.fill(ans, -1);
        int[] depth = new int[n];
        int[] ancestorByValue = new int[51];
        Arrays.fill(ancestorByValue, -1);
        dfs(0, 0, 0, nums, adj, ans, depth, ancestorByValue);
        return ans;
    }
    
    private void dfs(int node, int prev, int dep, int[] nums, List<List<Integer>> adj, int[] ans, int[] depth, int[] ancestorByValue) {
        depth[node] = dep;
        int best = Integer.MAX_VALUE;
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
        for (int v : adj.get(node)) {
            if (v != prev) dfs(v, node, dep + 1, nums, adj, ans, depth, ancestorByValue);
        }
        ancestorByValue[nums[node]] = prevState;
    }
    
    private int gcd(int a, int b) {
        return b == 0 ? a : gcd(b, a % b);
    }
}
