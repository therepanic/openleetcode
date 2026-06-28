impl Solution {
    pub fn can_partition_k_subsets(nums: Vec<i32>, k: i32) -> bool {
        let total: i32 = nums.iter().sum();
        if total % k != 0 {
            return false;
        }
        let target = total / k;
        let mut nums = nums;
        nums.sort_by(|a, b| b.cmp(a));
        if nums[0] > target {
            return false;
        }
        let n = nums.len();
        let mut memo = std::collections::HashMap::new();
        
        fn dfs(used: usize, curr: i32, nums: &Vec<i32>, target: i32, n: usize, memo: &mut std::collections::HashMap<(usize, i32), bool>) -> bool {
            if used == (1 << n) - 1 {
                return true;
            }
            if let Some(&result) = memo.get(&(used, curr)) {
                return result;
            }
            for i in 0..n {
                if (used >> i) & 1 == 0 && curr + nums[i] <= target {
                    let new_curr = curr + nums[i];
                    let nxt = if new_curr == target { 0 } else { new_curr };
                    if dfs(used | (1 << i), nxt, nums, target, n, memo) {
                        memo.insert((used, curr), true);
                        return true;
                    }
                }
            }
            memo.insert((used, curr), false);
            false
        }
        
        dfs(0, 0, &nums, target, n, &mut memo)
    }
}
