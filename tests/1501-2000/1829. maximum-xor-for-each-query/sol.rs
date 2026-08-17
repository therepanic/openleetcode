impl Solution {
    pub fn get_maximum_xor(nums: Vec<i32>, maximum_bit: i32) -> Vec<i32> {
        let n = nums.len();
        let mut ans = vec![0; n];
        let mask = (1 << maximum_bit) - 1;
        let mut curr = 0;
        for i in 0..n {
            curr ^= nums[i];
            ans[n - 1 - i] = mask ^ curr;
        }
        ans
    }
}
