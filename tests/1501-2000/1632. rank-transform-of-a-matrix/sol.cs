public class Solution {
    public int[][] MatrixRankTransform(int[][] matrix) {
        int m = matrix.Length, n = matrix[0].Length;
        var mp = new Dictionary<int, List<(int, int)>>();
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (!mp.ContainsKey(matrix[i][j])) mp[matrix[i][j]] = new List<(int, int)>();
                mp[matrix[i][j]].Add((i, j));
            }
        }
        
        int[] rank = new int[m+n];
        int[][] ans = new int[m][];
        for (int i = 0; i < m; i++) ans[i] = new int[n];
        
        var keys = mp.Keys.ToList();
        keys.Sort();
        foreach (int k in keys) {
            int[] parent = Enumerable.Range(0, m+n).ToArray();
            Func<int, int> find = null;
            find = p => {
                if (p != parent[p]) parent[p] = find(parent[p]);
                return parent[p];
            };
            
            foreach (var cell in mp[k]) {
                int i = cell.Item1, j = cell.Item2;
                int ii = find(i);
                int jj = find(m+j);
                parent[ii] = jj;
                rank[jj] = Math.Max(rank[ii], rank[jj]);
            }
            
            var seen = new HashSet<int>();
            foreach (var cell in mp[k]) {
                int i = cell.Item1, j = cell.Item2;
                int ii = find(i);
                if (!seen.Contains(ii)) rank[ii] += 1;
                seen.Add(ii);
                int v = rank[ii];
                rank[i] = rank[m+j] = ans[i][j] = v;
            }
        }
        return ans;
    }
}
