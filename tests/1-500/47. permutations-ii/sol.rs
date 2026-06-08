impl Solution {
    pub fn permute_unique(mut nums: Vec<i32>) -> Vec<Vec<i32>> {
        nums.sort_unstable();
        let mut used = vec![false; nums.len()];
        let mut res = vec![];
        let mut cur = vec![];

        fn dfs(
            nums: &Vec<i32>,
            used: &mut Vec<bool>,
            cur: &mut Vec<i32>,
            res: &mut Vec<Vec<i32>>,
        ) {
            if cur.len() == nums.len() {
                res.push(cur.clone());
                return;
            }

            for i in 0..nums.len() {
                if used[i] {
                    continue;
                }
                if i > 0 && nums[i] == nums[i - 1] && !used[i - 1] {
                    continue;
                }
                used[i] = true;
                cur.push(nums[i]);
                dfs(nums, used, cur, res);
                cur.pop();
                used[i] = false;
            }
        }

        dfs(&nums, &mut used, &mut cur, &mut res);
        res
    }
}
