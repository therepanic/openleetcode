public class Solution {
    public int StoneGameV(int[] stoneValue) {
        int n = stoneValue.Length;
        int[] sv = new int[n + 1];
        for (int i = 0; i < n; i++) sv[i + 1] = sv[i] + stoneValue[i];
        int[,] memo = new int[n + 1, n + 1];
        for (int i = 0; i <= n; i++)
            for (int j = 0; j <= n; j++)
                memo[i, j] = -1;
        return Helper(sv, 0, n, memo);
    }
    
    private int Helper(int[] sv, int fro, int to, int[,] memo) {
        if (to - fro == 1) return 0;
        if (memo[fro, to] != -1) return memo[fro, to];
        
        int target = (sv[to] + sv[fro]) / 2;
        int lo = fro, hi = to;
        while (lo < hi) {
            int mid = (lo + hi) / 2;
            if (sv[mid] < target) lo = mid + 1;
            else hi = mid;
        }
        int pivot = lo;
        
        int dist = 0;
        int res = 0;
        bool explore_more = true;
        int maxDist = Math.Max(pivot - fro, to - pivot);
        while (explore_more && dist <= maxDist) {
            explore_more = false;
            int[] candidates = {pivot - dist, pivot + dist};
            foreach (int i in candidates) {
                if (fro < i && i <= to) {
                    int left = sv[i] - sv[fro];
                    int right = sv[to] - sv[i];
                    if (res / 2 <= left && left <= right) {
                        res = Math.Max(res, left + Helper(sv, fro, i, memo));
                        explore_more = true;
                    }
                    if (left >= right && right >= res / 2) {
                        res = Math.Max(res, right + Helper(sv, i, to, memo));
                        explore_more = true;
                    }
                }
            }
            dist++;
        }
        memo[fro, to] = res;
        return res;
    }
}
