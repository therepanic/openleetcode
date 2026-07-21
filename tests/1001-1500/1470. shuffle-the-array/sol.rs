impl Solution {
    pub fn shuffle(nums: Vec<i32>, n: i32) -> Vec<i32> {
        let n_u = n as usize;
        let mut ans = vec![0; 2 * n_u];
        for i in 0..(2 * n_u) {
            if i % 2 == 0 {
                ans[i] = nums[i / 2];
            } else {
                ans[i] = nums[n_u + i / 2];
            }
        }
        ans
    }
}
