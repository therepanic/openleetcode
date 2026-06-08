impl Solution {
    pub fn three_sum(mut nums: Vec<i32>) -> Vec<Vec<i32>> {
        if nums.len() < 3 { return vec![]; }
        nums.sort();
        let mut res = vec![];
        let n = nums.len();
        for i in 0..n.saturating_sub(2) {
            if i > 0 && nums[i] == nums[i - 1] { continue; }
            let mut l = i + 1;
            let mut r = n - 1;
            while l < r {
                let sum = nums[i] + nums[l] + nums[r];
                if sum == 0 {
                    res.push(vec![nums[i], nums[l], nums[r]]);
                    l += 1;
                    r -= 1;
                    while l < r && nums[l] == nums[l - 1] { l += 1; }
                    while l < r && nums[r] == nums[r + 1] { r -= 1; }
                } else if sum < 0 {
                    l += 1;
                } else {
                    r -= 1;
                }
            }
        }
        res
    }
}
