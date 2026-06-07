impl Solution {
    pub fn max_sub_array(nums: Vec<i32>) -> i32 {
        let mut best = nums[0];
        let mut cur = 0;
        for n in nums {
            if cur < 0 {
                cur = 0;
            }
            cur += n;
            if cur > best {
                best = cur;
            }
        }
        best
    }
}
