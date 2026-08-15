public class Solution {
    public int MinimumMountainRemovals(int[] nums) {
        int n = nums.Length;
        int[] lis = new int[n];
        int[] lds = new int[n];
        Array.Fill(lis, 1);
        Array.Fill(lds, 1);

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < i; j++) {
                if (nums[i] > nums[j]) {
                    lis[i] = Math.Max(lis[i], lis[j] + 1);
                }
            }
        }

        for (int i = n - 1; i >= 0; i--) {
            for (int j = n - 1; j > i; j--) {
                if (nums[i] > nums[j]) {
                    lds[i] = Math.Max(lds[i], lds[j] + 1);
                }
            }
        }

        int maxLen = 0;
        for (int i = 1; i < n - 1; i++) {
            if (lis[i] > 1 && lds[i] > 1) {
                maxLen = Math.Max(maxLen, lis[i] + lds[i] - 1);
            }
        }

        return n - maxLen;
    }
}
