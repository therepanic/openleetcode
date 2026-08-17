public class Solution {
    public int MinimumBoxes(int n) {
        long lo = 0, hi = 200000, target = n;
        while (lo < hi) {
            long mid = (lo + hi + 1) / 2;
            if (mid * (mid + 1) * (mid + 2) / 6 <= target) lo = mid;
            else hi = mid - 1;
        }
        long remaining = target - lo * (lo + 1) * (lo + 2) / 6;
        long extra = 0;
        while (extra * (extra + 1) / 2 < remaining) extra++;
        return (int)(lo * (lo + 1) / 2 + extra);
    }
}
