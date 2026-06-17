public class Solution {
    public int[] ProductExceptSelf(int[] nums) {
        int n = nums.Length;
        int[] res = new int[n];

        int pre = 1;
        for (int i = 0; i < n; i++) {
            res[i] = pre;
            pre *= nums[i];
        }

        int suf = 1;
        for (int i = n - 1; i >= 0; i--) {
            res[i] *= suf;
            suf *= nums[i];
        }

        return res;
    }
}
