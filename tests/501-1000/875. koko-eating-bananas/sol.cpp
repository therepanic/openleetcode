class Solution {
public:
    int minEatingSpeed(vector<int>& piles, int h) {
        auto canFinish = [&](int k) -> bool {
            long long hours = 0;
            for (int pile : piles) {
                hours += pile / k;
                if (pile % k != 0) {
                    hours++;
                }
                if (hours > h) {
                    return false;
                }
            }
            return true;
        };

        int left = 1;
        int right = *max_element(piles.begin(), piles.end());
        int ans = right;
        while (left <= right) {
            int mid = left + (right - left) / 2;
            if (canFinish(mid)) {
                ans = mid;
                right = mid - 1;
            } else {
                left = mid + 1;
            }
        }
        return ans;
    }
};
