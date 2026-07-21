class Solution {
public:
    int minDays(vector<int>& bloomDay, int m, int k) {
        if ((long long)m * k > bloomDay.size()) return -1;
        
        auto f = [&](int timeLimit) -> bool {
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
        };
        
        int s = *min_element(bloomDay.begin(), bloomDay.end());
        int e = *max_element(bloomDay.begin(), bloomDay.end());
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
};
