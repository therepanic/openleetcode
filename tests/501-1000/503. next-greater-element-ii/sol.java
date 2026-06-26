class Solution {
    public int[] nextGreaterElements(int[] nums) {
        int n = nums.length;
        int[] res = new int[n];
        for (int i = 0; i < n; i++) {
            res[i] = -1;
            for (int j = i + 1; j < n; j++) {
                if (nums[j] > nums[i]) {
                    res[i] = nums[j];
                    break;
                }
            }
            if (res[i] == -1) {
                for (int j = 0; j < i; j++) {
                    if (nums[j] > nums[i]) {
                        res[i] = nums[j];
                        break;
                    }
                }
            }
        }
        return res;
    }
}
