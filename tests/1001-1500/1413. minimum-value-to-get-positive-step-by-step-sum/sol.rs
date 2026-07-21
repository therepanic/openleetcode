impl Solution {
    pub fn min_start_value(nums: Vec<i32>) -> i32 {
        let mut curr = 0;
        let mut ans = 0;
        for i in nums {
            curr += i;
            if curr < ans {
                ans = curr;
            }
        }
        ans.max(1 - ans)
    }
}
