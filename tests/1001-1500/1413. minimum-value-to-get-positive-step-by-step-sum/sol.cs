public class Solution {
    public int MinStartValue(int[] nums) {
        int curr = 0, ans = 0;
        foreach (int i in nums) {
            curr += i;
            if (curr < ans) {
                ans = curr;
            }
        }
        return Math.Max(ans, 1 - ans);
    }
}
