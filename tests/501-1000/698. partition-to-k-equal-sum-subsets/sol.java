class Solution {
    public boolean canPartitionKSubsets(int[] nums, int k) {
        int total = 0;
        for (int num : nums) total += num;
        if (total % k != 0) return false;
        int target = total / k;
        Arrays.sort(nums);
        for (int i = 0; i < nums.length / 2; i++) {
            int temp = nums[i];
            nums[i] = nums[nums.length - 1 - i];
            nums[nums.length - 1 - i] = temp;
        }
        if (nums[0] > target) return false;
        int n = nums.length;
        Map<Integer, Boolean> memo = new HashMap<>();
        return dfs(0, 0, nums, target, n, memo);
    }
    
    private boolean dfs(int used, int curr, int[] nums, int target, int n, Map<Integer, Boolean> memo) {
        if (used == (1 << n) - 1) return true;
        int key = (used << 10) | curr;
        if (memo.containsKey(key)) return memo.get(key);
        for (int i = 0; i < n; i++) {
            if (((used >> i) & 1) == 0 && curr + nums[i] <= target) {
                int new_curr = curr + nums[i];
                int nxt = new_curr == target ? 0 : new_curr;
                if (dfs(used | (1 << i), nxt, nums, target, n, memo)) {
                    memo.put(key, true);
                    return true;
                }
            }
        }
        memo.put(key, false);
        return false;
    }
}
