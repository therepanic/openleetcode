impl Solution {
    pub fn product_except_self(nums: Vec<i32>) -> Vec<i32> {
        let n = nums.len();
        let mut res = vec![0; n];

        let mut pre = 1;
        for i in 0..n {
            res[i] = pre;
            pre *= nums[i];
        }

        let mut suf = 1;
        for i in (0..n).rev() {
            res[i] *= suf;
            suf *= nums[i];
        }

        res
    }
}
