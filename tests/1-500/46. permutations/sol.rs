impl Solution {
    pub fn permute(mut nums: Vec<i32>) -> Vec<Vec<i32>> {
        fn dfs(i: usize, nums: &mut Vec<i32>, res: &mut Vec<Vec<i32>>) {
            if i == nums.len() {
                res.push(nums.clone());
                return;
            }

            for j in i..nums.len() {
                nums.swap(i, j);
                dfs(i + 1, nums, res);
                nums.swap(i, j);
            }
        }

        let mut res = vec![];
        dfs(0, &mut nums, &mut res);
        res
    }
}
