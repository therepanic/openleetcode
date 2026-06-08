impl Solution {
    pub fn subsets_with_dup(mut nums: Vec<i32>) -> Vec<Vec<i32>> {
        nums.sort();
        let mut res = Vec::new();
        let mut cur = Vec::new();
        Self::dfs(0, &nums, &mut cur, &mut res);
        res
    }

    fn dfs(start: usize, nums: &Vec<i32>, cur: &mut Vec<i32>, res: &mut Vec<Vec<i32>>) {
        res.push(cur.clone());
        for i in start..nums.len() {
            if i > start && nums[i] == nums[i - 1] {
                continue;
            }
            cur.push(nums[i]);
            Self::dfs(i + 1, nums, cur, res);
            cur.pop();
        }
    }
}
