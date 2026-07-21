class Solution {
    public int[] smallerNumbersThanCurrent(int[] nums) {
        int[] allNums = new int[101];
        int[] res = new int[nums.length];

        for (int v : nums) {
            allNums[v]++;
        }

        for (int v = 1; v <= 100; v++) {
            allNums[v] += allNums[v - 1];
        }

        for (int i = 0; i < nums.length; i++) {
            int v = nums[i];
            if (v == 0) {
                res[i] = 0;
            } else {
                res[i] = allNums[v - 1];
            }
        }
        return res;
    }
}
