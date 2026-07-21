class Solution {
    public boolean isPossibleDivide(int[] nums, int k) {
        if (nums.length % k != 0) return false;
        java.util.Map<Integer, Integer> count = new java.util.HashMap<>();
        for (int num : nums) {
            count.put(num, count.getOrDefault(num, 0) + 1);
        }
        java.util.Arrays.sort(nums);
        for (int num : nums) {
            if (count.get(num) == 0) continue;
            for (int i = 0; i < k; i++) {
                int cur = num + i;
                if (count.getOrDefault(cur, 0) == 0) return false;
                count.put(cur, count.get(cur) - 1);
            }
        }
        return true;
    }
}
