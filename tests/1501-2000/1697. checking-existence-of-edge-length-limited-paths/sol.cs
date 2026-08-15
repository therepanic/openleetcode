public class Solution {
    public bool[] DistanceLimitedPathsExist(int n, int[][] edgeList, int[][] queries) {
        int[] parent = new int[n];
        int[] rank = new int[n];
        for (int i = 0; i < n; i++) parent[i] = i;
        
        Func<int, int> find = null;
        find = (int x) => {
            if (parent[x] != x) {
                parent[x] = find(parent[x]);
            }
            return parent[x];
        };
        
        Action<int, int> union = (int x, int y) => {
            int xroot = find(x);
            int yroot = find(y);
            if (xroot == yroot) return;
            if (rank[xroot] < rank[yroot]) {
                parent[xroot] = yroot;
            } else if (rank[xroot] > rank[yroot]) {
                parent[yroot] = xroot;
            } else {
                parent[yroot] = xroot;
                rank[xroot]++;
            }
        };
        
        // add index to queries
        int[][] queriesWithIdx = new int[queries.Length][];
        for (int i = 0; i < queries.Length; i++) {
            queriesWithIdx[i] = new int[] { queries[i][0], queries[i][1], queries[i][2], i };
        }
        
        Array.Sort(queriesWithIdx, (a, b) => a[2].CompareTo(b[2]));
        Array.Sort(edgeList, (a, b) => a[2].CompareTo(b[2]));
        
        int idx = 0;
        bool[] res = new bool[queries.Length];
        foreach (var q in queriesWithIdx) {
            while (idx < edgeList.Length && edgeList[idx][2] < q[2]) {
                union(edgeList[idx][0], edgeList[idx][1]);
                idx++;
            }
            if (find(q[0]) == find(q[1])) {
                res[q[3]] = true;
            }
        }
        return res;
    }
}
