class Solution {
    public int minSpeedOnTime(int[] dist, double hour) {
        if (dist.length == 0) return -1;
        
        int low = 1, high = 10000000, ans = -1;
        while (low <= high) {
            int mid = low + (high - low) / 2;
            if (canReach(dist, hour, mid)) {
                ans = mid;
                high = mid - 1;
            } else {
                low = mid + 1;
            }
        }
        return ans;
    }
    
    private boolean canReach(int[] dist, double hour, int speed) {
        double total = 0;
        for (int i = 0; i < dist.length - 1; i++) {
            total += (dist[i] + speed - 1) / speed; // ceil division
        }
        total += (double) dist[dist.length - 1] / speed;
        return total <= hour;
    }
}
