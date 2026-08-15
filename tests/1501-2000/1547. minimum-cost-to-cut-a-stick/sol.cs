public class Solution {
    public int MinCost(int n, int[] cuts) {
        var c = cuts.ToList();
        c.Add(0);
        c.Add(n);
        c.Sort();
        int m = c.Count;
        var memo = new int[m, m];
        for (int i = 0; i < m; i++)
            for (int j = 0; j < m; j++)
                memo[i, j] = -1;
        return Optimize(0, m-1, c, memo);
    }
    
    private int Optimize(int i, int j, List<int> c, int[,] memo) {
        if (j - i <= 1) return 0;
        if (memo[i, j] != -1) return memo[i, j];
        int res = int.MaxValue;
        for (int k = i+1; k < j; k++) {
            int val = Optimize(i, k, c, memo) + Optimize(k, j, c, memo);
            if (val < res) res = val;
        }
        memo[i, j] = res + (c[j] - c[i]);
        return memo[i, j];
    }
}
