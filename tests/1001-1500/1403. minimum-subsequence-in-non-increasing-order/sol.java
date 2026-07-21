class Solution {
    public List<Integer> minSubsequence(int[] nums) {
        Arrays.sort(nums);
        List<Integer> v = new ArrayList<>();
        int l = nums.length;
        int sumV = 0, sumRem = 0;
        for (int i = 0; i < l; i++) sumRem += nums[i];
        while (sumV <= sumRem) {
            l--;
            sumV += nums[l];
            sumRem -= nums[l];
            v.add(nums[l]);
        }
        return v;
    }
}
