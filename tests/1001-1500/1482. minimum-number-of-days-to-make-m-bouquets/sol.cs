public class Solution {
    public int MinDays(int[] bloomDay, int m, int k) {
        if ((long)m * k > bloomDay.Length) return -1;
        
        bool f(int timeLimit) {
            int cntr = 0;
            int bouquetCntr = 0;
            foreach (int day in bloomDay) {
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
        
        int s = bloomDay.Min();
        int e = bloomDay.Max();
        int ans = -1;
        
        while (s <= e) {
            int mid = s + (e - s) / 2;
            if (f(mid)) {
                ans = mid;
                e = mid - 1;
            } else {
                s = mid + 1;
            }
        }
        
        return ans;
    }
}
