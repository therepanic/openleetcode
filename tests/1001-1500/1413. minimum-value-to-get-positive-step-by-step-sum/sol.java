class Solution {
    public int minStartValue(int[] nums) {
        int curr = 0, ans = 0;
        for (int i : nums) {
            curr += i;
            if (curr < ans) {
                ans = curr;
            }
        }
        return Math.max(ans, 1 - ans);
    }
}
