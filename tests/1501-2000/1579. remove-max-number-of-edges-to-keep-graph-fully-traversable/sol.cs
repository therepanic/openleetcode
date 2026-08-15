public class Solution {
    public int MaxNumEdgesToRemove(int n, int[][] edges) {
        Array.Sort(edges, (a, b) => b[0].CompareTo(a[0]));
        int[] parentA = new int[n + 1];
        int[] parentB = new int[n + 1];
        for (int i = 0; i <= n; i++) {
            parentA[i] = i;
            parentB[i] = i;
        }
        int[] rankA = new int[n + 1];
        int[] rankB = new int[n + 1];

        int Find(int[] parent, int x) {
            if (parent[x] != x) {
                parent[x] = Find(parent, parent[x]);
            }
            return parent[x];
        }

        bool Union(int[] parent, int[] rank, int x, int y) {
            int rootX = Find(parent, x);
            int rootY = Find(parent, y);
            if (rootX == rootY) return false;
            if (rank[rootX] < rank[rootY]) {
                parent[rootX] = rootY;
            } else if (rank[rootX] > rank[rootY]) {
                parent[rootY] = rootX;
            } else {
                parent[rootX] = rootY;
                rank[rootY]++;
            }
            return true;
        }

        int removed = 0;
        int aliceEdges = 0, bobEdges = 0;
        foreach (var e in edges) {
            if (e[0] == 3) {
                if (Union(parentA, rankA, e[1], e[2])) {
                    Union(parentB, rankB, e[1], e[2]);
                    aliceEdges++;
                    bobEdges++;
                } else {
                    removed++;
                }
            } else if (e[0] == 2) {
                if (Union(parentB, rankB, e[1], e[2])) {
                    bobEdges++;
                } else {
                    removed++;
                }
            } else {
                if (Union(parentA, rankA, e[1], e[2])) {
                    aliceEdges++;
                } else {
                    removed++;
                }
            }
        }
        return (bobEdges == n - 1 && aliceEdges == n - 1) ? removed : -1;
    }
}
