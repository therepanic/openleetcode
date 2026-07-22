public class Solution {
    public int[] SmallerNumbersThanCurrent(int[] nums) {
        int[] allNums = new int[101];
        int[] res = new int[nums.Length];

        foreach (int v in nums) {
            allNums[v]++;
        }

        for (int v = 1; v <= 100; v++) {
            allNums[v] += allNums[v - 1];
        }

        for (int i = 0; i < nums.Length; i++) {
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
