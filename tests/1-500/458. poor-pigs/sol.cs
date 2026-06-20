public class Solution {
    public int PoorPigs(int buckets, int minutesToDie, int minutesToTest) {
        int baseVal = minutesToTest / minutesToDie + 1;
        int ans = 0;
        int n = 1;
        while (n < buckets) {
            n *= baseVal;
            ans++;
        }
        return ans;
    }
}
