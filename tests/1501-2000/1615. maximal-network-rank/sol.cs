public class Solution {
    public int MaximalNetworkRank(int n, int[][] roads) {
        int[,] a = new int[n, n];
        foreach (var road in roads) {
            a[road[0], road[1]] = 1;
            a[road[1], road[0]] = 1;
        }
        
        int[] d = new int[n];
        for (int i = 0; i < n; i++) {
            int sum = 0;
            for (int j = 0; j < n; j++) sum += a[i, j];
            d[i] = sum;
        }
        
        int[,] rank = new int[n, n];
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                if (i != j) {
                    rank[i, j] = d[i] + d[j] - a[i, j];
                } else {
                    rank[i, j] = -1;
                }
            }
        }
        
        int max = -1;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                if (rank[i, j] > max) max = rank[i, j];
            }
        }
        return max;
    }
}
