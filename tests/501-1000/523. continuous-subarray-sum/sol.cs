public class Solution {
    public bool CheckSubarraySum(int[] nums, int k) {
        if (nums.Length == 0) return false;

        int prefixSum = 0;
        Dictionary<int, int> remainderMap = new Dictionary<int, int>();
        remainderMap[0] = -1;

        for (int i = 0; i < nums.Length; i++) {
            prefixSum += nums[i];
            int remainder = prefixSum % k;

            if (remainderMap.ContainsKey(remainder)) {
                if (i - remainderMap[remainder] > 1) return true;
            } else {
                remainderMap[remainder] = i;
            }
        }

        return false;
    }
}
