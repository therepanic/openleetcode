public class Solution {
    public bool CanPartitionKSubsets(int[] nums, int k) {
        int total = nums.Sum();
        if (total % k != 0) return false;
        int target = total / k;
        Array.Sort(nums, (a, b) => b.CompareTo(a));
        if (nums[0] > target) return false;
        int n = nums.Length;
        Dictionary<int, bool> memo = new Dictionary<int, bool>();
        
        bool Dfs(int used, int curr) {
            if (used == (1 << n) - 1) return true;
            int key = (used << 10) | curr;
            if (memo.ContainsKey(key)) return memo[key];
            for (int i = 0; i < n; i++) {
                if (((used >> i) & 1) == 0 && curr + nums[i] <= target) {
                    int newCurr = curr + nums[i];
                    int nxt = newCurr == target ? 0 : newCurr;
                    if (Dfs(used | (1 << i), nxt)) {
                        memo[key] = true;
                        return true;
                    }
                }
            }
            memo[key] = false;
            return false;
        }
        
        return Dfs(0, 0);
    }
}
