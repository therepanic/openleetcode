public class Solution {
    public int[] MaxSumOfThreeSubarrays(int[] nums, int k) {
        int n = nums.Length;
        int sum1 = 0, sum2 = 0, sum3 = 0;
        for (int i = 0; i < k; i++) sum1 += nums[i];
        for (int i = k; i < 2 * k; i++) sum2 += nums[i];
        for (int i = 2 * k; i < 3 * k; i++) sum3 += nums[i];

        int max1 = sum1;
        int max12 = sum1 + sum2;
        int max123 = sum1 + sum2 + sum3;

        int index1 = 0;
        int index12_1 = 0;
        int index12_2 = k;
        int[] ans = new int[] { 0, k, 2 * k };

        for (int i = 1; i <= n - 3 * k; i++) {
            sum1 = sum1 - nums[i - 1] + nums[i + k - 1];
            sum2 = sum2 - nums[i + k - 1] + nums[i + 2 * k - 1];
            sum3 = sum3 - nums[i + 2 * k - 1] + nums[i + 3 * k - 1];

            if (sum1 > max1) {
                max1 = sum1;
                index1 = i;
            }

            if (max1 + sum2 > max12) {
                max12 = max1 + sum2;
                index12_1 = index1;
                index12_2 = i + k;
            }

            if (max12 + sum3 > max123) {
                max123 = max12 + sum3;
                ans[0] = index12_1;
                ans[1] = index12_2;
                ans[2] = i + 2 * k;
            }
        }

        return ans;
    }
}
