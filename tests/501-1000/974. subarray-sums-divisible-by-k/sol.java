class Solution {
    public int subarraysDivByK(int[] nums, int k) {
        int s = 0;
        int res = 0;
        java.util.Map<Integer, Integer> hs = new java.util.HashMap<>();
        hs.put(0, 1);
        for (int num : nums) {
            s += num;
            int rem = ((s % k) + k) % k;
            res += hs.getOrDefault(rem, 0);
            hs.put(rem, hs.getOrDefault(rem, 0) + 1);
        }
        return res;
    }
}
