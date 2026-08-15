class Solution {
    private int[] parent;
    private int[] rank;

    private int find(int x) {
        int res = x;
        while (res != parent[res]) {
            parent[res] = parent[parent[res]];
            res = parent[res];
        }
        return res;
    }

    private void union(int a, int b) {
        int p1 = find(a);
        int p2 = find(b);
        if (p1 == p2) return;
        if (rank[p1] > rank[p2]) {
            parent[p2] = p1;
            rank[p1] += rank[p2];
        } else {
            parent[p1] = p2;
            rank[p2] += rank[p1];
        }
    }

    public List<Boolean> areConnected(int n, int threshold, int[][] queries) {
        int limit = n;
        for (int[] q : queries) {
            limit = Math.max(limit, Math.max(q[0], q[1]));
        }
        parent = new int[limit + 1];
        rank = new int[limit + 1];
        for (int i = 0; i <= limit; i++) {
            parent[i] = i;
            rank[i] = 1;
        }

        for (int i = threshold + 1; i <= limit; i++) {
            for (int j = 2 * i; j <= limit; j += i) {
                union(i, j);
            }
        }

        List<Boolean> result = new ArrayList<>();
        for (int[] q : queries) {
            result.add(find(q[0]) == find(q[1]));
        }
        return result;
    }
}
