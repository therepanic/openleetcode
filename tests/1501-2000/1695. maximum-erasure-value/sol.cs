public class Solution {
    public int MaximumUniqueSubarray(int[] nums) {
        int res = 0;
        int curSum = 0;
        int start = 0;
        const int k = 10001;
        bool[] isPresent = new bool[k];

        for (int end = 0; end < nums.Length; end++) {
            while (isPresent[nums[end]]) {
                isPresent[nums[start]] = false;
                curSum -= nums[start];
                start++;
            }

            isPresent[nums[end]] = true;
            curSum += nums[end];

            res = Math.Max(res, curSum);
        }

        return res;
    }
}
