class Solution {
    public int findNumberOfLIS(int[] nums) {
        int n = nums.length;
        if (n == 0) return 0;

        int[] lengths = new int[n];
        int[] counts = new int[n];
        for (int i = 0; i < n; i++) {
            lengths[i] = 1;
            counts[i] = 1;
        }

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < i; j++) {
                if (nums[j] < nums[i]) {
                    if (lengths[j] + 1 > lengths[i]) {
                        lengths[i] = lengths[j] + 1;
                        counts[i] = counts[j];
                    } else if (lengths[j] + 1 == lengths[i]) {
                        counts[i] += counts[j];
                    }
                }
            }
        }

        int maxLength = 0;
        for (int len : lengths) {
            maxLength = Math.max(maxLength, len);
        }

        int result = 0;
        for (int i = 0; i < n; i++) {
            if (lengths[i] == maxLength) {
                result += counts[i];
            }
        }
        return result;
    }
}
