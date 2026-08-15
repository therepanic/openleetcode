public class Solution {
    public IList<bool> AreConnected(int n, int threshold, int[][] queries) {
        int limit = n;
        foreach (var q in queries) {
            limit = Math.Max(limit, Math.Max(q[0], q[1]));
        }
        int[] parent = new int[limit + 1];
        int[] rank = new int[limit + 1];
        for (int i = 0; i <= limit; i++) {
            parent[i] = i;
            rank[i] = 1;
        }

        Func<int, int> find = null;
        find = x => {
            int res = x;
            while (res != parent[res]) {
                parent[res] = parent[parent[res]];
                res = parent[res];
            }
            return res;
        };

        Func<int, int, bool> union = (a, b) => {
            int p1 = find(a);
            int p2 = find(b);
            if (p1 == p2) return false;
            if (rank[p1] > rank[p2]) {
                parent[p2] = p1;
                rank[p1] += rank[p2];
            } else {
                parent[p1] = p2;
                rank[p2] += rank[p1];
            }
            return true;
        };

        for (int i = threshold + 1; i <= limit; i++) {
            for (int j = 2 * i; j <= limit; j += i) {
                union(i, j);
            }
        }

        var result = new List<bool>();
        foreach (var q in queries) {
            result.Add(find(q[0]) == find(q[1]));
        }
        return result;
    }
}
