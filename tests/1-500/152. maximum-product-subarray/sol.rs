impl Solution {
    pub fn max_product(nums: Vec<i32>) -> i32 {
        let mut best = nums[0];
        let mut cur_max = nums[0];
        let mut cur_min = nums[0];
        for &x in nums.iter().skip(1) {
            if x < 0 {
                std::mem::swap(&mut cur_max, &mut cur_min);
            }
            cur_max = x.max(cur_max * x);
            cur_min = x.min(cur_min * x);
            best = best.max(cur_max);
        }
        best
    }
}
