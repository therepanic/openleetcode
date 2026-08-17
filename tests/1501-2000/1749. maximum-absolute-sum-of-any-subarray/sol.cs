public class Solution {
    public int MaxAbsoluteSum(int[] nums) {
        int prefixSum = 0;
        int minPrefixSum = 0;
        int maxPrefixSum = 0;
        int maxAbsoluteSum = 0;

        foreach (int num in nums) {
            prefixSum += num;
            
            maxAbsoluteSum = Math.Max(maxAbsoluteSum, Math.Abs(prefixSum - minPrefixSum));
            maxAbsoluteSum = Math.Max(maxAbsoluteSum, Math.Abs(prefixSum - maxPrefixSum));
            
            minPrefixSum = Math.Min(minPrefixSum, prefixSum);
            maxPrefixSum = Math.Max(maxPrefixSum, prefixSum);
        }

        return maxAbsoluteSum;
    }
}
