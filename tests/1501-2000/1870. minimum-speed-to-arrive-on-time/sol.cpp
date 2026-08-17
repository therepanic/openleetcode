class Solution {
public:
    int minSpeedOnTime(vector<int>& dist, double hour) {
        if (dist.empty()) return -1;
        
        auto canReach = [&](int speed) {
            double total = 0;
            for (int i = 0; i < dist.size() - 1; ++i) {
                total += (dist[i] + speed - 1) / speed;
            }
            total += (double)dist.back() / speed;
            return total <= hour;
        };
        
        int low = 1, high = 10000000, ans = -1;
        while (low <= high) {
            int mid = (low + high) / 2;
            if (canReach(mid)) {
                ans = mid;
                high = mid - 1;
            } else {
                low = mid + 1;
            }
        }
        return ans;
    }
};
