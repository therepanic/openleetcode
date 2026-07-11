impl Solution {
    pub fn best_rotation(nums: Vec<i32>) -> i32 {
        let n = nums.len();
        let mut diffs = vec![0i32; n + 1];
        for i in 0..n {
            let left = (i as i32 - nums[i] + 1).rem_euclid(n as i32) as usize;
            let right = (i + 1) % n;
            diffs[left] -= 1;
            diffs[right] += 1;
            if left > right {
                diffs[0] -= 1;
            }
        }
        let mut best = 0;
        let mut cur = n as i32;
        let mut max_score = cur;
        for k in 1..n {
            cur += diffs[k];
            if cur > max_score {
                max_score = cur;
                best = k as i32;
            }
        }
        best
    }
}
