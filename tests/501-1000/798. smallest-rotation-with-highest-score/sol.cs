public class Solution {
    public int BestRotation(int[] nums) {
        int n = nums.Length;
        int[] diffs = new int[n + 1];
        for (int i = 0; i < n; i++) {
            int left = ((i - nums[i] + 1) % n + n) % n;
            int right = (i + 1) % n;
            diffs[left]--;
            diffs[right]++;
            if (left > right) {
                diffs[0]--;
            }
        }
        int best = 0;
        int cur = n;
        int maxScore = cur;
        for (int k = 1; k < n; k++) {
            cur += diffs[k];
            if (cur > maxScore) {
                maxScore = cur;
                best = k;
            }
        }
        return best;
    }
}
