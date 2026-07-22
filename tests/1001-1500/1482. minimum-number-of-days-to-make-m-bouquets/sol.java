class Solution {
    public int minDays(int[] bloomDay, int m, int k) {
        if ((long) m * k > bloomDay.length) return -1;
        
        int s = Integer.MAX_VALUE;
        int e = Integer.MIN_VALUE;
        for (int day : bloomDay) {
            s = Math.min(s, day);
            e = Math.max(e, day);
        }
        
        int ans = -1;
        while (s <= e) {
            int mid = s + (e - s) / 2;
            if (f(bloomDay, m, k, mid)) {
                ans = mid;
                e = mid - 1;
            } else {
                s = mid + 1;
            }
        }
        return ans;
    }
    
    private boolean f(int[] bloomDay, int m, int k, int timeLimit) {
        int cntr = 0;
        int bouquetCntr = 0;
        for (int day : bloomDay) {
            if (day <= timeLimit) {
                cntr++;
                if (cntr == k) {
                    bouquetCntr++;
                    cntr = 0;
                }
            } else {
                cntr = 0;
            }
        }
        return bouquetCntr >= m;
    }
}
