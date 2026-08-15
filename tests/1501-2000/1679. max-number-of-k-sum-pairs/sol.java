class Solution {
    public int maxOperations(int[] nums, int k) {
        Arrays.sort(nums);
        int i = 0, j = nums.length - 1;
        int count = 0;

        while (i < j) {
            int total = nums[i] + nums[j];
            if (total == k) {
                count++;
                i++;
                j--;
            } else if (total > k) {
                j--;
            } else {
                i++;
            }
        }

        return count;
    }
}
