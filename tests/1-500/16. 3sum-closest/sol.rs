impl Solution {
    pub fn three_sum_closest(mut nums: Vec<i32>, target: i32) -> i32 {
        if nums.len() < 3 { return 0; }
        nums.sort();
        let mut best = nums[0] + nums[1] + nums[2];
        let n = nums.len();
        for i in 0..n - 2 {
            let mut l = i + 1;
            let mut r = n - 1;
            while l < r {
                let sum = nums[i] + nums[l] + nums[r];
                if (target - sum).abs() < (target - best).abs() { best = sum; }
                if sum == target { return target; }
                if sum < target { l += 1; } else { r -= 1; }
            }
        }
        best
    }
}
