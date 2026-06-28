public class Solution {
    public int MinSwapsCouples(int[] row) {
        int n = row.Length / 2;
        int[] parent = new int[n];
        for (int i = 0; i < n; i++) {
            parent[i] = i;
        }
        
        int Find(int x) {
            if (parent[x] != x) {
                parent[x] = Find(parent[x]);
            }
            return parent[x];
        }
        
        void Union(int a, int b) {
            int pa = Find(a);
            int pb = Find(b);
            if (pa != pb) {
                parent[pa] = pb;
            }
        }
        
        for (int i = 0; i < row.Length; i += 2) {
            int couple1 = row[i] / 2;
            int couple2 = row[i+1] / 2;
            Union(couple1, couple2);
        }
        
        Dictionary<int, int> componentSize = new Dictionary<int, int>();
        for (int couple = 0; couple < n; couple++) {
            int root = Find(couple);
            if (componentSize.ContainsKey(root)) {
                componentSize[root]++;
            } else {
                componentSize[root] = 1;
            }
        }
        
        int swaps = 0;
        foreach (int size in componentSize.Values) {
            swaps += size - 1;
        }
        
        return swaps;
    }
}
