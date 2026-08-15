impl Solution {
    pub fn get_sum_absolute_differences(nums: Vec<i32>) -> Vec<i32> {
        let n = nums.len();
        let mut pref = vec![0; n];
        pref[0] = nums[0];
        for i in 1..n {
            pref[i] = pref[i-1] + nums[i];
        }
        let mut ans = Vec::with_capacity(n);
        for i in 0..n {
            let left = if i > 0 { pref[i-1] } else { 0 };
            let right = pref[n-1] - pref[i];
            ans.push(right - left + (2*i as i32 - n as i32 + 1) * nums[i]);
        }
        ans
    }
}
