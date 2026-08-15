public class Solution {
    public int MinSpeedOnTime(int[] dist, double hour) {
        if (dist.Length == 0) return -1;
        
        bool CanReach(int speed) {
            double total = 0;
            for (int i = 0; i < dist.Length - 1; i++) {
                total += (dist[i] + speed - 1) / speed;
            }
            total += (double)dist[dist.Length - 1] / speed;
            return total <= hour;
        }
        
        int low = 1, high = 10000000, ans = -1;
        while (low <= high) {
            int mid = (low + high) / 2;
            if (CanReach(mid)) {
                ans = mid;
                high = mid - 1;
            } else {
                low = mid + 1;
            }
        }
        return ans;
    }
}
