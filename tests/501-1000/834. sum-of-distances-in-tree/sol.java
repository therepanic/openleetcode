class Solution {
    @SuppressWarnings("unchecked")
    public int[] sumOfDistancesInTree(int n, int[][] edges) {
        List<Integer>[] adj = new ArrayList[n];
        for (int i = 0; i < n; i++) adj[i] = new ArrayList<>();
        for (int[] e : edges) {
            int u = e[0], v = e[1];
            adj[u].add(v);
            adj[v].add(u);
        }

        int[] parent = new int[n];
        Arrays.fill(parent, -1);
        int[] order = new int[n];
        int top = 0;
        int[] stack = new int[n];
        stack[top++] = 0;
        parent[0] = 0;
        int ord = 0;
        while (top > 0) {
            int node = stack[--top];
            order[ord++] = node;
            for (int child : adj[node]) {
                if (parent[child] == -1) {
                    parent[child] = node;
                    stack[top++] = child;
                }
            }
        }

        int[] count = new int[n];
        int[] ans = new int[n];
        Arrays.fill(count, 1);

        for (int i = n - 1; i > 0; i--) {
            int node = order[i];
            int p = parent[node];
            count[p] += count[node];
            ans[p] += ans[node] + count[node];
        }

        for (int i = 1; i < n; i++) {
            int node = order[i];
            int p = parent[node];
            ans[node] = ans[p] - count[node] + (n - count[node]);
        }
        return ans;
    }
}
