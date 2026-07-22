public class Solution {
    public IList<int> MinSubsequence(int[] nums) {
        Array.Sort(nums);
        var v = new List<int>();
        int l = nums.Length;
        int sumV = 0, sumRem = nums.Sum();
        while (sumV <= sumRem) {
            l--;
            sumV += nums[l];
            sumRem -= nums[l];
            v.Add(nums[l]);
        }
        return v;
    }
}
