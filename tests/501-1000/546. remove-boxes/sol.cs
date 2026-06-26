public class Solution {
    public int RemoveBoxes(int[] boxes) {
        var groups = new List<(int color, int count)>();
        int i = 0;
        while (i < boxes.Length) {
            int color = boxes[i];
            int count = 0;
            while (i < boxes.Length && boxes[i] == color) {
                count++;
                i++;
            }
            groups.Add((color, count));
        }
        
        int n = groups.Count;
        int[,,] dp = new int[n, n, boxes.Length + 1];
        
        int Dfs(int l, int r, int k) {
            if (l > r) return 0;
            if (dp[l, r, k] != 0) return dp[l, r, k];
            
            int color = groups[l].color;
            int count = groups[l].count + k;
            int res = count * count + Dfs(l + 1, r, 0);
            
            for (int i = l + 1; i <= r; i++) {
                if (groups[i].color == color) {
                    int left = Dfs(l + 1, i - 1, 0);
                    int right = Dfs(i, r, count);
                    res = Math.Max(res, left + right);
                }
            }
            
            dp[l, r, k] = res;
            return res;
        }
        
        return Dfs(0, n - 1, 0);
    }
}
