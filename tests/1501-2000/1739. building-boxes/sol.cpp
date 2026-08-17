class Solution {
public:
    int minimumBoxes(int n) {
        long long lo = 0, hi = 200000, target = n;
        while (lo < hi) {
            long long mid = (lo + hi + 1) / 2;
            if (mid * (mid + 1) * (mid + 2) / 6 <= target) lo = mid;
            else hi = mid - 1;
        }
        long long remaining = target - lo * (lo + 1) * (lo + 2) / 6;
        long long extra = 0;
        while (extra * (extra + 1) / 2 < remaining) ++extra;
        return (int)(lo * (lo + 1) / 2 + extra);
    }
};
