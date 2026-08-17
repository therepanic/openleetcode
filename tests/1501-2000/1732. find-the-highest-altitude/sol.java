class Solution {
    public int largestAltitude(int[] gain) {
        int ans = 0, acc = 0;
        for (int it : gain) {
            acc += it;
            int d = acc - ans;
            ans += d & ~(d >> 31);
        }
        return ans;
    }
}
