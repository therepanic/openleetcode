public class Solution {
    private int[][] mat;
    private Dictionary<long, int> dp;
    private int mini = int.MaxValue;
    
    public int MinimizeTheDifference(int[][] mat, int target) {
        this.mat = mat;
        dp = new Dictionary<long, int>();
        for (int i = 0; i < mat.Length; i++) {
            Array.Sort(mat[i]);
        }
        return Dfs(mat.Length - 1, target);
    }
    
    private int Dfs(int i, int ans) {
        if (i < 0) {
            int diff = Math.Abs(ans);
            if (diff < mini) mini = diff;
            return diff;
        }
        long key = (long)i * 100000 + (ans + 100000);
        if (dp.ContainsKey(key)) return dp[key];
        if (ans < 0 && Math.Abs(ans) > mini) return int.MaxValue / 2;
        int take = int.MaxValue / 2;
        for (int z = 0; z < mat[i].Length; z++) {
            if (z > 0 && mat[i][z] == mat[i][z-1]) continue;
            take = Math.Min(take, Dfs(i-1, ans - mat[i][z]));
            if (take == 0) break;
        }
        dp[key] = take;
        return take;
    }
}
