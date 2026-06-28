class Solution {
public:
    int findKthNumber(int m, int n, int k) {
        int lo = 1, hi = m * n;
        while (lo < hi) {
            int mid = lo + (hi - lo) / 2;
            int count = 0;
            for (int i = 1; i <= m; i++) {
                count += min(n, mid / i);
            }
            if (count >= k) {
                hi = mid;
            } else {
                lo = mid + 1;
            }
        }
        return lo;
    }
};
