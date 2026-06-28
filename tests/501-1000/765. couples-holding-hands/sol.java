class Solution {
    public int minSwapsCouples(int[] row) {
        int n = row.length / 2;
        int[] parent = new int[n];
        for (int i = 0; i < n; i++) {
            parent[i] = i;
        }
        
        for (int i = 0; i < row.length; i += 2) {
            int couple1 = row[i] / 2;
            int couple2 = row[i+1] / 2;
            union(parent, couple1, couple2);
        }
        
        int[] componentSize = new int[n];
        for (int couple = 0; couple < n; couple++) {
            int root = find(parent, couple);
            componentSize[root]++;
        }
        
        int swaps = 0;
        for (int size : componentSize) {
            if (size > 0) {
                swaps += size - 1;
            }
        }
        
        return swaps;
    }
    
    private int find(int[] parent, int x) {
        if (parent[x] != x) {
            parent[x] = find(parent, parent[x]);
        }
        return parent[x];
    }
    
    private void union(int[] parent, int a, int b) {
        int pa = find(parent, a);
        int pb = find(parent, b);
        if (pa != pb) {
            parent[pa] = pb;
        }
    }
}
