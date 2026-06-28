class Solution {
    public int findUnsortedSubarray(int[] nums) {
        int n = nums.length;
        int[] sortedNums = nums.clone();
        Arrays.sort(sortedNums);
        int start = n, end = 0;

        for (int i = 0; i < n; i++) {
            if (nums[i] != sortedNums[i]) {
                start = Math.min(start, i);
                end = Math.max(end, i);
            }
        }

        return end - start >= 0 ? end - start + 1 : 0;
    }
}
