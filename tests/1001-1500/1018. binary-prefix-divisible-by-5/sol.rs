impl Solution {
    pub fn prefixes_div_by5(nums: Vec<i32>) -> Vec<bool> {
        let mut ans = Vec::with_capacity(nums.len());
        let mut val = 0;
        for bit in nums {
            val = (val * 2 + bit) % 5;
            ans.push(val == 0);
        }
        ans
    }
}
