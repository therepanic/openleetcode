impl Solution {
    pub fn maximum_score(nums: Vec<i32>, k: i32) -> i32 {
        let n = nums.len();
        let mut i = k as usize;
        let mut j = k as usize;
        let mut cur_min = nums[k as usize];
        let mut res = cur_min;

        while i > 0 || j < n - 1 {
            if i == 0 {
                j += 1;
            } else if j == n - 1 {
                i -= 1;
            } else if nums[i - 1] >= nums[j + 1] {
                i -= 1;
            } else {
                j += 1;
            }
            cur_min = cur_min.min(nums[i]).min(nums[j]);
            res = res.max(cur_min * (j - i + 1) as i32);
        }

        res
    }
}
