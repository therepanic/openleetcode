import java.util.*;

class Solution {
    public long maxTaxiEarnings(int n, int[][] rides) {
        Arrays.sort(rides, (a, b) -> Integer.compare(a[1], b[1]));
        List<long[]> dp = new ArrayList<>();
        dp.add(new long[]{0, 0});
        
        for (int[] ride : rides) {
            int start = ride[0], end = ride[1], tip = ride[2];
            int i = binarySearch(dp, start) - 1;
            long profit = dp.get(i)[1] + end - start + tip;
            
            if (profit > dp.get(dp.size()-1)[1]) {
                dp.add(new long[]{end, profit});
            }
        }
        
        return dp.get(dp.size()-1)[1];
    }
    
    private int binarySearch(List<long[]> dp, int start) {
        int lo = 0, hi = dp.size();
        while (lo < hi) {
            int mid = lo + (hi - lo) / 2;
            if (dp.get(mid)[0] <= start) {
                lo = mid + 1;
            } else {
                hi = mid;
            }
        }
        return lo;
    }
}
