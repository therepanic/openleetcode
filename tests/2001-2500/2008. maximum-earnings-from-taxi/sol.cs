using System;
using System.Collections.Generic;

public class Solution {
    public long MaxTaxiEarnings(int n, int[][] rides) {
        Array.Sort(rides, (a, b) => a[1].CompareTo(b[1]));
        List<long[]> dp = new List<long[]> { new long[] {0, 0} };
        
        foreach (var ride in rides) {
            long start = ride[0], end = ride[1], tip = ride[2];
            
            int lo = 0, hi = dp.Count;
            while (lo < hi) {
                int mid = lo + (hi - lo) / 2;
                if (dp[mid][0] <= start) {
                    lo = mid + 1;
                } else {
                    hi = mid;
                }
            }
            int i = lo - 1;
            long profit = dp[i][1] + end - start + tip;
            
            if (profit > dp[dp.Count - 1][1]) {
                dp.Add(new long[] {end, profit});
            }
        }
        
        return dp[dp.Count - 1][1];
    }
}
