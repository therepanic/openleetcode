public class Solution {
    public int LargestAltitude(int[] gain) {
        int ans = 0, acc = 0;
        foreach (int it in gain) {
            acc += it;
            int d = acc - ans;
            ans += d & ~(d >> 31);
        }
        return ans;
    }
}
