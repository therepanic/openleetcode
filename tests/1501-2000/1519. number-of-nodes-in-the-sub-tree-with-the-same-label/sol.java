class Solution {
    public int[] countSubTrees(int n, int[][] edges, String labels) {
        java.util.List<java.util.List<Integer>> matrix = new java.util.ArrayList<>();
        for (int i = 0; i < n; i++) {
            matrix.add(new java.util.ArrayList<>());
        }
        for (int[] edge : edges) {
            int u = edge[0], v = edge[1];
            matrix.get(u).add(v);
            matrix.get(v).add(u);
        }

        int[] parent = new int[n];
        java.util.Arrays.fill(parent, -1);
        java.util.List<Integer> order = new java.util.ArrayList<>();
        order.add(0);
        for (int i = 0; i < order.size(); i++) {
            int node = order.get(i);
            for (int child : matrix.get(node)) {
                if (child != parent[node]) {
                    parent[child] = node;
                    order.add(child);
                }
            }
        }

        int[][] counts = new int[n][26];
        int[] ans = new int[n];
        for (int i = order.size() - 1; i >= 0; i--) {
            int node = order.get(i);
            int label = labels.charAt(node) - 'a';
            counts[node][label]++;
            ans[node] = counts[node][label];
            if (parent[node] != -1) {
                for (int j = 0; j < 26; j++) {
                    counts[parent[node]][j] += counts[node][j];
                }
            }
        }
        return ans;
    }
}
