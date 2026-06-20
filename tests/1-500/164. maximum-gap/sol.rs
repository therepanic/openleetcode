impl Solution {
    pub fn maximum_gap(mut nums: Vec<i32>) -> i32 {
        if nums.len() < 2 {
            return 0;
        }
        nums.sort();
        let mut best = 0;
        for i in 1..nums.len() {
            best = best.max(nums[i] - nums[i - 1]);
        }
        best
    }
}
