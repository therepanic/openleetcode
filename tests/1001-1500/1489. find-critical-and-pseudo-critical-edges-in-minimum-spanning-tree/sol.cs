public class Solution {
    private class UnionFind {
        private int[] parent;
        public UnionFind(int n) {
            parent = new int[n];
            for (int i = 0; i < n; i++) {
                parent[i] = i;
            }
        }
        public int FindParent(int p) {
            if (parent[p] == p) return p;
            parent[p] = FindParent(parent[p]);
            return parent[p];
        }
        public void Union(int u, int v) {
            int pu = FindParent(u);
            int pv = FindParent(v);
            parent[pu] = pv;
        }
    }

    private int FindMST(int n, int[][] edges, int block, int e) {
        UnionFind uf = new UnionFind(n);
        int weight = 0;
        if (e != -1) {
            weight += edges[e][2];
            uf.Union(edges[e][0], edges[e][1]);
        }
        for (int i = 0; i < edges.Length; i++) {
            if (i == block) continue;
            if (uf.FindParent(edges[i][0]) == uf.FindParent(edges[i][1])) continue;
            uf.Union(edges[i][0], edges[i][1]);
            weight += edges[i][2];
        }
        for (int i = 0; i < n; i++) {
            if (uf.FindParent(i) != uf.FindParent(0)) return int.MaxValue;
        }
        return weight;
    }

    public IList<IList<int>> FindCriticalAndPseudoCriticalEdges(int n, int[][] edges) {
        List<int> critical = new List<int>();
        List<int> pseudoCritical = new List<int>();
        int m = edges.Length;
        int[][] edgesWithIdx = new int[m][];
        for (int i = 0; i < m; i++) {
            edgesWithIdx[i] = new int[] { edges[i][0], edges[i][1], edges[i][2], i };
        }
        Array.Sort(edgesWithIdx, (a, b) => a[2].CompareTo(b[2]));
        int mstwt = FindMST(n, edgesWithIdx, -1, -1);
        for (int i = 0; i < m; i++) {
            if (mstwt < FindMST(n, edgesWithIdx, i, -1)) {
                critical.Add(edgesWithIdx[i][3]);
            } else if (mstwt == FindMST(n, edgesWithIdx, -1, i)) {
                pseudoCritical.Add(edgesWithIdx[i][3]);
            }
        }
        return new List<IList<int>> { critical, pseudoCritical };
    }
}
