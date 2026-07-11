class Solution {
    public int minKBitFlips(int[] nums, int k) {
        int n = nums.length;
        int ans = 0;
        int flips = 0;
        int[] flipped = new int[n + 1];

        for (int i = 0; i <= n - k; i++) {
            flips += flipped[i];
            if ((nums[i] == 0 && flips % 2 == 0) || (nums[i] == 1 && flips % 2 != 0)) {
                flips++;
                ans++;
                flipped[i + k]--;
            }
        }

        for (int i = n - k + 1; i < n; i++) {
            flips += flipped[i];
            if ((nums[i] == 0 && flips % 2 == 0) || (nums[i] == 1 && flips % 2 != 0)) {
                return -1;
            }
        }

        return ans;
    }
}
