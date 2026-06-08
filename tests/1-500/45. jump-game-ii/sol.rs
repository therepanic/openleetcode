impl Solution {
    pub fn jump(nums: Vec<i32>) -> i32 {
        let n = nums.len();
        if n <= 1 {
            return 0;
        }

        let mut jumps = 0;
        let mut curr_end = 0usize;
        let mut max_reach = 0usize;

        for i in 0..n - 1 {
            max_reach = max_reach.max(i + nums[i] as usize);
            if i == curr_end {
                jumps += 1;
                curr_end = max_reach;
                if curr_end >= n - 1 {
                    break;
                }
            }
        }

        jumps
    }
}
