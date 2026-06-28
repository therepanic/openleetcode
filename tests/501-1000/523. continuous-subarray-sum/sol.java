class Solution {
    public boolean checkSubarraySum(int[] nums, int k) {
        if (nums.length == 0) return false;

        int prefixSum = 0;
        java.util.Map<Integer, Integer> remainderMap = new java.util.HashMap<>();
        remainderMap.put(0, -1);

        for (int i = 0; i < nums.length; i++) {
            prefixSum += nums[i];
            int remainder = prefixSum % k;

            if (remainderMap.containsKey(remainder)) {
                if (i - remainderMap.get(remainder) > 1) return true;
            } else {
                remainderMap.put(remainder, i);
            }
        }

        return false;
    }
}
