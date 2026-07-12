public class Solution {
    public int MinEatingSpeed(int[] piles, int h) {
        bool CanFinish(int k) {
            long hours = 0;
            foreach (int pile in piles) {
                hours += pile / k;
                if (pile % k != 0) {
                    hours++;
                }
                if (hours > h) {
                    return false;
                }
            }
            return true;
        }

        int left = 1;
        int right = piles.Max();
        int ans = right;
        while (left <= right) {
            int mid = left + (right - left) / 2;
            if (CanFinish(mid)) {
                ans = mid;
                right = mid - 1;
            } else {
                left = mid + 1;
            }
        }
        return ans;
    }
}
